# Derin Öğrenme ile Göğüs Kanseri Tespiti

Bu proje, göğüs ultrason görüntülerini normal, iyi huylu (benign) ve kötü huylu (malignant) olarak sınıflandırmak için derin öğrenme modellerini kullanmayı amaçlamaktadır. Önceden eğitilmiş modeller (GoogleNet, MobileNetV2) ile özel tasarlanmış bir CNN modeli (OurCNN) karşılaştırılmıştır.

## Özellikler
- **BUSI Veri Kümesi** kullanılarak analiz yapılmıştır.
- **Veri artırımı (data augmentation)** ile veri sınıfları dengelenmiştir.
- Üç modelin performansı karşılaştırılmıştır:
  - GoogleNet
  - MobileNetV2
  - Özel CNN (OurCNN)
- GoogleNet ile artırılmış verilerde **%96 doğruluk** elde edilmiştir.

## Modeller ve Yöntemler
- **GoogleNet:** Görüntü sınıflandırmada kullanılan önceden eğitilmiş bir CNN.
- **MobileNetV2:** Hafif ve verimli bir CNN modeli.
- **OurCNN:** 38 katmanlı özel bir ağ mimarisi.
- Performans metrikleri: Doğruluk, Kesinlik, Duyarlılık, F1-Skoru.

## Eğitim Tipine Göre Eğitim Validasyon Sonuçları

| Ağlar         | Augmentsiz Verilerle Eğitilmiş Ağ | Augmentli Verilerle Eğitilmiş Ağ |
|---------------|----------------------------------|----------------------------------|
| MobileNetV2   | %81.20                           | %93.14                           |
| GoogleNet     | %85.47                           | %96.08                           |
| OurCNN        | %81.20                           | %89.36                           |

## Model Performans Karşılaştırması

| Model         | Veri Serisi   | Accuracy | Precision | Sensitivity | F1-Score |
|---------------|---------------|----------|-----------|-------------|----------|
| MobileNetV2   | Augmentsiz    | 0.81     | 0.81      | 0.74        | 0.76     |
| MobileNetV2   | Augmentli     | 0.94     | 0.94      | 0.95        | 0.94     |
| GoogleNet     | Augmentsiz    | 0.85     | 0.83      | 0.81        | 0.81     |
| GoogleNet     | Augmentli     | 0.96     | 0.96      | 0.96        | 0.96     |
| OurCNN        | Augmentsiz    | 0.85     | 0.86      | 0.79        | 0.82     |
| OurCNN        | Augmentli     | 0.90     | 0.90      | 0.91        | 0.90     |

## Emeği Geçenler
- [Semih Güner](https://github.com/SemihGuner "Semih Güner")
- Caner Ekinci
- [Samet Özer](https://github.com/sametozerx "Samet Özer")
- [Merve Ünal](https://github.com/merveunal26 "Merve Ünal")
- Muhammet Recep Özer

## Uygulama Arayüzü

![image](https://github.com/user-attachments/assets/4c1e940d-c700-49c4-aab9-dcdc3a4379ce)


