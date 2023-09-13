


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:delivery/screens/login/cubit/cubit.dart';
import 'package:delivery/screens/login/cubit/states.dart';
import 'package:delivery/shared/components.dart';
import 'package:delivery/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKeyemail = GlobalKey<FormState>();
    var formKeypassword = GlobalKey<FormState>();
    var emailcontroller = TextEditingController();
    var passcontroller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
          if (state is LoginErrorStates)
          {
            showToast (text: "Invalid Email or Password", color: Colors.red ,state: ToastStates. ERROR);
          }
          if (state is LoginSuccessStates)
          {
        LoginCubit.get(context).getUserName();
        await Future.delayed(const Duration(milliseconds: 1000));
        print("############################################3");
        print("a7a"+role);
        print("############################################3");
        navigateTo(context, LoginScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundcolor,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 36,
                            fontFamily: 'poppins'
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ), //
                      SizedBox(
                        height: 40,
                      ), //
                      Form(
                        key: formKeyemail,
                        child: defaultTextForm(
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!isEmail(value)) {
                              return 'Please enter a valid email';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                      ), // Text
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formKeypassword,
                        child: defaultTextForm(
                          controller: passcontroller,
                          type: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            // if (value.length < 8) {
                            //   return 'Password must be at least 8 characters';
                            // }
                            // if (!value.contains(RegExp(r'[A-Z]'))) {
                             //   return 'Password must contain at least one uppercase letter';
                            // }
                            // if (!value.contains(RegExp(r'[a-z]'))) {
                            //   return 'Password must contain at least one lowercase letter';
                            // }
                            // if (!value.contains(RegExp(r'[0-9]'))) {
                            //   return 'Password must contain at least one number';
                            // }
                          },
                          ispassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.lock_outlined,
                        ),
                      ), // Text
                      SizedBox(
                        height: 50,
                      ),
                      ConditionalBuilder(
                        condition:state is! LoginLoadingStates,
                        builder:(context)=>  defaultButton(
                          radius: 45,
                          height: 36,
                          width: 236,
                          function: () {

                            if(formKeyemail.currentState!.validate() && formKeypassword.currentState!.validate())
                            {
                              //emit(LoginInitialStates());
                              LoginCubit.get(context).userLogin(
                                email: emailcontroller.text,
                                password: passcontroller.text,
                              );


                            }
                          }, text: 'Sign in', upper: true,
                        ), fallback: (context) =>CircularProgressIndicator() ,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultTextButton(
                              function: () {
                                navigateTo(context,LoginScreen());
                              },
                              text: 'forgot your password?'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Column
          );
        },
      ),
    ); // Scaffold
  }
}
