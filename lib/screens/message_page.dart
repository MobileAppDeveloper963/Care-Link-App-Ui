import 'package:animate_do/animate_do.dart';
import 'package:care_link_app/controllers/message_controller.dart';
import 'package:care_link_app/widgets/build_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key});

  MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: BuildIconButton(icon: Icons.arrow_back),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Message"),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildIconButton(icon: Icons.arrow_back),
                Text(
                  "Message",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2)),
                  hintText: 'Search Message...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 1,
                          height: 24,
                          color: Colors.grey,
                        ),
                      ),
                      Icon(Icons.tune)
                    ],
                  ),
                ),
              ).fadeIn(
                  duration: Duration(seconds: 1),
                  delay: Duration(milliseconds: 400)),
            ),
            ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: controller.messageList.length,
              separatorBuilder: (context, index) => const Divider(
                height: 20,
                indent: 70,
              ),
              itemBuilder: (context, index) {
                final message = controller.messageList[index];

                return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(message.image),
                      ),
                      if (message.active)
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(
                    message.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    message.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message.time,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      if (message.unread > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            message.unread.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                )
                    .animate()
                    .fade(duration: 300.ms, delay: (index * 200).ms)
                    .slideX(begin: -1, end: 0, curve: Curves.easeOut);
              },
            ),
          ]),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade700),
        child: Center(
          child: Text(
            '+ New Chat',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
