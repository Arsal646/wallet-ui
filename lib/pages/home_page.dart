import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_ui/utils/bank_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade400,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: const [
                  BankCard(color: Color.fromARGB(255, 77, 111, 139)),
                  BankCard(color: Color.fromARGB(255, 67, 93, 112)),
                  BankCard(color: Color.fromARGB(255, 40, 67, 89)),
                ],
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(),
          )
        ],
      ),
    );
  }
}
