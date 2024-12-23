import 'package:flutter/material.dart';

class MoreLikePage extends StatefulWidget {
  const MoreLikePage({super.key});

  @override
  State<MoreLikePage> createState() => _MoreLikePageState();
}

class _MoreLikePageState extends State<MoreLikePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Upcoming',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
