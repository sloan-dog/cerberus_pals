import 'package:flutter/material.dart';
import 'package:cerberus_palsy/redux/store.dart';
import 'package:cerberus_palsy/widgets/custom_row_widget/activity_row_widget.dart';

class ActivityFeed extends StatelessWidget {
  final List<ActivityData> activities;
  ActivityFeed({this.activities});

  @override
  Widget build(BuildContext context) {
    final List<ActivityRowWidget> kids = [];
    for (var i = 0; i < this.activities.length; i++) {
      kids.add(new ActivityRowWidget(
        text: this.activities[i].text,
        name: this.activities[i].name,
        date: this.activities[i].date,
      ));
    }
    return Column(children: kids);
  }
}
