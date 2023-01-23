import 'package:flutter/material.dart';
import 'package:probability_tutor/constants.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Probability Tutor',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Monty Hall Problem',
                      style: Theme.of(context).textTheme.headline5),
                )),
            const SizedBox(height: buttonsDistance),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Conditional Probability',
                      style: Theme.of(context).textTheme.headline5),
                )),
            const SizedBox(height: buttonsDistance),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Bayes\' Theorem',
                      style: Theme.of(context).textTheme.headline5),
                )),
          ],
        ),
      );
    });
  }
}
