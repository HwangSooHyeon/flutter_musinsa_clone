class SpecialTheme {
  final String id;
  final String themeName;
  final String label;
  final String content;

  SpecialTheme({
    required this.id,
    required this.themeName,
    required this.label,
    required this.content,
  });

  SpecialTheme.fromJson({
    required Map<String, dynamic> json,
  })  : id = json['id'],
        themeName = json['themeName'],
        label = json['label'],
        content = json['content'];

  @override
  String toString() {
    return 'id: $id, themeName: $themeName, label: $label, content: $content';
  }
}
