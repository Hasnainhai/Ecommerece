// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/routes/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _isLoading = false;
  bool get isloading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  void setSignUpLaoding(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    try {
      dynamic value = await _myRepo.loginApi(data);

      setLoading(false);

      if (value != null && value['key'] != null && value['key'] != '') {
        // Navigate to the home screen only if the 'key' is present in the response
        Navigator.pushNamed(context, RoutesName.home);
        Utils.toastMessage('SuccessFully Login');
      } else {
        // Display a toast message if the 'key' is missing or empty in the response
        Utils.flushBarErrorMessage('User not found', context);
      }

      if (kDebugMode) {
        print(value.toString());
      }
    } catch (error) {
      setLoading(false);

      // Display a toast message for other errors
      Utils.flushBarErrorMessage(
          'An error occurred. Please try again.', context);
      // Fluttertoast.showToast(msg: 'An error occurred. Please try again.');

      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  // Future<void> loginApi(dynamic data, BuildContext context) async {
  //   setLoading(true);
  //   _myRepo.loginApi(data).then((value) {
  //     setLoading(false);
  //     Utils.flushBarErrorMessage(value.toString(), context);
  //     Navigator.pushNamed(context, RoutesName.home);
  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.flushBarErrorMessage(error.toString(), context);
  //     setLoading(false);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLaoding(true);
    _myRepo.loginApi(data).then((value) {
      setSignUpLaoding(false);
      Utils.flushBarErrorMessage(value.toString(), context);
      Navigator.pushNamed(context, RoutesName.login);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      setSignUpLaoding(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

// Future<void> signUpApi(dynamic data, BuildContext context) async {
//   setSignUpLoading(true);

//   try {
//     dynamic value = await _myRepo.signUpApi(data);

//     setSignUpLoading(false);

//     if (value != null && value['key'] != null && value['key'] != '') {
//       // Navigate to the login screen only if the 'key' is present in the response
//       Navigator.pushNamed(context, RoutesName.login);
//     } else {
//       // Display a toast message if the 'key' is missing or empty in the response
//       Fluttertoast.showToast(msg: 'Signup failed. User not created.');
//     }

//     if (kDebugMode) {
//       print(value.toString());
//     }
//   } catch (error) {
//     setSignUpLoading(false);

//     // Display a toast message for other errors
//     Fluttertoast.showToast(msg: 'An error occurred during signup. Please try again.');

//     if (kDebugMode) {
//       print(error.toString());
//     }
//   }
// }