import 'package:flutter/material.dart';
import 'welcome.dart'; // Import your welcome page

class FACIPage extends StatelessWidget {
  const FACIPage({super.key});

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
                  // Title
                  const Text(
                    'FACI Team',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // FACI Team Members Grid
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        _buildTeamMemberCard('CHADA JBELI', 'MCVP'),
                        _buildTeamMemberCard('CHADA JBELI', 'MCP'),
                        _buildTeamMemberCard('CHADA JBELI', 'MCVP MF'),
                        _buildTeamMemberCard('CHADA JBELI', 'MCP PXP'),
                        _buildTeamMemberCard('CHADA JBELI', 'MCP LAG'),
                        _buildTeamMemberCard('CHADA JBELI', 'MCP BH'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Explore The Theme Button
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to theme exploration page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9463E),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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

  Widget _buildTeamMemberCard(String name, String position) {
    return Column(
      children: [
        // Circular Photo Placeholder
        Container(
          width: 100,
          height: 100,
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
            size: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        
        // Name
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        
        // Position
        Text(
          position,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}