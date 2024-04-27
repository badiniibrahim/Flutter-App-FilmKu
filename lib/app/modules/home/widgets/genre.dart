import 'package:flutter/material.dart';
import 'package:movie/app/core/utilies/genre_names.dart';

class Genre extends StatelessWidget {
  final List<int> genreIds;
  const Genre({
    super.key,
    required this.genreIds,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const VerticalDivider(color: Colors.transparent),
        scrollDirection: Axis.horizontal,
        itemCount: genreIds.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 136, 164, 232)
                /*border:
                    Border.all(color: const Color.fromARGB(255, 136, 164, 232))*/
                ,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                getNameById(genreIds[index]).toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'Merriweather',
                  fontStyle: FontStyle.normal,
                  fontSize: 8,
                  color: Color.fromARGB(255, 17, 14, 71),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
