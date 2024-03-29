import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/user/authentication_db_functions.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';
import 'package:mind_sculptor/view/screens/authentication/functions/authentication_functions.dart';
import 'package:mind_sculptor/view/screens/authentication/logIn/log_in_screen.dart';
import 'package:mind_sculptor/view/screens/authentication/widgets/signup_textformfield_widget.dart';
import 'package:mind_sculptor/view/screens/authentication/widgets/widgets.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';
import 'package:mind_sculptor/view/widgets/screen_navigation.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  String? username;
  String? email;
  String? password;
  // bool? existingUser = true;
  // late Box<User> userBox;

  @override
  void initState() {
    super.initState();
    // userBox = Hive.box('user_details');
    UserDb.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 650,
            child: Card(
              shadowColor: Colors.grey,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'SIGN UP',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const Text('Create your own account'),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: TextFormFieldOfSignUpScreen(
                            usernameController: usernameController,
                            emailController: emailController,
                            passwordController: passwordController,
                            conformPasswordController:
                                conformPasswordController),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonClass(
                        cradius: 20,
                        height: 59,
                        width: 370,
                        text: 'Sign Up',
                        onpress: () {
                          // userAlreadyExist();
                          final isValidate = _key.currentState?.validate();
                          if (isValidate != null && isValidate) {
                            // var newUser = User(username: )
                            // userBox.add(User(
                            //     username: usernameController.text.trim(),
                            //     email: emailController.text.trim(),
                            //     password: passwordController.text.trim()));
                            userAlreadyExist();
                          }
                        },
                      ),
                    ),
                    sizedBox10,
                    const Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        orTextForLogInAndSignUp(
                            text: 'ALREADY HAVE AN ACCOUNT?'),
                        GestureDetector(
                          child: signUpOrLoginText(text: ' LOG IN'),
                          onTap: () => pushReplacementNavigator(
                              context: context,
                              screenName: const LogInScreen()),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void userAlreadyExist() async {
    final String enteredUsername = usernameController.text.trim();
    final String enteredEmail = emailController.text.trim();
    final String enteredPassword = passwordController.text.trim();

    final userExists = userNotifier.value.any((user) =>
        user.username == enteredUsername || user.email == enteredEmail);
    if (userExists) {
      showDialogueforUser(context: context);
    } else {
      var newUser = User(
          username: enteredUsername,
          email: enteredEmail,
          password: enteredPassword);
          await UserDb.addUser(newUser);
      await UserDb.getUser();
      // ignore: use_build_context_synchronously
      showSnackBar(backgroundColor: Colors.green,context: context,text: 'Successfully completed',textcolor: Colors.white);

      // SharedPreferences sharepref = await SharedPreferences.getInstance();
      // sharepref.setBool('userEntered', true);
      // // 
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ));
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      conformPasswordController.clear();
    }
  }
}




     // child: Column(
                        //   children: [
                        //     textInputFormField(
                        //         fieldIcon: Icons.person,
                        //         hintText: 'Username',
                        //         obscure: false,
                        //         txtcontroller: usernameController,
                        //         validatorFunction: validateUsername),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     textInputFormField(
                        //         fieldIcon: Icons.email,
                        //         hintText: 'Email',
                        //         obscure: false,
                        //         txtcontroller: emailController,
                        //         validatorFunction: validateEmail),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     textInputFormField(
                        //         fieldIcon: Icons.lock,
                        //         hintText: 'Password',
                        //         obscure: true,
                        //         txtcontroller: passwordController,
                        //         validatorFunction: validatePassword),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     textInputFormField(
                        //         fieldIcon: Icons.lock_person_sharp,
                        //         hintText: 'Confirm Password',
                        //         obscure: true,
                        //         txtcontroller: conformPasswordController,
                        //         validatorFunction: (String? value) {
                        //           if (value != passwordController.text) {
                        //             return 'Password does not match';
                        //           } else if (value!.isEmpty) {
                        //             return 'Re-enter your Password';
                        //           } else if (value.length < 5) {
                        //             return 'Password must be at least 5 character';
                        //           } else {
                        //             return null;
                        //           }
                        //         }),
                        //     const SizedBox(
                        //       height: 40,
                        //     ),
                        //   ],
                        // ),




                        /// 
                        ///       // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: const Text('User Already Exists'),
      //       content: const Text(
      //           'The provided username or email already exists. Please use different credentials.'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: const Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
