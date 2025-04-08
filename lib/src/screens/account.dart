import 'package:flutter/material.dart';
import 'welcome.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Custom Back Arrow
          Positioned(
            left: 16,
            top: 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'assets/back_arrow.png',
                    fit: BoxFit.contain,
                  ),
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Welcome()),
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ),

          // Main Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 140, bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Account Card - Made slightly wider to prevent overflow
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85, // Increased from 0.8
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFFC9463E)),
                    ),
                    child: Column(
                      children: [
                        // Title
                        const Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Profile Photo Placeholder
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[400],
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Delegate Name
                        const Text(
                          'Delegate Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // LC and Position Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'LC NABEL',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              color: Colors.white,
                            ),
                            const Text(
                              'Position: Position',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Phone Numbers - Now properly aligned with flexible space
                        _buildPhoneNumberRow('Regular phone number', '22 576 869'),
                        const SizedBox(height: 10),
                        _buildPhoneNumberRow('Emergency Phone Number', '22 576 869'),
                        const SizedBox(height: 10),
                        _buildPhoneNumberRow('LC Buddy', 'LC Buddy Name'),
                        const SizedBox(height: 10),
                        _buildPhoneNumberRow('LC Buddy Contact', 'xxx'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Hosted by section
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2, // Gives more space to the label
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis, // Prevents overflow
          ),
        ),
        Expanded(
          flex: 1, // Less space for the value
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.end, // Aligns values to the right
          ),
        ),
      ],
    );
  }
}