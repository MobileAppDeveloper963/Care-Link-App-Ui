import 'package:care_link_app/model/message_model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController{
  List<MessageModel> messageList = [
  MessageModel(
    name: "Esther Howard",
    message: "Lorem ipsum dolor sit amet...",
    time: "10:20",
    unread: 2,
    image: "https://randomuser.me/api/portraits/men/1.jpg",
    active: true,
  ),
  MessageModel(
    name: "Wade Warren",
    message: "Lorem ipsum dolor sit amet...",
    time: "10:20",
    unread: 2,
    image: "https://randomuser.me/api/portraits/men/2.jpg",
    active: false,
  ),
  MessageModel(
    name: "Chance Septimus",
    message: "Lorem ipsum dolor sit amet...",
    time: "10:20",
    unread: 0,
    image: "https://randomuser.me/api/portraits/men/3.jpg",
    active: false,
  ),
  MessageModel(
    name: "Robert Fox",
    message: "Lorem ipsum dolor sit amet...",
    time: "10:20",
    unread: 0,
    image: "https://randomuser.me/api/portraits/men/4.jpg",
    active: false,
  ),
];

}