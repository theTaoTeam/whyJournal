import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/input_tags.dart';
import 'package:flutter_tags/selectable_tags.dart';

import 'package:journal/pages/home/day/day-card/day_card.dart';

class DayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DayPageState();
  }
}

class _DayPageState extends State<DayPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<dynamic> tasks = [];
  double taskListHeight = 0.01;
  bool isAddingTask = false;
  bool needsValue = false;
  Map<String, dynamic> newTask = {
    'title': '',
    'value': '',
    'isComplete': false
  };
  List<Tag> tags = [
    Tag(title: 'Health/Balance'),
    Tag(title: 'Prof. Dev.'),
    Tag(title: 'Mental Health'),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 7, initialIndex: 3);
    if (tasks.length < 1) {
      setState(() {
        isAddingTask = true;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void addToTasksList() {
    if (newTask['value'] == '') {
      setState(() {
        needsValue = true;
      });
      return;
    } else {
      setState(() {
        isAddingTask = false;
        tasks.insert(0, newTask);
        newTask = {'title': '', 'value': '', 'isComplete': false};
        tags = [
          Tag(title: 'Health/Balance'),
          Tag(title: 'Prof. Dev.'),
          Tag(title: 'Mental Health'),
        ];
        if (taskListHeight < 0.3) {
          taskListHeight += 0.1;
        } else {
          taskListHeight = 0.352;
        }
      });
    }
  }

  void removeFromTasksList(int index) {
    setState(() {
      if (tasks[index] != null) {
        tasks.removeAt(index);
      }
      if (taskListHeight > 0.01 && tasks.length < 3) {
        taskListHeight -= 0.1;
      }
      if (tasks.length == 0) {
        isAddingTask = true;
      }
    });
  }

  void updateNewTaskName(String title) {
    setState(() {
      newTask['title'] = title;
    });
  }

  void updateNewTaskValue(String val) {
    print(val);
    setState(() {
      needsValue = false;
      newTask['value'] = val;
    });
  }

  void toggleCompleteTask(String title) {
    print('toggling task completeness');
    setState(() {
      int index = tasks.indexWhere((val) => val['title'] == title);
      tasks[index]['isComplete'] = !tasks[index]['isComplete'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: height * 0.09,
          child: !isAddingTask
              ? FloatingActionButton(
                  child: Icon(
                    Icons.add,
                    color: Colors.pink,
                    size: 32,
                  ),
                  backgroundColor: Colors.white,
                  focusColor: Colors.pink,
                  highlightElevation: 0,
                  onPressed: () {
                    setState(() {
                      isAddingTask = true;
                      taskListHeight += 0.05;
                    });
                  },
                )
              : FloatingActionButton(
                  child: Text(
                    'save',
                    style: TextStyle(color: Colors.pink),
                  ),
                  backgroundColor: Colors.white,
                  focusColor: Colors.pink,
                  highlightElevation: 0,
                  onPressed: () => addToTasksList(),
                ),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: TabBar(
          controller: _tabController,
          indicatorPadding: EdgeInsets.fromLTRB(39, 0, 39, 0),
          indicatorWeight: 3,
          indicatorColor: Colors.pink,
          labelColor: Colors.pink,
          labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1),
          tabs: [
            Text('MON'),
            Text('TUE'),
            Text('WED'),
            Text('THU'),
            Text('FRI'),
            Text('SAT'),
            Text('SUN'),
          ],
        ),
        body: Container(
          height: height * 0.7,
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
              DayCard(
                tasks: tasks,
                tags: tags,
                needsValue: needsValue,
                addToTasksList: addToTasksList,
                removeFromTasksList: removeFromTasksList,
                taskListHeight: taskListHeight,
                isAddingTask: isAddingTask,
                updateNewTaskName: updateNewTaskName,
                updateNewTaskValue: updateNewTaskValue,
                toggleCompleteTask: toggleCompleteTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
