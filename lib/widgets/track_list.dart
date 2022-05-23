import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../models/current_track.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;

  const TrackList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((track) {
        final selected = context.watch<CurrentTrack>().selected?.id == track.id;

        final color = selected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).iconTheme.color!;

        return DataRow(
          cells: [
            _dataCell(context, track.title, TextStyle(color: color)),
            _dataCell(context, track.artist, TextStyle(color: color)),
            _dataCell(context, track.album, TextStyle(color: color)),
            _dataCell(context, track.duration, TextStyle(color: color)),
          ],
          selected: selected,
          onSelectChanged: (_) {
            context.read<CurrentTrack>().selectTrack(track);
          },
        );
      }).toList(),
    );
  }

  DataCell _dataCell(BuildContext context, String label, TextStyle textStyle) {
    return DataCell(
      Text(
        label,
        style: textStyle,
      ),
    );
  }
}
