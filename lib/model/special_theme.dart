class SpecialTheme {
  final String id;
  final String themeName;
  final String content;

  SpecialTheme({
    required this.id,
    required this.themeName,
    required this.content,
  });

  SpecialTheme.fromJson({
    required Map<String, dynamic> json,
  })  : id = json['id'],
        themeName = json['themeName'],
        content = json['content'];

  @override
  String toString() {
    return 'id: $id, themeName: $themeName, content: $content';
  }
}
