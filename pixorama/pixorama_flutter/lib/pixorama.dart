import "package:flutter/material.dart";
import "package:pixels/pixels.dart";
import "package:pixorama_client/pixorama_client.dart";
import "../../main.dart";

class Pixorama extends StatefulWidget
{
  @override
  State<Pixorama> createState() => _PixoramaState();
}

class _PixoramaState extends State<Pixorama>
{
  PixelImageController? _imageController;
}