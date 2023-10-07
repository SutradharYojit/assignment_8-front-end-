import 'package:assignment_8/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../resources/resources.dart';
import '../routes/routes_name.dart';
import '../widget/widget.dart';

// class FirebaseService {
//
//   //used to define the for Scaffold messenger for to show the custom snack bar
//   static final bar = WarningBar();
//   final userPreferences = UserPreferences();
//
//   Future signIN(BuildContext context, {required String textEmail, required String textPass}) async {
//     debugPrint("Button pressed");
//     final notExist = bar.snack(FBServiceManager.serviceFirebaseNoAccount, ColorManager.redColor);
//     // Show Loading screen while function is called
//
//     showDialog(
//         context: context,
//         builder: (context) {
//           return const Center(child: Loading());
//         });
//     try {
//       // check if user is credentials are correct or not
//       await FirebaseAuth.instance.signInWithEmailAndPassword(email: textEmail, password: textPass).then(
//         (value) async {
//           final auth = FirebaseAuth.instance.currentUser;
//           // save the user credentials locally so user don't need to login in every time
//           await userPreferences.saveLoginUserInfo(textEmail, true, auth!.uid).then(
//             (value) {
//               context.go(RoutesName.dashboardScreen);
//             },
//           );
//         },
//       );
//     } on FirebaseAuthException catch (e) {
//       debugPrint(e.message);
//       final error = bar.snack(e.message.toString(), ColorManager.redColor);
//
//       // ignore: use_build_context_synchronously
//       Navigator.pop(context);
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(notExist);
//     }
//   }
// }


