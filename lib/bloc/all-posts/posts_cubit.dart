import 'package:bloc/bloc.dart';
import 'package:infozzle_task/configs/models/all_post_model.dart';
import 'package:infozzle_task/repository/auth_http_api_repository.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  AuthHttpApiRepository  authHttpApiRepository = AuthHttpApiRepository();


  void fetchAllPost(int catid) async {
    emit(PostsLoadingState());

    await authHttpApiRepository.allPostsApi(catid).then((posts) async {
      List<AllPostModel> allPost = posts ;
      if(allPost.isEmpty){
        emit(PostsErrorState(message: "Something went wrong !"));
      }
      else{
        emit(PostsLoadedState(posts: allPost));
      }
    }).onError((error, stackTrace){
      // print(error.toString());
      emit(PostsErrorState(message: "Something went wrong !"));
    }); 
  }
}
