class Token {
  final int userId;
  final int id;
  final String title;
  final String body;

  Token(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
