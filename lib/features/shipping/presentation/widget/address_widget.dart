import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/get_address_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/button.dart';
import '../../../../config/components/space_height.dart';

class AddressTile extends StatelessWidget {
  final bool isSelected;
  final GetAddress data;
  final VoidCallback onTap;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  const AddressTile({
    super.key,
    this.isSelected = false,
    required this.data,
    required this.onTap,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: isSelected ? primaryColor : greyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.attributes.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(16.0),
            Text(
              data.attributes.address,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            const SpaceHeight(16.0),
            Text(
              data.attributes.phone,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Button.filled(
                  onPressed: onEditTap,
                  label: 'Edit',
                  width: 80.0,
                ),
                const SpaceWidth(16.0),
                IconButton(
                  onPressed: onDeleteTap,
                  icon: ImageIcon(
                    const AssetImage('assets/icons/Trash.png'),
                    color: dangerColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
