import 'package:flutter/widgets.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 31,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 229, 228, 234)),
          borderRadius: BorderRadius.circular(50)),
      child: const Center(
        child: Text("See more"),
      ),
    );
  }
}
