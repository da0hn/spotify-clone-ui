import 'package:flutter/material.dart';

import '../data/data.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;

  const TrackList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((track) {
        return DataRow(cells: [
          _dataCell(context, track.title),
          _dataCell(context, track.artist),
          _dataCell(context, track.album),
          _dataCell(context, track.duration),
        ]);
      }).toList(),
    );
  }

  DataCell _dataCell(BuildContext context, String label) {
    return DataCell(
      Text(
        label,
        style: TextStyle(color: Theme.of(context).iconTheme.color),
      ),
    );
  }
}
