clear all;
I=[1    1   5   6   8                % matriks input
   0   0   5   7   1
   4   5   7   1   2
   8   5   1   2   0];
[N,M]=size(I);
G=max(max(I)) - min(min(I)) +1;      % hitung ukuran matriks
CM(1:G,1:G)=0;                       % inisialisasi matriks co-occurrence
sudut=0;                           % masukan nilai sudut 
switch sudut
    case 0                           % arah nol derajat
        dx=1; dy=0;                  % set jarak antar dua pixel
        N0=1; N1=N;                  % tentukan baris awal dan akhir proses
        M0=1; M1=M-1;                % tentukan kolom awal dan akhir proses
    case 45                                        % arah 45 derajat
        dx=1; dy=-1; N0=2; N1=N;  M0=1; M1=M-1;
     case 90                                       % arah 90 derajat
        dx=0; dy=-1;  N0=2; N1=N; M0=1; M1=M;     
     case 135                                      % arah 135 derajat
        dx=-1; dy=-1;  N0=2; N1=N;  M0=2; M1=M;
     case 180                                      % arah 180 derajat
        dx=-1; dy=0;  N0=1; N1=N;  M0=2; M1=M;
    case 225                                       % arah 225 derajat
        dx=-1; dy=+1; N0=1; N1=N-1;  M0=2; M1=M;
    case 270                                       % arah 270 derajat
        dx=0; dy=1; N0=1; N1=N-1;  M0=1; M1=M;
    case 315                                       % arah 315 derajat
        dx=1; dy=1;  N0=1; N1=N-1; M0=1; M1=M-1;
end
                              % hitung matriks CM sesuai arah yang dipilih
for n=N0:N1
  for m=M0:M1
    CM(I(n,m)+1, I(n+dy,m+dx)+1) = CM(I(n,m)+1, I(n+dy,m+dx)+1) +1 ;
  end
end
CM