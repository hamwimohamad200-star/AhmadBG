import 'package:ahmad_bg/cubit/get_data_cubit.dart';
import 'package:ahmad_bg/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.dio});
  final Dio dio ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            onPressed: () {
              context.read<GetDataCubit>().fetchData();
            },
            text: "FetchData"),

        Expanded(
            child: BlocBuilder<GetDataCubit,GetDataState>(builder: (context,state){
          if (state is LoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is SuccessState){
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return Card(
                  child: ListTile(
                    title: Text('${user['firstName']} ${user['lastName']}'),
                    subtitle: Text(user['email']),
                  ),
                ) ;
              } ,

            );
          }
          if (state is FailureState){
            return Center(
              child: Text(
                state.errMessage,
              ),
            );
          }
          return SizedBox.shrink();
        }))
      ],
    );
  }
}
