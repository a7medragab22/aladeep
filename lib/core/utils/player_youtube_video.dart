// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class PlayerYouTubeVideo extends StatelessWidget {
//   const PlayerYouTubeVideo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(
//         controller: YoutubePlayerController(
//           initialVideoId: "dQw4w9WgXcQ",
//           flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
//         ),
//       ),
//       builder: (context, player) {
//         return Padding(
//           padding: const EdgeInsets.all(20),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: player,
//           ),
//         );
//       },
//     );
//   }
// }
