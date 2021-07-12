import 'package:flutter/material.dart';

class AssetSong {
  final String name;
  final String singer;
  final String image;
  final int duration;
  final Color color;

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
    name: 'Champion',
    image: 'assets/images/other/song1.jpg',
    singer: 'Wizard Redeyes',
    duration: 241,
    color: Colors.blue,
  ),
  AssetSong(
    name: 'Falsa',
    image: 'assets/images/other/song2.jpg',
    singer: 'Wizard ft BiBowling',
    duration: 320,
    color: Colors.orange,
  ),
  AssetSong(
    name: 'Nao Sabes',
    image: 'assets/images/other/song4.jpg',
    singer: 'Wizard Redeyes ft Tenebrose Derko',
    duration: 300,
    color: Colors.red,
  ),
  AssetSong(
    name: 'XINGONDO',
    image: 'assets/images/other/song3.jpg',
    singer: 'Wizard Redeyes',
    duration: 300,
    color: Colors.grey,
  ),
];
