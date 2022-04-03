
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutter/bloc/register/register_cubit.dart';
import 'package:rutter/constants/paths.dart';
import 'package:rutter/ui/widgets/background.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case UserRegistered:
            // showTopSnackBar(
            //   context,
            //   const SuccessSnackbar(info: "Вы успешно зарегистрировались!"),
            // );
            Navigator.pushNamed(context, LOGIN);
            return;
          case RegisterError:
            // showTopSnackBar(
            //     context, const ErrorSnackbar(info: "Попробуйте еще раз"));
            return;
        }
      },
      child: Scaffold(
          body: Stack(
            children: [
              const Background(),
              SafeArea(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    onPressed: () => Navigator.pop(
                                        context)),

                                Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  child: const Align(
                                    child: Text(
                                      'Регистрация',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 50),
                                width: 270,
                                child: TextField(
                                  controller: _controller,
                                  onChanged: (String value) {
                                    context
                                        .read<RegisterCubit>()
                                        .updateUsername(value);
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    // suffixIcon: IconButton(
                                    //   icon: const Icon(Icons.clear, size: 16),
                                    //   color: Colors.black,
                                    //   onPressed: _controller.clear,
                                    // ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Rubik',
                                    ),
                                    labelText: 'Логин',
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                width: 270,
                                child: TextField(
                                  onChanged: (String value) {
                                    context
                                        .read<RegisterCubit>()
                                        .updateEmail(value);
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Rubik',
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Rubik',
                                    ),
                                    labelText: 'Email',
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                width: 270,
                                child: TextField(
                                  onChanged: (String value) {
                                    context
                                        .read<RegisterCubit>()
                                        .updatePassword(value);
                                  },
                                  obscureText: true,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Rubik',
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Rubik',
                                        fontSize: 16),
                                    labelText: 'Пароль',
                                  ),
                                )),
                            Container(
                              width: 270,
                              height: 50,
                              margin: const EdgeInsets.only(top: 90),
                              child: ElevatedButton(
                                  child: const Text('Продолжить',
                                      style: TextStyle(
                                          fontFamily: 'Rubik', fontSize: 16, color: Colors.black)),
                                  onPressed: () async {
                                    BlocProvider.of<RegisterCubit>(context)
                                        .registerUser(context
                                        .read<RegisterCubit>()
                                        .state
                                        .data);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          const Color(0xff7A79CD)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          )))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}