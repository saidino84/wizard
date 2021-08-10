
# Metodos de Leitura No StorageFirebase E FAZER DOWNLOAD
'uma pasta com nome files '
[+] files/
[-] files contidos dentro do files/
    /files/image_1.png
    /files/image_2.png
    /files/image_3.png
    /files/image_4.png

```dart
<!-- MODELO -->
class FirebaseFile{
    final Reference ref;
    final String name;
    final String url;
    const FirebaseFile({required this.ref, required this.name, required this.url});
}


<!-- REPOSITORY -->
class FirebaseApi{
    static Future<List<FirebaseFile>> listAll(String path) async {
        final ref = FirebaseStorage.instance.ref(path);
        final result = await ref.listAll();

        final urls =await _getDownloadLinks(result.items); //List<Reference> get items

        <!-- pegando os Urls dos dados  -->
        var dados =urls.asMap().map((index,url){
            final _ref =result.items[index];
            final _name =_ref.name;
            <!--
             Finalmente vou ter que criar um FileDoFirebase 
             -->
            final file = FirebaseFile(ref:_ref, name:_name,url:url);

            return MapEntry(index,file);
        }).values.toList();
    }

    static Future<List<Strings>> _getDownloadLinks(List<Reference> references){
        'metodo que retorn os links de download de files passado como referencia'
        return Future.wait(references.map((ref)=>ref.getDownloadURL()).toList());
    }
}

```