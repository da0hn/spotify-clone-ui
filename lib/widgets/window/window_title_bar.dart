import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../data/palette.dart';

class WindowTitleBar extends StatelessWidget {
  const WindowTitleBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(
                child: Row(
                  children: [
                    Container(color: Colors.blue, width: 220),
                    Expanded(child: Container(color: Palette.topBar.value))
                  ],
                ),
              ),
            ),
            const _WindowButtons(),
          ],
        ),
      ),
    );
  }
}

class _WindowButtons extends StatefulWidget {
  const _WindowButtons({Key? key}) : super(key: key);

  @override
  State<_WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<_WindowButtons> {
  final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFFFFFFFF),
    mouseOver: const Color(0xFF4C4D51),
    mouseDown: const Color(0xFF454546),
    iconMouseOver: const Color(0xFFFFFFFF),
  );

  final closeButtonColors = WindowButtonColors(
    iconNormal: const Color(0xFFFFFFFF),
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconMouseOver: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }

  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }
}
