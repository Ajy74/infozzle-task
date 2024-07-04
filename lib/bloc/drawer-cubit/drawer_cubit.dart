import 'package:bloc/bloc.dart';
import 'package:infozzle_task/configs/models/category_model.dart';
import 'package:infozzle_task/repository/auth_http_api_repository.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  AuthHttpApiRepository authHttpApiRepository = AuthHttpApiRepository();


  void fetchDrawerItems() async {
    // emit(DrawerLoadingState());

    // await authHttpApiRepository.categoryApi().then((items) async {
    //   List<CategoryModel> categoryItem = items ;
    //   if(categoryItem.isEmpty){
    //     emit(DrawerErrorState(message: "Something went wrong !"));
    //   }
    //   else{
    //     emit(DrawerLoadedState(categoryItem));
    //   }
    // }).onError((error, stackTrace){
    //   // print(error.toString());
    //   emit(DrawerErrorState(message: "Something went wrong !"));
    // }); 

    final catList = [
        {
          "id": 199,
          "name": "Citizen Enfants"
        },
        {
          "id": 223,
          "name": "Listen"
        },
        {
          "id": 224,
          "name": "Watch"
        },
        {
          "id": 11,
          "name": "Travel"
        },
        {
          "id": 23,
          "name": "Culture"
        },
        {
          "id": 156,
          "name": "Style"
        },
        {
          "id": 158,
          "name": "Beauty"
        }
    ];

    List<CategoryModel> categoryItem = catList.map((item) => CategoryModel.fromJson(item)).toList();
    emit(DrawerLoadedState(categoryItem));
  }
}
