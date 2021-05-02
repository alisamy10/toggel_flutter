import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';
import 'package:toggel_client/di/injector.dart';
import 'package:toggel_client/modules/home/cubit/home_cubit.dart';
import 'package:toggel_client/modules/home/cubit/home_state.dart';
import 'package:toggel_client/modules/login/login_custom_widget/default_button.dart';
import 'package:toggel_client/modules/login/login_screen.dart';
import 'package:toggel_client/shared/util/utility.dart';

import '../home_screen.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) =>
        getIt<HomeCubit>()
          ..getUserProfile(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProfileSuccessState) {
              return Container(
                child: ListView(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("workspace "),
                              Text(state.user.data.workspaces[0].name)

                            ],
                          ),
                        )),

                    const SizedBox(height: 12,),

                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Name "),
                              Text(state.user.data.fullname)

                            ],
                          ),
                        )),

                    const SizedBox(height: 12,),

                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Email Address "),
                              Text(state.user.data.email)

                            ],
                          ),
                        )),


                    const SizedBox(height: 30,),
                    DefaultButton(
                      function: () async {
                        SecureStorage.clearData().then((value) =>
                            navigateAndFinish(
                              context,
                              LoginScreen(),
                            )
                        );
                      },
                      text: 'Logout',
                    )


                  ],
                ),
              );
            }
            if (state is ProfileLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
  }
}
