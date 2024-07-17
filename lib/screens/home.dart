import 'package:flutter/material.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/widgets/tile_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _mousePosition = Offset.zero;
  double _cursorSize = 20;
  double _cursorStrokeWidth = 2;
  Color _cursorColor = Colors.transparent;

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
            backgroundColor: Colors.transparent,
            appBar: _buildAppBar(size),
            body: _buildBody(size),
          ),
          const TilePage(),
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
          icon: Icons.phone,
          size: size.width * 0.015,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: const EdgeInsets.all(8),
                actionsPadding: const EdgeInsets.all(8),
                content: Container(
                  width: size.width * 0.3,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/call_me.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "+91-9570078848",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: size.width * 0.022,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          padding: EdgeInsets.only(left: size.width * 0.03),
        ),
        _buildIconButton(
          icon: Icons.share,
          size: size.width * 0.015,
          onPressed: () async {
            var url = Uri.parse(
                "https://drive.google.com/file/d/1nmC5v_W7zjV6J6_vu7HjeI1hGjYe1DKY/view?usp=drive_link");
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          padding: EdgeInsets.only(
            right: size.width * 0.06,
            left: size.width * 0.06,
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
        hoverColor: Colors.transparent,
        icon: Icon(
          icon,
          size: size,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }

  _sendingMails() async {
    var url = Uri.parse("mailto:udityaraj.18024@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildBody(Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.075),
          IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.0055,
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
                        'DEVELOPER',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: size.width * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.none,
                  onEnter: (_) => setState(() {
                    _cursorSize = 60;
                    _cursorStrokeWidth = 4;
                  }),
                  onExit: (_) => setState(() {
                    _cursorSize = 20;
                    _cursorStrokeWidth = 2;
                  }),
                  child: Text(
                    "UDITYA",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 0.8,
                      fontFamily: 'Roboto',
                      fontSize: size.width * 0.12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                        'INNOVATOR',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: size.width * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.none,
                      onEnter: (_) => setState(() {
                        _cursorColor = Colors.black;
                      }),
                      onExit: (_) => setState(() {
                        _cursorColor = Colors.transparent;
                      }),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          enabledMouseCursor: MouseCursor.defer,
                          fixedSize:
                              Size(size.width * 0.22, size.height * 0.06),
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        onPressed: () async {
                          var url = Uri.parse(
                              "https://github.com/UdityaRaj11?tab=repositories");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
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
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.none,
                      onEnter: (_) => setState(() {
                        _cursorColor = Colors.white;
                      }),
                      onExit: (_) => setState(() {
                        _cursorColor = Colors.transparent;
                      }),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          enabledMouseCursor: MouseCursor.defer,
                          fixedSize:
                              Size(size.width * 0.11, size.height * 0.06),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.black,
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        onPressed: () {
                          _sendingMails();
                        },
                        child: Text(
                          "Contact",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: size.width * 0.0075,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    MouseRegion(
                      cursor: SystemMouseCursors.none,
                      onEnter: (_) => setState(() {
                        _cursorColor = Colors.black;
                      }),
                      onExit: (_) => setState(() {
                        _cursorColor = Colors.transparent;
                      }),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          enabledMouseCursor: MouseCursor.defer,
                          fixedSize:
                              Size(size.width * 0.105, size.height * 0.06),
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AboutMe(),
                            ),
                          );
                        },
                        child: Text(
                          "About Me",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: size.width * 0.0075,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
