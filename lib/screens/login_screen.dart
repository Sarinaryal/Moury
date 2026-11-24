import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../widgets/animations/bob.dart';
import '../widgets/animations/press_effect.dart';
import '../widgets/common/bee_button.dart';
import '../widgets/common/honeycomb_painter.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onDone;
  
  const LoginScreen({
    super.key,
    required this.onDone,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool otpStep = false;
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    phoneController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.all(26),
            child: otpStep ? _buildOtpView() : _buildPhoneView(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 320,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [honey, honeyDeep],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: HoneycombPainter(Colors.white.withOpacity(0.18)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Bob(
                  dy: 8,
                  child: Text('🐝', style: TextStyle(fontSize: 84)),
                ),
                const SizedBox(height: 8),
                Text(
                  'Welcome to Moury',
                  style: fred(30, w: FontWeight.w700, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'One app. Every loyalty card you love.',
                  style: fred(14, w: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your mobile number',
          style: fred(16, w: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cream2, width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Text(
                '🇳🇵 +977',
                style: fred(15, w: FontWeight.w600, color: beeSoft),
              ),
              Container(
                width: 2,
                height: 26,
                color: cream2,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              Expanded(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  style: fred(18, w: FontWeight.w600),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: '98XXXXXXXX',
                    hintStyle: TextStyle(color: Color(0xFFCCBBAA)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        BeeButton(
          'Send OTP 🍯',
          onTap: () {
            if (phoneController.text.length >= 10) {
              setState(() => otpStep = true);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a valid phone number')),
              );
            }
          },
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(
            "We'll text you a one-time code. No passwords, ever. 🔒",
            style: nun(13),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter the 4-digit code',
          style: fred(16, w: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          'Sent to +977 ${phoneController.text.isEmpty ? "98XXXXXXXX" : phoneController.text}',
          style: nun(13, color: beeSoft),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) => _buildOtpField(index)),
        ),
        const SizedBox(height: 20),
        BeeButton(
          'Verify & Enter 🐝',
          onTap: () {
            // Simulate OTP verification
            widget.onDone();
          },
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: () => setState(() => otpStep = false),
            child: Text(
              'Change number',
              style: fred(13, color: amber),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpField(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 56,
        height: 64,
        child: TextField(
          controller: otpControllers[index],
          focusNode: otpFocusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: fred(26, w: FontWeight.w700),
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: cream2, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: honey, width: 2.5),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty && index < 3) {
              FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
            }
          },
        ),
      ),
    );
  }
}