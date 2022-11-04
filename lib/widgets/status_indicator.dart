import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String characterStatus;

  const StatusIndicator({Key? key, required this.characterStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: _getColorByStatus(characterStatus),
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getColorByStatus(String status) {
    var enumStatus = Status.values.singleWhere((element) => element.name == status);

    switch (enumStatus) {
      case Status.Alive:
        return Colors.lightGreenAccent;
      case Status.Dead:
        return Colors.red;
      default:
        return Colors.grey.shade500;
    }
  }
}

enum Status {
  Alive,
  Dead,
  unknown
}
