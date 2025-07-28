import 'package:flutter/material.dart';
import 'package:jalees/features/quran/view/screens/quran_screen.dart';
import 'package:jalees/features/bukhari/view/screens/bukhari_screen.dart';
import 'package:jalees/features/azkar/view/screens/azkar_screen.dart';
import '../../../jadwal/view/screens/jadwali_screen.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isBottomBarVisible = true;
  double _scrollDistance = 0.0;
  double _upScrollDistance = 0.0;
  late TabController _tabController;

  final List<Widget> _screens = const [
    QuranScreen(),
    BukhariScreen(),
    AzkarScreen(),
    JadwaliScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(_currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo is ScrollUpdateNotification) {
                  if (scrollInfo.scrollDelta != null &&
                      scrollInfo.metrics.pixels >= 0 &&
                      scrollInfo.metrics.pixels <=
                          scrollInfo.metrics.maxScrollExtent &&
                      !scrollInfo.metrics.outOfRange) {
                    if (scrollInfo.scrollDelta! > 0) {
                      _scrollDistance += scrollInfo.scrollDelta!;
                      _upScrollDistance = 0.0;
                      if (_scrollDistance > 100 && _isBottomBarVisible) {
                        setState(() {
                          _isBottomBarVisible = false;
                        });
                      }
                    } else if (scrollInfo.scrollDelta! < 0) {
                      _upScrollDistance += scrollInfo.scrollDelta!.abs();
                      if (_upScrollDistance > 30 && !_isBottomBarVisible) {
                        setState(() {
                          _isBottomBarVisible = true;
                        });
                        _upScrollDistance = 0.0;
                      }
                      _scrollDistance = 0.0;
                    }
                  }
                }
                return false;
              },
              child: IndexedStack(index: _currentIndex, children: _screens),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isBottomBarVisible ? 30 : -100,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                onTap: _onTabTapped,
                indicator: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorSize: TabBarIndicatorSize.tab,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NeoSansArabic',
                  color: Colors.white,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NeoSansArabic',
                  color: Colors.white70,
                ),
                tabs: const [
                  Tab(icon: Icon(Icons.menu_book, size: 22), text: 'القرآن'),
                  Tab(
                    icon: Icon(Icons.book_outlined, size: 22),
                    text: 'أحاديث',
                  ),
                  Tab(icon: Icon(Icons.auto_awesome, size: 22), text: 'أذكار'),
                  Tab(
                    icon: Icon(Icons.calendar_month, size: 22),
                    text: 'جدولي',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
