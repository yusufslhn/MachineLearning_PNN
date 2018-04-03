% Mochamad Yusuf Solihin 1301150020 IF 3906
% Tugas machine learning 1.3

% -----------------------------------------------------
% % import data_train dan data_test nya dari file excel
% -----------------------------------------------------
class = xlsread('data train.xlsx','Sheet1','D1:D150');
data_train = xlsread('data train.xlsx','Sheet1','A1:D150');
data_test = xlsread('data test.xlsx','Sheet1','A1:C30');

% --------------------------------------------------
% % memisahkan semua atribut menjadi 1 kelas 1 kelas
% --------------------------------------------------
kelas0 = data_train(find(class==0),:);
kelas1 = data_train(find(class==1),:);
kelas2 = data_train(find(class==2),:);

% -------------------------------------------
% % memisahkan setiap atribut menjadi 3 kelas
% -------------------------------------------
ata0 = kelas0(:,1);
atb0 = kelas0(:,2);
atc0 = kelas0(:,3);
ata1 = kelas1(:,1);
atb1 = kelas1(:,2);
atc1 = kelas1(:,3);
ata2 = kelas2(:,1);
atb2 = kelas2(:,2);
atc2 = kelas2(:,3);

% ---------------------------------------------------
% % mencari nilai delta untuk setiap kelas 
% % dengan memanggil fungsi delta pada file yang lain
% ---------------------------------------------------
taw0 = fungsidelta(size(kelas0,1),kelas0);
taw1 = fungsidelta(size(kelas1,1),kelas1);
taw2 = fungsidelta(size(kelas2,1),kelas2);

% ------------------------------------------------------------
% % menghitung probabilitas setiap kelas untuk dijadikan sigma 
% % yang nantinya bakal diambil kesimpulan untuk si data test 
% ------------------------------------------------------------
x = 1;
for i = 1:size(data_test,1)
    tabelhasil(i,1) = fungsiPNN(taw0,size(data_test,1),data_test(i,1),data_test(i,2),data_test(i,3),kelas0,kelas0,kelas0,size(kelas0,1));
    tabelhasil(i,2) = fungsiPNN(taw1,size(data_test,1),data_test(i,1),data_test(i,2),data_test(i,3),kelas1,kelas1,kelas1,size(kelas1,1));
    tabelhasil(i,3) = fungsiPNN(taw2,size(data_test,1),data_test(i,1),data_test(i,2),data_test(i,3),kelas2,kelas2,kelas2,size(kelas2,1));
    x = x+1;
end

% ------------------------------------------------------
% % mencari nilai yang terbesar diantara data yg didapat
% ------------------------------------------------------
y = 1;
for i = 1:size(tabelhasil,1)
    finalkelas(y,:) = max(tabelhasil(i,:));
    y = y+1;
end

% -----------------------------------------------------------
% % memasukan nilai probabilitas terbesar kedalam tabel hasil
% -----------------------------------------------------------
tabelhasil(:,4) = finalkelas(:,:);

% --------------------------------------------
% % mengelompokan data data yang sudah didapat 
% % kedalam kelas kelas yang bersangkutan
% --------------------------------------------
for i = 1:size(tabelhasil,1)
    if tabelhasil(i,4) == tabelhasil(i,1)
        tabelhasil(i,5) = 0;
    elseif tabelhasil(i,4) == tabelhasil(i,2)
        tabelhasil(i,5) = 1;
    elseif tabelhasil(i,4) == tabelhasil(i,3)
        tabelhasil(i,5) = 2;
    end
end

% ----------------------------------------------------------------
% % memasukan kelas-kelas yang telah didapatkan ke tabel data_test 
% ----------------------------------------------------------------
data_test(:,4) = tabelhasil(:,5);
test0 = data_test(find(tabelhasil(:,5)==0),:);
test1 = data_test(find(tabelhasil(:,5)==1),:);
test2 = data_test(find(tabelhasil(:,5)==2),:);

% --------------------------------------------------------
% %menunjukan gambar grafik scatter plot untuk semua kelas
% --------------------------------------------------------
figure; hold on;
scatter3(ata0,atb0,atc0,'r','filled')
scatter3(ata1,atb1,atc1,'b','filled')
scatter3(ata2,atb2,atc2,'g','filled')
scatter3(test0(:,1),test0(:,2),test0(:,3),'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1)
scatter3(test1(:,1),test1(:,2),test1(:,3),'MarkerEdgeColor','k','MarkerFaceColor','b','LineWidth',1)
scatter3(test2(:,1),test2(:,2),test2(:,3),'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',1)
legend('kelas0 Train','kelas1 Train','kelas2 Train','Testing Termasuk kelas0','Testing Termasuk kelas1','Testing Termasuk kelas2')
hold off;


% figure; hold on;
% scatter3(ata0,atb0,atc0,'r','filled')
% scatter3(ata1,atb1,atc1,'b','filled')
% scatter3(ata2,atb2,atc2,'g','filled')
% hold off;