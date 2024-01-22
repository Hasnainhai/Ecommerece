import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/colors.dart';
import '../res/components/rounded_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/routes/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obscurePassword1 = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscurePassword2 = ValueNotifier<bool>(true);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmpassFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obscurePassword1.dispose();
    _obscurePassword2.dispose();
    _nameFocusNode.dispose();
    _confirmPassController.dispose();
    _confirmpassFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    // final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SignUp View'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _nameFocusNode,
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'name',
                  label: Text('name'),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.focusNode(context, _nameFocusNode, _emailFocusNode);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'email',
                  label: Text('email'),
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.focusNode(context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              const SizedBox(height: 20.0),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword1,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: _passwordFocusNode,
                      obscureText: _obscurePassword1.value,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'password',
                        label: const Text('password'),
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword1.value = !_obscurePassword1.value;
                          },
                          child: Icon(
                            _obscurePassword1.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 20.0),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword2,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: _confirmpassFocusNode,
                      obscureText: _obscurePassword2.value,
                      obscuringCharacter: '*',
                      controller: _confirmPassController,
                      decoration: InputDecoration(
                        hintText: 'password',
                        label: const Text('password'),
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword2.value = !_obscurePassword2.value;
                          },
                          child: Icon(
                            _obscurePassword2.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(height: height * .1),
              RoundedButton(
                title: 'SignUp',
                loading: false,
                  color: AppColor.primaryColor,
                onpress: () {},
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: const Text("Already have Account Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
