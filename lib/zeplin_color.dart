part of flutter_zeplin;

class ZeplinColor {
  final String id;
  final int created;
  final String name;
  final Color color;

  const ZeplinColor({
    required this.id,
    required this.created,
    required this.name,
    required this.color,
  });

  factory ZeplinColor.fromMap(Map<String, dynamic> map) {
    return ZeplinColor(
        id: map['id'] ?? '',
        created: map['created']?.toInt() ?? 0,
        name: map['name'] ?? '',
        color: Color.fromRGBO(
            map['r']?.toInt() ?? 0, map['g']?.toInt() ?? 0, map['b']?.toInt() ?? 0, map['a']?.toDouble() ?? 0.0));
  }
}
