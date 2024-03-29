import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/comments/presentation/provider/menu_comment_provider.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';

class MenuCommentTextField extends StatefulWidget {
  const MenuCommentTextField({super.key, this.menu});
  final dynamic menu;

  @override
  State<MenuCommentTextField> createState() => _MenuCommentTextFieldState();
}

class _MenuCommentTextFieldState extends State<MenuCommentTextField> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: LayoutBuilder(
          builder: (context, constraints) => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  .4, // Adjust the max height as needed
            ),
            child: Scrollbar(
              interactive: true,
              thickness: 20,
              controller: _scrollController,
              thumbVisibility:
                  _textEditingController.text.split('\n').length > 4,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    TextField(
                      controller: _textEditingController,
                      cursorHeight: 20,
                      cursorColor: Colors.green,
                      style: const TextStyle(fontSize: 15),
                      maxLines: 5, // Limit to a maximum of 5 lines
                      minLines: 1, // Start with a minimum of 1 line
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.all(8.0).copyWith(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                        fillColor: lightGrey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 10),
                      child: InkWell(
                          onTap: () async {
                            await context
                                .read<MenuCommentProvider>()
                                .customerMenuComment(
                                  _textEditingController.text,
                                  widget.menu!.id,
                                )
                                .then((value) => value.fold(
                                      (l) => print(l.message),
                                      (r) => _textEditingController.clear(),
                                    ));
                          },
                          child: const Icon(Icons.send, color: green,)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
