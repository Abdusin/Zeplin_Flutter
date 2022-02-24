part of flutter_zeplin;

class ZeplinSpace {
  String name;
  num value;

  ZeplinSpace({
    required this.name,
    required this.value,
  });

  factory ZeplinSpace.fromMap(Map<String, dynamic> map) {
    return ZeplinSpace(
      name: map['name'],
      value: map['value'] ?? 0,
    );
  }

  SizedBox? _box;
  SizedBox get box => _box ??= SizedBox.square(dimension: value.toDouble());

  SizedBox? _horizontalBox;
  SizedBox get horizontalBox => _horizontalBox ??= SizedBox(width: value.toDouble());

  SizedBox? _verticalBox;
  SizedBox get verticalBox => _verticalBox ??= SizedBox(height: value.toDouble());
}
