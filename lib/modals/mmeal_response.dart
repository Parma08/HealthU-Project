class APIMealModal {
  final List<Map> meals;

  APIMealModal(this.meals);

  factory APIMealModal.fromJSON(Map<String, dynamic> json) {
    return APIMealModal(json['meals']);
  }
}
