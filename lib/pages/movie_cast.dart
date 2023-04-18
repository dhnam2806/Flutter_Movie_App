import 'package:flutter/material.dart';
import '../data/api_handle.dart';
import '../models/movie.dart';

class MovieCast extends StatefulWidget {
  // final Cast cast;
  // const MovieCast({super.key, required this.cast});
  const MovieCast({super.key});

  @override
  State<MovieCast> createState() => _MovieCastState();
  
}

class _MovieCastState extends State<MovieCast> {
  // final api_handle = ApiHandle();
  // Future<List<Cast>>? _cast;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _cast = api_handle.getMovieCredit(widget.cast.id) as Future<List<Cast>>?;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cast>>(builder: (context, snapshot) {
      if (snapshot.hasData) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: snapshot.data!
                .map(
                  (cast) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${cast.fullProfilePath}',
                        height: 240,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      } else if (snapshot.hasError) {
        return const Text('Error');
      }
      return const CircularProgressIndicator();
    });

    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: [
    //       Container(
    //         width: 120,
    //         margin: const EdgeInsets.only(right: 12),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(8),
    //               child: Image.network(
    //                 widget.cast.fullProfilePath,
    //                 // 'https://image.tmdb.org/t/p/w200/6X2YjjYcs8XyZRDmJAHNDlls7L4.jpg',
    //                 height: 150,
    //                 width: 110,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             const SizedBox(height: 10),
    //             Text(
    //               widget.cast.name,
    //               // 'Tom Holland',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             const SizedBox(height: 6),
    //             Text(
    //               widget.cast.character,
    //               // 'Peter Parker',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 15,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
