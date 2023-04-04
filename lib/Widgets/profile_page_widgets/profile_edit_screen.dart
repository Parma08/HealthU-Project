import 'package:fiteness_x/Widgets/onboardingandloginwidgets/comple_your_profile_slider_view.dart';
import 'package:fiteness_x/Widgets/onboardingandloginwidgets/range_slider_picker.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:fiteness_x/screens/create_account_page.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../modals/firebaseservice.dart';
import '../onboardingandloginwidgets/input_widget.dart';

class ProfileEditScreen extends StatefulWidget {
  static String routeName = '/complete-your-profile';

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String? gender =
      '${getGenderEnumToStringConvertor(getUserDetails.gender)[0].toUpperCase()}${getGenderEnumToStringConvertor(getUserDetails.gender).substring(1)}';

  Gender selectedGender = getUserDetails.gender;

  DateTime? dateOfBirth = getUserDetails.dateOfBirth;

  TextEditingController? dob = TextEditingController(
      text: DateFormat.yMMMd().format(getUserDetails.dateOfBirth));

  TextEditingController firstName =
      TextEditingController(text: getUserDetails.firstName);

  TextEditingController lastName =
      TextEditingController(text: getUserDetails.lastName);

  TextEditingController weight =
      TextEditingController(text: getUserDetails.weightInKgs.toString());

  TextEditingController height =
      TextEditingController(text: getUserDetails.heightInCM.toString());

  List<String> availableGenders = ['Male', 'Female', 'Other'];
  Future openDatePicker(BuildContext context) async {
    dateOfBirth = await showDatePicker(
        context: context,
        initialDate: DateTime(2014),
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(const Duration(days: 2920)));

    setState(() {
      dob =
          TextEditingController(text: DateFormat.yMMMd().format(dateOfBirth!));
    });
  }

  Future save() async {
    DateTime birthDate = dateOfBirth!;

    var backupFirstName = getUserDetails.firstName;
    var backupLastName = getUserDetails.lastName;
    var backupbirthDate = getUserDetails.dateOfBirth;
    var backupGender = getUserDetails.gender;
    var backupWeight = getUserDetails.weightInKgs;
    var backupHeight = getUserDetails.heightInCM;
    var backupBmi = getUserDetails.bmi;
    var backupBmr = getUserDetails.bmr;
    var backupIbw = getUserDetails.ibw;

    setUserDetails(UserModal(
        userId: getUserDetails.userId,
        firstName: firstName.text,
        lastName: lastName.text,
        dateOfBirth: birthDate,
        gender: selectedGender,
        weightInKgs: int.parse(weight.text),
        heightInCM: int.parse(height.text),
        bmi: getCalculatedBMI(int.parse(weight.text), int.parse(height.text)),
        bmr: getCalculatedBMR(int.parse(weight.text), int.parse(height.text),
            birthDate, selectedGender),
        ibw: getCalculatedIdealBodyWeight(
            int.parse(height.text), selectedGender),
        waterGoalsInLiters: getUserDetails.waterGoalsInLiters,
        waterConsumedInADay: getUserDetails.waterConsumedInADay));

    final status = await editUserDetails();
    if (status != SUCCESS_MESSAGE) {
      setUserDetails(UserModal(
          userId: getUserDetails.userId,
          firstName: backupFirstName,
          lastName: backupLastName,
          dateOfBirth: backupbirthDate,
          gender: backupGender,
          weightInKgs: backupWeight,
          heightInCM: backupHeight,
          bmi: backupBmi,
          bmr: backupBmr,
          ibw: backupIbw,
          waterGoalsInLiters: getUserDetails.waterGoalsInLiters,
          waterConsumedInADay: getUserDetails.waterConsumedInADay));
    }
    return status;
  }

  Future openBottomModal(
      {required BuildContext context,
      required int initialValue,
      required int minimumValue,
      required int maximumValue,
      required String type,
      required String heading,
      required String units}) async {
    await showModalBottomSheet(
        context: context,
        builder: (_) {
          return RangeSliderPicker(
            minumumValue: minimumValue,
            maximumValue: maximumValue,
            initialValue: initialValue,
            heading: heading,
            units: units,
          );
        }).then((value) {
      if (type == 'height') {
        height = TextEditingController(text: value.toString());
      } else if (type == 'weight') {
        weight = TextEditingController(text: value.toString());
      } else {
        print("PLEASE CHOOSEE A VALID TYPE");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              height: MediaQuery.of(context).size.height -
                  (AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Scrollbar(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F8F8),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.person_2_outlined),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 30),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 31, 31, 31),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                keyboardType: TextInputType.name,
                                controller: firstName,
                                decoration: const InputDecoration(
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(fontSize: 14),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F8F8),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.person_2_outlined),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 30),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 31, 31, 31),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                keyboardType: TextInputType.name,
                                controller: lastName,
                                decoration: const InputDecoration(
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(fontSize: 14),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(bottom: 10, top: 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.person_2_outlined),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: DropdownButton(
                              value: gender,
                              style: TextStyle(
                                color: Color(
                                    0xFF1D1617), // Customize the color of the selected item here
                              ),
                              dropdownColor: Color(0xFF92A3FD),
                              underline: SizedBox(),
                              hint: Text(
                                'Specify your Gender       ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              items: availableGenders.map((gender) {
                                return DropdownMenuItem(
                                  child: Text(
                                    gender,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  value: gender,
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  gender = val;
                                  if (val == 'Male') {
                                    selectedGender = Gender.male;
                                  } else if (val == 'Female') {
                                    selectedGender = Gender.female;
                                  } else if (val == 'Other') {
                                    selectedGender = Gender.others;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.calendar_month_outlined),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: TextField(
                              controller: dob,
                              onTap: () {
                                openDatePicker(context);
                              },
                              readOnly: true,
                              style: TextStyle(
                                  color: Color(0xFF1D1617),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Date Of Birth',
                                  hintStyle: TextStyle(fontSize: 14)),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.monitor_weight_outlined),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              controller: weight,
                              onTap: () {
                                openBottomModal(
                                    context: context,
                                    initialValue: 55,
                                    minimumValue: 25,
                                    maximumValue: 180,
                                    type: 'weight',
                                    heading: 'Your Weight',
                                    units: 'kilogram');
                              },
                              readOnly: true,
                              style: TextStyle(
                                  color: Color(0xFF1D1617),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your Weight',
                                  hintStyle: TextStyle(fontSize: 14)),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(right: 5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                gradient: secondaryLinearGradient,
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(
                              'KG',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.swap_vert),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              controller: height,
                              onTap: () {
                                openBottomModal(
                                    context: context,
                                    initialValue: 180,
                                    minimumValue: 160,
                                    maximumValue: 243,
                                    type: 'height',
                                    heading: 'Your Height',
                                    units: 'Centimeters');
                              },
                              readOnly: true,
                              style: TextStyle(
                                  color: Color(0xFF1D1617),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your Height',
                                  hintStyle: TextStyle(fontSize: 14)),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: secondaryLinearGradient,
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(
                              'CM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          final status = await save();
                          if (status == SUCCESS_MESSAGE) {
                            showSuccessDialog(
                                context: context,
                                successMessage: 'Details updated Successfully');
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.of(context).pop();
                            });
                          } else {
                            showErrorDialog(
                                context: context,
                                errorMessage: status,
                                callbackFuction: save);
                          }
                          // gotoCreateAcoountScreen(context);
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 40, left: 10, right: 10),
                          decoration: BoxDecoration(
                              gradient: primaryLinearGradient,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
