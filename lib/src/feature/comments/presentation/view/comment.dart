import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';

class Comments extends StatefulWidget {
  const Comments({
    Key? key,
    this.img,
    this.name,
    this.comment,
    this.dateTime,
  }) : super(key: key);

  final String? img;
  final String? name;
  final String? comment;
  final DateTime? dateTime;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    final formattedDateTime =
        widget.dateTime != null ? formatDateTime(widget.dateTime!) : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    widget.img! ,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .08,
                ),
                Text(
                  widget.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 17),
                )
              ],
            ),
            Text(
              formattedDateTime,
              style: const TextStyle(
                  color: grey, fontSize: 15, fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .02,
        ),
        Text(
          widget.comment ?? '',
        ),
      ],
    );
  }

  String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat('dd MMM y').format(dateTime);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
