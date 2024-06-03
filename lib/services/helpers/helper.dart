

class Helper {
  static splitDisplayName(String fullName) {
    String firstName = '';
    String lastName = '';

    var sname = fullName.trim().split(" ");

    var n = sname.length % 2 != 0 ? (sname.length / 2) - 1 : sname.length / 2;
    for (var i = 0; i < sname.length; i++) {
      if (i < n)
        firstName += sname[i] + ' ';
      else
        lastName += sname[i] + ' ';
    }
    return [firstName.trim(), lastName.trim()];
  }

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
  //       .buffer
  //       .asUint8List();
  // }

  // Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
  //     String path, int width) async {
  //   final Uint8List imageData = await getBytesFromAsset(path, width);
  //   return BitmapDescriptor.fromBytes(imageData);
  // }

  // static String convertUrlToId(String url) {
  //   assert(url?.isNotEmpty ?? false, 'Url cannot be empty');
  //   if (!url.contains("http") && (url.length == 11)) return url;

  //   for (var exp in [
  //     RegExp(
  //         r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
  //     RegExp(
  //         r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
  //     RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
  //   ]) {
  //     Match match = exp.firstMatch(url);
  //     if (match != null && match.groupCount >= 1) return match.group(1);
  //   }

  //   return null;
  // }
}
