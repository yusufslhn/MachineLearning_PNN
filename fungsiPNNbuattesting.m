% Mochamad Yusuf Solihin 1301150020 IF 3906
% Tugas machine learning 1.3

% persamaan untuk mencari probabilitas tiap kelas nya 
function fx = fungsiPNNbuattesting(taw,jmldatatest,datatest1,datatest2,datatest3,datatrain1,datatrain2,datatrain3,jmldataset)
    phi = 3.14;
    m = 3;
    bawahkiri = ((2*phi)^(m/2))*(taw^(m))*jmldataset;
    bawahkanan = 2*(taw^2);
    x = 1;
    
    for i = 1:jmldataset
        exponen(x,:) = exp(-(((datatest1 - datatrain1(i,1))^2)+...
            ((datatest2 - datatrain2(i,2))^2)+...
            ((datatest3 - datatrain3(i,3))^2))^2)/bawahkanan;
        x = x+1;    
    end
    n_exponen = sum(exponen);
    
    fx = (1/bawahkiri)*n_exponen;
end


