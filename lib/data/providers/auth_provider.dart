import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import '../services/clients/_clients.dart';

part 'auth_provider.g.dart';

@riverpod
class Login extends _$Login with AsyncXNotifierMixin<AuthenticationModel> {
  @override
  Future<AsyncX<AuthenticationModel>> build() => idle();

  @useResult
  RunXCallback<AuthenticationModel> run(String email, String password) => handle(() async {
        final response =
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

        final user = await FirebaseFirestore.instance.collection('users').doc(response.user?.uid).get();
        final model = AuthenticationModel.fromJson(user.data()!);

        await ref.read(authenticationProvider.notifier).update((state) => model);
        return model;
      });
}

@riverpod
class Signup extends _$Signup with AsyncXNotifierMixin<AuthenticationModel> {
  @override
  Future<AsyncX<AuthenticationModel>> build() => idle();

  @useResult
  RunXCallback<AuthenticationModel> run(String fullName, String email, String password) => handle(() async {
        final response =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        final model = AuthenticationModel(
          uid: response.user?.uid ?? '',
          email: email,
          password: password,
          fullName: fullName,
          createdAt: DateTime.now(),
          streak: 0,
          points: 0,
        );
        await FirebaseFirestore.instance.collection('users').doc(response.user?.uid).set(model.toJson());

        await ref.read(authenticationProvider.notifier).update((state) => model);
        return model;
      });
}
