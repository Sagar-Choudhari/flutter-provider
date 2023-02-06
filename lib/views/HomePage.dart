import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(provider.eligibilityMsg.toString(),style: TextStyle(
                      color: (provider.isEligible == true) ? Colors.green : Colors.red,
                    ),),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter age",
                      ),
                      onChanged: (val) {
                        provider.checkEligibility(int.parse(val));
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
