import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/comments/presentation/view/comment.dart';

class CommentBuilder extends StatefulWidget {
  const CommentBuilder({Key? key, required this.restaurant}) : super(key: key);
  final RestaurantDataModel? restaurant;

  @override
  State<CommentBuilder> createState() => _CommentBuilderState();
}

class _CommentBuilderState extends State<CommentBuilder> {
  late Future<RestaurantDataModel?> commentsFuture;

  @override
  void initState() {
    fetchRestaurants();
    super.initState();
  }

  void fetchRestaurants() {
    commentsFuture = Future.value(widget.restaurant);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RestaurantDataModel?>(
      future: commentsFuture,
      builder: (context, AsyncSnapshot<RestaurantDataModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          final comments = snapshot.data!;
          return buildCommentsListView(comments);
        } else {
          return const Center(child: Text('No comment available.'));
        }
      },
    );
  }

  Widget buildCommentsListView(RestaurantDataModel comments) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.03,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: comments.comments!.length,
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
