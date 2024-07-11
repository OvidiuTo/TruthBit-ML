import 'package:flutter/material.dart';

class EducationResources extends StatelessWidget {
  const EducationResources({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'How to Combat Disinformation:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '1. Verify the source:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Always check the credibility of the source before believing or sharing information. Look for the author\'s credentials and the website\'s reputation.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '2. Cross-check information:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Look for the same news on multiple reputable sources to ensure its accuracy. Different perspectives can help you get a fuller picture.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '3. Be skeptical of sensational headlines: ',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Disinformation often uses sensational headlines to grab attention. Read beyond the headline to understand the full story.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '4. Check the date: ',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Sometimes old news is recirculated as current news to mislead people. Always check the publication date to ensure the information is current.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '5. Look for evidence: ',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Reliable news should be backed by evidence and facts. Check for sources, data, and references that support the claims made.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '6. Be aware of biases:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Understand the potential biases of the sources you are reading from. Consider the political, cultural, or financial motivations that might influence the information.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '7. Report disinformation:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'If you come across false information, report it to the platform or website hosting it. This helps prevent the spread of false information.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '8. Educate others: ',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Share your knowledge about disinformation with friends and family to help them stay informed. Encourage critical thinking and media literacy.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Text(
                      'Want to become a verified fact checker? Contact us at: ovidiutoma.andrei@gmail.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [],
    //     ),
    //   ),
    // );
  }
}
