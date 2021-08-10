
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

//View


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
                                    leading: Container(
                                      width: 70,
                                      height: 72,
                                      child: Image.network(
                                        file.url,
                                        fit: BoxFit.cover,
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
            })

```