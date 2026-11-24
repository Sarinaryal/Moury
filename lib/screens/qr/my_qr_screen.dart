import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/providers/moury_store.dart';
import '../../../widgets/common/bee_button.dart';
import '../../../widgets/animations/confetti.dart';
import '../../../widgets/common/bee_toast.dart';

class MyQrScreen extends StatelessWidget {
  const MyQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: beeDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        children: [
          Center(child: Text('Show to earn 🍯', style: fred(26, w: FontWeight.w700))),
          Center(
            child: Text('Let the shop scan this after you pay', style: fred(14, w: FontWeight.w500, color: beeSoft)),
          ),
          const SizedBox(height: 24),
          _buildQrCode(),
          const SizedBox(height: 18),
          Center(child: Text('Aarav Sharma', style: fred(20, w: FontWeight.w700))),
          Center(
            child: Text('Moury ID · MRY-7F3K9 · +977 98••••321', style: fred(13, w: FontWeight.w500, color: beeSoft)),
          ),
          const SizedBox(height: 24),
          _buildButtons(context),
          const SizedBox(height: 16),
          Text(
            'Same QR works at every Moury shop. The shop credits points or punches your card instantly.',
            textAlign: TextAlign.center,
            style: nun(12),
          ),
        ],
      ),
    );
  }

  Widget _buildQrCode() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: honey, width: 3),
          boxShadow: [BoxShadow(color: beeDark.withOpacity(0.18), blurRadius: 30, offset: const Offset(0, 14))],
        ),
        child: QrImageView(
          data: 'moury://customer/MRY-7F3K9',
          version: QrVersions.auto,
          size: 200,
          eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: beeDark),
          dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: beeDark),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BeeButton('Share', variant: 'ghost', onTap: () => showBeeToast(context, '🔗 QR link copied!')),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BeeButton(
            'Demo earn',
            variant: 'primary',
            icon: Icons.play_arrow,
            onTap: () {
              store.earnAtHoneycomb();
              showConfetti(context);
              showBeeToast(context, '🍯 +50 points & 1 stamp at Honeycomb Café!');
            },
          ),
        ),
      ],
    );
  }
}