% Mochamad Yusuf Solihin 1301150020 IF 3906
% Tugas machine learning 1.3

% fungsi mencari TAW untuk dimasukan ke fungsi PDF
function taw = fungsidelta(jmldata,kelasnya)
    g =1; % parameter untuk memperhalus hasilnya 
    
% melakukan perulangan untuk mencari total jarak antar data dalam satu
% kelas yang sama yang nanti nya dicari jarak terpendeknya
    for i = 1:jmldata
        x = 1;
        for j = 1:jmldata
            if i ~= j
                b(x) = (norm([kelasnya(i,1) kelasnya(i,2) kelasnya(i,3)]-[kelasnya(j,1) kelasnya(j,2) kelasnya(j,3)])^2);
                x = x+1;
            end
        end
        jarak_terkecil(i) = min(b(:,1));
    end
    a = sum(jarak_terkecil);
    z = a/jmldata;
    taw = g*z;
end


% cari norm secara manual
%                 b(x) = ((kelasnya(i,1)-kelasnya(j,1))^2)+...
%                     ((kelasnya(i,2)-kelasnya(j,2))^2)+...
%                     ((kelasnya(i,3)-kelasnya(j,3))^2)^(1/2);