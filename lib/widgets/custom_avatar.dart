import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAvatar extends StatelessWidget {
  final String? url;
  const CustomAvatar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: url == null
          ? Icon(
              FontAwesomeIcons.image,
            )
          : Image(
              image: NetworkImage(url!),
              errorBuilder: (ctx, obj, stackTrace) => Icon(
                FontAwesomeIcons.image,
              ),
            ),
      radius: 40,
    );
  }
}
