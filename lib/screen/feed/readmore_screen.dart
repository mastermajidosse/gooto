import 'package:flutter/material.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/post_model.dart';

class MoreScreen extends StatefulWidget {
  final BlogModel post;
  const MoreScreen(this.post, {super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
