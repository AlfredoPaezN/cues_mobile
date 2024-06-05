import 'package:firebase_auth/firebase_auth.dart';
import 'package:virtual_cues/modules/data/datasources/remote/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.autenticate());
  AuthFirebase auth = AuthFirebase();

  Future<bool?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(const AuthState.isLoading());
    final user = await auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      emit(AuthState.autenticate(user: user));
      return true;
    }
    emit(const AuthState.isError());
    return null;
  }

  Future<bool?> signInWithGoogle() async {
    emit(const AuthState.isLoading());
    final user = await null;
    if (user != null) {
      emit(const AuthState.autenticate());
      return true;
    }
    emit(const AuthState.isError());
    return null;
  }

  Future<bool?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(const AuthState.isLoading());
    final user = await null;
    if (user != null) {
      emit(const AuthState.autenticate());
      return true;
    }
    emit(const AuthState.isError());
    return null;
  }
}
