// ignore_for_file: unused_element
import 'package:belhalal_update/screen/account/complete_registration_screen1.dart';
import 'package:belhalal_update/screen/widgets/belhalal_logo.dart';
import 'package:belhalal_update/screen/widgets/custom_text_field.dart';
import 'package:belhalal_update/value/const.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../privacy_policy_screen.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool acceptPolicy = false;
  bool emailIsExist = false;

  bool userNameExist = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        // MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.black;
    }

    nullValidator(String value) {
      if (value == '' || value.isEmpty) {
        return 'حقل مطلوب';
      }
      return "خطأ في الإدخال";
    }

    passwordValidator(String value) {
      if (value == '' || value.isEmpty) {
        return 'حقل مطلوب';
      } else if (passwordController.text != confirmPasswordController.text) {
        return 'كلمة المرور ليست مطابقة';
      }
      return "خطأ في الإدخال";
    }

    // check email pattern
    bool isEmail(String input) => EmailValidator.validate(input);
    // validate email if empty or not correct
    emailValidator(String value) {
      //checkIsEmailAlreadyExist(value);
      if (value == '' || value.isEmpty) {
        return "حقل مطلوب";
      }
      if (!isEmail(value)) {
        return "الايميل غير صحيح";
      }
      // if (emailIsExist==true) {
      //   return  "الايميل موجود بالفعل";
      // }
      return null;
    }

// save form
    saveForm() async {
      FocusScope.of(context).unfocus();
      // TODO:saveForm Function
      // await checkIfUserNameIsAlreadyUsed();
      // if (acceptPolicy == true) {
      //   if (_formKey.currentState!.validate()) {
      //     if (userNameExist == false) {
      //       _formKey.currentState!.save();
      //       _userController.myUser.value.name = userNameController.text;
      //       _userController.myUser.value.email = emailController.text;
      //       _userController.myUser.value.password = passwordController.text;
      //       _userController.myUser.value.acceptPolicy = acceptPolicy;

            Get.to(() => CompleteRegistration1());
      //     } else {
      //       Get.snackbar("اسم المستخدم", "اسم المستخدم موجود بالفعل");
      //     }
      //   }
      // } else {
      //   Get.snackbar("سياسات الخصوصية", "يجب أن توافق على سياسات الخصوصية");
      // }
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Constant.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BelhalaLogo(height: height, width: width),
              Form(
                key: _formKey,
                child: Container(
                  width: width / 1.2,
                  margin: EdgeInsets.only(top: height / 25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                          leftTextAlign: true,
                          hint: 'اسم المستخدم',
                          keyboardType: TextInputType.name,
                          textEditingController: userNameController,
                          validateFun: nullValidator,
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        CustomTextField(
                          leftTextAlign: true,
                          hint: 'البريد الالكتروني',
                          keyboardType: TextInputType.emailAddress,
                          textEditingController: emailController,
                          validateFun: emailValidator,
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        CustomTextField(
                          leftTextAlign: true,
                          hint: 'أدخل كلمة المرور',
                          keyboardType: TextInputType.visiblePassword,
                          textEditingController: passwordController,
                          validateFun: nullValidator,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        CustomTextField(
                          leftTextAlign: true,
                          hint: 'أعد إدخال كلمة المرور',
                          keyboardType: TextInputType.visiblePassword,
                          textEditingController: confirmPasswordController,
                          validateFun: passwordValidator,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.to(() => const PrivacyPolicy());
                                },
                                child: const Text(
                                  'شروط الخصوصية  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13),
                                )),
                            const Text(' قرأت وأوافق على ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            const SizedBox(
                              width: 5,
                            ),
                            Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                checkColor: Colors.white,
                                value: acceptPolicy,
                                onChanged: (value) {
                                  //TODO: update value using controller
                                 // setState(() {
                                    acceptPolicy = value!;
                               //   });
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              saveForm();
                            },
                            child: const Text(
                              'استمرار',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
