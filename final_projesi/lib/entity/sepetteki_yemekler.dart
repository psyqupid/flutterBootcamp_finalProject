class sepetYemekler{
  String yemek_adi;
  String yemek_fiyat;
  String sepet_yemek_id;
  String yemek_resim_adi;
  String yemek_siparis_adet;
  String kullanici_adi;

  sepetYemekler(
      {required this.yemek_adi,
        required this.yemek_fiyat,
        required this.sepet_yemek_id,
        required this.yemek_resim_adi,
        required this.yemek_siparis_adet,
        required this.kullanici_adi});

  factory sepetYemekler.fromJson(Map<String,dynamic> json){
    print("ALL IS GOOD2");

    return sepetYemekler(
        yemek_adi: json["yemek_adi"] as String,
        yemek_fiyat: json["yemek_fiyat"] as String,
        sepet_yemek_id: json["sepet_yemek_id"] as String,
        yemek_resim_adi: json["yemek_resim_adi"] as String,
        yemek_siparis_adet: json["yemek_siparis_adet"] as String,
        kullanici_adi: json["kullanici_adi"] as String
    );
  }
}