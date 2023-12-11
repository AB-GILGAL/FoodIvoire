import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/comments/presentation/view/comment.dart';


class MenuCommentBuilder extends StatefulWidget {
  const MenuCommentBuilder({Key? key, this.menu}) : super(key: key);
    final dynamic menu;

  


  @override
  State<MenuCommentBuilder> createState() => _MenuCommentBuilderState();
}

class _MenuCommentBuilderState extends State<MenuCommentBuilder> {
  late Future<dynamic> commentsFuture;

  @override
  void initState() {
    fetchMenus();
    super.initState();
  }

  void fetchMenus() {
  if (widget.menu != null) {
    commentsFuture = Future.value(widget.menu);
  } else {
    // Handle the case when widget.menu is null, e.g., set commentsFuture to a default value.
    commentsFuture = Future.value(/* default value or null */);
  }
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: commentsFuture,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
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

  Widget buildMenuCommentsListView(dynamic comments) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.03,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: comments.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var comment = comments?.isNotEmpty == true
            ? comments![index]
            : null;
            print("yooooo $comment");

        final img = comment['customer']['avatar'];
        final name = "${comment["customer"]["otherName"]} ${comment["customer"]["lastName"]}";
        final date = comment["createdAt"];
        final commentText = comment["comment"];

        return Comments(
          img: img,
          name: name,
          dateTime: DateTime.tryParse(date),
          comment: commentText,
        );
      },
    );
  }
}