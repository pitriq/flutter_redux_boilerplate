import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/screens/main_tabs/news_tab.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/stats_tab.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/discover_tab.dart';

enum MainTabs {
    news,
    statistics,
    discover
}

Map<MainTabs, String> mainTabsTitles = {
    MainTabs.news: 'News',
    MainTabs.statistics: 'Statistics',
    MainTabs.discover: 'Discover',
};

Map<MainTabs, Icon> mainTabsIcons = {
    MainTabs.news: new Icon(Icons.assignment),
    MainTabs.statistics: new Icon(Icons.timeline),
    MainTabs.discover: new Icon(Icons.group_work),
};

Map<MainTabs, Widget> mainTabsWidgets = {
    MainTabs.news: new NewsTab(),
    MainTabs.statistics: new StatsTab(),
    MainTabs.discover: new DiscoverTab(),
};