import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truth_bit/pages/TopNews/top_news_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class TopNewsExpanded extends StatelessWidget {
  final int index;
  final Article article;
  const TopNewsExpanded(
      {super.key, required this.index, required this.article});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: DefaultTextStyle(
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.surface),
                  child: Text(article.title),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary),
                            child: Text(timeago
                                    .format(DateTime.parse(article.publishedAt))
                                // DateFormat.yMMMMd()
                                //     .format(DateTime.parse(article.publishedAt)),
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (article.author != '')
                      Row(
                        children: [
                          Flexible(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Text("By ${article.author}"),
                            ),
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary),
                            child: Text(
                              DateFormat.yMMMMd()
                                  .format(DateTime.parse(article.publishedAt)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        article.urlToImage,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Container();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (article.description.isNotEmpty)
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary),
                        textAlign: TextAlign.justify,
                        child: Text(article.description),
                      ),
                    if (article.description.isNotEmpty)
                      const SizedBox(
                        height: 25,
                      ),
                    if (article.content.isNotEmpty)
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary),
                        textAlign: TextAlign.justify,
                        child: Text(article.content),
                      ),
                    if (article.url.isNotEmpty)
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
                              child: Text('Read more'),
                            ),
                          ),
                        ],
                      ),
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
    final Uri url = Uri.parse(article.url);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
