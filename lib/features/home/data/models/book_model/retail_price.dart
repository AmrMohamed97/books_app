class RetailPrice {
  num? amount;
  String? currencyCode;

  RetailPrice({this.amount, this.currencyCode});

  @override
  String toString() {
    return 'RetailPrice(amount: $amount, currencyCode: $currencyCode)';
  }

  factory RetailPrice.fromJson(Map<String, dynamic> json) => RetailPrice(
        amount: (json['amount'] as num?) as num,
        currencyCode: json['currencyCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };
}
