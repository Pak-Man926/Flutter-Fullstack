import "dart:typed_data";
import "package:serverpod/serverpod.dart";
import "package:pixorama_server/src/generated/protocol.dart";

class PixoramaEndpoint extends Endpoint
{
  static const _imageWidth = 64;
  static const _imageHeight = 64;
  static const _numPixels = _imageWidth * _imageHeight;

  static const _numColorsInPalette =16;
  static const _defaultPixelColor = 2;

  final _pixelData = Uint8List(_numPixels)
    ..fillRange(0,
    _numPixels,
     _defaultPixelColor);

   static const _channelPixelAdded = "pixel_added";  

   Future<void> setPixel(Session session, required int colorIndex, required int pixelIndex)
}