import 'package:blog/ui/detail/post_detail_page.dart';
import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //1. 페이지 들어오면서 ViewModel이 만들어져야함 watch로 보기

    PostListModel? model = ref.watch(postListProvider);

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${model.posts[index].id}"),
                title: Text("${model.posts[index].title}"),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailPage(),
                        ));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: model.posts.length),
      );
    }
  }
}
