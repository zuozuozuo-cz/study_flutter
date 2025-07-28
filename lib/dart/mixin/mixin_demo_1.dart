void main() {
  D(); // 这里会调 A.initInstances()
}

class A {
  void initInstances() {
    print("A");
  }

  A() {
    print('A constructor');
    initInstances(); // 顶层类 处罚mixin链条
  }
}

mixin B on A {
  @override
  void initInstances() {
    super.initInstances();
    print("B");
  }
}

mixin C on A {
  @override
  void initInstances() {
    super.initInstances();
    print("C");
  }
}

class D extends A with B, C {}
