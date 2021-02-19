import 'package:flutter/material.dart';
import 'package:jaeger/ui/expense/expense.dart';
import 'package:jaeger/ui/movie/movie.dart';
import 'package:jaeger/ui/purchase/purchase.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Widget> _pages = [ PurchasePage(), MoviePage(), ExpensePage() ];
  int _selectedPage = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void _onTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xFF0D0838),
      body: PageView(
        children: _pages,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Purchase'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Film'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Expenses'
          )
        ],
      ),
    );
  }


}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: null);
  }
}
