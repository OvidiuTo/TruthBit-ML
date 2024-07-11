import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truth_bit/pages/ReportNews/report_news_service.dart';
import 'package:truth_bit/pages/TopNews/top_news_model.dart';
import 'package:truth_bit/pages/homepage.dart';

class ReportNews extends StatefulWidget {
  final Article article;
  final String reportType;
  const ReportNews(
      {super.key, required this.reportType, required this.article});

  @override
  State<ReportNews> createState() => _ReportNewsState();
}

class _ReportNewsState extends State<ReportNews> {
  final ReportNewsService reportNewsService = ReportNewsService();
  final TextEditingController _controller = TextEditingController();
  bool isTrue = false;
  bool isFalse = false;
  String articleType = '';
  bool reportSubmit = false;
  @override
  void initState() {
    super.initState();
    widget.reportType == "true"
        ? isTrue = true
        : widget.reportType == 'false'
            ? isFalse = true
            : null;
    articleType = isTrue
        ? 'true'
        : isFalse
            ? 'fake'
            : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text(
          "Classify",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        isFalse = isTrue;
                        isTrue = !isTrue;
                        articleType = isTrue ? 'true' : 'fake';
                        setState(() {});
                      },
                      child: Container(
                        // width: 180,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: Image.asset(
                                'assets/check.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Real",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: isTrue
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            const Spacer(),
                            Checkbox(
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
                                value: isTrue,
                                onChanged: (value) {
                                  isFalse = isTrue;
                                  isTrue = !isTrue;
                                  articleType = isTrue ? 'true' : 'fake';
                                  setState(() {});
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        isTrue = isFalse;
                        isFalse = !isFalse;
                        articleType = isTrue ? 'true' : 'fake';
                        setState(() {});
                      },
                      child: Container(
                        // width: 180,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: Image.asset(
                                'assets/no.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Fake",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: isFalse
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            const Spacer(),
                            Checkbox(
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
                                value: isFalse,
                                onChanged: (value) {
                                  isTrue = isFalse;
                                  isFalse = !isFalse;
                                  articleType = isTrue ? 'true' : 'fake';
                                  setState(() {});
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              if (articleType != "")
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      "Could you please explain why you classify this article as $articleType?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600),
                    )),
                  ],
                ),
              if (articleType != "")
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: null,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              if (articleType != "")
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      "Any reliable source would help us better classify this article",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600),
                    )),
                    Text(
                      "*",
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.surface,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (reportSubmit == false) {
                      if (_controller.text.isNotEmpty) {
                        reportSubmit = true;
                        setState(() {});
                        reportNewsService.reportArticle(
                            widget.article, _controller.text, articleType);
                        Timer(const Duration(seconds: 5), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomePage();
                              },
                            ),
                          );
                        });
                      }
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
              const SizedBox(
                height: 25,
              ),
              if (reportSubmit)
                Text(
                  "Thank you for your contribution !",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600),
                ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
