import 'package:flutter/material.dart';

enum NewActivityActions {
  setText,
  setDate,
  setName,
}

class UpdateNewActivityAction {
  String newText;
  DateTime newDate;
  String newName;
  NewActivityActions actionType;

  UpdateNewActivityAction(this.actionType,
      {this.newText, this.newDate, this.newName});
}

NewActivityData newActivityReducer(NewActivityData newActivity, action) {
  if (action is UpdateNewActivityAction) {
    switch (action.actionType) {
      case NewActivityActions.setText:
        return NewActivityData(
            text: action.newText,
            date: newActivity.date,
            name: newActivity.name);
        break;
      case NewActivityActions.setDate:
        return NewActivityData(
            text: newActivity.text,
            date: action.newDate,
            name: newActivity.name);
        break;
      case NewActivityActions.setName:
        return NewActivityData(
            text: newActivity.text,
            date: newActivity.date,
            name: action.newName);
    }
  } else {
    return newActivity;
  }
}

class NewActivityData {
  final String? text;
  final DateTime? date;
  final String? name;
  NewActivityData({this.text, this.date, this.name});
}
