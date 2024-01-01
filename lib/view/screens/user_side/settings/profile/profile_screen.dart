import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/user/authentication_db_functions.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/imagepicker_function.dart';
import 'package:mind_sculptor/view/screens/authentication/functions/authentication_functions.dart';
import 'package:mind_sculptor/view/screens/authentication/widgets/widgets.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _key = GlobalKey<FormState>();

  String? key = " ";
  User? currentUser;
  String? editedUsername;
  String? yrname;
  String? editedGmail;
  String? phnNumber;
  String? profilePic;
  String? dp;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    SharedPreferences sharepref = await SharedPreferences.getInstance();
      key =  sharepref.getString('userEnteredId');
    if (key != null && key!.isNotEmpty) {
      final user = await UserDb.getUserById(key!);
      setState(() {
        if (user != null) {
          currentUser = user;
          editedUsername = currentUser!.username;
          yrname = currentUser!.yourName;
          editedGmail = currentUser!.email;
          phnNumber = currentUser!.phoneNumber;
          dp = currentUser!.profilepicPath;
        }
      });
    }
  }

  void saveDataTodb() {
    currentUser!.username = editedUsername ?? currentUser!.username;
    currentUser!.yourName = yrname ?? currentUser!.yourName;
    currentUser!.email = editedGmail ?? currentUser!.email;
    currentUser!.phoneNumber = phnNumber ?? currentUser!.phoneNumber;
    currentUser!.profilepicPath = profilePic ?? currentUser!.profilepicPath;
    UserDb.updateUser(currentUser!);
    setState(() {});
    showSnackBar(
        backgroundColor: Colors.green,
        context: context,
        text: 'Edited profile saved');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
                fontFamily: GoogleFonts.archivoBlack().fontFamily,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: tc1,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [tc1, lg1, lg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: profilePic != null
                              ? DecorationImage(
                                  image: FileImage(File(profilePic!)),
                                  fit: BoxFit.cover)
                              : dp != null && dp!.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(File(dp!)),
                                      fit: BoxFit.cover)
                                  : const DecorationImage(
                                      image: NetworkImage(
                                          "https://imgs.search.brave.com/F2-JuCznDFyTZacItZl1MFz_oVdn6DBVaT6OBkGRA7o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAxLzI2LzYxLzEz/LzM2MF9GXzEyNjYx/MTMzN19tOGtjUnRT/NUc3QWhyRnBPUTBX/dWZ4NFBnTDZKNHl4/Zy5qcGc")),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () async {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 100,
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                final imagePath =
                                                    await collectImage();
                                                if (imagePath != null) {
                                                  setState(() {
                                                    profilePic = imagePath;
                                                  });
                                                }
                                              },
                                              child: const Row(
                                                children: [
                                                  sizedBox10w,
                                                  Icon(Icons.image_outlined),
                                                  Text('New profile picture')
                                                ],
                                              ),
                                            ),
                                            divider(thickness: 2),
                                            InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Are you sure?',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                      content: const Text(
                                                          'Do you want to remove your profile pic?'),
                                                      actions: [
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (currentUser !=
                                                                  null) {
                                                                UserDb.deleteProfilePic(
                                                                    currentUser!);
                                                                setState(() {
                                                                  profilePic =
                                                                      null;
                                                                });

                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: const Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            )),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                "Cancel"))
                                                      ],
                                                    );
                                                  },
                                                );

                                                // ignore: use_build_context_synchronously
                                              },
                                              child: const Row(children: [
                                                sizedBox10w,
                                                Icon(
                                                  CupertinoIcons.delete,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  'Delete current profile pic',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                              ]),
                                            )
                                          ]),
                                    )),
                                  );
                                },
                              );
                            },
                            child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.edit)),
                          ))
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          SizedBox(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: TextEditingController(
                                  text: currentUser == null
                                      ? " "
                                      : currentUser!.username),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                hintText: 'Username',
                              ),
                              validator: validateUsername,
                              onChanged: (newvalue) {
                                if (newvalue.isNotEmpty) {
                                  editedUsername = newvalue;
                                }
                              },
                            ),
                          ),
                          sizedBox10,
                          SizedBox(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: TextEditingController(
                                  text: currentUser == null
                                      ? "Your name"
                                      : currentUser!.yourName),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                hintText: 'Your Name',
                              ),
                              onChanged: (newvalue) {
                                if (newvalue.isNotEmpty) {
                                  yrname = newvalue;
                                }
                              },
                            ),
                          ),
                          sizedBox10,
                          SizedBox(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: TextEditingController(
                                  text: currentUser == null
                                      ? " "
                                      : currentUser!.email),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                hintText: 'Email-id',
                              ),
                              validator: validateEmail,
                              onChanged: (newvalue) {
                                if (newvalue.isNotEmpty) {
                                  editedGmail = newvalue;
                                }
                              },
                            ),
                          ),
                          sizedBox10,
                          SizedBox(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              controller: TextEditingController(
                                  text: currentUser == null
                                      ? " "
                                      : currentUser!.phoneNumber),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                hintText: 'Phone number',
                              ),
                              onChanged: (newvalue) {
                                if (newvalue.isNotEmpty) {
                                  phnNumber = newvalue;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBox10,
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                final isValidate =
                                    _key.currentState?.validate();
                                if (isValidate != null && isValidate) {
                                  saveDataTodb();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(140, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text('Save')),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
