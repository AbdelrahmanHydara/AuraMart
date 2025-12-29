import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'widgets/offer_banner.dart';
import 'widgets/offers_body_screen.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late Timer _timer;
  int _colorIndex = 0;
  final List<Color> _colors = [
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.yellow.shade200,
  ];
  late final DateTime _endTime;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _endTime = DateTime(now.year, now.month, now.day, 23, 59, 59);
    _updateState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateState();
    });
  }

  void _updateState() {
    final now = DateTime.now();
    final difference = _endTime.difference(now);
    if (mounted) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
        _duration = difference.isNegative ? Duration.zero : difference;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        color: _colors[_colorIndex],
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(20),
              OfferBanner(duration: _duration),
              verticalSpace(10),
              const Expanded(child: OffersBodyScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
