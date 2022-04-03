import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutter/bloc/login/login_cubit.dart';
import 'package:rutter/constants/paths.dart';
import 'package:rutter/ui/widgets/background.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    bool isPasswordVisible = false;
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state)
    {
      switch (state.runtimeType) {
        case LoggedIn:
          Navigator.pushNamedAndRemoveUntil(context, HOME, (r) => false);
          return;
        case LogInError:
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
                    child: Column(children: [
                      // if (!isKeyboard)
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Text(
                              'Rutter',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.black87,
                                // color: Color(0xff908FEC),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 270,
                          //   child: Text(
                          //       'Не пропадай из инфополя вместе с друзьями.',
                          //       textAlign: TextAlign.center,
                          //       style: TextStyle(
                          //           fontFamily: 'Inter',
                          //           color: Colors.black54,
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.normal)),
                          // ),

                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: 270,
                          child: TextField(
                            onChanged: (String value) async {
                              context.read<LogInCubit>().updateEmail(value);
                            },
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontSize: 16
                            ),
                            cursorColor: Colors.black54,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                // color: Color(0xff908FEC),
                                fontFamily: 'Inter',
                                fontSize: 16,
                            ),
                              labelText: 'Email',
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: 270,
                          child: TextField(
                            onChanged: (String value) async {
                              context.read<LogInCubit>().updatePassword(value);
                            },
                            obscureText: true,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontSize: 20),
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  // color: Color(0xff908FEC),
                                  fontFamily: 'Inter',
                                  fontSize: 16
                              ),
                              labelText: 'Пароль',
                            ),
                          )),
                      Container(
                        width: 270,
                        height: 50,
                        margin: const EdgeInsets.only(top: 90),
                        child: ElevatedButton(
                            child: const Text('Войти',
                                style: TextStyle(
                                    fontFamily: 'Inter', fontSize: 16,
                                    color: Colors.black54
                                )),
                            onPressed: () async {
                              BlocProvider.of<LogInCubit>(context).loginUser(
                                  context.read<LogInCubit>().state.data);
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
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 40),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, REGISTER);
                            },
                            child: const Text('Создать аккаунт',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.black87,
                                  // color: Color(0xff908FEC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                )),
                          )),
                      // Container(
                      //     margin: const EdgeInsets.only(top: 29),
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         Navigator.pushNamed(context, HOME);
                      //       },
                      //       child: const Text(
                      //           'ДЛЯ РАЗРАБОТЧИКОВ - НА ДОМАШНЮЮ СТРАНИЦУ',
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontFamily: 'Inter',
                      //             color: Color(0xff908FEC),
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold,
                      //             decoration: TextDecoration.underline,
                      //           )),
                      //     )),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}