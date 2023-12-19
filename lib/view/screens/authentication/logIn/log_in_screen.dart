import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/model/user_model.dart';
import 'package:mind_sculptor/view/screens/admin_side/main_screen.dart';
import 'package:mind_sculptor/view/screens/authentication/signIn/sign_in_screen.dart';
import 'package:mind_sculptor/view/screens/authentication/functions/authentication_functions.dart';
import 'package:mind_sculptor/view/screens/authentication/widgets/widgets.dart';
import 'package:mind_sculptor/view/widgets/bottomnavigaiton/bottomnavigation_bar.dart';
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
  late Box<User> userBox;

  @override
  void initState() {
    super.initState();
    userBox = Hive.box<User>('user_details');
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
                      if (enteredUsername == 'pravee@123' &&
                          enteredPassword == '1234') {
                            pushReplacementNavigator(context: context,screenName: const AdminScreen());
                      } else if (isLogInValidate) {
                        bool isLoggedIn = await checkUserExist(
                            enteredUsername, enteredPassword,userBox);
                        if (isLoggedIn) {
                          // ignore: use_build_context_synchronously
                          pushReplacementNavigator(context: context,screenName: const BottomNavi());
                        } else {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context: context,backgroundColor: Colors.red,textcolor: Colors.white);
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






  // Future<bool> checkUserExist(
  //     String enteredUsername, String enteredPassword) async {
  //   var existingUserData = userBox.values.cast<User>().toList();

  //   bool existingUser = existingUserData.any((user) =>
  //       user.username == enteredUsername && user.password == enteredPassword);
  //   if (existingUser) {
  //     SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //     sharedPref.setBool('userEntered', true);
  //   }
  //   return existingUser;
  // }
}





//check user exist 
    // ignore: use_build_context_synchronously
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const BottomNavi()),
                          // );
                          // ignore: use_build_context_synchronously



//textformfield


                                 // Padding(
                          //   padding: const EdgeInsets.only(left: 12, right: 12),
                          //   child: TextFormField(
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'Please enter your Password';
                          //       } else {
                          //         return null;
                          //       }
                          //     },
                          //     controller: loginPasswordController,
                          //     obscureText: true,
                          //     decoration: InputDecoration(
                          //         prefixIcon: const Icon(Icons.lock),
                          //         enabledBorder: OutlineInputBorder(
                          //             borderSide:
                          //                 const BorderSide(color: Colors.black),
                          //             borderRadius: BorderRadius.circular(20)),
                          //         hintText: 'Password',
                          //         border: OutlineInputBorder(
                          //             borderSide:
                          //                 const BorderSide(color: Colors.black),
                          //             borderRadius: BorderRadius.circular(20))),
                          //   ),
                          // ),



  // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const AdminScreen()),
                        // );

// show snackbar

                                   // // ignore: use_build_context_synchronously
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //       'Inavlid Username and Password',
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     backgroundColor: Colors.red,
                          //   ),
                          // );