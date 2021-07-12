import 'package:flutter/material.dart';

class AssetSong {
  final String name;
  final String singer;
  final String image;
  final int duration;
  MaterialColor color;

  AssetSong(
      {required this.name,
      required this.singer,
      required this.image,
      required this.duration,
      required this.color});
}

List<AssetSong> fake_mostPopular = [
  AssetSong(
    name: 'Champion',
    image: 'assets/musics/wiizard_redeyes_champion.jpg',
    singer: 'Wizard Redeyes',
    duration: 241,
    color: Colors.grey,
  ),
  AssetSong(
    name: 'Falsa',
    image: 'assets/musics/wiizard_redeyes_falsa.jpeg',
    singer: 'Wizard ft BiBowling',
    duration: 320,
    color: Colors.red,
  ),
  AssetSong(
    name: 'Nao Sabes',
    image: 'assets/musics/wiizard_redeyes_oque_faco.jpg',
    singer: 'Wizard Redeyes ft Tenebrose Derko',
    duration: 300,
    color: Colors.orange,
  ),
  AssetSong(
    name: 'XINGONDO',
    image: 'assets/musics/wiizard_redeyes_xigondo.jpg',
    singer: 'Wizard Redeyes',
    duration: 300,
    color: Colors.blue,
  ),
];

List<AssetSong> fake_new_release = [
  AssetSong(
    name: "like it doens't hurt",
    image: 'assets/images/other/song1.jpg',
    singer: 'Charlotte Cardin',
    duration: 241,
    color: Colors.blue,
  ),
  AssetSong(
    name: 'Love in the brain',
    image: 'assets/images/other/song2.jpg',
    singer: 'Tvorchi',
    duration: 320,
    color: Colors.orange,
  ),
  AssetSong(
    name: 'lay you',
    image: 'assets/images/other/song4.jpg',
    singer: 'idk',
    duration: 300,
    color: Colors.red,
  ),
  AssetSong(
    name: 'go to the hello',
    image: 'assets/images/other/song3.jpg',
    singer: 'Danito',
    duration: 300,
    color: Colors.grey,
  ),
];
