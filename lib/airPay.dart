import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

typedef void Closure(bool val, Transaction response);

class Transaction {
  String sTATUS;
  String tXNMODE;
  String tXNDATETIME;
  String tXNCURRENCYCODE;
  String tRANSACTIONID;
  String tRANSACTIONAMT;
  String tRANSACTIONSTATUS;
  String sTATUSMSG;
  String tRANSACTIONVARIANT;
  String mERCHANTTRANSACTIONID;
  String mERCHANTKEY;
  String cUSTOMVAR;
  String aPSECUREHASH;
  String cHMOD;
  String fULLNAME;
  String eMAIL;
  String cONTACTNO;
  String iSRISK;
  String bANKNAME;
  CARDDETAILS cARDDETAILS;
  String eMIDETAILS;
  String mERCHANTNAME;
  String sETTLEMENTDATE;
  String sURCHARGE;
  String bILLEDAMOUNT;
  String rRN;
  String tRANSACTIONREASON;

  Transaction(
      {this.sTATUS,
      this.tXNMODE,
      this.tXNDATETIME,
      this.tXNCURRENCYCODE,
      this.tRANSACTIONID,
      this.tRANSACTIONAMT,
      this.tRANSACTIONSTATUS,
      this.sTATUSMSG,
      this.tRANSACTIONVARIANT,
      this.mERCHANTTRANSACTIONID,
      this.mERCHANTKEY,
      this.cUSTOMVAR,
      this.aPSECUREHASH,
      this.cHMOD,
      this.fULLNAME,
      this.eMAIL,
      this.cONTACTNO,
      this.iSRISK,
      this.bANKNAME,
      this.cARDDETAILS,
      this.eMIDETAILS,
      this.mERCHANTNAME,
      this.sETTLEMENTDATE,
      this.sURCHARGE,
      this.bILLEDAMOUNT,
      this.rRN,
      this.tRANSACTIONREASON});

  Transaction.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    tXNMODE = json['TXN_MODE'];
    tXNDATETIME = json['TXN_DATE_TIME'];
    tXNCURRENCYCODE = json['TXN_CURRENCY_CODE'];
    tRANSACTIONID = json['TRANSACTIONID'];
    tRANSACTIONAMT = json['TRANSACTIONAMT'];
    tRANSACTIONSTATUS = json['TRANSACTIONSTATUS'];
    sTATUSMSG = json['STATUSMSG'];
    if (json['TRANSACTIONVARIANT'] != null) {
      tRANSACTIONVARIANT = json['TRANSACTIONVARIANT'];
    }
    mERCHANTTRANSACTIONID = json['MERCHANTTRANSACTIONID'];
    mERCHANTKEY = json['MERCHANTKEY'];
    if (json['CUSTOMVAR'] != null) {
      cUSTOMVAR = json['CUSTOMVAR'];
    }
    aPSECUREHASH = json['AP_SECUREHASH'];
    cHMOD = json['CHMOD'];
    fULLNAME = json['FULLNAME'];
    eMAIL = json['EMAIL'];
    cONTACTNO = json['CONTACTNO'];
    iSRISK = json['ISRISK'];
    bANKNAME = json['BANKNAME'];
    cARDDETAILS = json['CARD_DETAILS'] != null
        ? new CARDDETAILS.fromJson(json['CARD_DETAILS'])
        : null;
    if (json['EMI_DETAILS'] != null && json['EMI_DETAILS'] is String) {
      eMIDETAILS = json['EMI_DETAILS'];
    }
    mERCHANTNAME = json['MERCHANT_NAME'];
    if (json['SETTLEMENT_DATE'] != null) {
      sETTLEMENTDATE = json['SETTLEMENT_DATE'];
    }
    sURCHARGE = json['SURCHARGE'];
    bILLEDAMOUNT = json['BILLEDAMOUNT'];
    rRN = json['RRN'];
    tRANSACTIONREASON = json['TRANSACTIONREASON'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUS'] = this.sTATUS;
    data['TXN_MODE'] = this.tXNMODE;
    data['TXN_DATE_TIME'] = this.tXNDATETIME;
    data['TXN_CURRENCY_CODE'] = this.tXNCURRENCYCODE;
    data['TRANSACTIONID'] = this.tRANSACTIONID;
    data['TRANSACTIONAMT'] = this.tRANSACTIONAMT;
    data['TRANSACTIONSTATUS'] = this.tRANSACTIONSTATUS;
    data['STATUSMSG'] = this.sTATUSMSG;
    if (this.tRANSACTIONVARIANT != null) {
      data['TRANSACTIONVARIANT'] = this.tRANSACTIONVARIANT;
    }
    data['MERCHANTTRANSACTIONID'] = this.mERCHANTTRANSACTIONID;
    data['MERCHANTKEY'] = this.mERCHANTKEY;
    if (this.cUSTOMVAR != null) {
      data['CUSTOMVAR'] = this.cUSTOMVAR;
    }
    data['AP_SECUREHASH'] = this.aPSECUREHASH;
    data['CHMOD'] = this.cHMOD;
    data['FULLNAME'] = this.fULLNAME;
    data['EMAIL'] = this.eMAIL;
    data['CONTACTNO'] = this.cONTACTNO;
    data['ISRISK'] = this.iSRISK;
    data['BANKNAME'] = this.bANKNAME;
    if (this.cARDDETAILS != null) {
      data['CARD_DETAILS'] = this.cARDDETAILS.toJson();
    }
    if (this.eMIDETAILS != null) {
      data['EMI_DETAILS'] = this.eMIDETAILS;
    }
    data['MERCHANT_NAME'] = this.mERCHANTNAME;
    if (this.sETTLEMENTDATE != null) {
      data['SETTLEMENT_DATE'] = this.sETTLEMENTDATE;
    }
    data['SURCHARGE'] = this.sURCHARGE;
    data['BILLEDAMOUNT'] = this.bILLEDAMOUNT;
    data['RRN'] = this.rRN;
    data['TRANSACTIONREASON'] = this.tRANSACTIONREASON;
    return data;
  }
}

class CARDDETAILS {
  String pRIACCNOSTART;
  String pRIACCNOEND;
  String cARDISSUER;
  String cARDTYPE;
  String cARDCOUNTRY;

  CARDDETAILS(
      {this.pRIACCNOSTART,
      this.pRIACCNOEND,
      this.cARDISSUER,
      this.cARDTYPE,
      this.cARDCOUNTRY});

  CARDDETAILS.fromJson(Map<String, dynamic> json) {
    pRIACCNOSTART = json['PRI_ACC_NO_START'];
    pRIACCNOEND = json['PRI_ACC_NO_END'];
    cARDISSUER = json['CARDISSUER'];
    cARDTYPE = json['CARDTYPE'];
    cARDCOUNTRY = json['CARDCOUNTRY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PRI_ACC_NO_START'] = this.pRIACCNOSTART;
    data['PRI_ACC_NO_END'] = this.pRIACCNOEND;
    data['CARDISSUER'] = this.cARDISSUER;
    data['CARDTYPE'] = this.cARDTYPE;
    data['CARDCOUNTRY'] = this.cARDCOUNTRY;
    return data;
  }
}

class UserRequest {
  bool isStaging;
  String fname;
  String lname;
  String phone;
  String email;
  String fulladdress;
  String city;
  String state;
  String country;
  String pincode;
  String orderid;
  String amount;
  String username;
  String password;
  String secret;
  String merchantId;
  String protoDomain;
  String currency;
  String isCurrency;
  String chMode;
  String customVar;
  String txnSubtype;
  String wallet;
  String successUrl;
  String failedUrl;
  UserRequest(
      {this.username,
      this.isStaging,
      this.password,
      this.secret,
      this.merchantId,
      this.protoDomain,
      this.fname,
      this.lname,
      this.email,
      this.phone,
      this.fulladdress,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.amount,
      this.orderid,
      this.currency,
      this.isCurrency,
      this.chMode,
      this.customVar,
      this.txnSubtype,
      this.wallet,
      this.successUrl,
      this.failedUrl});
}

class AirPay extends StatefulWidget {
  final UserRequest user;
  final Closure closure;

  AirPay({Key key, @required this.user, this.closure}) : super(key: key);
  @override
  _AirPayState createState() => new _AirPayState();
}

class _AirPayState extends State<AirPay> {
  // var URL = 'https://google.com.tr';
  String url = "";
  var postdata = "";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  num _stackToView = 1;
  var payURL = '';
  bool isFirst = true;
  bool isProceed = false;

  void _handleLoad(int index) {
    setState(() {
      _stackToView = index;
    });
  }

  String loadData() {
    var date = new DateTime.now();
    var format = DateFormat("yyyy-MM-dd");
    var formattedDate = format.format(date);
    var temp = utf8.encode(
        '${widget.user.secret}@${widget.user.username}:|:${widget.user.password}');
    var privatekey = sha256.convert(temp);
    var setAllData = utf8.encode(
        '${widget.user.email}${widget.user.fname}${widget.user.lname}${widget.user.fulladdress}${widget.user.city}${widget.user.state}${widget.user.country}${widget.user.amount}${widget.user.orderid}$formattedDate$privatekey');
    var checksum = md5.convert(setAllData);
    var protocolDomain = getProtoDomain(widget.user.protoDomain);
    List<int> bytes = ascii.encode(protocolDomain);
    var encoded = base64.encode(bytes);
    var user = widget.user;
    String productionURL = "https://payments.airpay.co.in/pay/index.php";
    String productionFailedURL = "https://payments.airpay.co.in/error.php";
    // String productionVPAURL = "https://payments.airpay.co.in/upi/v.php";
    String stagingURL = "https://payments.airpay.ninja/pay/index.php";
    String stagingFailedURL = "https://payments.airpay.ninja/error.php";
    // String stagingVPAURL = "https://payments.airpay.ninja/upi/v.php";

    var isGateWay = (user.isStaging != null && user.isStaging == true)
        ? stagingURL
        : productionURL;
    user.failedUrl = (user.isStaging != null && user.isStaging == true)
        ? stagingFailedURL
        : productionFailedURL;

    var url = "<!DOCTYPE html>" +
        "<html>" +
        "<body onload='document.frm1.submit()'>" +
        "<form action='$isGateWay' method='post' name='frm1'>" +
        "  <input type='hidden' name='mer_dom' value='$encoded'><br>" +
        "  <input type='hidden' name='currency' value='${user.currency}'><br>" +
        "  <input type='hidden' name='isocurrency' value='${user.isCurrency}'><br>" +
        "  <input type='hidden' name='orderid' value='${user.orderid}'><br>" +
        "  <input type='hidden' name='privatekey' value='$privatekey'><br>" +
        "  <input type='hidden' name='checksum' value='$checksum'><br>" +
        "  <input type='hidden' name='mercid' value='${user.merchantId}'><br>" +
        "  <input type='hidden' name='buyerEmail' value='${user.email}'><br>" +
        "  <input type='hidden' name='buyerPhone' value='${user.phone}'><br>" +
        "  <input type='hidden' name='buyerFirstName' value='${user.fname}'><br>" +
        "  <input type='hidden' name='buyerLastName' value='${user.lname}'><br>" +
        "  <input type='hidden' name='buyerAddress' value='${user.fulladdress}'><br>" +
        "  <input type='hidden' name='buyerCity' value='${user.city}'><br>" +
        "  <input type='hidden' name='buyerState' value='${user.state}'><br>" +
        "  <input type='hidden' name='buyerCountry' value='${user.country}'><br>" +
        "  <input type='hidden' name='buyerPinCode' value='${user.pincode}'><br>" +
        "  <input type='hidden' name='amount' value='${user.amount}'><br>" +
        "  <input type='hidden' name='chmod' value='${user.chMode}'><br>" +
        "  <input type='hidden' name='customvar' value='${user.customVar}'><br>" +
        "  <input type='hidden' name='txnsubtype' value='${user.txnSubtype}'><br>" +
        "  <input type='hidden' name='token' value=''><br>" +
        "  <input type='hidden' name='txnsubtype' value='${user.txnSubtype}'><br>" +
        "</form>" +
        "</body>" +
        "</html>";
    return url;
  }

  @override
  void initState() {
    super.initState();
    String errMsg = '';
    if (widget.user.protoDomain.isNotEmpty) {
      errMsg = 'Kindly enter your AirPay protoDomain to proceed';
    }
    else if (widget.user.merchantId.isNotEmpty) {
      errMsg = 'Kindly enter your AirPay MerchantID to proceed';
    }
    else if (widget.user.secret.isNotEmpty) {
      errMsg = 'Kindly enter your AirPay secretID to proceed';
    }
    else if (widget.user.successUrl.isNotEmpty) {
      errMsg = 'Kindly enter your AirPay SuccessURL to proceed';
    }
    else if (widget.user.failedUrl.isNotEmpty) {
      errMsg = 'Kindly enter your AirPay failedUrl to proceed';
    }
    if (errMsg.isNotEmpty) {
    _showAlert(context, errMsg + '\n to proceed with the demo app you must enter the required details to proceed.');
    }
    isProceed = true;
    _handleLoad(1);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    this.payURL = Uri.dataFromString(loadData(),
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
  }

  String getProtoDomain(String sDomain) {
    if (sDomain.isNotEmpty == true) {
    int slashslash = sDomain.indexOf("//") + 2;
    return sDomain.substring(0, sDomain.indexOf("/", slashslash));
    }
    return '';
  }

  fetchDetails() async {
    var user = widget.user;

    String stagingDataURL = "https://payments.airpay.ninja/sdk/a.php";
    String productionDataURL = "https://payments.airpay.co.in/sdk/a.php";
    var isGateWay = (user.isStaging != null && user.isStaging == true)
        ? stagingDataURL
        : productionDataURL;

    String urlString = isGateWay;
    var date = new DateTime.now();
    var format = DateFormat("dd/MM/yyyy HH:mm:ss");
    var formattedDate = format.format(date);
    format = DateFormat("yyyy HH:mm:ss");
    var formattedDate2 = format.format(date);

    var temp = utf8.encode(
        '${widget.user.secret}@${widget.user.username}:|:${widget.user.password}');
    var privatekey = sha256.convert(temp);

    var setAllData = utf8.encode(
        '$privatekey${widget.user.orderid}${widget.user.merchantId}$formattedDate2');
    var checksum = md5.convert(setAllData);

    FormData formData = new FormData.fromMap({
      'privatekey': privatekey,
      'orderid': widget.user.orderid,
      'mercid': widget.user.merchantId,
      'checksum': checksum,
      'datetime': formattedDate,
    });
    Dio dio = new Dio();
    dio.options.headers['Accept'] =
        'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';

    var response = await dio.post(urlString, data: formData);
    print(response);
    final myTransformer = Xml2Json();
    var stingDAta = response.data.toString();
    stingDAta = stingDAta.replaceAll("<![CDATA[", "").replaceAll("]]>", "");
    myTransformer.parse(stingDAta);
    var document = myTransformer.toParker();
    var data = json.decode(document);
    Transaction transaction = Transaction();
    transaction.sTATUS = '500';
    if (data != null && data['RESPONSE'] != null) {
      if (data['RESPONSE']['TRANSACTION'] != null) {
        transaction = Transaction.fromJson(data['RESPONSE']['TRANSACTION']);
      }
    }
    // print("Transaction $data");
    if (transaction.sTATUS != null) {
      if (transaction.sTATUS == '200') {
        widget.closure(true, transaction);
      } else {
        widget.closure(false, transaction);
      }
    }
  }

  userCancel(String withMessage) {
    var trans = Transaction();
    trans.sTATUS = '500';
    trans.tRANSACTIONREASON = withMessage;
    widget.closure(false, trans);
  }

_showAlert(context, message) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "Airpay";
        String message1 = message;
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message1),
                actions: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue[900],
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  )
                ],
              )
            : new AlertDialog(
                title: Text(title),
                content: Container(
                    height: 140.0,
                    width: 400.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return new Column(children: <Widget>[
                            Text(message1),
                          ]);
                        })),
                actions: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(2.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue[900],
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
  _showConfirmation(context, message) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "Airpay";
        String message1 = message;
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message1),
                actions: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pop(context);
                        userCancel('User canceled');
                      },
                      color: Colors.blue[900],
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue[900],
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  )
                ],
              )
            : new AlertDialog(
                title: Text(title),
                content: Text(message1),
                actions: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(2.0),
                      onPressed: () {
                        Navigator.pop(context);
                        userCancel('User canceled');
                      },
                      color: Colors.blue[900],
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(2.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue[900],
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }

  // InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                'assets/airpays.png',
                height: 40,
                color: Colors.white,
                width: 200,
              ),
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => {
                  _showConfirmation(
                      context, "Did you want to cancel this transaction ?")
                },
              ),
              backgroundColor: Colors.blue[900],
              actions: <Widget>[],
            ),
            body: (isProceed ? IndexedStack(index: _stackToView, children: [
              Column(children: <Widget>[
                Expanded(
                  child: WebView(
                    initialUrl: this.payURL,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onPageStarted: (String url) {
                      _handleLoad(1);

                      setState(() {
                        print("onLoadStart : $url");
                        var succesPath = getProtoDomain(widget.user.successUrl);
                        var webURLPath = getProtoDomain(url);
                        if (succesPath.contains("http://") &&
                            webURLPath.contains("https://")) {
                          webURLPath =
                              webURLPath.replaceAll("https://", "http://");
                        } else if (succesPath.contains("https://") &&
                            webURLPath.contains("http://")) {
                          webURLPath =
                              webURLPath.replaceAll("http://", "https://");
                        }

                        if (succesPath == webURLPath) {
                          // isShow = false;
                          _handleLoad(1);
                          fetchDetails();
                          // print("onLoadStart : Success");
                        } else if (widget.user.failedUrl == webURLPath) {
                          userCancel('Transaction failed');
                          // print("onLoadStart : Failed");
                        }
                      });
                    },
                    onPageFinished: (controller) async {
                      if (Platform.isAndroid && this.isFirst == true) {
                        this.isFirst = false;
                        Future.delayed(const Duration(seconds: 6), () {
                          _handleLoad(0);
                        });
                      } else {
                        _handleLoad(0);
                      }
                      var cntrl = (await _controller.future);

                      final String url1 = await cntrl.currentUrl();
                      setState(() {
                        this.url = url1;
                        var failurePath = widget.user
                            .failedUrl; //getProtoDomain(widget.user.failedUrl);

                        if (this.url.startsWith(failurePath)) {
                          setState(() {
                            userCancel('Transaction failed');
                            // print('onLoad Stop in - $url');
                          });
                        } else {
                          // print('on Load Stop: not error URL: $url');
                        }
                      });
                    },
                    navigationDelegate: (NavigationRequest request) {
                      // if (request.url.startsWith('https://www.test.com/')) {
                      //   print('blocking navigation to $request}');
                      //   return NavigationDecision.prevent;
                      // }
                      // print('allowing navigation to $request');
                      return NavigationDecision.navigate;
                    },
                  ),
                ),
              ]),
              Container(
                  child: Center(
                      child: SpinKitCircle(
                color: Colors.blue[900],
                size: 50.0,
              )))
            ]) :  Container(
                  child: Center(
                      child: SpinKitCircle(
                color: Colors.blue[900],
                size: 50.0,
              ))))
            )
            );
  }
}
