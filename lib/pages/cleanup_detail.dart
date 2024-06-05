// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gs_oceans/components/bottom_button.dart';
import 'package:gs_oceans/models/cleanup_solution_model.dart';
import 'package:gs_oceans/pages/gallery.dart';

class CleanupDetail extends StatefulWidget {
  const CleanupDetail({super.key});

  @override
  State<CleanupDetail> createState() => _CleanupDetailState();
}

class _CleanupDetailState extends State<CleanupDetail> {
  @override
  Widget build(BuildContext context) {
    // Obtem o tamanho da tela
    var size = MediaQuery.of(context).size;
    final arguments = 
    ModalRoute.of(context)!.settings.arguments as CleanupSolution;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/image_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    arguments.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Since: ${arguments.since}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Status: ${arguments.statusDescription}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    arguments.description,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BottomButton(
                    buttonTitle: 'View Gallery (${arguments.imagesGallery.length})',
                    color: Color(0xFFEB1555),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                         builder: (context) => Gallery(images: arguments.imagesGallery),
                        ));
                    },
                  ),
                  BottomButton(
                    buttonTitle: 'Back',
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

























// class MovieDetailPage extends StatefulWidget {
//   final int movieId;
//   const MovieDetailPage({super.key, required this.movieId});

//   @override
//   State<MovieDetailPage> createState() => _MovieDetailPageState();
// }

// class _MovieDetailPageState extends State<MovieDetailPage> {
//   ApiServices apiServices = ApiServices();

//   late Future<MovieDetailModel> movieDetail;
//   late Future<MovieRecommendationsModel> movieRecommendationModel;

//   @override
//   void initState() {
//     fetchInitialData();
//     super.initState();
//   }

//   fetchInitialData() {
//     movieDetail = apiServices.getMovieDetail(widget.movieId);
//     movieRecommendationModel =
//         apiServices.getMovieRecommendations(widget.movieId);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     print(widget.movieId);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: FutureBuilder(
//           future: movieDetail,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final movie = snapshot.data;

//               String genresText =
//                   movie!.genres.map((genre) => genre.name).join(', ');

//               return Column(
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         height: size.height * 0.4,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     "$imageUrl${movie.posterPath}"),
//                                 fit: BoxFit.cover)),
//                         child: SafeArea(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.arrow_back_ios,
//                                     color: Colors.white),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 25, left: 10, right: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           movie.title,
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Text(
//                               movie.releaseDate.year.toString(),
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 30,
//                             ),
//                             Text(
//                               genresText,
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 17,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           movie.overview,
//                           maxLines: 6,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                  // ok
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   FutureBuilder(
//                     future: movieRecommendationModel,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         final movie = snapshot.data;

//                         return movie!.results.isEmpty
//                             ? const SizedBox()
//                             : Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "More like this",
//                                     maxLines: 6,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   GridView.builder(
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     shrinkWrap: true,
//                                     padding: EdgeInsets.zero,
//                                     scrollDirection: Axis.vertical,
//                                     itemCount: movie.results.length,
//                                     gridDelegate:
//                                         const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 3,
//                                       mainAxisSpacing: 15,
//                                       childAspectRatio: 1.5 / 2,
//                                     ),
//                                     itemBuilder: (context, index) {
//                                       return InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   MovieDetailPage(
//                                                       movieId: movie
//                                                           .results[index].id),
//                                             ),
//                                           );
//                                         },
//                                         child: CachedNetworkImage(
//                                           imageUrl:
//                                               "$imageUrl${movie.results[index].posterPath}",
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               );
//                       }
//                       return const Text("Something Went wrong");
//                     },
//                   ),
//                 ],
//               );
//             }
//             return const SizedBox();
//           },
//         ),
//       ),
//     );
//   }
// }
