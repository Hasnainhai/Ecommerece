// ignore_for_file: use_build_context_synchronously
import 'package:ecommerece/repository/auth_repository.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:ecommerece/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import '../utils/routes/routes_name.dart';

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

  // Future<void> loginApi(dynamic data, BuildContext context) async {
  //   setLoading(true);

  //   try {
  //     dynamic value = await _myRepo.loginApi(data);

  //     setLoading(false);

  //     // Check if value is not null and 'key' is a non-empty string
  //     if (value != null &&
  //         value is Map &&
  //         value.containsKey('key') &&
  //         value['key'] != null &&
  //         value['key'] != '') {
  //       setLoading(false);
  //       //if value is not null save user
  //       final userPrefrences =
  //           Provider.of<UserViewModel>(context, listen: false);

  //       userPrefrences.saveUser(UserModel(key: value['key'].toString()));

  //       // if value is not null navigate
  //       Navigator.pushNamed(context, RoutesName.dashboardScreen);
  //       Utils.toastMessage('Successfully Login');
  //     } else {
  //       // display if user is not found
  //       Utils.flushBarErrorMessage('User not found', context);
  //     }

  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   } catch (error) {
  //     setLoading(false);

  //     // Displaying message for other errors
  //     Utils.flushBarErrorMessage(
  //         'An error occurred. Please try again.', context);

  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   }
  // }

  // Future<void> signUpApi(dynamic data, BuildContext context) async {
  //   try {
  //     // Set loading state to true during the signup process
  //     setSignUpLaoding(true);

  //     // Call the signup API
  //     dynamic value = await _myRepo.signUpApi(data);

  //     // Set loading state to false after the signup process completes
  //     setSignUpLaoding(false);

  //     // Check for a specific property (e.g., 'key') in the response
  //     if (value != null && value['key'] != null && value['key'] != '') {
  //       // Navigate to the home screen if the 'key' is present
  //       Navigator.pushNamed(context, RoutesName.dashboardScreen);
  //       Utils.toastMessage('Successfully Registered');
  //     } else {
  //       // Display an error message if the 'key' is missing or empty in the response
  //       Utils.flushBarErrorMessage('Signup failed. User not created.', context);
  //     }

  //     // Print the response value for debugging (in debug mode)
  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   } catch (error) {
  //     setSignUpLaoding(false);

  //     // Print the error details for debugging
  //     if (kDebugMode) {
  //       print('Error during signup: $error');
  //     }

  //     // Display a user-friendly error message
  //     Navigator.pushNamed(context, RoutesName.dashboardScreen);
  //     Utils.toastMessage('Successfully Registered');
  //     //   Utils.flushBarErrorMessage(
  //     //       'An error occurred during signup. Please try again later.', context);
  //     // }
  //   }
  // }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    await _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.toastMessage(
        'Successfully Login',
      );

      Navigator.pushNamed(context, RoutesName.dashboardScreen);
      final userPrefrences = Provider.of<UserViewModel>(context, listen: false);

      userPrefrences.saveUser(UserModel(key: value['key'].toString()));
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLaoding(true);
    await _myRepo.signUpApi(data).then((value) {
      setSignUpLaoding(false);
      Utils.toastMessage(
        'Successfully Register',
      );
      Navigator.pushNamed(context, RoutesName.dashboardScreen);
      final userPrefrences = Provider.of<UserViewModel>(context, listen: false);

      userPrefrences.saveUser(UserModel(key: value['key'].toString()));

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      Navigator.pushNamed(context, RoutesName.dashboardScreen);
      setSignUpLaoding(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
