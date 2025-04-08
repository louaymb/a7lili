import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart'; // Import provider
import 'registrationnext.dart';
import '../providers/user_registration_provider.dart'; // Import UserRegistrationProvider
import '../models/user_registration_data.dart'; // Import UserRegistrationData model

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? selectedLC;
  String? selectedPosition;
  String? selectedKeyArea;
  String? selectedGender;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  late FirebaseFirestore firestore;
  String? userId;

  final List<String> lcOptions = [
    'Hadrumet', 'Nabeul', 'Bardo', 'University', 'Carthage',
    'Medina', 'Tacapes', 'Thyna', 'Sfax', 'Benzart', 'Ruspina'
  ];

  final List<String> positionOptions = [
    'Newbie', 'OLIDE', 'MM', 'VP', 'LCP'
  ];

  final List<String> keyAreaOptions = [
    'F', 'PM&IM', 'TM', 'BD', 'Mkt', 'OGV', 'OGT', 'IGV', 'IGT'
  ];

  @override
  void initState() {
    super.initState();
    initFirebase();
    userId = const Uuid().v4(); // Generate unique user ID
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    firestore = FirebaseFirestore.instance;
  }

  Future<void> _submitForm() async {
    if (selectedLC == null ||
        selectedGender == null ||
        selectedPosition == null ||
        selectedKeyArea == null ||
        nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty) {
      setState(() {
        errorMessage = "All fields are required";
      });
      return;
    }

    // Create the UserRegistrationData object
    UserRegistrationData userData = UserRegistrationData(
      userId: userId!,
      lc: selectedLC!,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      gender: selectedGender!,
      position: selectedPosition!,
      keyArea: selectedKeyArea!,
    );

    try {
      Provider.of<UserRegistrationProvider>(context, listen: false);
          final provider = Provider.of<UserRegistrationProvider>(context, listen: false);

await provider.updateBasicInfo(
  name: nameController.text.trim(),
  email: emailController.text.trim(),
  gender: selectedGender,
  position: selectedPosition,
  keyArea: selectedKeyArea,
);

provider.userData.userId = userId!;
await provider.updateAdditionalInfo(lc: selectedLC);
await provider.saveUserData();


      setState(() {
        errorMessage = null;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationNext(userId: userId!),
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = "Error saving data: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 140, bottom: 100),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC9463E),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/themelogo.png',
                        width: 90,
                        height: 90,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        if (errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              errorMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        _buildDropdown(
                          value: selectedLC,
                          items: lcOptions,
                          hint: 'Choose your LC',
                          onChanged: (value) {
                            setState(() {
                              selectedLC = value;
                            });
                          },
                        ),
                        _buildTextField(
                          controller: nameController,
                          hint: 'Full Name',
                        ),
                        _buildTextField(
                          controller: emailController,
                          hint: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        _buildDropdown(
                          value: selectedGender,
                          items: ['Male', 'Female'],
                          hint: 'Gender',
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        _buildDropdown(
                          value: selectedPosition,
                          items: positionOptions,
                          hint: 'Choose your position',
                          onChanged: (value) {
                            setState(() {
                              selectedPosition = value;
                            });
                          },
                        ),
                        _buildDropdown(
                          value: selectedKeyArea,
                          items: keyAreaOptions,
                          hint: 'Choose key area',
                          onChanged: (value) {
                            setState(() {
                              selectedKeyArea = value;
                            });
                          },
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC9463E),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(28, 28, 29, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(

        value: value,
        hint: Text(
          hint,
          style: const TextStyle(color: Color.fromRGBO(109, 109, 110, 1)),
        ),
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: const Color.fromRGBO(28, 28, 29, 1),
        style: const TextStyle(color: Colors.white),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(28, 28, 29, 1),
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromRGBO(109, 109, 110, 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }
}
