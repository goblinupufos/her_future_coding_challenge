import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_event.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final text = _controller.text.trim();
    context.read<PalindromeBloc>().add(LiveCheckPalindromeEvent(text));
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: "Enter a word or phrase",
        suffixIcon: IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              context.read<PalindromeBloc>().add(
                CheckPalindromeEvent(_controller.text.trim()),
              );
            }
          },
        ),
      ),
    );
  }
}
