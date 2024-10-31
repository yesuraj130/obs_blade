import 'package:flutter/material.dart';

import 'audio_inputs/audio_inputs.dart';
import 'media_inputs/media_inputs.dart';
import 'scene_items/all_scene_items.dart';
import 'scene_items/current_scene_items.dart';

class SceneContentMobile extends StatelessWidget {
  const SceneContentMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length: 3,
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Theme.of(context).cupertinoOverrideTheme!.barBackgroundColor,
            child: const TabBar(
              tabs: [
                Tab(
                  child: Text('Current'),
                ),
                Tab(
                  child: Text('All Items'),
                ),
                Tab(
                  child: Text('Audio'),
                ),
                Tab(
                  child: Text('Media'),
                ),
              ],
              dividerColor: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 300,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                CurrentSceneItems(),
                AllSceneItems(),
                AudioInputs(),
                MediaInputs(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
