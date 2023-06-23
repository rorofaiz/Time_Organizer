import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:timeorganize/BottemAppbar.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late DialogFlowtter dialogFlowtter;
  late Message userMessage;
  final TextEditingController messageController = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile(path: "assets/nlpapp-duok-e46024870dac.json")
        .then((instance) => dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    var themeValue = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      appBar: MyAppbar(),
      drawer: MyDrawer(),
      bottomNavigationBar: BottemAppbar(1),
      body: Stack(
        children: [
          SizedBox.expand(
              child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              "images/add.gif",
            ),
          )),
          Expanded(child: Body(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    style: TextStyle(
                        color: themeValue == Brightness.dark
                            ? Colors.black
                            : Colors.black,
                        fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: themeValue == Brightness.dark
                                  ? Colors.black
                                  : Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      hintStyle: TextStyle(
                        color: themeValue == Brightness.dark
                            ? Colors.white54
                            : Colors.black54,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                      labelStyle: TextStyle(
                          color: themeValue == Brightness.dark
                              ? Colors.black
                              : Colors.black),
                      hintText: 'Send a message',
                    ),
                  ),
                ),
                IconButton(
                  color: themeValue == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      userMessage = Message(text: DialogText(text: [text]));
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      // print("This Message using Print method   "+response.message.toString());
      addMessage(response.message!);

      String eventName = response.queryResult!.intent!.displayName.toString();

      if (eventName == "add event") {
      } else if (eventName == "add event name") {
      } else if (eventName == "event date") {
        addMessage(
          userMessage,
          false,
        );
      } else if (eventName == "edit event") {
      } else if (eventName == "edit event name") {
      } else if (eventName == "edit event date") {
        addMessage(
          userMessage,
          false,
        );
      } else if (eventName == "delete event") {
      } else if (eventName == "delete event name") {
      } else if (eventName == "delete event name - yes") {
      } else if (eventName == "delete event name - no") {}
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}

class Body extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const Body({
    Key? key,
    this.messages = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        var obj = messages[messages.length - 1 - i];
        Message message = obj['message'];
        bool isUserMessage = obj['isUserMessage'] ?? false;
        return Row(
          mainAxisAlignment:
              isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _MessageContainer(
              message: message,
              isUserMessage: isUserMessage,
            ),
          ],
        );
      },
      separatorBuilder: (_, i) => Container(height: 10),
      itemCount: messages.length,
      reverse: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final Message message;
  final bool isUserMessage;

  const _MessageContainer({
    Key? key,
    required this.message,
    this.isUserMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Container(
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.blue : Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              message.text?.text?[0] ?? '',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
