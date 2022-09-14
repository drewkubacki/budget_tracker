import 'package:budget_tracker/services/theme_service.dart';
import 'package:budget_tracker/widgets/add_budget_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];

  int _currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Budget Tracker")),
        leading: IconButton(
          onPressed: () {
            themeService.darkTheme = !themeService.darkTheme;
          },
          icon: Icon(themeService.darkTheme ? Icons.sunny : Icons.dark_mode),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: ((context) {
                  return AddBudgetDialog(
                    budgetToAdd: (budget) {},
                  );
                }
                ));
          }, 
          icon: const Icon(Icons.attach_money)),
        ],
      ),
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: bottomNavItems,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        ),
    );
  }
}