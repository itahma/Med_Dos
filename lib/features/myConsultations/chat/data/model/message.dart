class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String ?message;
  final String ?image;
  final String ?pdf;
  final bool isMe;
  final String formattedCreatedAt;
  final String createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.image,
    required this.pdf,
required this.createdAt,
    required this.isMe,
    required this.formattedCreatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'] ?? "",
      image: json['image'] ?? "",
      pdf: json['pdf'] ?? "",
      isMe: json['isme'],
      createdAt: json['createdAt'],
      formattedCreatedAt: json['formattedCreatedAt'],
    );
  }

}