class Message {
  bool fromMe;
  String body;

  Message(this.body, this.fromMe);
}

List<Message> messages = [
  Message("Ei! Como tá indo? 😀", false),
  Message("Muito obrigado, estou na preparando a muda para amanhã 😍", true),
  Message("Eu também. Você conseguiu falar com o pessoal do bosque?", false),
  Message("Precisa confirmar se estará aberto", false),
  Message("Ou moió o rolê ", false),
  Message("ok, vou dormir", true),
];