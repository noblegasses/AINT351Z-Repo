function [class1 ,class2] = NaiveBayesClassifier(data ,mean1, mean2, var11, var12, var21,var22)
mean1 = mean1';
mean2 = mean2';
PoXGA = ((1/sqrt(2*pi*var11))*exp(-(data(1,:)-mean1(1,:)).^2/(2*var11)));
PoXGA = PoXGA.*((1/sqrt(2*pi*var12))*exp(-(data(2,:)-mean1(2,:)).^2/(2*var12)));
PoXGB = ((1/sqrt(2*pi*var21))*exp(-(data(1,:)-mean2(1,:)).^2/(2*var21)));
PoXGB = PoXGB.*((1/sqrt(2*pi*var22))*exp(-(data(2,:)-mean2(2,:)).^2/(2*var22)));
PA = length(data)/(length(data)+length(data));
PB = length(data)/(length(data)+length(data));
PoAGX = (PoXGA.*PA)./(PoXGA.*PA+PoXGB.*PB);
PoBGX = (PoXGB.*PB)./(PoXGB.*PB+PoXGA.*PA);
c1idx = find(PoAGX>PoBGX);
c2idx = find(PoBGX>PoAGX);
class1 = data(:,c1idx);
class2 = data(:,c2idx);

 end

