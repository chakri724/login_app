import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

// login Data
class _LoginData
{
  String name="";
  String password="";

}

class _CustomLoginFormState extends State<CustomLoginForm> {

  final _formkey = GlobalKey<FormState>();

  _LoginData _data= new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Center(child: Image.asset("images/face.png",width: 90,height: 90,color: Colors.green,)),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               decoration: InputDecoration(
                 labelText: "Name",
                 border: OutlineInputBorder(
                   gapPadding: 3.3,
                   borderRadius: BorderRadius.circular(3.3)
                 )
               ),
               validator: (value){
                 if(value.isEmpty)
                   {
                     return "Please enter Name";
                   }
                 else
                   {
                  _data.name=value;
                   }
               }
             ),

           ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3)
                  )
              ),
                validator: (value){
                  if(value.isEmpty)
                  {
                    return "Please enter Password";
                  }
                  else
                  {
                    _data.password=value;
                 //   return "All is good";
                  }
                }
            ),

          ),

          Container(
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: RaisedButton(

                    onPressed: (){
if(_formkey.currentState.validate())
  {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("All is good"),));
    setState(() {
      _data.name=_data.name;
    });
  }
                    },
                    child: Text('Submit'),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: RaisedButton(
                    onPressed: (){
                      _formkey.currentState.reset();
                      setState(() {
                        _data.name="";
                      });

                    },
                    child: Text("Clear"),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:_data.name.isEmpty?Text(""): Text("Welcome ${_data.name}", style: TextStyle(
fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),),
            ),
          )
        ],
      ),
    )
    );
  }
}
