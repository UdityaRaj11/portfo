import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/tile.dart';

class TilePage extends StatefulWidget {
  const TilePage({super.key});

  @override
  State<TilePage> createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  final Color color = Colors.white;
  final List<bool> _visibilityStates = List<bool>.filled(65, false);

  @override
  void initState() {
    super.initState();
    _startAnimation().then((_) {
      Future.delayed(const Duration(seconds: 5), () {
        _disappear();
      });
    });
  }

  Future<void> _startAnimation() async {
    final random = Random();
    for (int i = 0; i < 65; i++) {
      Future.delayed(Duration(milliseconds: random.nextInt(4000)), () {
        setState(() {
          _visibilityStates[i] = true;
        });
      });
    }
  }

  void _disappear() {
    for (int i = 0; i < 65; i++) {
      final random = Random();
      Future.delayed(Duration(milliseconds: random.nextInt(3000)), () {
        setState(() {
          _visibilityStates[i] = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: size.width * 0.09),
              _buildAnimatedTile(
                  1, Tile(tl: size.width * 0.03, br: size.width * 0.03)),
              _buildAnimatedTile(
                  2, Tile(tr: size.width * 0.03, bl: size.width * 0.03)),
              SizedBox(width: size.width * 0.43),
              _buildAnimatedTile(8, Tile(bl: size.width * 0.03)),
            ],
          ),
          Row(
            children: [
              SizedBox(width: size.width * 0.01),
              _buildAnimatedTile(
                  11, Tile(tl: size.width * 0.03, br: size.width * 0.03)),
              SizedBox(width: size.width * 0.672),
              _buildAnimatedTile(20, const Tile(icon: Icons.category)),
              _buildAnimatedTile(21, Tile(br: size.width * 0.03)),
            ],
          ),
          Row(
            children: [
              SizedBox(width: size.width * 0.09),
              _buildAnimatedTile(24, Tile(tr: size.width * 0.03)),
              SizedBox(width: size.width * 0.592),
              _buildAnimatedTile(
                  31,
                  Tile(
                    tl: size.width * 0.05,
                    tr: size.width * 0.05,
                    br: size.width * 0.05,
                    bl: size.width * 0.05,
                  )),
            ],
          ),
          Row(
            children: [
              SizedBox(width: size.width * 0.01),
              _buildAnimatedTile(33, Tile(bl: size.width * 0.03)),
              _buildAnimatedTile(
                  34,
                  Tile(
                    tl: size.width * 0.05,
                    tr: size.width * 0.05,
                    br: size.width * 0.05,
                    bl: size.width * 0.05,
                  )),
              SizedBox(width: size.width * 0.672),
              _buildAnimatedTile(
                  43, Tile(tr: size.width * 0.03, bl: size.width * 0.03)),
            ],
          ),
          Row(
            children: [
              SizedBox(width: size.width * 0.09),
              _buildAnimatedTile(45, Tile(br: size.width * 0.03)),
              SizedBox(width: size.width * 0.592),
              _buildAnimatedTile(53, Tile(bl: size.width * 0.03)),
            ],
          ),
          Row(
            children: [
              SizedBox(width: size.width * 0.01),
              _buildAnimatedTile(
                  54,
                  Tile(
                    tl: size.width * 0.05,
                    br: size.width * 0.05,
                    bl: size.width * 0.05,
                    icon: Icons.code,
                  )),
              _buildAnimatedTile(55, Tile(tr: size.width * 0.03)),
              _buildAnimatedTile(
                  56, Tile(tl: size.width * 0.03, br: size.width * 0.03)),
              _buildAnimatedTile(57, const Tile()),
              _buildAnimatedTile(58, Tile(br: size.width * 0.03)),
              _buildAnimatedTile(
                  59, Tile(tr: size.width * 0.03, bl: size.width * 0.03)),
              _buildAnimatedTile(60, Tile(br: size.width * 0.03)),
              _buildAnimatedTile(
                  61, Tile(tl: size.width * 0.03, tr: size.width * 0.03)),
              _buildAnimatedTile(62, Tile(tr: size.width * 0.03)),
              SizedBox(width: size.width * 0.09),
              _buildAnimatedTile(64, Tile(bl: size.width * 0.03)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedTile(int index, Widget tile) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _visibilityStates[index] = true;
          if (index == 64) {
            return;
          }
          if (index - 1 % 11 == 0) {
            _visibilityStates[index + 1] = true;
          }
          if (index > 0) _visibilityStates[index - 1] = true;
          if (index > 12) _visibilityStates[index - 12] = true;
          if (index < 53) _visibilityStates[index + 12] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _visibilityStates[index] = false;
          if (index == 64) {
            return;
          }
          if (index - 1 % 11 == 0) {
            _visibilityStates[index + 1] = false;
          }
          if (index > 0) _visibilityStates[index - 1] = false;
          if (index > 12) _visibilityStates[index - 12] = false;
          if (index < 53) _visibilityStates[index + 12] = false;
        });
      },
      child: AnimatedOpacity(
        curve: Curves.easeInOut,
        opacity: _visibilityStates[index] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: tile,
      ),
    );
  }
}
