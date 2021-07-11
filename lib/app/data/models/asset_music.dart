import 'package:flutter/material.dart';

class AssetSong {
  final String? name;
  final String? singer;
  final String? image;
  final int? duration;
  final Color color;

  AssetSong(
      {this.name, this.singer, this.image, this.duration, required this.color});
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
    color: Colors.grey,
  ),
  AssetSong(
    name: 'Nao Sabes',
    image: 'assets/musics/wiizard_redeyes_oque_faco.jpg',
    singer: 'Wizard Redeyes ft Tenebrose Derko',
    duration: 300,
    color: Colors.grey,
  ),
  AssetSong(
    name: 'XINGONDO',
    image: 'assets/musics/wiizard_redeyes_xigondo.jpg',
    singer: 'Wizard Redeyes',
    duration: 300,
    color: Colors.grey,
  ),
];
