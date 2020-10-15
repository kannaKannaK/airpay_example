import 'package:airpay_package/model/user.dart';
import 'package:airpay_package/screens/inappwebview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSuccess = false;
  bool isVisible = false;
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController  orderId = TextEditingController();
  TextEditingController amount = TextEditingController();

  void _showAddress()
  {
     setState(() {
       isVisible = ! isVisible;
     });
  }
  void _sendDatas(){
    fname.text = "testFname";
    lname.text = "testLname";
    email.text = "akj117@gmail.com";
    phone.text = "9847096517";
    fullAddress.text = "testAddress";
    pincode.text = "600001";
    orderId.text = "MAAPP75421598614777";
    amount.text = "1.00";
    city.text ="testCity";
    state.text = "testState";
    country.text = "testcountry";
   /* User user = User(username :'8419743',password : 'JRLcAz5Y',secret: '74QpNYaT1oyqhxdL',merchantId : '1',fname : fname.text,
      lname :lname.text, email :email.text,phone :phone.text,fulladdress : full_address.text,
      pincode:pincode.text,orderid: order_id.text,amount: amount.text,city : city.text,state :state.text,country :country.text,
      currency: "356",isCurrency: "INR",chMode: "",customVar: "",txnSubtype: "",wallet: "0",successUrl: "http://www.theroadiesstore.in/airpay/transact/response"
        //,failedUrl: "https://cos.stfc.in/COS/COS_UI/COS_PaymentReceive.aspx"
    );*/
    User user = User(username :'3967423',password : 'DtEte24X',secret: '6UnpYTPm2fBweTKH',merchantId : '30057',fname : fname.text,
        lname :lname.text, email :email.text,phone :phone.text,fulladdress : fullAddress.text,
        pincode:pincode.text,orderid: orderId.text,amount: amount.text,city : city.text,state :state.text,country :country.text,
        currency: "356",isCurrency: "INR",chMode: "",customVar: "",txnSubtype: "",wallet: "0",successUrl: "https://retail.airpay.co.in/index.html"
      ,failedUrl: "https://retail.airpay.co.in/index.html"
    );
    Navigator.push(context, MaterialPageRoute(
       builder: (context) => AirPay(user: user,callback: (val) => setState(
         () => isSuccess = val
         ))
      /*  builder: (context) => WebViewPlug()*/
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0,15.0,12.0,15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Personal Information',style: TextStyle(fontSize: 20.0,color: Colors.blue[900],fontWeight: FontWeight.bold),),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(child: Text('First Name *',style: TextStyle(fontSize: 18.0,color: Colors.blue[900]),)),
                            SizedBox(width: 10.0,),
                            Expanded( child : Text('Last Name *',style: TextStyle(fontSize: 18.0,color: Colors.blue[900]),),),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'First Name',
                             //   contentPadding: EdgeInsets.all(2.0),
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                              ),
                              controller: fname,
                            )),
                            SizedBox(width: 10.0,),
                            Expanded( child : TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                               // contentPadding: EdgeInsets.all(2.0),
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                              ),
                              controller: lname,
                            ),),
                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email Id',
                              // contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                            ),
                            controller: email,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              // contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                            ),
                            controller: phone,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                      ],
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Address',style: TextStyle(color: Colors.blue[900],fontSize: 20.0,fontWeight: FontWeight.bold),),
                            IconButton(
                              onPressed: (){
                                _showAddress();
                              },
                              icon: isVisible ?  Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down) ,
                              color: Colors.black,
                            )
                          ],
                        ),
                        Visibility(
                          visible: isVisible,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Full Address',
                                    // contentPadding: EdgeInsets.all(2.0),
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                                  ),
                                  controller: fullAddress,
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'City Name',
                                    // contentPadding: EdgeInsets.all(2.0),
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                                  ),
                                  controller: city,
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Row(
                                children: [
                                  Expanded(child: Text('State Name',style: TextStyle(fontSize: 18.0,color: Colors.blue[900]),)),
                                  SizedBox(width: 8.0,),
                                  Expanded( child : Text('Country Name',style: TextStyle(fontSize: 18.0,color: Colors.blue[900]),),),
                                ],
                              ),

                              Row(
                                children: [
                                  Expanded(child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: 'State',
                                      //   contentPadding: EdgeInsets.all(2.0),
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                                    ),
                                    controller: state,
                                  )),
                                  SizedBox(width: 10.0,),
                                  Expanded( child : TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: 'Country ',
                                      // contentPadding: EdgeInsets.all(2.0),
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                                    ),
                                    controller: country,
                                  ),),
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'PinCode',
                                    // contentPadding: EdgeInsets.all(2.0),
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                                  ),
                                  controller: pincode,
                                ),
                              ),
                              SizedBox(height: 15.0,),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Transaction Information',style: TextStyle(fontSize: 20.0,color: Colors.blue[900],fontWeight: FontWeight.bold),),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(child: Text('Order Id *',style: TextStyle(fontSize: 18.0,color: Colors.blue[900]),)),
                            SizedBox(width: 8.0,),
                            Expanded( child : Text('Amount *',style: TextStyle(fontSize: 18.0,color: Colors.blue[900]),),),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'Order Id',
                                //   contentPadding: EdgeInsets.all(2.0),
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                              ),
                              controller: orderId,
                            )),
                            SizedBox(width: 8.0,),
                            Expanded( child : TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Amount',
                                // contentPadding: EdgeInsets.all(2.0),
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                              ),
                              controller: amount,
                            ),),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    onPressed: (){
                    _sendDatas();
                    },
                    color: Colors.blue[900],
                    child: Text('NEXT',style: TextStyle(color: Colors.white,fontSize: 24.0),),
                  ),
                )
              ],
            ),
          )
            ,
        )
    );
  }
}
