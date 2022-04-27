import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailureAlertDialog extends StatefulWidget {
  FailureAlertDialog({
    Key? key,
    required this.errorTitle,
    required this.errorMessage,
    Function ? additionalFunction,
  }) : super(key: key) {
    if (additionalFunction == null) {
      runAdditionalFunction = () {

      };
    } else {
      runAdditionalFunction = additionalFunction;
    }
  }

  final String errorTitle;
  final String errorMessage;
  late final Function runAdditionalFunction;

  @override
  _FailureAlertDialogState createState() => _FailureAlertDialogState();
}

class _FailureAlertDialogState extends State<FailureAlertDialog>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      titlePadding: const EdgeInsets.only(top: 30),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/animation/failure_cross.json',
            width: 150,
            fit: BoxFit.cover,
            controller: _controller,
            onLoaded: (composition) {
              _controller..duration = composition.duration;
              _controller.forward();
            },
            errorBuilder: (context, error, stackTrace) {
              return const Placeholder(
                color: Color.fromRGBO(226, 71, 71, 1),
              );
            },
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            margin: const EdgeInsets.only(top: 12.0),
            child : Align(
              // alignment: Alignment.center,
              child: Text(
                widget.errorTitle,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(83, 81, 81, 1),
                ),
              ),
            ),
          ),
        ],
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 156).copyWith(top: 24),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Text(
          widget.errorMessage,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(83, 81, 81, 1), //Quarternary Grey
          ),
          textAlign: TextAlign.justify,
          softWrap: true,
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(top: 24, bottom: 30),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 45),
            primary: const Color.fromRGBO(226, 71, 71, 1), // error red
            side: const BorderSide(color: Color.fromRGBO(226, 71, 71, 1)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            widget.runAdditionalFunction();
            _controller.stop();
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
