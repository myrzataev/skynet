import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/features/authorization/presentation/widgets/policy_dialog.dart';

class AgreeTermsScreen extends StatefulWidget {
  const AgreeTermsScreen({Key? key}) : super(key: key);

  @override
  State<AgreeTermsScreen> createState() => _AgreeTermsScreenState();
}

class _AgreeTermsScreenState extends State<AgreeTermsScreen> {
  late SharedPreferences _prefs;
  bool buttonDisabled = false;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    bool agreedToAllTerms = _prefs.getBool('agreedToAllTerms') ?? false;
    if (agreedToAllTerms) {
      _navigateToHomePage();
    } else {
      _showTermsDialog();
    }
  }

  void _navigateToHomePage() {
    context.go("/bottomNavigation");
  }

  // By default, none of the checkboxes are checked
  Map<String, bool> agreements = {
    'term1': false,
    // 'term2': false,
    // Add more terms as needed
  };

  // Add corresponding text for each checkbox
  Map<String, String> agreementTexts = {
    'term1': "agreement.md",

    // 'term2': "rules.md"

    // Add more texts as needed
  };

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Check if all checkboxes are checked
    if (agreements.containsValue(false)) {
      // If not, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Пожалуйста, согласитесь со всеми условиями')),
      );
      // buttonDisabled = false;
    } else {
      // If all checkboxes are checked, save the agreement status and navigate to the home page
      _prefs.setBool('agreedToAllTerms', true);
      
      buttonDisabled = true;
      print(buttonDisabled);
      _navigateToHomePage();
    }
  }

  void _showTermsDialog() {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return PopScope(
              canPop: false,
              child: Scaffold(
                backgroundColor: Colors.white,
                key: scaffoldKey,
                // appBar: AppBar(
              
                //   title: const Text('Политика конфиденциальности'),
                // ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07,
                            bottom: MediaQuery.of(context).size.height * 0.038),
                        child: const Text(
                          "Добро пожаловать!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Gotham",
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 232, 229, 229),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Политика конфиденциальности",
                                  softWrap: true,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Gotham",
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: agreements.keys.map((key) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: RichText(
                                          selectionColor: Colors.blue,
                                          text: TextSpan(children: [
                                            const TextSpan(
                                                text:
                                                    "Это приложение уважает и защищает конфиденциальность пользователей. Чтобы предоставить вам более точные и персонализированные сервисы, это приложение будет использовать и раскрывать ваши данные в соответствии с настоящей политикой конфиденциальности. См.подробнее в ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Gotham",
                                                    fontSize: 14)),
                                            TextSpan(
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            const PolicyDialog(
                                                                mdFileName:
                                                                    "agreement.md"));
                                                  },
                                                text: "Сервисном соглашении ",
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily: "Gotham",
                                                    fontSize: 14)),
                                            const TextSpan(
                                                text: "и ",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            TextSpan(
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            const PolicyDialog(
                                                                mdFileName:
                                                                    "rules.md"));
                                                  },
                                                text:
                                                    "Политики конфиденциальности",
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily: "Gotham",
                                                    fontSize: 14)),
                                          ]),
                                          // agreementTexts[key.
                                          //     ], // Use corresponding text for the checkbox
                                          softWrap: true,
                                          maxLines: 15,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 330,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                              activeColor: Colors.blue,
                                              value: agreements[key],
                                              onChanged: (value) {
                                                setState(() {
                                                  agreements[key] =
                                                      value ?? false;
                                                  buttonDisabled =
                                                      !buttonDisabled;
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              width: 200,
                                              child: Text(
                                                'Я Согласен на обработку персональных данных',
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: "Gotham"),
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.75,
                                          child: ElevatedButton(
                                              onPressed: buttonDisabled
                                                  ? () => _doSomething()
                                                  : null,
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                              ),
                                              child: const Text("Принимаю",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ),
                                      )
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
