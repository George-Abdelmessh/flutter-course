import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/auth/auth_states.dart';
import 'package:note_app/core/storage/cache_manager.dart';
import 'package:note_app/core/storage/db_helper.dart';
import 'package:note_app/core/storage/end_points.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  Future<bool> register({
    required final String name,
    required final String userName,
    required final String password,
  }) async {
    try {
      emit(LoadingState());
      await DBHelper.insert(sql: '''
      INSERT INTO $USERS_TABLE (
        $NAME,
        $USER_NAME,
        $PASSWORD
        ) VALUES ("$name", "$userName", "$password")
      ''');

      emit(SuccessState());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
      return false;
    }
  }

  Future<void> login({required String user, required String password}) async {
    try {
      emit(LoadingState());
      List<Map<String, dynamic>> userData = await DBHelper.select(
        sql: '''
        SELECT * FROM $USERS_TABLE WHERE $USER_NAME = "$user"
      ''',
      );

      await Future.delayed(const Duration(seconds: 2), () {});

      if (userData.isNotEmpty) {
        if (password == userData[0][PASSWORD]) {
          CacheManager.saveData(key: 'id', value: userData[0][ID]);
          CacheManager.saveData(key: 'name', value: userData[0][NAME]);
          emit(SuccessState());
        } else {
          emit(ErrorState());
        }
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }
}
