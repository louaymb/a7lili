import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:provider/provider.dart';
import 'account.dart';
import '../models/user_registration_data.dart';
import '../providers/user_registration_provider.dart';

class RegistrationFinalPage extends StatefulWidget {
  final UserRegistrationData userData;
  
  const RegistrationFinalPage({super.key, required this.userData});

  @override
  State<RegistrationFinalPage> createState() => _RegistrationFinalPageState();
}

class _RegistrationFinalPageState extends State<RegistrationFinalPage> {
  String? _cvFileName;
  String? _photoFileName;
  String? _singleRoomAnswer;
  bool _agreedToTerms = false;
  bool _isSubmitting = false;
  final TextEditingController _ocExpectationsController = TextEditingController();
  final TextEditingController _faciExpectationsController = TextEditingController();
  final SignatureController _signatureController = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 3,
    exportBackgroundColor: Colors.white,
  );

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xFFC9463E),
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Welcome ${widget.userData.name} !',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/clock.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "You're in!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The clock is ticking...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'will you make it out in time?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFC9463E), Color(0xFF8D312B)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          final provider = Provider.of<UserRegistrationProvider>(context, listen: false);
                          provider.clearData();
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Account()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFC9463E), Color(0xFF4B1916)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/themelogo.png',
                      width: 36,
                      height: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _signatureController.dispose();
    _ocExpectationsController.dispose();
    _faciExpectationsController.dispose();
    super.dispose();
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                        // CV and Photo Import
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // CV Import Button
                            GestureDetector(
                              onTap: () {
                                // TODO: Implement CV import functionality
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/importcv.png',
                                    width: 130,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    _cvFileName ?? 'No CV selected',
                                    style: TextStyle(
                                      color: _cvFileName == null 
                                          ? const Color.fromRGBO(109, 109, 110, 1)
                                          : Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            // Photo Import Button
                            GestureDetector(
                              onTap: () {
                                // TODO: Implement photo import functionality
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/importphoto.png',
                                    width: 130,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    _photoFileName ?? 'No photo selected',
                                    style: TextStyle(
                                      color: _photoFileName == null 
                                          ? const Color.fromRGBO(109, 109, 110, 1)
                                          : Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Contract Placeholder
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: SingleChildScrollView(
                            child: Text(
                              'CONTRACT TERMS AND CONDITIONS\n\n'
                              'Participant: ${widget.userData.name}\n'
                              'ID: ${widget.userData.userId}\n\n'
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                              'Nullam auctor, nisl eget ultricies tincidunt, nisl nisl '
                              'aliquam nisl, eget ultricies nisl nisl eget nisl. '
                              'Nullam auctor, nisl eget ultricies tincidunt, nisl nisl '
                              'aliquam nisl, eget ultricies nisl nisl eget nisl.\n\n'
                              'By signing this agreement, you agree to all the terms and '
                              'conditions outlined above. Please read carefully before '
                              'proceeding with the registration.',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Agreement Checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: _agreedToTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreedToTerms = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFFC9463E),
                              checkColor: Colors.white,
                            ),
                            const Expanded(
                              child: Text(
                                'I have read and agreed to the terms and conditions of this contract',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Rest of the form
                        _buildSignatureField(),
                        const SizedBox(height: 20),
                        _buildSingleRoomQuestion(),
                        const SizedBox(height: 20),
                        _buildExpectationsField(
                          controller: _ocExpectationsController,
                          label: 'What do you expect from the OC Team',
                        ),
                        const SizedBox(height: 20),
                        _buildExpectationsField(
                          controller: _faciExpectationsController,
                          label: 'What do you expect from the FACI Team',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFC9463E), Color(0xFF8D312B)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: _agreedToTerms && !_isSubmitting
                          ? () async {
                              setState(() => _isSubmitting = true);
                              try {
                                final provider = Provider.of<UserRegistrationProvider>(context, listen: false);
                                
                                // Save all final data
                                await provider.updateAdditionalInfo(
                                  singleroom: _singleRoomAnswer,
                                  
                                );
                                
                                // Mark registration as complete
                                await provider.completeRegistration();
                                
                                if (!mounted) return;
                                _showSuccessDialog(context);
                              } catch (e) {
                                if (!mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error completing registration: ${e.toString()}'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } finally {
                                if (mounted) {
                                  setState(() => _isSubmitting = false);
                                }
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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

  Widget _buildSignatureField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Signature',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(28, 28, 29, 1),
              border: Border.all(color: Colors.grey),
            ),
            child: Signature(
              controller: _signatureController,
              width: double.infinity,
              height: 150,
              backgroundColor: const Color.fromRGBO(28, 28, 29, 1),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => _signatureController.clear(),
              child: const Text(
                'Clear',
                style: TextStyle(
                  color: Color(0xFFC9463E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSingleRoomQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'You want a single room?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'It will cost an extra 50 DT',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Yes', style: TextStyle(color: Colors.white)),
                value: 'Yes',
                groupValue: _singleRoomAnswer,
                onChanged: (value) {
                  setState(() {
                    _singleRoomAnswer = value;
                  });
                },
                activeColor: const Color(0xFFC9463E),
                dense: true,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('No', style: TextStyle(color: Colors.white)),
                value: 'No',
                groupValue: _singleRoomAnswer,
                onChanged: (value) {
                  setState(() {
                    _singleRoomAnswer = value;
                  });
                },
                activeColor: const Color(0xFFC9463E),
                dense: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpectationsField({
    required TextEditingController controller,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: 3,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(28, 28, 29, 1),
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
          ),
        ),
      ],
    );
  }
}