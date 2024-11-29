import 'package:flutter/material.dart';
import 'package:obs_blade/views/dashboard/widgets/scenes/profile_scene_collection/profile_scene_collection.dart';
import 'package:obs_blade/views/dashboard/widgets/scenes/scene_content/all_scene_contents_mobile.dart';
import 'package:obs_blade/views/dashboard/widgets/scenes/studio_mode_checkbox.dart';
import 'package:obs_blade/views/dashboard/widgets/scenes/studio_mode_transition_button.dart';
import 'package:obs_blade/views/dashboard/widgets/scenes/transition_controls.dart';
// import 'package:mobx/mobx.dart';
// import 'package:get_it/get_it.dart';
// import 'package:dynamic_tabbar/dynamic_tabbar.dart';

import '../../../../shared/general/responsive_widget_wrapper.dart';
import 'exposed_controls/exposed_controls.dart';
import 'scene_buttons/scene_buttons.dart';
import 'scene_content/scene_content.dart';
import 'scene_content/scene_content_mobile.dart';
import 'scene_preview/scene_preview.dart';
// import '../../../../stores/views/dashboard.dart';

const double kSceneButtonSpace = 9.0;

class Scenes extends StatelessWidget {
  const Scenes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // DashboardStore dashboardStore = GetIt.instance<DashboardStore>();

    return const Column(
      children: [
        ProfileSceneCollection(),
        ExposedControls(),
        SizedBox(height: 6.0),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SizedBox(width: 24.0),
        //   ],
        // ),
        Center(child: SceneButtons()
            // child: Padding(
            //   padding: EdgeInsets.only(
            //     top: 32.0,
            //     left: kSceneButtonSpace,
            //     right: kSceneButtonSpace,
            //   ),
            //   child: SceneButtons(),
            // ),
            ),
        // BaseButton(
        //   onPressed: () => NetworkHelper.makeRequest(
        //       GetIt.instance<NetworkStore>().activeSession.socket,
        //       RequestType.PlayPauseMedia,
        //       {'sourceName': 'was geht ab', 'playPause': false}),
        //   text: 'SOUND',
        // ),
        SizedBox(height: 6.0),
        Row(
          children: [
            SizedBox(width: 24.0),
            StudioModeCheckbox(),
            SizedBox(width: 24.0),
            StudioModeTransitionButton(),
          ],
        ),
        // SizedBox(height: 24.0),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     TransitionControls(),
        //     SizedBox(width: 24.0),
        //   ],
        // ),
        // SizedBox(height: 24.0),
        ScenePreview(),
        // SizedBox(height: 24.0),
        ResponsiveWidgetWrapper(
          mobileWidget: AllSceneContentsMobile(),

          // mobileWidget: DynamicTabBarWidget(
          //     onTabControllerUpdated: (p0) => {},
          //     dynamicTabs: ObservableList.of(dashboardStore.sceneItems
          //         .map((x) => TabData(
          //             index: 0,
          //             title: const Tab(
          //               text: '',
          //             ),
          //             content: const SceneContent()))
          //         .followedBy([
          //       TabData(
          //           index: 1,
          //           title: const Tab(
          //             text: 'Ta',
          //           ),
          //           content: const SceneContent())
          //     ]))),

          tabletWidget: SceneContent(),
        ),
      ],
    );
  }
}
