import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'registrationfinalpage.dart';

class RegistrationNext extends StatefulWidget {
  final String userId;
  const RegistrationNext({super.key, required this.userId});

  @override
  State<RegistrationNext> createState() => _RegistrationNextState();
}

class _RegistrationNextState extends State<RegistrationNext> {
  DateTime? _selectedDate;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emergencyPhoneController = TextEditingController();
  final TextEditingController _cinController = TextEditingController();
  String? _allergiesAnswer;
  String? _illnessAnswer;
  final TextEditingController _allergiesDetailsController = TextEditingController();
  final TextEditingController _illnessDetailsController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
                onPressed: () => Navigator.pop(context),
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
                  // Personal Information Title
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Form Fields Container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFFC9463E)),
                    ),
                    child: Column(
                      children: [
                        _buildDateField(context),
                        const SizedBox(height: 15),
                        _buildNumberField(controller: _phoneController, hint: 'Put your phone number'),
                        const SizedBox(height: 15),
                        _buildNumberField(controller: _emergencyPhoneController, hint: 'Emergency Phone number'),
                        const SizedBox(height: 15),
                        _buildNumberField(controller: _cinController, hint: 'CIN Number (ID)'),
                        const SizedBox(height: 15),

                        _buildYesNoQuestion(
                          question: 'Do you have any allergies?',
                          answer: _allergiesAnswer,
                          onChanged: (value) => setState(() => _allergiesAnswer = value),
                        ),
                        const SizedBox(height: 10),
                        if (_allergiesAnswer == 'Yes')
                          _buildParagraphField(controller: _allergiesDetailsController, hint: 'If yes, mention it'),
                        const SizedBox(height: 15),

                        _buildYesNoQuestion(
                          question: 'Do you have any chronic illness?',
                          answer: _illnessAnswer,
                          onChanged: (value) => setState(() => _illnessAnswer = value),
                        ),
                        const SizedBox(height: 10),
                        if (_illnessAnswer == 'Yes')
                          _buildParagraphField(controller: _illnessDetailsController, hint: 'If yes, mention it'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Next Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationFinalPage(),
                        ),
                      );
                    },
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
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(28, 28, 29, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDate == null
                  ? 'Date of birth'
                  : DateFormat('yyyy-MM-dd').format(_selectedDate!),
              style: TextStyle(
                color: _selectedDate == null
                    ? const Color.fromRGBO(109, 109, 110, 1)
                    : Colors.white,
              ),
            ),
            const Icon(Icons.calendar_today, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberField({required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
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
    );
  }

  Widget _buildYesNoQuestion({
    required String question,
    required String? answer,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Yes', style: TextStyle(color: Colors.white)),
                value: 'Yes',
                groupValue: answer,
                onChanged: onChanged,
                activeColor: const Color(0xFFC9463E),
                dense: true,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('No', style: TextStyle(color: Colors.white)),
                value: 'No',
                groupValue: answer,
                onChanged: onChanged,
                activeColor: const Color(0xFFC9463E),
                dense: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildParagraphField({required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      maxLines: 3,
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
    );
  }
}
