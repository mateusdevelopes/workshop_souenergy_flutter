import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_assets.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_colors.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_controller.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/app_bar_widget.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/elegant_password_input_field.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/elegant_text_input.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/section_text.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(),
      body: Container(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Image.asset(
                  DesignAssets.LOGO,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SectionTextWidget(
                  text: 'Entrar',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElegantTextInputWidget(
                  text: 'E-mail',
                  textInputType: TextInputType.emailAddress,
                  controller: controller.email,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Obx(
                  () => ElegantPasswordInputWidget(
                    text: 'Senha',
                    controller: controller.password,
                    isObscureText: !controller.isVisiblePassword.value,
                    onTap: () {
                      controller.setVisible();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: RoundedLoadingButton(
                  color: DesignColors.COLOR_BLUE,
                  elevation: 0,
                  controller: controller.loginButton,
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.doLogin();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "Esqueceu sua senha",
                    style: TextStyle(
                      color: DesignColors.COLOR_ORANGE,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
