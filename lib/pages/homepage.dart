import 'package:flutter/material.dart';
import 'package:truth_bit/pages/EducationResources/education_resources.dart';
import 'package:truth_bit/pages/FactChecking/fact_checking_view.dart';
import 'package:truth_bit/pages/Profile/profile.dart';
import 'package:truth_bit/pages/TopNews/top_news_view.dart';
import 'package:truth_bit/widgets/navigator_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool topNews = true;
  bool factChecking = false;
  bool reportMisinformation = false;
  bool educationalResources = false;
  bool communityForum = false;
  bool aboutUs = false;

  int selectedIndex = 0;
  List<Widget> pageIndex = [
    const TopNewsView(),
    const FactCheckingView(),
    const EducationResources(),
    Container(),
    Container(),
  ];
  void _handleTap(int tabNumber) {
    selectedIndex = tabNumber;
    topNews = false;
    factChecking = false;
    educationalResources = false;
    communityForum = false;
    aboutUs = false;
    switch (tabNumber) {
      case 0:
        topNews = true;
        break;
      case 1:
        factChecking = true;
        break;
      case 2:
        educationalResources = true;
        break;
      default:
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
          title: Row(
            children: [
              SizedBox(
                height: 70,
                width: 75,
                child: Image.asset(
                  "assets/logo_truthbit.png",
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                "Truth Bit",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const Profile();
                })),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.person,
                    size: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  )),
                ),
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customPrefferedSize(),
            Expanded(child: pageIndex[selectedIndex])
          ],
        ),
      ),
    );
  }

  Widget customPrefferedSize() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 44,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                _handleTap(0);
              },
              child: NavigatorTile(
                isSelected: topNews,
                title: "Top News",
              ),
            ),
            GestureDetector(
              onTap: () {
                _handleTap(1);
              },
              child: NavigatorTile(
                isSelected: factChecking,
                title: "Fact-Checking",
              ),
            ),
            GestureDetector(
              onTap: () {
                _handleTap(2);
              },
              child: NavigatorTile(
                isSelected: educationalResources,
                title: "Education Resources",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
