import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris/resource/colors.dart';

class Button extends StatefulWidget {
  final Widget icon;

  final VoidCallback onTap;

  final Color color;

  final bool enableLongPress;

  const Button({
    Key key,
    @required this.onTap,
    this.icon,
    this.color = AppColors.bigButtonLayerBorder,
    this.enableLongPress = true,
  }) : super(key: key);

  @override
  _ButtonState createState() {
    return new _ButtonState();
  }
}

class _ButtonState extends State<Button> {
  Timer _timer;

  bool _tapEnded = false;

  Color _color;

  @override
  void didUpdateWidget(Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: _color),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.bigButtonLayerTop,
                AppColors.bigButtonLayerBottom
              ],
            ),
          ),
          child: Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.bigButtonLayerTop,
                  AppColors.bigButtonLayerBottom2,
                ],
              ),
            ),
            child: Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.bigButtonLayerBorder, width: 1),
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.bigButtonLayer2Top,
                    AppColors.bigButtonLayerBottom2,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ButtonDirections extends StatefulWidget {
  final Widget icon;

  final VoidCallback onTap;

  final Color color;

  final bool enableLongPress;

  const ButtonDirections({
    Key key,
    @required this.onTap,
    this.icon,
    this.color = AppColors.bigButtonLayerBorder,
    this.enableLongPress = true,
  }) : super(key: key);

  @override
  _ButtonDirectionsState createState() {
    return new _ButtonDirectionsState();
  }
}

class _ButtonDirectionsState extends State<ButtonDirections> {
  Timer _timer;

  bool _tapEnded = false;

  Color _color;

  @override
  void didUpdateWidget(ButtonDirections oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: _color),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.bigButtonLayerTop,
                AppColors.bigButtonLayerBottom
              ],
            ),
          ),
          child: Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.bigButtonLayerTop,
                  AppColors.bigButtonLayerBottom2,
                ],
              ),
            ),
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.bigButtonLayerBorder, width: 1),
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.bigButtonLayer2Top,
                    AppColors.bigButtonLayerBottom2,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
