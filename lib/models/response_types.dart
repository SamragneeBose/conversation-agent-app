class ResponseTypes{
  final String type;

  ResponseTypes({
   required this.type,
  });

  String getResponseType() {
    String content="";
    switch(type)
    {
      case "Multiple Choice Questions":
        content="Give the answer first, then provide an explanation";
        break;
      case "Graduation or Higher":
        content="Give the answer first, then provide an explanation";
        break;
      case "ISC":
        content="Answer as per CISCE class 12 standards";
        break;
      case "CBSE 12":
        content="Answer as per CBSE class 12 standards";
        break;
      case "ICSE":
        content="Answer as per CISCE class 10 standards";
        break;
      case "CBSE 10":
        content="Answer as per CBSE class 10 standards";
        break;
    }

    return content;
  }
}