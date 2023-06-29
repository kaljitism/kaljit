import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:provider/provider.dart';
import '../provider/homepageProvider.dart';
import '../utils/colors.dart';
import '../widgets/addtaskbutton.dart';
import '../widgets/appbar.dart';
import '../widgets/navigationdrawer.dart';
import '../widgets/outertasktile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: AddTaskButton(),
        drawer: MyNavigationDrawer(),
        appBar: myAppBar(),
        backgroundColor: backGroundColor,
        body: Column(
          children: [
            Expanded(
              child: Consumer<HomePageProvider>(
                builder: (context, provider, child) {
                  bool isTaskListEmpty = provider.itemCount == 0 ? true : false;

                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: isTaskListEmpty
                        ? Container(color: backGroundColor)
                        : DraggableGridViewBuilder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 5 / 7,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            children:
                                List.generate(provider.itemCount, (index) {
                              return DraggableGridItem(
                                isDraggable: true,
                                child: OuterTaskTile(
                                  serialNumber: index,
                                ),
                              );
                            }),
                            isOnlyLongPress: true,
                            dragCompletion: (List<DraggableGridItem> list,
                                int beforeIndex, int afterIndex) {
                              provider.onDragCompletionSwap(
                                  beforeIndex, afterIndex);

                              print(
                                  'onDragAccept: $beforeIndex -> $afterIndex');
                            },
                            dragFeedback:
                                (List<DraggableGridItem> list, int index) {
                              return Container(
                                child: list[index].child,
                                width: 400,
                                height: 300,
                              );
                            },
                            dragPlaceHolder:
                                (List<DraggableGridItem> list, int index) {
                              return PlaceHolderWidget(
                                child: Container(
                                  color: placeholderWidgetColor,
                                  height: 300,
                                  width: 400,
                                ),
                              );
                            },
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
