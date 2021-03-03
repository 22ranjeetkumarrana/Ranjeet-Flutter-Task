import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class User
{
  String _Name;
  String _phone;
  String _productType;
  String _amount;
  String _amountType;
  String _date;

  User(this._Name, this._phone, this._productType,this._amount,this._amountType,this._date);

  User.map(dynamic obj)
  {
    this._Name = obj["name"];
    this._phone = obj["phoneN"];
    this._productType = obj["productTypr"];
    this._amount = obj["amount"];
    this._amountType = obj["amountType"];
    this._date = obj["date"];
  }

  String get name => _Name;
  String get phoneN => _phone;
  String get productTypr => _productType;
  String get amount => _amount;
  String get amountType => _amountType;
  String get date => _date;



  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["name"] = _Name;
    map["phoneN"] =_phone;
    map["productTypr"] = _productType;
    map["amount"] = _amount;
    map["amountType"] = _amountType;
    map["date"] = _date;

    return map;
  }
}