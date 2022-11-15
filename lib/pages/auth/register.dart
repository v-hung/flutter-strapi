import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/provider/user/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    Future<void> login() async {
      try {
        await context.read<UserCubit>().login(
          email: emailController.text,
          password: passwordController.text
        );

        context.router.pushNamed('/');
      }catch (e) {
        print(e);
      }
    }

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.android,
              size: 100,
            ),
            const SizedBox(height: 75,),

            const Text(
              "Hello Again!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Welcome back, you\'ve been missed!",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            const SizedBox(height: 50,),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserError) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      state.error,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
                // return Text(state.user?.email ?? 'null');
              },
            ),

            // email field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email'
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            // password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password'
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            // password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: rePasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'RePassword'
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            // button signin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  login();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25,),

            // not a member
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Have a account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    context.router.pushNamed('/auth/login');
                  },
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  color: Colors.grey.withOpacity(0.5),
                  child: const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator())
                  )
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}