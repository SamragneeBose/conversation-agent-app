class ChatResponse{
  final String msg;
  final int chatIndex;

  ChatResponse({
    required this.msg,
    required this.chatIndex,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json)=> ChatResponse(
      msg: json["msg"],
      chatIndex: json["chatIndex"],
  );
}