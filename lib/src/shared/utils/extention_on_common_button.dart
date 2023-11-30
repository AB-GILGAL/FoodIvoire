import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodivoire/src/feature/auth/presentation/widgets/common_button.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';

extension ButtonExtension on CommonButton {
  loading(bool isLoading) {
    return isLoading
        ? SizedBox(
            height: 50,
            // dimension: 20,
            child: SpinKitDancingSquare(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? green : white,
                  ),
                );
              },
            ),
          )
        : this;
  }
}
