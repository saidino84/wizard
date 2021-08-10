import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/app/data/models/firebase_image.dart';
import 'package:wizard/app/ui/pages/covers_page/componets/image_details.dart';
import '../../../controllers/covers_controller.dart';

class CoversPage extends GetView<CoversController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CoversPage'),
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        body: FutureBuilder<List<FirebaseImage>>(
            future: controller.futurefiles,
            builder: (ctx, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child:
                            Text('Some thik was wrong :\n ${snapshot.error}'));
                  } else {
                    final files = snapshot.data!;
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(
                              '/flutfirebase/covers =${files.length} arquivos '),
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: files.length,
                              itemBuilder: (ctx, index) {
                                var file = files[index];
                                return Card(
                                  child: ListTile(
                                    onTap: () => Get.to(
                                      ImageDetails(
                                        image: file,
                                      ),
                                    ),
                                    leading: ClipOval(
                                      child: Container(
                                        width: 70,
                                        height: 76,
                                        child: Image.network(
                                          file.url,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    title: Text('${file.name}'),
                                    subtitle: Text('${file.url}'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]);
                  }
              }
            }));
  }

  Widget buildHeader(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      height: kToolbarHeight,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Row(
        children: [
          Icon(Icons.filter_vintage_rounded, color: Colors.yellow),
          Text(
            title,
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
