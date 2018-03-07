import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/presentation/platform_adaptive.dart';
import 'package:flutter_redux_boilerplate/presentation/bottom_navigation_label.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/main_tabs.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MainScreen> createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
    int _index;

    @override
    void initState() {
        super.initState();
        _index = 0;
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            
            appBar: new PlatformAdaptiveAppBar(
                title: new Text(mainTabsTitles[MainTabs.values[_index]]),
                platform: Theme.of(context).platform
            ),
            
            bottomNavigationBar: new BottomNavigationBar(
                currentIndex: _index,
                type: BottomNavigationBarType.fixed,
                onTap: (int _index) {
                    setState(() {
                        this._index = _index;
                    });
                },
                items: MainTabs.values.map((MainTabs tab) {
                    return new BottomNavigationBarItem(
                        icon: mainTabsIcons[tab],
                        title: new BottomNavigationLabel(mainTabsTitles[tab], tab.index, _index)
                    );
                }).toList()
            ),
            
            body: new Stack(
                children: MainTabs.values.map((MainTabs tab) {
                    return new Offstage(
                        offstage: _index != tab.index,
                        child: new TickerMode(
                            enabled: _index == tab.index,
                            child: new Material(
                                child: mainTabsWidgets[tab],
                            ),
                        )
                    );
                }).toList()
            )

        );
    }
}