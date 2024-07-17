import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool _animate = false;
  Offset _mousePosition = Offset.zero;
  double _cursorSize = 20;
  double _cursorStrokeWidth = 2;
  Color _cursorColor = Colors.transparent;
  Color? _textColor = Colors.grey[400];
  double _blurVal = 15;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        setState(() {
          _mousePosition = event.position;
        });
      },
      child: Stack(
        children: [
          _buildCustomCursor(),
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: _buildAppBar(size),
            body: _buildBody(size),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCursor() {
    return Positioned(
      left: _mousePosition.dx - 10,
      top: _mousePosition.dy - 10,
      child: MouseRegion(
        cursor: SystemMouseCursors.none,
        child: Container(
          width: _cursorSize,
          height: _cursorSize,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.black,
                width: _cursorStrokeWidth,
              ),
            ),
            color: _cursorColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: size.height * 0.18,
      leading: _buildIconButton(
        padding: EdgeInsets.only(left: size.width * 0.06),
        icon: Icons.emoji_emotions_rounded,
        size: size.width * 0.04,
        onPressed: () {},
      ),
      actions: [
        _buildIconButton(
          icon: Icons.keyboard_arrow_right,
          size: size.width * 0.04,
          onPressed: () {
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.only(
            right: size.width * 0.03,
            left: size.width * 0.03,
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData? icon,
    required double size,
    required VoidCallback onPressed,
    required EdgeInsetsGeometry padding,
  }) {
    return Padding(
      padding: padding,
      child: IconButton(
        color: Colors.white,
        hoverColor: Colors.transparent,
        icon: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildBody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Image(
            image: const AssetImage(
              'assets/images/uleft.png',
            ),
            height: size.height * 0.37,
          ),
          Positioned(
            top: 0,
            right: -size.width / 3,
            child: MouseRegion(
              cursor: SystemMouseCursors.none,
              onEnter: (_) => setState(() {
                _cursorColor = Colors.white;
              }),
              onExit: (_) => setState(() {
                _cursorColor = Colors.transparent;
              }),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('assets/images/right.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.16,
            left: size.width * 0.04,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                ),
                ImageFiltered(
                  imageFilter:
                      ImageFilter.blur(sigmaX: _blurVal, sigmaY: _blurVal),
                  child: SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.4,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.none,
                      onEnter: (_) => setState(() {
                        _blurVal = 0;
                        _textColor = Colors.black;
                        _cursorSize = 60;
                        _cursorStrokeWidth = 4;
                      }),
                      onExit: (_) => setState(() {
                        _blurVal = 15;
                        _textColor = Colors.grey[400];
                        _cursorSize = 20;
                        _cursorStrokeWidth = 2;
                      }),
                      child: Text(
                        "UDITYA RAJ",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: _textColor,
                          letterSpacing: 12,
                          height: 0.8,
                          fontFamily: 'Roboto',
                          fontSize: size.width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.2,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.46),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: size.width,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.none,
                        onEnter: (_) => setState(() {
                          _cursorSize = 40;
                          _cursorStrokeWidth = 3;
                        }),
                        onExit: (_) => setState(() {
                          _cursorSize = 20;
                          _cursorStrokeWidth = 2;
                        }),
                        child: Text(
                          "About Me",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 0.8,
                            fontFamily: 'Roboto-condensed',
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02, width: size.width),
                      SizedBox(
                        width: size.width * 0.4,
                        child: Text(
                          """I'm a passionate engineer specializing in Dart, Flutter, TensorFlow, Java, Python, React, and more. As a Software Engineer, Cross-Platform Developer and Machine Learning Engineer, I thrive on creating innovative solutions. I'm quick to learn and eager to collaborate, always ready to expand my skills as needed to meet your project's demands.""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Roboto-Light',
                            fontWeight: FontWeight.w300,
                            fontSize: size.width * 0.012,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.12,
                        width: size.width,
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.15,
                            height: size.height * 0.06,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    var url = Uri.parse(
                                        "https://github.com/UdityaRaj11");
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.009,
                                      vertical: size.height * 0.02,
                                    ),
                                  ),
                                  child:
                                      Image.asset("assets/images/github.png"),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    var url = Uri.parse(
                                        "https://www.linkedin.com/in/uditya-raj-b6152b224");
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.009,
                                      vertical: size.height * 0.02,
                                    ),
                                  ),
                                  child:
                                      Image.asset("assets/images/linkedin.png"),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    var url = Uri.parse(
                                        "https://www.instagram.com/uditya_raj_001");
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.009,
                                      vertical: size.height * 0.02,
                                    ),
                                  ),
                                  child: Image.asset("assets/images/insta.png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: size.width * 0.15),
                          MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                _cursorColor = Colors.black;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _cursorColor = Colors.transparent;
                              });
                            },
                            child: OutlinedButton(
                              onPressed: () async {
                                var url = Uri.parse(
                                    "https://github.com/UdityaRaj11?tab=repositories");
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                enabledMouseCursor: SystemMouseCursors.none,
                                fixedSize: Size(
                                    size.width * 0.07, size.height * 0.062),
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              child: Text(
                                "My Work",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: size.width * 0.0075,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.01),
                          ElevatedButton(
                            onPressed: () async {
                              var url =
                                  Uri.parse("mailto:udityaraj.18024@gmail.com");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              enabledMouseCursor: SystemMouseCursors.none,
                              elevation: 10,
                              fixedSize:
                                  Size(size.width * 0.07, size.height * 0.062),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Text(
                              "Hire me",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: size.width * 0.0075,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: size.width / 1.86,
            child: AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              bottom: _animate ? 0 : -size.height,
              left: size.width / 1.86,
              child: MouseRegion(
                cursor: SystemMouseCursors.none,
                onEnter: (_) => setState(() {
                  _blurVal = 0;
                  _textColor = Colors.black;
                  _cursorSize = 60;
                  _cursorStrokeWidth = 4;
                }),
                onExit: (_) => setState(() {
                  _blurVal = 10;
                  _textColor = Colors.grey[400];
                  _cursorSize = 20;
                  _cursorStrokeWidth = 2;
                }),
                child: Container(
                  height: size.height,
                  width: size.width / 1.8,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/images/mePic.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
