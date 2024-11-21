% Klasör yolu
OrgfolderPath = '././Dataset_BUSI_with_GT/ETIKETLI/malignant'; 
% Klasördeki tüm dosyaları al
fileList = dir(fullfile(OrgfolderPath, '*.png')); % Uzantıyı uygun şekilde değiştirin

% Veri artırma için ImageDataAugmenter nesnesini oluştur
augmenter = imageDataAugmenter( ...
    'RandRotation', [-10, 10], ...
    'RandXTranslation', [-20, 20], ...
    'RandYTranslation', [-20, 20], ...
    'RandXScale', [0.8, 1.2], ...
    'RandYScale', [0.8, 1.2], ...
    'RandXShear', [-10, 10], ...
    'RandYShear', [-10, 10] ...
);

% Her bir dosya üzerinde döngü
for i = 1:length(fileList)
    % Dosyayı yolu ve adıyla birleştir
    imagePath = fullfile(OrgfolderPath, fileList(i).name);

    % Görüntüyü oku
    originalImage = imread(imagePath);

    % Veri artırma işlemini uygula
    augmentedImage = augment(augmenter, originalImage);

    % Artırılmış görüntüyü kaydet (İhtiyaca göre)
    augmentedImagePath = fullfile(OrgfolderPath, ['1-' fileList(i).name]);
    imwrite(augmentedImage, augmentedImagePath);
end