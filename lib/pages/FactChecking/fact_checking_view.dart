import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FactCheckingView extends StatefulWidget {
  const FactCheckingView({super.key});

  @override
  State<FactCheckingView> createState() => _FactCheckingViewState();
}

class _FactCheckingViewState extends State<FactCheckingView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return factCheckingPage(context);
  }

  Widget factCheckingPage(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                children: <InlineSpan>[
                  const TextSpan(text: "Please insert "),
                  // TextSpan(
                  //     text: "the news",
                  //     style: TextStyle(
                  //       color: Theme.of(context).colorScheme.surface,
                  //     )),
                  WidgetSpan(
                    child: DefaultTextStyle(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                      child: AnimatedTextKit(
                        animatedTexts: [WavyAnimatedText("the news")],
                        isRepeatingAnimation: true,
                        pause: const Duration(seconds: 4),
                        totalRepeatCount: 5,
                      ),
                    ),
                  ),
                  const TextSpan(text: " you want to check"),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                // width: 275,
                height: 74,
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    debugPrint("Text changed: $value");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
