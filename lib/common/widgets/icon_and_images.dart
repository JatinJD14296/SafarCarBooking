import 'dart:io';


icons({  icon,  color, double? size}) =>
    icons(icon:icon, color: color , size: size ?? 24);

class Images {
  Images._privateConstructor();

  static final Images _instance = Images._privateConstructor();

  static Images get instance => _instance;

  Images networkImage(String s, {String? url, double ?height, double? width,  color,  fit}) =>
      Images.network(url, height: height, width: width, color: color, fit: fit);

  Images assetImage({ String? name, double? height, double? width,  color,  fit}) =>
      Images.asset(name, height: height, width: width, color: color, fit: fit);

  ImageProvider networkImageProvider({String ?url}) => network(url);

  ImageProvider assetImageProvider({String ? name}) => asset(name);

  ImageProvider fileImageProvider({File? name}) => FileImage(name);

  static network(String? url, {double? height, double? width, color, fit}) {}

  static asset(String? name, {double? height, double? width, color, fit}) {}

  FileImage(File? name) {}
}


class ImageProvider {
}
