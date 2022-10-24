part of 'pages.dart';

class EmailPages extends StatefulWidget {
  const EmailPages({super.key});

  @override
  State<EmailPages> createState() => _EmailPagesState();
}

class _EmailPagesState extends State<EmailPages> {
  @override
  void initState() {
    super.initState();
  }

  final _dataKey = GlobalKey<FormState>();
  final emailChecker = TextEditingController();

  @override
  void dispose() {
    emailChecker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Testing Send Email")),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Form(
          key: _dataKey,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder()),
            controller: emailChecker,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: ((value) {
              return !EmailValidator.validate(value.toString())
                  ? "Email tidacc valid"
                  : null;
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_dataKey.currentState!.validate()) {
            await MailService()
                .sendMail(emailChecker.text.toString())
                .then((value) {
              var result = JsonController.fromJson(jsonDecode(value.body));
              if (result.code == 404) {
                Fluttertoast.showToast(
                    msg: result.message.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 14,
                    backgroundColor: Colors.redAccent.shade400,
                    textColor: Colors.white);
              } else if (result.code == 200) {
                Fluttertoast.showToast(
                    msg: result.message.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 14,
                    backgroundColor: Colors.greenAccent.shade400,
                    textColor: Colors.white);
              } else {
                Fluttertoast.showToast(
                    msg: "Oh no, something is not right",
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 14,
                    backgroundColor: Colors.redAccent.shade400,
                    textColor: Colors.white);
              }
            });
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
