import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: const [
            _TrackInfo(),
            Spacer(),
            _TrackPlayerControls(),
            Spacer(),
            _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4.0),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}

class _TrackPlayerControls extends StatelessWidget {
  const _TrackPlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 34,
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_fill_outlined),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption),
            const SizedBox(height: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          iconSize: 20.0,
          icon: const Icon(Icons.devices_outlined),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.fullscreen),
        ),
      ],
    );
  }
}
