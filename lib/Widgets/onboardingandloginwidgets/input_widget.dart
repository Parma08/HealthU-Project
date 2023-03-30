import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String labelName;
  final TextEditingController textController;
  final IconData iconName;
  InputWidget(
      {required this.labelName,
      required this.textController,
      required this.iconName});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late FocusNode focusnode;

  @override
  void initState() {
    super.initState();
    focusnode = FocusNode();
    focusnode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    focusnode.removeListener(onFocusChange);
    focusnode.dispose();
    super.dispose();
  }

  void onFocusChange() {
    if (widget.textController.text == '' && !focusnode.hasFocus) {
      showLabel = true;
      setState(() {});
      return;
    }
    showLabel = false;
    setState(() {});
  }

  var showLabel = true;
  var userTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(58, 185, 185, 185),
          borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.iconName),
          Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                obscureText: widget.labelName == 'Password' ||
                        widget.labelName == 'Confirm Password'
                    ? true
                    : false,
                focusNode: focusnode,
                style: const TextStyle(
                    color: Color.fromARGB(255, 31, 31, 31), fontSize: 16),
                keyboardType: widget.labelName == 'Email'
                    ? TextInputType.emailAddress
                    : widget.labelName == 'Password'
                        ? TextInputType.visiblePassword
                        : TextInputType.name,
                controller: widget.textController,
                decoration: showLabel
                    ? InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        label: Text(
                          widget.labelName,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 185, 185, 185)),
                        ))
                    : const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                      ),
              )),
        ],
      ),
    );
  }
}
