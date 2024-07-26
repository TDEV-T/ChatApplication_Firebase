import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String msg;
  final Timestamp timestamp;

  Message(
      {required this.senderID,
      required this.senderEmail,
      required this.receiverID,
      required this.msg,
      required this.timestamp});

  //convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'msg': msg,
      'timestamp': timestamp
    };
  }
}
