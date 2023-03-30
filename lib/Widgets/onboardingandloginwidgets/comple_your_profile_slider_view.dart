import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes.dart';

class ScrollViewModal {
  final String illustrationLink;
  final String heading;
  final String content;
  ScrollViewModal(
      {required this.illustrationLink,
      required this.heading,
      required this.content});
}

class CompleteYourProfileSlides extends StatelessWidget {
  final List<ScrollViewModal> slides = [
    ScrollViewModal(
        illustrationLink: 'assets/images/complete_profile_one.svg',
        heading: 'Loose Fat',
        content:
            'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass'),
    ScrollViewModal(
        illustrationLink: 'assets/images/complete_profile_two.svg',
        heading: 'Improve Strength',
        content: 'I lack strength. I want to become stronger'),
    ScrollViewModal(
        illustrationLink: 'assets/images/complete_profile_three.svg',
        heading: 'Lean & Tone',
        content:
            'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way'),
    ScrollViewModal(
        illustrationLink: 'assets/images/complete_profile_four.svg',
        heading: 'Improve Shape',
        content:
            'I have a low amount of body fat and need / want to build more muscle'),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: slides.map((slide) {
          return Container(
              padding:
                  EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(50)),
              height: MediaQuery.of(context).size.height * 0.42,
              child: Column(
                children: [
                  Container(
                      height: 150,
                      child: SvgPicture.asset(slide.illustrationLink)),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Text(
                      slide.heading,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Text(
                      slide.content,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ));
        }).toList(),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.42,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 3)));
  }
}
