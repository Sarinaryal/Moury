import 'package:flutter/material.dart';
import 'package:moury/data/models/history_item.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/providers/moury_store.dart';
import '../../../widgets/common/app_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: honeyDeep,
        elevation: 0,
        title: Text('Activity 🕑', style: fred(22, w: FontWeight.w700)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: beeDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18),
        children: [
          for (int i = 0; i < store.history.length; i++)
            _historyItem(store.history[i], i == store.history.length - 1),
        ],
      ),
    );
  }

  Widget _historyItem(HistoryItem item, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(width: 22),
          Column(
            children: [
              const SizedBox(height: 18),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: honey,
                  shape: BoxShape.circle,
                  border: Border.all(color: beeDark, width: 3),
                ),
              ),
              if (!isLast) Expanded(child: Container(width: 2, color: cream2)),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 22, 12),
              child: AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                child: Row(
                  children: [
                    Text(item.emoji, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: fred(14, w: FontWeight.w600)),
                          Text(item.sub, style: nun(11)),
                        ],
                      ),
                    ),
                    Text(
                      item.value,
                      style: fred(15, w: FontWeight.w700, color: item.kind == 'plus' ? good : pink),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}