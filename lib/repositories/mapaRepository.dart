import 'package:atividade0909/models/mapa.dart';

class MapaRepository {
  static List<Mapa> mapas = [
    Mapa(
        nome: "Ascent",
        icone: 'images/ascentSplash.png',
        coordenadas: "45°26'BF'N,12°20'Q'E",
        displayMap: 'images/ascent.webp'
        ),
    Mapa(
        nome: "Bind",
        icone: 'images/bindSplash.png',
        coordenadas: "34°2'A'N,6°51'Z'W",
        displayMap: 'images/bind.webp'),
    Mapa(
        nome: "Haven",
        icone: 'images/havenSplash.png',
        coordenadas: "27°28'A'N,89°38'WZ'E",
        displayMap: 'images/haven.webp'),
    Mapa(
        nome: "Icebox",
        icone: 'images/iceboxSplash.png',
        coordenadas: "76°44' A\"N 149°30' Z\"E",
        displayMap: 'images/icebox.webp'),
    Mapa(
        nome: "Sunset",
        icone: 'images/sunsetSplash.png',
        coordenadas: "34°2' C″N,118°12'YT″W",
        displayMap: 'images/sunset.webp')
  ];
}
