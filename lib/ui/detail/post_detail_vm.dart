//Spring server(MVC) 와 Flutter(Front) server(MVVM)의 차이점

//1. 창고(View)
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailVM extends StateNotifier<PostDetailModel?> {
  PostDetailVM(super.state);
}

//2. 창고 데이터(State)
//통신해서 받아야 할 데이터
class PostDetailModel {}

//3. 창고 관리자 (Provider)
final postListProvider =
    StateNotifierProvider<PostDetailVM, PostDetailModel?>((ref) {
  //? 붙이 이유는 아직 데이터를 넣지않기때문에 나중에 바꿔준다.
  return PostDetailVM(null);
});
