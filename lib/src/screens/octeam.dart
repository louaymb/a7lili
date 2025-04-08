import 'package:flutter/material.dart';

class OCTeamPage extends StatelessWidget {
  const OCTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (first layer)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content (second layer)
          Positioned.fill(
            child: Scrollbar(
              controller: PrimaryScrollController.of(context),
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                controller: PrimaryScrollController.of(context),
                padding: const EdgeInsets.only(
                  top: 140,
                  bottom: 120,
                  left: 16,
                  right: 16,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'OC Team',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),

                      Image.asset(
                        'assets/OCP.png',
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        height: (180 + 20) * 4 + 20,
                        child: Scrollbar(
                          thumbVisibility: true,
                          trackVisibility: true,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildImageColumn([
                                  'assets/mkt.png',
                                  'assets/mkt1.png',
                                ]),
                                const SizedBox(width: 30),

                                _buildImageColumn([
                                  'assets/pxp.png',
                                  'assets/pxp1.png',
                                  'assets/pxp2.png',
                                  'assets/pxp3.png',
                                ]),
                                const SizedBox(width: 30),

                                _buildImageColumn([
                                  'assets/F.png',
                                ]),
                                const SizedBox(width: 30),

                                _buildImageColumn([
                                  'assets/er.png',
                                  'assets/er1.png',
                                  'assets/er2.png',
                                  'assets/er3.png',
                                ]),
                                const SizedBox(width: 30),

                                _buildImageColumn([
                                  'assets/log.png',
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC9463E),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Explore The Theme',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      const Text(
                        'Hosted by:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/lclogo.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Back Arrow (TOP layer - ensures it's clickable)
          Positioned(
            left: 16,
            top: 60,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque, // Makes the entire area tappable
              onTap: () {
                // Option 1: Go back to previous screen
                Navigator.pop(context);
                
                // Option 2: If you always want to go to Welcome screen:
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Welcome()),
                //   (route) => false,
                // );
              },
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'assets/back_arrow.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageColumn(List<String> imagePaths) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: imagePaths
          .map((path) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  path,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ))
          .toList(),
    );
  }
}