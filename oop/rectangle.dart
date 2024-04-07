/// Class
/// Object
/// Setter
/// Getter
class Rectangle {
  double? _width;
  double? _height;

  double get area => _width! * _height!;

  set width(double width) {
    _width = width;
  }

  set height(double height) {
    _height = height;
  }
}