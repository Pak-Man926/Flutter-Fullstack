import "package:flutter/material.dart";
import "package:pixels/pixels.dart";
import "package:pixorama_client/pixorama_client.dart";
import "../../main.dart";

class Pixorama extends StatefulWidget {
  const Pixorama({super.key});

  @override
  State<Pixorama> createState() => _PixoramaState();
}

class _PixoramaState extends State<Pixorama> {
  PixelImageController? _imageController;

  @override
  void initState() {
    super.initState();

    _listenToUpdates();
  }

  Future<void> _listenToUpdates() async {
    while (true) {
      try {
        final imageUpdates = client.pixorama.imageUpdate();

        await for (final update in imageUpdates) {
          if (update is ImageData) {
            setState(() {
              _imageController = PixelImageController(
                  palette: PixelPalette.rPlace(),
                  width: update.width,
                  height: update.height,
                  pixels: update.pixels);
            });
          } else if (update is ImageUpdate) {
            _imageController?.setPixelIndex(
                pixelIndex: update.pixelIndex, colorIndex: update.colorIndex);
          }
        }
      } on MethodStreamException catch (_) {
        setState(() {
          _imageController = null;
        });
      }
      await Future.delayed(Duration(seconds:5));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: _imageController == null
          ? const CircularProgressIndicator()
          : PixelEditor(
            controller: _imageController!,
            onSetPixel: (details) {
              client.pixorama.setPixel(colorIndex: details.colorIndex, pixelIndex: details.tapDetails.index);
            }
            ),

    );
  }
}
