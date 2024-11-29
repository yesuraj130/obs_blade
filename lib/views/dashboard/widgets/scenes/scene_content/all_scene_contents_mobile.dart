import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:obs_blade/views/dashboard/widgets/scenes/scene_content/scene_items/named_scene_items.dart';

import '../../../../../../stores/views/dashboard.dart';
import 'audio_inputs/audio_inputs.dart';
import 'media_inputs/media_inputs.dart';
import 'scene_items/all_scene_items.dart';
import 'scene_items/current_scene_items.dart';

class AllSceneContentsMobile extends StatefulWidget {
  const AllSceneContentsMobile({
    super.key,
  });

  @override
  _AllSceneContentsMobileState createState() => _AllSceneContentsMobileState();
}

class _AllSceneContentsMobileState extends State<AllSceneContentsMobile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    DashboardStore dashboardStore = GetIt.instance<DashboardStore>();
    double tabHeight = 30.0;
    return Observer(builder: (context) {
      return DefaultTabController(
        length: dashboardStore.sceneItems.length + 3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color:
                  Theme.of(context).cupertinoOverrideTheme!.barBackgroundColor,
              child: TabBar(
                // isWrap: true,
                labelColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                isScrollable: false,
                tabAlignment: TabAlignment.fill,
                labelPadding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                tabs: dashboardStore.sceneItems
                    .map((x) => Tab(height: tabHeight, child: Text(x.sceneName)))
                    .toList()
                    .followedBy([
                  Tab(
                    height: tabHeight,
                    child: const Text('Current'),
                  ),
                  // const Tab(
                  //   child: Text('All Items'),
                  // ),
                  Tab(
                    height: tabHeight,
                    child: const Text('Audio'),
                  ),
                  Tab(
                    height: tabHeight,
                    child: const Text('Media'),
                  ),
                ]).toList(),
                dividerColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 600,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: dashboardStore.sceneItems
                    .map((x) =>
                        NamedSceneItems(sceneName: x.sceneName) as Widget)
                    .toList()
                    .followedBy([
                  const CurrentSceneItems(),
                  // const AllSceneItems(),
                  const AudioInputs(),
                  const MediaInputs(),
                ]).toList(),
              ),
            ),
            // TabBarView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: dashboardStore.sceneItems
            //       .map((x) => NamedSceneItems(sceneName: x.sceneName) as Widget)
            //       .toList()
            //       .followedBy([
            //     const CurrentSceneItems(),
            //     const AllSceneItems(),
            //     const AudioInputs(),
            //     const MediaInputs(),
            //   ]).toList(),
            // ),
          ],
        ),
      );
    });
  }
}
