import 'dart:math';
import './box_item.dart';

abstract class BoxesAPI {
  /// Throws [NetworkException].
  Future<List<BoxItem>> fetchBoxes();
}

class FakeBoxesAPI implements BoxesAPI {
  List<BoxItem> storedBoxes = [
    BoxItem(
        title: 'Lorem ipsum dolor',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices purus nec dolor pretium faucibus. Phasellus eget molestie velit, vitae iaculis mauris. Mauris gravida, diam eu fermentum volutpat, dui neque elementum odio, eu faucibus odio purus quis tellus. Nam non rutrum velit. Cras posuere odio leo, sed sollicitudin leo cursus eu. Aenean varius enim nibh, sed maximus arcu malesuada eu. Proin enim sapien, faucibus sed sagittis in, tristique in lorem. Praesent facilisis cursus erat, sit amet interdum turpis lacinia et. Etiam sit amet urna pulvinar, bibendum sem id, semper quam. Aenean egestas nisi at magna efficitur ultricies. Morbi imperdiet erat neque, sed cursus ante maximus sed. Nulla porttitor eu nibh sed suscipit. Integer sollicitudin nibh volutpat, iaculis eros eu, lacinia lorem.',
        expanded: false),
    BoxItem(
        title: 'Integer non lectus',
        text:
            'Integer non lectus nunc. Donec velit velit, facilisis et suscipit a, convallis nec ante. Nam non erat fermentum, suscipit sem vel, interdum risus. Cras ultrices vestibulum lacinia. Integer dignissim, magna et blandit congue, tellus libero condimentum nibh, quis hendrerit felis ante eget arcu. Proin nulla turpis, hendrerit vel leo eu, bibendum rutrum urna. Mauris at quam purus. Aliquam ut magna malesuada, blandit est at, maximus magna.',
        expanded: false),
    BoxItem(
        title: 'Ut elit est',
        text:
            'Ut elit est, posuere ac dignissim eu, faucibus ultricies quam. Nunc luctus, tortor et dictum rutrum, nisi nunc condimentum nulla, nec mollis odio quam ac ex. Donec vel vulputate ligula, id suscipit orci. Ut diam leo, iaculis non erat mattis, dapibus molestie erat. Ut mauris velit, gravida eu neque id, fermentum interdum nibh. Integer sodales et lectus ac viverra. Etiam sodales enim ut arcu sodales congue. Suspendisse rhoncus sapien id ante maximus placerat. Mauris eget enim sit amet est tristique varius. Suspendisse odio libero, tincidunt vel congue vitae, vehicula id ligula. Fusce facilisis viverra turpis, vitae malesuada nulla euismod eu.',
        expanded: false)
  ];

  Future<List<BoxItem>> fetchBoxes() {
    return Future.delayed(Duration(seconds: 2), () {
      final random = Random();
      if (random.nextBool()) {
        throw NetworkException();
      }
      return storedBoxes;
    });
  }
}

class NetworkException implements Exception {}
