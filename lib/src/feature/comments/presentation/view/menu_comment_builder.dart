import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/comments/presentation/view/comment.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';


class MenuCommentBuilder extends StatefulWidget {
  const MenuCommentBuilder({Key? key, this.menu}) : super(key: key);
    final MenuDataModel? menu;

  


  @override
  State<MenuCommentBuilder> createState() => _MenuCommentBuilderState();
}

class _MenuCommentBuilderState extends State<MenuCommentBuilder> {
  late Future<MenuDataModel?> commentsFuture;

  @override
  void initState() {
    fetchMenus();
    super.initState();
  }

  void fetchMenus() {
    commentsFuture = Future.value(widget.menu);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MenuDataModel?>(
      future: commentsFuture,
      builder: (context, AsyncSnapshot<MenuDataModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data!.comments != null) {
          final comments = snapshot.data!.comments;
          return buildMenuCommentsListView(comments);
        } else {
          return const Center(child: Text('No menu comment available.'));
        }
      },
    );
  }

  Widget buildMenuCommentsListView(MenuDataModel comments) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.03,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: comments.comments.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var comment = comments.comments?.isNotEmpty == true
            ? comments.comments![index]
            : null;

        final img = comment?.customer.avatar;
        final name = comment?.customer.otherName;
        final date = comment?.createdAt;
        final commentText = comment?.comment;

        return Comments(
          img: img,
          name: name,
          dateTime: date,
          comment: commentText,
        );
      },
    );
  }
}