
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggel_client/di/injector.dart';
import 'package:toggel_client/modules/home/home_screen.dart';
import 'package:toggel_client/shared/resource/style.dart';
import 'package:toggel_client/shared/util/utility.dart';

import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';
import 'login_custom_widget/default_button.dart';
import 'login_custom_widget/default_form_field.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState)
          {
            navigateAndFinish(
              context,
              HomeScreen(),
            );
          }

          if (state is LoginErrorState)
          {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
              content: Text('${state.error}'),
            ));
          }



        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title:Text("Login",style: textStyle,),centerTitle: true,),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        DefaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                            if(!validateEmail(value)){
                              return 'please enter valid email ';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: context.watch<LoginCubit>().suffix,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {

                              context.read<LoginCubit>().userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: context.watch<LoginCubit>().isPassword,
                          suffixPressed: () {
                            context.read<LoginCubit>().changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        state is! LoginLoadingState
                            ? DefaultButton(
                                function: () {
                                  if (formKey.currentState.validate()) {
                                    context.read<LoginCubit>().userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                              )

                        :Center(child:CircularProgressIndicator())
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }








}