import 'dart:convert';

class NetworkMenuItem {
  final String imageUrl;
  final String name;
  NetworkMenuItem({
    required this.imageUrl,
    required this.name,
  });

  NetworkMenuItem copyWith({
    String? imageUrl,
    String? name,
  }) {
    return NetworkMenuItem(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'name': name,
    };
  }

  factory NetworkMenuItem.fromMap(Map<String, dynamic> map) {
    return NetworkMenuItem(
      imageUrl: map['imageUrl'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkMenuItem.fromJson(String source) =>
      NetworkMenuItem.fromMap(json.decode(source));

  @override
  String toString() => 'NetworkMenuItem(imageUrl: $imageUrl, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkMenuItem &&
        other.imageUrl == imageUrl &&
        other.name == name;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ name.hashCode;
}
