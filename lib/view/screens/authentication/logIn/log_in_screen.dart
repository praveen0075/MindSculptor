import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/user/authentication_db_functions.dart';
import 'package:mind_sculptor/view/screens/admin_side/main_screen.dart';
import 'package:mind_sculptor/view/screens/authentication/signIn/sign_in_screen.dart';
import 'package:mind_sculptor/view/screens/authentication/functions/authentication_functions.dart';
import 'package:mind_sculptor/view/screens/authentication/widgets/widgets.dart';
import 'package:mind_sculptor/view/screens/user_side/onboarding/on_boarding_screen.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';
import 'package:mind_sculptor/view/widgets/screen_navigation.dart';
import 'package:mind_sculptor/view/widgets/textfields.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController loginUsernameController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  // late Box<User> userBox;

  @override
  void initState() {
    super.initState();
    // userBox = Hive.box<User>('user_details');
    UserDb.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  welcomeBack,
                  sizedBox10,
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: Image.asset('assets/images/log_in_blue-image.png'),
                  ),
                  sizedBox10,
                  const Text('Login to your account'),
                  sizedBox10,
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          textInputFormField(
                              hintText: 'Username',
                              obscure: false,
                              fieldIcon: Icons.person_3,
                              txtcontroller: loginUsernameController,
                              validatorFunction: validateUsername),
                      sizedBox10,
                          textInputFormField(
                            hintText: 'Password',
                            obscure: true,
                            fieldIcon: Icons.lock,
                            txtcontroller: loginPasswordController,
                            validatorFunction: validateLoginPassword,
                          ),
                          sizedBox10,
                        ],
                      )),
                   sizedBox20,
                  ButtonClass(
                    cradius: 20,
                    height: 59,
                    width: 370,
                    text: 'LOG IN',
                    onpress: () async {
                      String enteredUsername =
                          loginUsernameController.text.trim();
                      String enteredPassword =
                          loginPasswordController.text.trim();
                      final isLogInValidate = _formkey.currentState!.validate();
                      if (enteredUsername == 'pxadmin@123' &&
                          enteredPassword == 'lost') {
                            pushReplacementNavigator(context: context,screenName: const AdminScreen());
                      } else if (isLogInValidate) {
                        bool isLoggedIn = await checkUserExist(
                            enteredUsername, enteredPassword);
                        if (isLoggedIn) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return const OnBoardingScreen();
                          },));
                        } else {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context: context,backgroundColor: Colors.red,textcolor: Colors.white,text: 'Invalid username and password');
                        }
                      }
                    },
                  ),
                  sizedBox10,
                  const Text(
                    'OR',
                    style: TextStyle(color: Colors.grey),
                  ),
                  sizedBox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      orTextForLogInAndSignUp(
                          text: 'CREATE A NEW ACCOUNT?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignInScreen();
                          }));
                        },
                        child: signUpOrLoginText(text: ' SIGN UP')
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}