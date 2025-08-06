import 'dart:math';

class OracleResponses {
  static const List<String> affirmativeResponses = [
    "Sì, senza dubbio.",
    "Assolutamente sì.",
    "Il destino è a tuo favore.",
    "Puoi contarci.",
    "Certamente.",
    "È scritto nelle stelle.",
    "Non c'è alcun dubbio.",
    "Sicuramente accadrà.",
    "Tutto indica di sì.",
    "Il momento è propizio."
  ];

  static const List<String> negativeResponses = [
    "No, scordatelo.",
    "Assolutamente no.",
    "Non ci contare.",
    "Le stelle non sono allineate.",
    "Le probabilità sono scarse.",
    "Decisamente no.",
    "Il destino dice di no.",
    "Non osare sperarci.",
    "Non sembra possibile.",
    "I segni non sono buoni."
  ];

  static const List<String> ambiguousResponses = [
    "Il tempo lo dirà.",
    "Tutto dipende dalle tue azioni.",
    "Forse, ma non come immagini.",
    "Non posso rispondere ora.",
    "Segui il tuo istinto.",
    "Guarda dentro di te per la risposta.",
    "La verità è più complessa di quanto pensi.",
    "Alcuni misteri non devono essere svelati.",
    "Ciò che chiedi ha molte sfaccettature.",
    "La risposta ti verrà in sogno."
  ];

static const List<String> ironicResponses = [
  "Se te lo dicessi, dovrei eliminarti.",
  "La mia sfera di cristallo è in aggiornamento, riprova tra 5 minuti.",
  "Non vengo pagato abbastanza per rispondere a questa domanda.",
  "Anche Nostradamus avrebbe avuto difficoltà con questa.",
  "Se vuoi una risposta, lascia un’offerta nel barattolo.",
  "Ti direi la verità, ma poi dovresti affrontarla.",
  "Ho chiesto agli astri, ma mi hanno visualizzato e non risposto.",
  "Purtroppo, la tua richiesta è stata rifiutata dagli dei dell’oracolo.",
  "La verità è là fuori... ma io non ho tempo di cercarla.",
  "Potrei dirtelo, ma preferisco lasciarti nell'angoscia."
];


  static const List<String> allResponses = [
    ...affirmativeResponses,
    ...negativeResponses,
    ...ambiguousResponses,
    ...ironicResponses,
  ];

  static List getAllResponses() {
    return allResponses;
  }

  static String getRandomResponse() {
    final random = Random();
    int randomIndex = random.nextInt(allResponses.length);
    return allResponses[randomIndex];
  }
  
}
