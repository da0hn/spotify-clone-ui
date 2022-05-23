import 'package:flutter/material.dart';

import '../data/data.dart';

class CurrentTrack extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
