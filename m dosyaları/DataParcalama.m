seed = 42;
rng(seed);

% Önce genel bir imageDatastore oluşturun
augluData = imageDatastore("C:\Users\semih\OneDrive\Documents\DÜ - Silme\7. Dönem\Derin Öğrenme\1. Ödev\Dosyalar/Dataset_BUSI_with_GT/ETIKETLI/", "IncludeSubfolders", true, "LabelSource", "foldernames");
augsuzData = imageDatastore("C:\Users\semih\OneDrive\Documents\DÜ - Silme\7. Dönem\Derin Öğrenme\1. Ödev\Dosyalar/Dataset_BUSI_with_GT/augmentedsızlar/", "IncludeSubfolders", true, "LabelSource", "foldernames");

% Veriyi karıştırın (shuffle)
shuffledData1 = shuffle(augluData);
shuffledData2 = shuffle(augsuzData);

% Toplam örnek sayısını alın
totalSamples1 = numel(shuffledData1.Files);
totalSamples2 = numel(shuffledData2.Files);

% Veriyi oranlara göre bölelim
trainRatio = 0.7;
valRatio = 0.15;

augluNumTrain = round(totalSamples1 * trainRatio);
augluNumVal = round(totalSamples1 * valRatio);
augsuznumTrain = round(totalSamples2 * trainRatio);
augsuznumVal = round(totalSamples2 * valRatio);

% Eğitim verisi
augluTrainingData = subset(shuffledData1, 1:augluNumTrain);
augsuzTrainingData = subset(shuffledData2, 1:augsuznumTrain);

% Doğrulama verisi
augluValidationData = subset(shuffledData1, augluNumTrain+1:augluNumTrain+augluNumVal);
augsuzValidationData = subset(shuffledData2, augsuznumTrain+1:augsuznumTrain+augsuznumVal);

% Test verisi
augluTestData = subset(shuffledData1, augluNumTrain+augluNumVal+1:totalSamples1); 
augsuzTestData = subset(shuffledData2, augsuznumTrain+augsuznumVal+1:totalSamples2); 

rng(0);