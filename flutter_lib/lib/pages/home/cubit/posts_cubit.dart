import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../http_helper.dart';
import '../models/posts_response_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required HTTPHelper httpHelper})
      : _httpHelper = httpHelper,
        super(PostsInitial());

  final HTTPHelper _httpHelper;

  Future<void> getPosts() async {
    try {
      emit(PostsLoading());
      final response = await _httpHelper.getPosts();
      print('This is Posts Response $response');
      emit(PostsLoaded(response: response));
    } catch (e) {
      print(e);
      emit(
        PostsError(error: e.toString()),
      );
    }
  }
}
