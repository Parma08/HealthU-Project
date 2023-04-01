import 'package:fiteness_x/Widgets/onboardingandloginwidgets/complete_your_profile.dart';
import 'package:fiteness_x/screens/login_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../Widgets/utils/page_transition.dart';
import './create_account_page.dart';
import './introduction_screen.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  static const routeName = '/getstarted';

  void gotoIntroductionPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return IntroductionScreen(
          screenInfo: IntroductionScreenModal(
              progressPercent: 0.25,
              iconLink: 'assets/images/intro_one.svg',
              titleText: 'Track Your Goal',
              bodyText:
                  'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
              onTapMethod: gotoSecondIntroductionPage));
    }));
  }

  void gotoSecondIntroductionPage(BuildContext context) {
    Navigator.of(context).push(RightToLeftTransition(
        child: IntroductionScreen(
            screenInfo: IntroductionScreenModal(
                progressPercent: 0.50,
                iconLink: 'assets/images/intro_two.svg',
                titleText: 'Get Burn',
                bodyText:
                    'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
                onTapMethod: gotoThirdIntroductionPage))));
  }

  void gotoThirdIntroductionPage(BuildContext context) {
    Navigator.of(context).push(RightToLeftTransition(
        child: IntroductionScreen(
            screenInfo: IntroductionScreenModal(
                progressPercent: 0.75,
                iconLink: 'assets/images/intro_three.svg',
                titleText: 'Eat Well',
                bodyText:
                    'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
                onTapMethod: gotoFourthIntroductionPage))));
  }

  void gotoFourthIntroductionPage(BuildContext context) {
    Navigator.of(context).push(RightToLeftTransition(
        child: IntroductionScreen(
            screenInfo: IntroductionScreenModal(
                progressPercent: 1.0,
                iconLink: 'assets/images/intro_four.svg',
                titleText: 'Improve Sleep Quality',
                bodyText:
                    'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
                onTapMethod: gotoCreateAccount))));
  }

  void gotoCreateAccount(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: SvgPicture.asset(
                    'assets/images/app_logo.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Healthier U starts with HealthyU',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              gotoIntroductionPage(context);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(100)),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
