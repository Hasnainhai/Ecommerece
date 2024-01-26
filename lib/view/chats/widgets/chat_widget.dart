// ignore_for_file: file_names

import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

import '../../../res/components/colors.dart';

class ChatScreenWidget extends StatefulWidget {
  const ChatScreenWidget({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({required this.text, required this.isSender});
}

class ChatScreenState extends State<ChatScreenWidget> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
        text: text,
        isSender: true); // You can modify this to determine sender/receiver.
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildMessage(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        alignment:
            message.isSender ? Alignment.centerRight : Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: message.isSender
                ? AppColor.primaryColor
                : Colors.grey, // Change colors accordingly
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text, // Use the actual message text
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: message.isSender
                      ? Colors.white
                      : Colors.black, // Change colors accordingly
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "00:00",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: message.isSender
                          ? Colors.white
                          : Colors.black, // Change colors accordingly
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: message.isSender
                        ? Colors.white
                        : Colors.black, // Change colors accordingly
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessage(_messages[index]);
            },
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return Column(
      children: [
        const Divider(height: 1.0, color: Color(0xFFEBEBEB)),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions),
                    onPressed: () {
                      // Handle emoji icon press
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Digite aqui sua mensagem...',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 16.0),
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _handleSubmitted(_textController.text);
                      }
                      // Handle send icon press
                    },
                  ),
                ],
              ),
            )),
        const Divider(height: 1.0, color: Color(0xFFEBEBEB)),
        const VerticalSpeacing(14),
      ],
    );
    // return Container(
    //   margin: const EdgeInsets.all(10.0),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: TextField(
    //           controller: _textController,
    //           onSubmitted: _handleSubmitted,
    //           decoration: const InputDecoration(
    //               hintText: 'Type a message...',
    //               hintStyle: TextStyle(
    //                 color: AppColor.whiteColor,
    //               )),
    //         ),
    //       ),
    //       IconButton(
    //         icon: const Icon(
    //           Icons.send,
    //           color: AppColor.primaryColor,
    //         ),
    //         onPressed: () {
    //           if (_textController.text.isNotEmpty) {
    //             _handleSubmitted(_textController.text);
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
