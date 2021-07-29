class Song {
  String? id;
  String? cover_url;
  String? songUrl;
  String? songName;
  String? artist;
  bool? isSolo;

  Song(
      {this.id,
      this.songName,
      this.songUrl,
      this.artist,
      this.cover_url,
      this.isSolo});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        artist: json['artist'],
        cover_url: json['cover_url'],
        songName: json['songName'],
        songUrl: json['songUrl'],
        isSolo: json['isSolor']);
  }
  Map<String, dynamic> toJson() => {
        'artist': this.artist,
        'cover_url': this.cover_url,
        'songName': this.songName,
        'songUrl': this.songUrl,
        'isSolor': this.isSolo
      };

  Song copyWith(
      {String? uid,
      String? cover_url,
      String? songUrl,
      String? songName,
      String? artist,
      bool? isSolo}) {
    return Song(
        id: uid ?? this.id,
        cover_url: cover_url ?? this.cover_url,
        songName: songName ?? this.songName,
        artist: artist ?? this.artist,
        isSolo: isSolo ?? this.isSolo,
        songUrl: songUrl ?? this.songUrl);
  }
}
