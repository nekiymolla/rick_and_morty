import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';

class PersonPlateWidget extends StatelessWidget {
  const PersonPlateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.plateColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        backgroundBlendMode: BlendMode.overlay,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            PlatePersonInfo(),
          ],
        ),
      ),
    );
  }
}

class PersonImage extends StatelessWidget {
  const PersonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class PlatePersonInfo extends StatelessWidget {
  const PlatePersonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        Text(
          'Gender',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
