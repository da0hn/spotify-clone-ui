import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

import 'custom_divider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 220.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              _logo(),
            ],
          ),
          _MenuItemSidebar(
            icon: Icons.home,
            label: 'Home',
            onTap: () {},
          ),
          _MenuItemSidebar(
            icon: Icons.search,
            label: 'Search',
            onTap: () {},
          ),
          _MenuItemSidebar(
            icon: Icons.radio,
            label: 'Radio',
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomDivider(),
          const _LibraryPlayLists(),
        ],
      ),
    );
  }

  _logo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/spotify_logo.png',
        height: 50.0,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}

class _MenuItemSidebar extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuItemSidebar({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  const _LibraryPlayLists({Key? key}) : super(key: key);

  @override
  State<_LibraryPlayLists> createState() => _LibraryPlayListsState();
}

class _LibraryPlayListsState extends State<_LibraryPlayLists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 50);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ScrollPhysics(),
          controller: _scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const CustomDivider(),
                ...yourLibrary.map(_toLabel).toList(),
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const CustomDivider(),
                ...playlists.map(_toLabel).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _toLabel(String e) {
    return ListTile(
      dense: true,
      title: Text(
        e,
        style: Theme.of(context).textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}
