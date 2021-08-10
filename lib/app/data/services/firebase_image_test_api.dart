import 'package:firebase_storage/firebase_storage.dart';
import 'package:wizard/app/data/models/firebase_image.dart';

class FirebaseApi {
  static Future<List<FirebaseImage>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls =
        await _getDownloadLinks(result.items); //List<Reference> get items

    // <!-- pegando os Urls dos dados  -->
    var dados = urls
        .asMap()
        .map((index, url) {
          final _ref = result.items[index];
          final _name = _ref.name;
          // <!--Finalmente vou ter que criar um FileDoFirebase -->
          final file = FirebaseImage(ref: _ref, name: _name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();

    return dados;
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> references) {
    // 'metodo que retorn os links de download de files passado como referencia'
    return Future.wait(references.map((ref) => ref.getDownloadURL()).toList());
  }
}
