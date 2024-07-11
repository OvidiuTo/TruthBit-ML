import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:truth_bit/api.dart';

class FactCheckingView extends StatefulWidget {
  const FactCheckingView({super.key});

  @override
  State<FactCheckingView> createState() => _FactCheckingViewState();
}

class _FactCheckingViewState extends State<FactCheckingView> {
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();
  String newsReport = '';

  Future<void> sendNews(String news) async {
    try {
      final response = await http.post(
        Uri.parse(getNewsReport),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'news': news}),
      );

      if (response.statusCode == 200) {
        isLoading = false;
        newsReport = response.body;
        Map<String, dynamic> jsonObject = jsonDecode(newsReport);
        String resultFinal = jsonObject['result'];
        newsReport = resultFinal;

        setState(() {});
      } else {
        isLoading = false;
        setState(() {});
      }
    } catch (e) {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return factCheckingPage(context);
  }

  Widget factCheckingPage(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (newsReport.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "This article ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    newsReport,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            if (newsReport.isEmpty)
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                  children: <InlineSpan>[
                    const TextSpan(text: "Enter "),
                    WidgetSpan(
                      child: DefaultTextStyle(
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                        child: AnimatedTextKit(
                          animatedTexts: [WavyAnimatedText("the article")],
                          isRepeatingAnimation: true,
                          pause: const Duration(seconds: 4),
                          totalRepeatCount: 5,
                        ),
                      ),
                    ),
                    const TextSpan(text: " you would like to check."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  // height: 74,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: null,
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_controller.text.isNotEmpty) {
                            isLoading = true;
                            setState(() {});
                            await sendNews(_controller.text);
                            setState(() {});
                          }
                        },
                        child: const SizedBox(
                          height: 46,
                          width: 108,
                          child: Center(
                            child: Text(
                              "Show Me",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      if (_controller.text.isNotEmpty)
                        GestureDetector(
                            onTap: () {
                              _controller.clear();
                              newsReport = '';
                              setState(() {});
                            },
                            child: SizedBox(
                              width: 45,
                              child: Center(
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )),
                      if (_controller.text.isEmpty)
                        const SizedBox(
                          width: 45,
                        ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
