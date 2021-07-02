import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  Function action;
  final Color color;
  final Color highlightColor;
  final EdgeInsets padding;
  final bool disabled;

  PrimaryButton(
      {@required this.child,
      this.action,
      this.color,
      this.highlightColor,
      this.padding = const EdgeInsets.symmetric(vertical: 5),
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    action = disabled ? null : action;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        padding: padding,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashColor: Colors.transparent,
        highlightColor: highlightColor,
        onPressed: action != null ? action : () {},
        color: color ?? Theme.of(context).buttonColor,
        child: child,
      ),
    );
  }
}
