import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit({required this.dio}) : super(GetDataInitial());

  final Dio dio ;

  Future <void> fetchData() async{
    emit(LoadingState());

    try{
      final res = await dio.get("https://dummyjson.com/users");
      if (res.statusCode==200){
        final List userList = res.data['users']??[];
        
        emit(SuccessState(userList));
      }
    }catch(e){
      emit(FailureState(e.toString()));
    }
}
}
