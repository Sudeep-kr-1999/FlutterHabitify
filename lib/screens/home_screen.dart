import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String _todayText = "TODAY";
  static const String _initialTitle = "My Journal";
  final TextEditingController _titleController =
      TextEditingController(text: _initialTitle);
  static const allHabitText = "All Habits";
  static const morningText = "Morning";
  static const newAreaText = "New Area";
  Color? allhabitButtonColor = Colors.blue.shade200;
  Color? morningButtonColor = Colors.white;
  Color? newAreaButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 500,
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    child: Text(
                                      _todayText,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 150,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          controller: _titleController,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        )),
                                    GestureDetector(
                                        onTap: () {},
                                        child: const Icon(Icons.edit)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        TopBarRightIcon(
                          iconType2: Icons.school,
                          iconType1: null,
                          ontapIconFunction: () {},
                        ),
                        TopBarRightIcon(
                          iconType1: Icons.arrow_upward,
                          iconType2: Icons.sort_outlined,
                          ontapIconFunction: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TopBarOptionSection(
                            optionText: allHabitText,
                            buttonColor: allhabitButtonColor!,
                            optionIcon: Icons.ac_unit,
                            ontapFunction: () {},
                          ),
                          TopBarOptionSection(
                            optionText: morningText,
                            optionIcon: Icons.light_mode_rounded,
                            buttonColor: morningButtonColor!,
                            ontapFunction: () {},
                          ),
                          TopBarOptionSection(
                            optionText: newAreaText,
                            optionIcon: Icons.add,
                            buttonColor: newAreaButtonColor!,
                            ontapFunction: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
            const Expanded(
              child: Center(
                child: Text("Save your Task Here"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white, // <-- This works for fixed
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_agenda_sharp,
              color: Colors.grey,
            ),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart_outline_outlined,
              color: Colors.grey,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.details,
              color: Colors.grey,
            ),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_border,
              color: Colors.grey,
            ),
            label: 'Upgrade',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TopBarOptionSection extends StatefulWidget {
  final Color buttonColor;
  final String optionText;
  final IconData optionIcon;
  final void Function() ontapFunction;
  const TopBarOptionSection({
    required this.optionIcon,
    required this.optionText,
    required this.ontapFunction,
    required this.buttonColor,
    Key? key,
  }) : super(key: key);

  @override
  State<TopBarOptionSection> createState() => _TopBarOptionSectionState();
}

class _TopBarOptionSectionState extends State<TopBarOptionSection> {
  // note:-- inside widget.parameter use to access the properties paased above in the constructor
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontapFunction,
      child: SizedBox(
        width: 120,
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: widget.buttonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(widget.optionIcon),
              const SizedBox(
                width: 10,
              ),
              Text(widget.optionText),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBarRightIcon extends StatelessWidget {
  final void Function() ontapIconFunction;
  final IconData? iconType1;
  final IconData iconType2;
  const TopBarRightIcon({
    required this.ontapIconFunction,
    required this.iconType1,
    required this.iconType2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapIconFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: const EdgeInsets.all(4),
          color: const Color(0xFFD6EAF8),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: SizedBox(
            height: 45,
            width: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconType1,
                  color: const Color(0xFF0000FF),
                  size: (iconType1 == null) ? 0 : 15,
                ),
                Icon(
                  iconType2,
                  color: const Color(0xFF0000FF),
                  size: (iconType1 == null) ? 20 : 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
