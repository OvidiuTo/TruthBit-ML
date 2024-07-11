import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truth_bit/pages/ReportNews/report_news.dart';
import 'package:truth_bit/pages/TopNews/top_news_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class TopNewsExpanded extends StatefulWidget {
  final bool loggedIn;
  final int index;
  final Article article;

  const TopNewsExpanded(
      {super.key,
      required this.index,
      required this.article,
      required this.loggedIn});

  @override
  _TopNewsExpandedState createState() => _TopNewsExpandedState();
}

class _TopNewsExpandedState extends State<TopNewsExpanded> {
  bool loggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.currentUser != null
        ? loggedIn = true
        : loggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.index,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          centerTitle: false,
          title: Text(
            "Truth Bit",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.surface),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    DefaultTextStyle(
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.tertiary),
                      child: Text(widget.article.title),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.surface),
                            child: Text(timeago.format(
                                DateTime.parse(widget.article.publishedAt))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (widget.article.author != '')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Text("By ${widget.article.author}"),
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary),
                            child: Text(
                              DateFormat.yMMMMd().format(
                                  DateTime.parse(widget.article.publishedAt)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (widget.article.urlToImage != "")
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            widget.article.urlToImage,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Container();
                            },
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (widget.article.description.isNotEmpty)
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary),
                        textAlign: TextAlign.justify,
                        child: Text(widget.article.description),
                      ),
                    if (widget.article.description.isNotEmpty)
                      const SizedBox(
                        height: 25,
                      ),
                    if (widget.article.content.isNotEmpty)
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary),
                        textAlign: TextAlign.justify,
                        child: Text(widget.article.content),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (widget.article.url.isNotEmpty)
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchUrl();
                            },
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              textAlign: TextAlign.justify,
                              child: const Text('Read more'),
                            ),
                          ),
                        ],
                      ),
                    if (loggedIn)
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ReportNews(
                                      reportType: 'true',
                                      article: widget.article,
                                    );
                                  }));
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ReportNews(
                                      reportType: 'false',
                                      article: widget.article,
                                    );
                                  }));
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(widget.article.url);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
