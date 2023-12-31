import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/space_height.dart';

class OrderStatus extends StatelessWidget {
  final List<String> status;
  const OrderStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Status(
          label: 'Dikemas',
          isActive: status.contains('Dikemas'),
          isFirst: true,
        ),
        _Status(
          label: 'Dikirim',
          isActive: status.contains('Dikirim'),
        ),
        _Status(
          label: 'Diterima',
          isActive: status.contains('Diterima'),
          isLast: true,
        ),
        // _Status(
        //   label: 'Sukses',
        //   isActive: status.contains('Sukses'),
        //   isLast: true,
        // ),
      ],
    );
  }
}

class _Status extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isFirst;
  final bool isLast;

  const _Status({
    required this.label,
    required this.isActive,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: isFirst
                  ? Colors.transparent
                  : isActive
                      ? primaryColor
                      : greyColor2,
              height: 2.0,
              width: MediaQuery.of(context).size.width / 11.88,
            ),
            Icon(
              Icons.check_circle,
              color: isActive ? primaryColor : greyColor2,
            ),
            Container(
              color: isLast
                  ? Colors.transparent
                  : isActive
                      ? primaryColor
                      : greyColor2,
              height: 2.0,
              width: MediaQuery.of(context).size.width / 11.88,
            ),
          ],
        ),
        const SpaceHeight(12.0),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: darkColor,
          ),
        ),
      ],
    );
  }
}
