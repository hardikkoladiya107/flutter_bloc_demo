import 'package:flutter/cupertino.dart';

extension extOnWidget on Widget {
  Widget padding({
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: all ?? left ?? 0,
        right: all ?? right ?? 0,
        top: all ?? top ?? 0,
        bottom: all ?? bottom ?? 0,
      ),
      child: this,
    );
  }

  Widget onClick(GestureTapCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: this,
    );
  }

  Widget get safeArea{
    return SafeArea(child: this);
  }

  Widget get center{
    return Center(child: this,);
  }
}
