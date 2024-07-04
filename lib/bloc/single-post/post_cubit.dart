import 'package:bloc/bloc.dart';
import 'package:infozzle_task/configs/models/single_post_model.dart';
import 'package:infozzle_task/repository/auth_http_api_repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  AuthHttpApiRepository  authHttpApiRepository = AuthHttpApiRepository();


  void fetchSinglePost(int postid) async {
    emit(PostLoadingState());
    
    await authHttpApiRepository.singlePostsApi(postid).then((post) async {
      SinglePostModel singlePost = post ;
      if(singlePost.authorName == ""){
        emit(PostErrorState(message: "Something went wrong !"));
      }
      else{
        emit(PostLoadedState(post: singlePost));
      }
    }).onError((error, stackTrace){
      // print(error.toString());
      emit(PostErrorState(message: "Something went wrong !"));
    }); 
  }
}
