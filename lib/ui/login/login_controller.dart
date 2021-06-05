import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:workshop_souenergy_flutter/shared/services/rest_exception.dart';
import 'package:workshop_souenergy_flutter/shared/utils/snack_bars.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_binding.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_page.dart';

class LoginController extends GetxController {
  final _snack = SnackBars();
  final _box = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  var loginButton = RoundedLoadingButtonController();
  RxBool isVisiblePassword = false.obs;
  RxBool get isVisible => isVisiblePassword;

  doLogin() async {
    try {
      if (email.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo do E-mail!');
        loginButton.stop();
      } else if (!EmailValidator.validate(email.text)) {
        _snack.errorSnackbar(msg: 'Informe um  E-mail valido!');
        loginButton.stop();
      } else if (password.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo da Senha!');
        loginButton.stop();
      } else if (password.text.length < 6) {
        _snack.errorSnackbar(
            msg: "A senha precisa ter mais do que 6 caracteres!");
        loginButton.stop();
      } else if (email.text != "lopes@teste.com" && password.text != "123456") {
        _snack.errorSnackbar(msg: "A conta informada não está valida!");
        loginButton.stop();
      } else {
        _box.write("token", "abc-fakeToken");
        Get.off(DashPage(), binding: DashBinding());
        loginButton.stop();
        _snack.successSnackbar(msg: "Login realizado com sucesso!");
      }
      loginButton.stop();
    } on RestException catch (e) {
      loginButton.stop();
      _snack.errorSnackbar(msg: e.toString());
    }
  }

  setVisible() => isVisiblePassword.toggle();
}
