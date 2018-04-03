% Mochamad Yusuf Solihin 1301150020 IF 3906
% Tugas machine learning 1.3

% persamaan untuk mencari probabilitas PDF
function fx = fungsiPNN(taw,jmldatatest,datatest1,datatest2,datatest3,datatrain1,datatrain2,datatrain3,jmldataset)
    phi = 3.14;
    m = 3; %m adalah dimensi nya 
    bawahkiri = ((2*phi)^(m/2))*(taw^(m))*jmldataset;
    bawahkanan = 2*(taw^2);
    x = 1;
    
    %melakukan perulangan untuk mendapatkan hasil zigma (total dari
    %exponensial nya 
    for i = 1:jmldataset
        exponen(x,:) = exp(-(((datatest1 - datatrain1(i,1))^2)+...
            ((datatest2 - datatrain2(i,2))^2)+...
            ((datatest3 - datatrain3(i,3))^2))^2)/bawahkanan;
        x = x+1;    
    end
    n_exponen = sum(exponen); %hasil penjumlahan exponen 
    fx = n_exponen/bawahkiri; %outputan
end


