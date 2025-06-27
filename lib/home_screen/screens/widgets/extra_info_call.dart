import 'package:flutter/cupertino.dart';

import '../../../utilities/common_class/common_class.dart';
import '../../../utilities/theme/color_theme.dart';

class ExtraInfoCall extends StatefulWidget {
  final String extraInfoName;
  final String extraInfoValue;
  final String extraInfoUnit;
  final String extraInfoIcon;

  const ExtraInfoCall({
    super.key,
    required this.extraInfoValue,
    required this.extraInfoUnit,
    required this.extraInfoName,
    required this.extraInfoIcon,
  });

  @override
  State<ExtraInfoCall> createState() => _ExtraInfoCallState();
}

class _ExtraInfoCallState extends State<ExtraInfoCall> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.extraInfoIcon, height: 26, width: 25),
        Text(
          '${widget.extraInfoValue}${widget.extraInfoUnit}',
          style: variousTextStyle.extraInfo,
        ),
        Text(
          widget.extraInfoName,
          style: variousTextStyle.extraInfoDescription,
        ),
      ],
    );
  }
}
