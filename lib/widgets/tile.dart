import 'dart:math';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final double tl;
  final double tr;
  final double br;
  final double bl;
  final IconData? icon;

  const Tile({
    Key? key,
    this.tl = 0.0,
    this.tr = 0.0,
    this.br = 0.0,
    this.bl = 0.0,
    this.icon,
  }) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.08,
      width: size.width * 0.08,
      margin: EdgeInsets.only(
        left: size.width * 0.003,
        bottom: size.width * 0.002,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 40,
            offset: const Offset(8, 0),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.tl),
          topRight: Radius.circular(widget.tr),
          bottomRight: Radius.circular(widget.br),
          bottomLeft: Radius.circular(widget.bl),
        ),
      ),
      child: widget.icon != null
          ? Icon(
              widget.icon,
              size: size.width * 0.03,
              color: Colors.black,
            )
          : const SizedBox(),
    );
  }
}
