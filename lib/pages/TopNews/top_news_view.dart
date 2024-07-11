import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truth_bit/api.dart';
import 'package:truth_bit/pages/ReportNews/report_news.dart';
import 'package:truth_bit/pages/TopNews/top_news_expanded.dart';
import 'package:truth_bit/pages/TopNews/top_news_model.dart';
import 'package:truth_bit/pages/TopNews/top_news_service.dart';

class TopNewsView extends StatefulWidget {
  const TopNewsView({super.key});

  @override
  State<TopNewsView> createState() => _TopNewsViewState();
}

class _TopNewsViewState extends State<TopNewsView> {
  bool isDoneLoading = false;
  late NewsResponse newsResponse;
  List<String> regionList = <String>['United States', 'Romania'];
  String dropdownValue = "";
  String apiCall = "";
  bool loggedIn = false;

  @override
  void initState() {
    dropdownValue = regionList.first;
    apiCall = "$baseUrl$country$apiKeyString";

    super.initState();
    FirebaseAuth.instance.currentUser != null
        ? loggedIn = true
        : loggedIn = false;
    getNewsResponse();
  }

  void getNewsResponse() async {
    newsResponse = await TopNewsService.getNews(apiCall);
    isDoneLoading = true;
    setState(() {});
  }

  void getNewsResponsePickRegion(String newApi) async {
    newsResponse = await TopNewsService.getNews(newApi);
    print(newsResponse.articles.length);
    isDoneLoading = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
                underline: Container(
                    height: 2, color: Theme.of(context).colorScheme.surface),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                    isDoneLoading = false;
                    if (dropdownValue == "United States") {
                      country = 'us';
                    } else {
                      country = 'ro';
                    }
                    apiCall = "$baseUrl$country$apiKeyString";

                    getNewsResponsePickRegion(apiCall);
                  });
                },
                items: regionList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        isDoneLoading
            ? Expanded(
                child: ListView.builder(
                  itemCount: newsResponse.articles.length,
                  itemBuilder: (context, index) {
                    if (newsResponse.articles[index].title != '[Removed]') {
                      return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TopNewsExpanded(
                              loggedIn: loggedIn,
                              index: index,
                              article: newsResponse.articles[index]);
                        })),
                        child: Hero(
                          tag: index,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Card(
                              color: Theme.of(context).colorScheme.primary,
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    newsResponse.articles[index].title,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        newsResponse
                                            .articles[index].description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (newsResponse
                                              .articles[index].urlToImage !=
                                          "")
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.network(
                                              newsResponse
                                                  .articles[index].urlToImage,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                return Container();
                                              },
                                            ),
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              newsResponse
                                                  .articles[index].author,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              DateFormat.yMMMMd().format(
                                                  DateTime.parse(newsResponse
                                                      .articles[index]
                                                      .publishedAt)),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      if (loggedIn)
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return ReportNews(
                                                    reportType: 'unknown',
                                                    article: newsResponse
                                                        .articles[index],
                                                  );
                                                }));
                                              },
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
                                                    "Classify",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
      ],
    );
  }
}
