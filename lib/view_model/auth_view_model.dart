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

      // Check if value is not null and 'key' is a non-empty string
      if (value != null &&
          value is Map &&
          value.containsKey('key') &&
          value['key'] != null &&
          value['key'] != '') {
        // if value is not null navigate
        Navigator.pushNamed(context, RoutesName.home);
        Utils.toastMessage('Successfully Login');
      } else {
        // display if user is not found
        Utils.flushBarErrorMessage('User not found', context);
      }

      if (kDebugMode) {
        print(value.toString());
      }
    } catch (error) {
      setLoading(false);

      // Displaying message for other errors
      Utils.flushBarErrorMessage(
          'An error occurred. Please try again.', context);

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

//   Future<void> signUpApi(dynamic data, BuildContext context) async {
//     setSignUpLaoding(true);
//     _myRepo.loginApi(data).then((value) {
//       setSignUpLaoding(false);
//       Utils.flushBarErrorMessage(value.toString(), context);
//       Navigator.pushNamed(context, RoutesName.login);

//       if (kDebugMode) {
//         print(value.toString());
//       }
//     }).onError((error, stackTrace) {
//       Utils.flushBarErrorMessage(error.toString(), context);
//       setSignUpLaoding(false);
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
// }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLaoding(true);

    try {
      dynamic value = await _myRepo.signUpApi(data);

      setSignUpLaoding(false);

      // Check if value is not null and 'key' is present
      if (value != null &&
          value is Map &&
          value.containsKey('key') &&
          value['key'] != null &&
          value['key'] != '') {
        // Handle 'key' case or success first
        print("..............Key Value: ${value['key']}..............");

        Navigator.pushNamed(context, RoutesName.home);
        Utils.toastMessage('Successfully Signed Up');
      } else if (value != null &&
          value is Map &&
          value.containsKey('non_field_errors')) {
        List<dynamic> nonFieldErrors = value['non_field_errors'];

        // Debugging: Show nonFieldErrors
        print("Non-field errors: $nonFieldErrors");

        // Check if the error message indicates a password similarity issue
        if (nonFieldErrors
            .contains("The password is too similar to the username.")) {
          Utils.flushBarErrorMessage(
              'Password is too similar to the username.', context);
        } else if (nonFieldErrors
            .contains("The two password fields didn't match.")) {
          // Display toast message for non-matching passwords
          Utils.flushBarErrorMessage(
              "The password fields didn't match.", context);
        } else if (nonFieldErrors.contains("Another specific error")) {
          // Handle another specific non-field error
          Utils.flushBarErrorMessage(
              "Another specific error occurred.", context);
        } else if (nonFieldErrors.contains("Yet another specific error")) {
          // Handle yet another specific non-field error
          Utils.flushBarErrorMessage(
              "Yet another specific error occurred.", context);
        } else {
          // Handle other non-field errors
          Utils.flushBarErrorMessage(
              'Sign up failed. Please try again.', context);
        }
      } else {
        // Debugging: Show the entire response for further analysis
        Utils.toastMessage("Unexpected API response: $value");
      }

      if (kDebugMode) {
        print(value.toString());
      }
    } catch (error) {
      setSignUpLaoding(false);

      // Displaying message for other errors
      Utils.flushBarErrorMessage(
          'An error occurred during signup. Please try again.', context);

      // Debugging: Print the full error stack trace
      if (kDebugMode) {
        print("Error during signup: $error");
      }
    }
  }
}
