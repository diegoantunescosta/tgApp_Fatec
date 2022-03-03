class Validate {
  String phone(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if (value.length != 10) {
      return "O celular deve ter 10 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    } else if (value == null || value.isEmpty) {
      return 'Por favor preencha o Campo';
    }
    return null;
  }

  String password(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor preencha o Campo';
    }
    if (value == '123456') {
      return 'Senha 123456 ? Escolha uma senha mais segura !';
    }
    return null;
  }

  String email(String value) {
    String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    }
    return null;
  }

  name() {}
}
