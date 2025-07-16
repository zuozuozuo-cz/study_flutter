import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:study_flutter/mvvm/viewmodels/member_view_model.dart';

class SnhMemberListPage extends StatelessWidget {
  final memberController = Get.find<MemberViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SNH48 成员列表'),
      ),
      body: Obx(() {
        if (memberController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.separated(
            itemBuilder: (context, index) {
              final m = memberController.members[index];
              return ListTile(
                leading: ClipOval(
                  child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Image.network(
                          'https://www.snh48.com/images/member/zp_${m.sid}.jpg')),
                ),
                title: Text(m.sname ?? ''),
                subtitle: Text('昵称:${m.nickname}' ?? ''),
                trailing: Text('身高: ${m.height}'),
              );
            },
            separatorBuilder: (_, __) {
              return Divider();
            },
            itemCount: memberController.members.length);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: memberController.loadMembers,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
