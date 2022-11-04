class Info {
  final int count;
  final String? next;

  Info(this.count, {this.next = ''});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      json["count"],
      next: json["next"],
    );
  }
}