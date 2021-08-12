 # WIDGET BACANA QUE GURADA IMAGES EM CACHE QUANDO FICAS OFFLINE
 
```yaml
cached_network_image: ^3.1.0
```
 How to use

The CachedNetworkImage can be used directly or through the ImageProvider. Both the CachedNetworkImage as CachedNetworkImageProvider have minimal support for web. It currently doesn't include caching.

With a placeholder:

```dart
CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
```

Or with a progress indicator:
```dart
CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),

Image(image: CachedNetworkImageProvider(url))

 CachedNetworkImage(
  imageUrl: "http://via.placeholder.com/200x150",
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
    ),
  ),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
),



 ```