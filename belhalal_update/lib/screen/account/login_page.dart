import 'package:belhalal_update/screen/account/registration_screen.dart';
import 'package:belhalal_update/screen/account/update_user_password.dart';
import 'package:belhalal_update/screen/widgets/custom_text_field.dart';
import 'package:belhalal_update/screen/widgets/sign_in_button.dart';
import 'package:belhalal_update/value/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final  _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() async {
    // TODO:
  }
  nullValidator(String value) {
    if (value == '' || value.isEmpty) {
      return 'حقل مطلوب';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    saveForm() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      login();
    }
  }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: height / 2.5,
                width: width / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/belhalal.png',
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: width / 12.0,
                      right: width / 12.0,
                      top: height / 15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                            onChanged: (value) {
                             // TODO:
                             // _athUser.password = value;
                            },
                            leftTextAlign: true,
                            validateFun: nullValidator,
                            keyboardType: TextInputType.visiblePassword,
                            textEditingController: passwordController,
                            icon: Icons.lock,
                            obscureText: true,
                            hint: "كلمة المرور",
                          ),
                        SizedBox(height: height / 40.0),
                        CustomTextField(
                            onChanged: (value) {
                             // _athUser.email = value;
                            },
                            leftTextAlign: true,
                            validateFun: nullValidator,
                            keyboardType: TextInputType.emailAddress,
                            textEditingController: emailController,
                            icon: Icons.email,
                            hint: "البريد الالكتروني",
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
               Get.to(const UpdateUserPassword());
              },
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 0, // Space between underline and text
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.blueAccent,
                  width: 1.0, // Underline thickness
                ))),
                child: const Text(
                  "نسـيـت كلمـة الـمـرور ؟",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SignInButton(
              ontop: saveForm, 
              width: width,
              height: height,
              label: 'تسجيل',
              primaryColor: Colors.redAccent,
            ),
            SizedBox(
              height: height / 15,
            ),
            GestureDetector(
                onTap: () {
                 Get.to(RegistrationScreen());
                },
                child: const Text(
                  'مستخدم جديد',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:Constant.kPrimaryColor),
                )),
          ],
        ),
      ),
      ),
    );
  }

}
