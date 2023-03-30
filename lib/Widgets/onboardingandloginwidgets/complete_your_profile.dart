import 'package:fiteness_x/Widgets/onboardingandloginwidgets/comple_your_profile_slider_view.dart';
import 'package:fiteness_x/Widgets/onboardingandloginwidgets/range_slider_picker.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:fiteness_x/screens/create_account_page.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CompleteYourProfile extends StatefulWidget {
  static String routeName = '/complete-your-profile';

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  String? gender;

  Gender? selectedGender = null;

  DateTime? dateOfBirth;

  TextEditingController? dob;

  TextEditingController? weight;

  TextEditingController? height;

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

  Future gotoCreateAcoountScreen(BuildContext context) async {
    try {
      if (height!.text.isEmpty ||
          weight!.text.isEmpty ||
          dob!.text.isEmpty ||
          selectedGender == null) {
        showErrorDialogWithoutRetry(context, 'Please fill all the fields');
        return;
      } else {
        Navigator.pushNamed(context, CreateAccount.routeName, arguments: {
          'gender': selectedGender,
          'dob': dateOfBirth,
          'height': int.parse(height!.text),
          'weight': int.parse(weight!.text),
        });
      }
    } catch (e) {
      print("ERROR - $e");
      showErrorDialogWithoutRetry(context, 'Please fill all the fields');
    }
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
      body: Container(
        padding: EdgeInsets.only(top: 60),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CompleteYourProfileSlides(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Let\'s complete your profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1D1617)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('It will help us to know more about you',
                  style: TextStyle(fontSize: 13, color: Color(0xFF7B6F72))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Scrollbar(
                child: ListView(
                  children: [
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
                              value: gender,
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
                                    initialValue: 100,
                                    minimumValue: 50,
                                    maximumValue: 280,
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
                        onTap: () {
                          gotoCreateAcoountScreen(context);
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  size: 14,
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                              ]),
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
