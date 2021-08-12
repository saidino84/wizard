import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/songuploader_controller.dart';

class SongUploaderPage extends GetView<SonguploaderController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primaryColor = Theme.of(context).primaryColor;
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      padding: EdgeInsets.all(20),
      // alignment: Alignment.center,

      child: SingleChildScrollView(
        // height: 400,
        // decoration: BoxDecoration(),
        reverse: true,
        child: Form(
          key: controller.form_key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),

              Container(
                alignment: Alignment.center,
                height: 160,
                width: 160,
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.select_music_cover();
                    },
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: controller.has_cover.value == true
                          ? FileImage(controller.cover_uri.value)
                          : null,
                      child: controller.has_cover.value
                          ? Text('')
                          : Text(
                              'cover image',
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 24),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  onTap: () {
                    controller.get_audio().then((value) {
                      Get.snackbar('Got sonmg', 'Song catch sucessfuly',
                          backgroundColor: Colors.green);
                    }).catchError((err) {
                      Get.snackbar('Got sonmg', 'Song catch problem $err',
                          backgroundColor: primaryColor);
                    });
                  },
                  readOnly: true,
                  controller: controller.song_uri_contrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                    suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(Icons.library_music)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // labelText: 'song name',
                    helperText: 'Selecione o caminho da musica',
                    helperStyle: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  style: TextStyle(color: Colors.grey[200], fontSize: 14),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'por favor vai e busque o som';
                    }
                    return null;
                  }),
              TextFormField(
                  // readOnly: true,
                  controller: controller.song_title_contrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.music_note_sharp,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // labelText: 'song name',
                    helperText: 'Song name',
                    helperStyle: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  style: TextStyle(color: Colors.grey[200], fontSize: 14),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o nome do Som';
                    }
                    return null;
                  }),
              // SizedBox(
              //   height: 20,
              // ),

              TextFormField(
                  // readOnly: true,
                  controller: controller.song_artist_contrl,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.personal_injury_sharp),
                    ),
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // labelText: 'song name',
                    helperText: 'Artist Name',
                    helperStyle: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  style: TextStyle(color: Colors.grey[200], fontSize: 14),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite O/os Cantaores do som';
                    }
                    return null;
                  }),

              Obx(
                () => CheckboxListTile(
                  value: controller.is_solo.value,
                  onChanged: controller.change_is_solo,
                  title: Text(
                    ' Musica Solo',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            controller.save_to();
                            // controller.upload_simple();
                          },
                          child: Text(
                            'Salvar '.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: primaryColor,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
