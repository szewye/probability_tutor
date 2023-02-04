import 'package:flutter/material.dart';
import 'package:probability_tutor/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

import 'homepage.dart';

class Monty_Hall extends StatelessWidget {
  const Monty_Hall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        color: lightBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Monty Hall',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.apply(fontWeightDelta: 20, color: darkBlue),
              ),
              const SizedBox(height: 50),
              Container(
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(title: "Play", onPress: () {}),
                    ),
                    const SizedBox(height: buttonsDistance),
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                        title: "Simulate",
                        onPress: () {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        },
                        child: Text(
                          "back to home page",
                          style: Theme.of(context).textTheme.bodySmall?.apply(
                                fontWeightDelta: 20,
                                color: darkBlue,
                                decoration: TextDecoration.underline,
                              ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
