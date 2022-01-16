import 'package:belhalal_update/screen/widgets/belhalal_logo.dart';
import 'package:belhalal_update/screen/widgets/custom_text_field.dart';
import 'package:belhalal_update/screen/widgets/drop_down_input.dart';
import 'package:belhalal_update/screen/widgets/sign_in_button.dart';
import 'package:belhalal_update/value/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompleteRegistration2 extends StatelessWidget {
   CompleteRegistration2({Key? key}) : super(key: key);

  TextEditingController skinColorController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String marriedTypeValue = 'دائم معلن';
  var marriedTypes = ['دائم معلن', 'دائم غير معلن','آخر'];
  String annualIncomeValue = 'أقل من 50\$ ألف';
  var annualIncomeTypes = [
    'أكثر من 150\$ ألف',
    'أقل من 100\$ ألف',
    'أقل من 50\$ ألف'
  ];
  nullValidator(String value) {
    if (value == '' || value.isEmpty) {
      return 'حقل مطلوب';
    }
    return null;
  }
  // save form
  saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.kPrimaryColor,
        elevation: 0,
      ),
      backgroundColor: Constant.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
                      AppDropdownInput( 
                        hintText: "نوع الزواج",
                        options:   marriedTypes,
                        value: marriedTypeValue,
                        onChanged: (String? value) {
                          //TODO: update value using controller
                         // setState(() {
                            marriedTypeValue = value!;
                       //   });
                        },
                        getLabel: (String? value) => value,
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      CustomTextField(
                        hint: 'لون البشرة',
                        leftTextAlign: false,
                        keyboardType: TextInputType.text,
                        textEditingController: skinColorController,
                        validateFun: nullValidator,
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      AppDropdownInput(
                        hintText: "الدخل السنوي",
                        options: annualIncomeTypes,
                        value: annualIncomeValue,
                        onChanged: (String? value) {
                           //TODO: update value using controller
                         // setState(() {
                            annualIncomeValue = value!;
                          // });
                        },
                        getLabel: (String? value) => value,
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      CustomTextField(
                        leftTextAlign: false,
                        hint: 'المهنة',
                        keyboardType: TextInputType.text,
                        textEditingController: jobController,
                        validateFun: nullValidator,
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 2.4,
                  child: CustomTextField(
                    leftTextAlign: false,
                    width: width / 2.4,
                    hint: 'الوزن',
                    keyboardType: TextInputType.number,
                    textEditingController: weightController,
                    validateFun: nullValidator,
                  ),
                ),
                SizedBox(
                  width: width / 40,
                ),
                SizedBox(
                  width:width / 2.4,
                  child: CustomTextField(
                    leftTextAlign: false,
                    width: width / 2.4,
                    hint: 'الطول',
                    keyboardType: TextInputType.number,
                    textEditingController: hightController,
                    validateFun: nullValidator,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height:25,
            ),
            SignInButton(
              width: width,
              height: height,
              label: 'تسجيل',
              labelcolor: Colors.white,
              primaryColor: Constant.kPrimaryColor,
              borderColor: Colors.white,
              ontop: () {
              FocusScope.of(context).unfocus();
              saveForm();
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}
