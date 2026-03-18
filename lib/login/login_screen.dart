import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:school_management/constant/text_strings.dart';
import '../../navigation_menu/navigation_menu.dart';
import '../authentication/provider/LOGIN/login_provider.dart';
import '../common_widgets/big_buttons.dart';
import '../constant/colors.dart';
import '../constant/sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;


  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(HRSizes.md),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: HRSizes.spaceBtwItems),
                  Text(
                    HRTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                  const SizedBox(height: HRSizes.sm),
                  Text(
                    HRTexts.toHRAttendee,
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                  const SizedBox(height: HRSizes.md),
                  Text(
                    HRTexts.loginText,
                    style: Theme.of(context).textTheme.titleMedium!,
                  ),
                  const SizedBox(height: HRSizes.spaceBtwItems),
                  TextFormField(
                    controller: usernameController,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Username";
                      }
                      return null;
                    },
                    focusNode: _usernameFocusNode,
                    decoration: InputDecoration(
                      labelText: HRTexts.username,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: HRSizes.spaceBtwInputFields),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: passwordController,
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: HRTexts.password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: HRSizes.spaceBtwInputFields),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {

                        // Handle forgot password
                      },
                      child: const Text(
                        HRTexts.forgetPassword,
                        style: TextStyle(color: blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: HRSizes.defaultSpace),
              HRBigButton(
                onPressed: () {
                  setState(() {
                    _autoValidateMode = AutovalidateMode.onUserInteraction;
                  });
                  if (_formKey.currentState!.validate()) {
                    // Clear any prior routes and go to NavigationMenu on successful login
                    loginProvider.login(
                      context,
                      usernameController.text,
                      passwordController.text,
                          () {
                        // Clear navigation stack and move to the desired screen
                        Get.offAll(() => NavigationMenu());
                      },
                    );
                  }
                },
                text: HRTexts.login,
                backgroundColor: appColor,
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
