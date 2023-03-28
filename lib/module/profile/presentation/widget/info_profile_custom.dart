import 'package:flutter/material.dart';

Widget infoProfileCustom(
  BuildContext context, {
  required String title,
  String? data,
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            data ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey[600],
          )
        ],
      ),
    ),
  );
}
