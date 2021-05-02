import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggel_client/di/injector.dart';
import 'package:toggel_client/modules/home/component/shared_widget/time_entry_list.dart';
import 'package:toggel_client/modules/home/cubit/home_cubit.dart';
import 'package:toggel_client/modules/home/cubit/home_state.dart';

import '../home_screen.dart';

class AllTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getTimes(""),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeSuccessState) {
            return Container(
              child: RefreshIndicator(
                  onRefresh: () async {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (a, b, c) => HomeScreen(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                    return;
                  },
                  child:
                      TimeEntryList(state.timesEntriesModel.reversed.toList())),
            );
          }
          if (state is HomeLoadingState) {
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
