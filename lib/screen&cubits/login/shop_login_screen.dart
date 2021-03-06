import 'package:abood/screen&cubits/register/shop_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../Home.dart';
import '../../main.dart';
import '../../storage/const.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class StoreLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StoreLoginCubit(),
      child: BlocConsumer<StoreLoginCubit, StoreLoginStates>(
        listener: (context, state) {
          if (state is StoreLoginSuccessState) {
            print(state.loginModel.message);
            print(state.loginModel.token);
            //to save token
            //check
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Temp(),
              ),
              (route) {
                return false;
              },
            );
          }
          else if(state is StoreLoginSuccessStateT){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Tempp(state.tempModel),
              ),
                  (route) {
                return false;
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 255, 255, 225),
                  ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Column(
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Sign up to get started ",
                      style: TextStyle(),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: coco,
                              // color: Colors.teal,//hainfa
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Email'),
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'the Email must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                            // hoverColor: Colors.green,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: coco,
                              // color: Colors.teal,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password'),
                        controller: passController,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'the password must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: coco),
                          primary: coco,
                          elevation: 7,
                          shape: const StadiumBorder(side: BorderSide()),
                          fixedSize: const Size(300, 50),
                        ),
                        onPressed: () {
                          // if (formKey.currentState!.validate())
                          // {
                            StoreLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passController.text,
                            );
                          // }
                        } ,
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        primary: Colors.white,
                        elevation: 7,
                        shape: const StadiumBorder(side: BorderSide()),
                        fixedSize: const Size(300, 50),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreRegisterScreen(),
                          ),
                          (route) {
                            return false;
                          },
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: coco,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
