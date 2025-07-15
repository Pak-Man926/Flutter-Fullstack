import "package:flutter/material.dart";
import "package:pixels/pixels.dart";
import "package:pixorama_client/pixorama_client.dart";
import "../../main.dart";

class Pixorama extends StatefulWidget
{
  const Pixorama({super.key});

  @override
  State<Pixorama> createState() => _PixoramaState();
}

class _PixoramaState extends State<Pixorama>
{
  PixelImageController? _imageController;

  @override
  void initState()
  {
    super.initState();

    _listenToUpdates();
  }

  Future<void> _listenToUpdates() async
  {
    while(true)
    {
      final imageUpdates = client.pixorama.imageUpdate();

      await for(final update in imageUpdates)
      {
        if(update is ImageDate)
        {
          setState((){
            _imageController = PixelImageController(palette: PixelPalette.rPlace(), width: update.width, height: update.height, pixels: update.pixels);
          })
        }
      }
    }
  }
}