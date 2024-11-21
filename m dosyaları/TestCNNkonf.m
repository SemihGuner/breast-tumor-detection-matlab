net = ag; 
% auglu/augsuz değişebilir yer
testData = augmentedImageDatastore([224 224 3], augsuzTestData, 'OutputSizeMode', 'resize');

% Ağı kullanarak tahminlerde bulun
[tahmin, eminlik] = classify(net, testData);

% auglu/augsuz değişebilir yer
% Gerçek etiketleri al
gercek_etiketler = augsuzTestData.Labels;


% Sınıf sırasını belirle (cell dizisi türünde)
sinif_sirasi = {'benign', 'malignant', 'normal'};

% Confusion matrix oluştur ve sınıf sırasını belirt
konfuzyon_matrisi = confusionmat(gercek_etiketler, tahmin, 'Order', sinif_sirasi);
disp(konfuzyon_matrisi);



% Görselleştirme
figure;
imagesc(konfuzyon_matrisi);
colorbar;

% Eksen etiketleri ekle
xlabel('Tahmin Edilen Etiketler');
ylabel('Gerçek Etiketler');

% Hücrelerin içine sayıları ekle
for i = 1:size(konfuzyon_matrisi, 1)
    for j = 1:size(konfuzyon_matrisi, 2)
        text(j, i, num2str(konfuzyon_matrisi(i, j)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    end
end

% Sütun etiketleri ekle
xticks(1:size(konfuzyon_matrisi, 2));
xticklabels({'benign', 'malignant', 'normal'});

% Satır etiketleri ekle
yticks(1:size(konfuzyon_matrisi, 1));
yticklabels({'benign', 'malignant', 'normal'});

% Accuracy hesapla
accuracy = sum(diag(konfuzyon_matrisi)) / sum(konfuzyon_matrisi(:));

% Precision hesapla
precision = zeros(3, 1);
for i = 1:3
    precision(i) = konfuzyon_matrisi(i,i) / sum(konfuzyon_matrisi(:,i));
end

% Recall (Sensitivity) hesapla
recall = zeros(3, 1);
for i = 1:3
    recall(i) = konfuzyon_matrisi(i,i) / sum(konfuzyon_matrisi(i,:));
end

% F1 Score hesapla
f1_score = zeros(3, 1);
for i = 1:3
    f1_score(i) = 2 * (precision(i) * recall(i)) / (precision(i) + recall(i));
end

% Ortalama F1 Score hesapla
average_precision = mean(precision);
average_recall = mean(recall);
average_f1_score = mean(f1_score);

% Sonuçları ekrana yazdır
fprintf('Accuracy: %.2f\n', accuracy);
fprintf('Precision: %.2f, %.2f, %.2f\n', average_precision);
fprintf('Sensitivity: %.2f, %.2f, %.2f\n', average_recall);
fprintf('F1 Score: %.2f, %.2f, %.2f\n', average_f1_score);

