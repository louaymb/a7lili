import 'package:flutter/material.dart';
import 'dart:async';
import 'registration.dart';
import 'octeam.dart';
import 'conf_overview.dart';
import 'account.dart';
import 'room.dart';
import 'agenda.dart';
import 'sponsors.dart';
import 'signin.dart';

void main() {
  runApp(const MaterialApp(home: Welcome()));
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  bool _isDrawerOpen = false;
  final PageController _teamPageController = PageController();
  int _currentTeamPage = 0;
  final List<TeamSection> _teamSections = [
    const TeamSection(title: "MEET THE OC TEAM", targetPage: OCTeamPage()),
  ];

  // Countdown variables
  late Duration _remaining;
  late Timer _timer;
  late AnimationController _secondsController;
  late AnimationController _minutesController;
  late AnimationController _hoursController;
  late AnimationController _daysController;
  
  String _days = '00';
  String _hours = '00';
  String _minutes = '00';
  String _seconds = '00';
  
  String _prevDays = '00';
  String _prevHours = '00';
  String _prevMinutes = '00';
  String _prevSeconds = '00';
  
  bool _flipSeconds = false;
  bool _flipMinutes = false;
  bool _flipHours = false;
  bool _flipDays = false;

  @override
  void initState() {
    super.initState();
    
    // Calculate duration to April 17th
    final now = DateTime.now();
    DateTime april17;
    
    if (now.month < 4 || (now.month == 4 && now.day < 17)) {
      april17 = DateTime(now.year, 4, 17);
    } else {
      april17 = DateTime(now.year + 1, 4, 17);
    }
    
    _remaining = april17.difference(now);
    
    // Initialize animation controllers
    _secondsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _minutesController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _hoursController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _daysController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateTime();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds > 0) {
        setState(() {
          // Store previous values
          _prevDays = _days;
          _prevHours = _hours;
          _prevMinutes = _minutes;
          _prevSeconds = _seconds;
          
          // Update remaining time
          _remaining = _remaining - const Duration(seconds: 1);
          
          // Update current values
          final newDays = _remaining.inDays.toString().padLeft(2, '0');
          final newHours = _remaining.inHours.remainder(24).toString().padLeft(2, '0');
          final newMinutes = _remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
          final newSeconds = _remaining.inSeconds.remainder(60).toString().padLeft(2, '0');
          
          // Determine which digits changed and need to flip
          _flipSeconds = true; // Always flip seconds
          _flipMinutes = newMinutes != _minutes;
          _flipHours = newHours != _hours;
          _flipDays = newDays != _days;
          
          // Update current values
          _days = newDays;
          _hours = newHours;
          _minutes = newMinutes;
          _seconds = newSeconds;
          
          // Trigger animations for changed digits
          _secondsController.forward(from: 0).then((_) {
            setState(() => _flipSeconds = false);
          });
          
          if (_flipMinutes) {
            _minutesController.forward(from: 0).then((_) {
              setState(() => _flipMinutes = false);
            });
          }
          
          if (_flipHours) {
            _hoursController.forward(from: 0).then((_) {
              setState(() => _flipHours = false);
            });
          }
          
          if (_flipDays) {
            _daysController.forward(from: 0).then((_) {
              setState(() => _flipDays = false);
            });
          }
        });
      } else {
        _timer.cancel();
      }
    });
  }

  Widget _buildFlipDigit({
    required String current,
    required String previous,
    required String label,
    required bool flipping,
    required AnimationController controller,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 70,
          height: 80,
          child: Stack(
            children: [
              // Bottom digit (current) with gradient and rounded corners
              Container(
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(237, 83, 73, 1.0),
                      Color.fromRGBO(141, 50, 44, 1.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  current,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              
              // Top digit (previous) - will flip down
              if (flipping)
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(controller.value * (3.141592653589793 / 2)),
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 70,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(237, 83, 73, 1.0),
                              Color.fromRGBO(141, 50, 44, 1.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          previous,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCountdownTimer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(146, 28, 28, 29),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromRGBO(172, 61, 55, 1.0), width: 1),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'TIME REMAINING',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFlipDigit(
                current: _days,
                previous: _prevDays,
                label: 'DAYS',
                flipping: _flipDays,
                controller: _daysController,
              ),
              _buildFlipDigit(
                current: _hours,
                previous: _prevHours,
                label: 'HOURS',
                flipping: _flipHours,
                controller: _hoursController,
              ),
              _buildFlipDigit(
                current: _minutes,
                previous: _prevMinutes,
                label: 'MINUTES',
                flipping: _flipMinutes,
                controller: _minutesController,
              ),
              _buildFlipDigit(
                current: _seconds,
                previous: _prevSeconds,
                label: 'SECONDS',
                flipping: _flipSeconds,
                controller: _secondsController,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _secondsController.dispose();
    _minutesController.dispose();
    _hoursController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  void _updateTime() {
    _days = _remaining.inDays.toString().padLeft(2, '0');
    _hours = _remaining.inHours.remainder(24).toString().padLeft(2, '0');
    _minutes = _remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    _seconds = _remaining.inSeconds.remainder(60).toString().padLeft(2, '0');
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Added this to extend behind navigation bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 30),
          onPressed: _toggleDrawer,
        ),
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Background Image - now extends behind everything
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Main Content with Scroll
          SingleChildScrollView(
            child: Column(
              children: [
                // Themestone logo positioned at the top
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Image.asset(
                      'assets/themelogo.png',
                      width: 300,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Added more space between logo and welcome container
                const SizedBox(height: 30),

                // Welcome Section
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFC9463E), Color(0xFF4B1916)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: -5,
                        top: 20,
                        child: Transform.scale(
                          scale: 1.8,
                          child: Image.asset(
                            'assets/dragon.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 100, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome To", 
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Tul'ds 2K25", 
                              style: TextStyle(
                                fontSize: 28, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Begin your journey and register now!",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white, 
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30,
                        bottom: 10,
                        child: SizedBox(
                          width: 130,
                          height: 43,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFFC9463E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.zero,
                              elevation: 3,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Conf_Overview()),
                              );
                            },
                            child: const Center(
                              child: Text(
                                "Discover",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Rest of the content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildEventCard(),
                      _buildTeamSection(),
                      _buildCountdownTimer(),
                      _buildSponsorsSection(),
                      const SizedBox(height: 40),
                      
                      // Hosted By section at the bottom
                      Column(
                        children: [
                          const Text(
                            'Hosted By:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            'assets/lclogo.png',
                            width: 150,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 80), // Increased space for navigation bar
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Drawer Overlay
          if (_isDrawerOpen)
            GestureDetector(
              onTap: _toggleDrawer,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),

          // Drawer Menu
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isDrawerOpen ? 0 : -300,
            top: 0,
            bottom: 0,
            width: 300,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 80),
                  color: const Color.fromARGB(226, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileSection(),
                      _buildMenuTitle(),
                      Expanded(child: _buildMenuItems(context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildTransparentFooter(context),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF555555),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ghada Jbeli", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("MKT manager", style: TextStyle(fontSize: 14, color: Color(0xFFCCCCCC))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTitle() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text("MENU", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildMenuItem("Home", Icons.home, () => _navigateTo(context, const Welcome())),
        _buildMenuItem("Account", Icons.person, () => _navigateTo(context, const Account())),
        _buildMenuItem("Room", Icons.room, () => _navigateTo(context, const RoomPage())),
        _buildMenuItem("Agenda", Icons.calendar_today, () => _navigateTo(context, const Agenda())),
        _buildMenuItem("Sponsors", Icons.business, () => _navigateTo(context, const Sponsors())),
        _buildMenuItem("Contact Us", Icons.contact_mail, () {}),
        _buildMenuItem("About", Icons.info, () {}),
        _buildMenuItem("Sign Out", Icons.logout, () => _navigateTo(context,  const SignInPage(), replace: true)),
      ],
    );
  }

  Widget _buildEventCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        color: const Color.fromARGB(136, 28, 28, 29),
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/hotelpic.png',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Begin your journey and register now",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.white54),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white70),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "17/18/19/20 April, 2025",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.white54),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white70),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Hotel El Fell, Nabel,Tunisia", 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9463E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Registration()),
                        );
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              _teamSections[_currentTeamPage].title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(
            height: 350,
            child: Stack(
              children: [
                PageView(
                  controller: _teamPageController,
                  onPageChanged: (index) => setState(() => _currentTeamPage = index),
                  children: [
                    Center(child: Image.asset('assets/meetoc.png')),
                    Center(child: Image.asset('assets/meetfaci.png')),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCF4940),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _teamSections[_currentTeamPage].targetPage,
                          ),
                        );
                      },
                      child: const Text(
                        "Explore", 
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        _teamPageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () {
                        _teamPageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorsSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(136, 28, 28, 29),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFCF4940), width: 1),
      ),
      child: Column(
        children: [
          const Text(
            'OUR SPONSORS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSponsorPlaceholder(),
              _buildSponsorPlaceholder(),
              _buildSponsorPlaceholder(),
              _buildSponsorPlaceholder(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorPlaceholder() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF424242),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white54, width: 1),
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.white54,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildTransparentFooter(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white, // Semi-transparent white
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Conference Price",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "180 TND /4 Nights",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC9463E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Registration()),
                );
              },
              child: const Text(
                "Register Now",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Container(
      color: const Color.fromRGBO(226, 0, 0, 0),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFCCCCCC)),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFEEEEEE),
          ),
        ),
        onTap: () {
          _toggleDrawer();
          onTap();
        },
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page, {bool replace = false}) {
    if (replace) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    }
  }
}

class TeamSection {
  final String title;
  final Widget targetPage;

  const TeamSection({required this.title, required this.targetPage});
}