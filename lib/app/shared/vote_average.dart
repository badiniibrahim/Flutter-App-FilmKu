import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({
    super.key,
    required this.voteAverage,
  });

  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        const SizedBox(width: 5),
        Text(
          voteAverage,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            fontFamily: 'Merriweather',
            fontStyle: FontStyle.normal,
            fontSize: 11,
            color: Color.fromARGB(255, 17, 14, 71),
          ),
        ),
      ],
    );
  }
}
