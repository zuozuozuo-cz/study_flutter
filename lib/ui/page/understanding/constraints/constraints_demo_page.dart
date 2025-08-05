import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstraintsDemoPage extends StatefulWidget {
  const ConstraintsDemoPage({super.key});

  @override
  State<ConstraintsDemoPage> createState() => _ConstraintsDemoPageState();
}

class _ConstraintsDemoPageState extends State<ConstraintsDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('盒子约束条件demo'),
        centerTitle: true,
      ),
      body: ConstrainedBoxWidget(),
      //body: ConstrainedMinBoxWidget(),
      //body: ConstrainedMaxBoxWidget(),
      // body: ConstrainedMixBoxWidget1(),
    );
  }
}


class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        /// 父级约束条件，最小高度为150
        constraints:
        BoxConstraints(minWidth: double.infinity, minHeight: 150.0),
        child: Container(
          height: 5.0,

          /// 子级设置为5.0无效
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('当前的约束信息: $constraints'),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class ConstrainedMinBoxWidget extends StatelessWidget {
  const ConstrainedMinBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 260.0, minWidth: 260.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            // minWidth: 200.0,
            // minHeight: 200.0,
            minWidth: 300.0,
            minHeight: 300.0,
          ),
          child: Container(
            height: 5.0,
            width: 5.0,

            /// 子级设置为5.0无效
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    color: Colors.green,
                    child: Center(
                      child: Text('当前的约束信息: $constraints'),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class ConstrainedMaxBoxWidget extends StatelessWidget {
  const ConstrainedMaxBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 260.0, maxHeight: 260.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            // maxWidth: 300.0,
            // maxHeight: 300.0,
            maxWidth: 300.0,
            maxHeight: 200.0,
          ),
          child: Container(
            height: 350.0,
            width: 350.0,

            /// 子级设置为5.0无效
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('当前的约束信息: $constraints'),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class ConstrainedMixBoxWidget1 extends StatelessWidget {
  const ConstrainedMixBoxWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 260.0,
          minWidth: 100.0,
          maxHeight: 260.0,
          minHeight: 100.0,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: 200.0,
            minHeight: 50,
            maxHeight: 200.0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 120,
              maxWidth: 280,
              minHeight: 120,
              maxHeight: 280.0,
            ),
            child: Container(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      color: Colors.amber,
                      child: Center(
                        child: Text('当前的约束信息: $constraints'),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}