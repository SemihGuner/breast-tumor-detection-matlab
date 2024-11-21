net = trainedNetwork_1  ;
augTestData = augmentedImageDatastore([224 224 3],testData,"OutputSizeMode","resize");
[tahmin,eminlik] = classify(net,augTestData);
accuracy = mean(tahmin == testData.Labels)