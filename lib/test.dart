import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';

final Map<int, Color> colorMapper = {
  0: Colors.white,
  1: Colors.blueGrey[50]!,
  2: Colors.blueGrey[100]!,
  3: Colors.blueGrey[200]!,
  4: Colors.blueGrey[300]!,
  5: Colors.blueGrey[400]!,
  6: Colors.blueGrey[500]!,
  7: Colors.blueGrey[600]!,
  8: Colors.blueGrey[700]!,
  9: Colors.blueGrey[800]!,
  10: Colors.blueGrey[900]!,
};

extension ColorUtil on Color {
  Color byLuminance() =>
      computeLuminance() > 0.4 ? Colors.black87 : Colors.white;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<TreeViewState> _treeKey = GlobalKey<TreeViewState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SizedBox(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                ),
                DraggableScrollableSheet(
                    maxChildSize: 0.5,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        color: Colors.grey.shade300.withOpacity(0.5),
                        child: ListView.builder(
                            itemCount: 30,
                            controller: scrollController,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Item ${index + 1}'),
                              );
                            }),
                      );
                    })
              ],
            ),
          )

          //  TreeView.simple(
          //   key: _treeKey,
          //   tree: sampleTree,
          //   expansionIndicator: ExpansionIndicator.RightUpChevron,
          //   onItemTap: (item) {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text("Item tapped: ${item.key}"),
          //         duration: const Duration(milliseconds: 750),
          //       ),
          //     );
          //   },
          //   builder: (context, level, item) => Card(
          //     color: colorMapper[level.clamp(0, colorMapper.length - 1)]!,
          //     child: ListTile(
          //       title: Text("Item ${item.level}-${item.key}"),
          //       subtitle: Text('Level $level'),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}

final sampleTree = TreeNode.root()
  ..addAll([
    TreeNode(key: "0A")..add(TreeNode(key: "0A1A")),
    TreeNode(key: "0C")
      ..addAll([
        TreeNode(key: "0C1A"),
        TreeNode(key: "0C1B"),
        TreeNode(key: "0C1C")
          ..addAll([
            TreeNode(key: "0C1C2A")
              ..addAll([
                TreeNode(key: "0C1C2A3A"),
                TreeNode(key: "0C1C2A3B"),
                TreeNode(key: "0C1C2A3C"),
              ]),
          ]),
      ]),
    TreeNode(key: "0D"),
    TreeNode(key: "0E"),
  ]);
