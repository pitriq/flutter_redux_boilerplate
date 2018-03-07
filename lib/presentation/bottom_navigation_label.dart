import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/styles/texts.dart';

class BottomNavigationLabel extends StatelessWidget {
    final String text;
    final int _activeIndex;
    final int _current;

    BottomNavigationLabel(this.text, this._activeIndex, this._current);

    @override
    Widget build(BuildContext context) {
        return new Text(
            text,
            style: _current == _activeIndex ? 
                textStyles['bottom_label_selected'] 
                : textStyles['bottom_label']
        );
    }
}