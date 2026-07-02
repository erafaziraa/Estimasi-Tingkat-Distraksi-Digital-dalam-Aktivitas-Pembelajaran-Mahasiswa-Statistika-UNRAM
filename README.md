# Estimasi Tingkat Distraksi Digital dalam Aktivitas Pembelajaran Mahasiswa Program Studi Statistika Universitas Mataram Menggunakan Two-Stage Cluster Sampling

## 📂 Struktur Repository

```text
📦 Estimasi-Tingkat-Distraksi-Digital-dengan-Two-Stage-Cluster-Sampling
│
├── 📄 README.md
│   └── Dokumentasi lengkap penelitian
│
├── 📄 Executive Summary.pdf
│   └── Ringkasan hasil penelitian
│
├── 📊 Data Kuesioner.xlsx
│   └── Data hasil kuesioner penelitian
│
├── 💻 Sintaks R.R
│   └── Script analisis Two-Stage Cluster Sampling menggunakan R
│
├── 📈 Histogram Skor Total.png
│   └── Visualisasi distribusi skor total
│
└── 📈 Boxplot Outlier.png
    └── Visualisasi deteksi outlier
```
## 📑 Daftar Isi

- [Latar Belakang](#latar-belakang)
- [Tujuan Penelitian](#tujuan-penelitian)
- [Metode Penelitian](#metode-penelitian)
  - [Teknik Pengambilan Sampel](#teknik-pengambilan-sampel)
  - [Tahap Analisis Data](#tahap-analisis-data)
- [Hasil dan Pembahasan](#hasil-dan-pembahasan)
  - [Uji Validitas dan Reliabilitas Instrumen Penelitian](#2-uji-validitas-dan-reliabilitas-instrumen-penelitian)
  - [Penerapan Two-Stage Cluster Sampling](#hasil-penerapan-two-stage-cluster-sampling)
  - [Estimasi Rata-rata](#estimasi-rata-rata)
  - [Evaluasi Estimasi](#hasil-evaluasi-estimasi)
  - [Interpretasi Tingkat Distraksi Digital](#interpretasi-tingkat-distraksi-digital)
- [Kesimpulan](#kesimpulan)
- [Rekomendasi](#rekomendasi)
## Latar Belakang

Perkembangan teknologi digital telah memberikan kemudahan bagi mahasiswa dalam mengakses informasi dan mendukung proses pembelajaran. Namun, penggunaan perangkat digital yang tidak terkontrol juga dapat menimbulkan distraksi digital, yaitu gangguan perhatian akibat aktivitas seperti penggunaan media sosial, aplikasi pesan instan, maupun hiburan digital selama kegiatan belajar. Distraksi digital berpotensi menurunkan konsentrasi, efektivitas belajar, serta hasil akademik mahasiswa.

Mahasiswa Program Studi Statistika Universitas Mataram sebagai pengguna aktif teknologi digital juga tidak terlepas dari potensi terjadinya distraksi digital. Oleh karena itu, diperlukan informasi mengenai tingkat distraksi digital yang dialami mahasiswa sebagai dasar untuk memahami kondisi yang ada dan mendukung penyusunan strategi pembelajaran yang lebih efektif.

Penelitian ini bertujuan untuk mengestimasi tingkat distraksi digital dalam aktivitas pembelajaran mahasiswa Program Studi Statistika Universitas Mataram menggunakan metode *Two-Stage Cluster Sampling*. Metode tersebut dipilih karena populasi mahasiswa secara alami terbagi dalam kelompok-kelompok, seperti angkatan atau kelas, sehingga proses pengambilan sampel menjadi lebih efisien tanpa mengurangi kualitas estimasi yang dihasilkan.

## Tujuan Penelitian

Tujuan penelitian ini adalah sebagai berikut:

1. Menggambarkan kondisi tingkat distraksi digital yang dialami mahasiswa Program Studi Statistika Universitas Mataram dalam kegiatan pembelajaran.
2. Melakukan pengujian validitas dan reliabilitas instrumen yang digunakan untuk mengukur distraksi digital.
3. Mengimplementasikan desain two-stage cluster sampling sebagai teknik pengambilan sampel penelitian.
4. Menentukan bobot sampel berdasarkan peluang pemilihan pada setiap tahap dalam proses sampling.
5. Mengestimasi rerata tingkat distraksi digital mahasiswa menggunakan pendekatan analisis survei berbobot (survey-weighted estimation).
6. Menilai ketelitian hasil estimasi melalui Standard Error (SE), Confidence Interval (CI), Design Effect (DEFF), dan Relative Standard Error (RSE).

## Metode Penelitian

Penelitian ini merupakan penelitian kuantitatif dengan metode survei. Data yang digunakan adalah data primer yang diperoleh melalui penyebaran kuesioner kepada mahasiswa Program Studi Statistika Universitas Mataram. Populasi penelitian adalah seluruh mahasiswa aktif Program Studi Statistika Universitas Mataram.

Teknik pengambilan sampel yang digunakan adalah Two-Stage Cluster Sampling. Pada tahap pertama, dipilih klaster dari populasi, yaitu berdasarkan angkatan mahasiswa. Selanjutnya, pada tahap kedua dipilih sejumlah mahasiswa dari klaster terpilih menggunakan Simple Random Sampling. Data yang telah diperoleh kemudian diuji validitas dan reliabilitas instrumennya sebelum dilakukan analisis.

Estimasi tingkat distraksi digital dilakukan menggunakan pendekatan survey-weighted estimation berdasarkan desain Two-Stage Cluster Sampling. Analisis yang dilakukan meliputi estimasi rata-rata berbobot (weighted mean), serta evaluasi ketelitian estimasi melalui Standard Error (SE), Confidence Interval (CI) 95%, Design Effect (DEFF), dan Relative Standard Error (RSE) sebagai indikator kualitas hasil estimasi.

## Teknik Pengambilan Sampel

Penelitian ini menerapkan metode Two-Stage Cluster Sampling, yaitu teknik pengambilan sampel yang dilakukan dalam dua tahapan.
 ### Tahap 1. Pemilihan Cluster
 
 Pada tahap pertama, populasi dikelompokkan ke dalam enam cluster berdasarkan kelas, yaitu:
 - 2023 A
 - 2023 B
 - 2024 A
 - 2024 B
 - 2025 A
 - 2025 B

Selanjutnya, setiap cluster diberikan bilangan acak menggunakan fungsi RAND() pada Microsoft Excel. Hasil pengacakan digunakan untuk menentukan cluster yang akan dijadikan sampel penelitian. Berdasarkan proses tersebut, diperoleh dua cluster terpilih, yaitu:
- 2023 A
- 2024 A

### Tahap 2. Pemilihan Responden

Setelah cluster terpilih, dilakukan pemilihan responden dari masing-masing cluster menggunakan metode Simple Random Sampling. Setiap mahasiswa pada cluster 2023 A dan 2024 A diberikan bilangan acak menggunakan fungsi RAND(), kemudian dipilih sesuai dengan jumlah sampel yang telah ditentukan. Jumlah responden yang diambil dari setiap cluster disesuaikan secara proporsional berdasarkan banyaknya mahasiswa pada masing-masing cluster.

| Cluster | Jumlah Mahasiswa | Jumlah Sampel |
|---|---|---|
| 2023 A | 18 | 11 |
| 2024 A | 26 | 19 |
| Total | 44 | 30 |

Berdasarkan hasil pemilihan sampel, diperoleh 30 responden yang digunakan sebagai sampel penelitian.

## Tahap Analisis Data

### 1. Import Data Kuesioner

Data hasil kuesioner diimpor ke dalam R sebagai tahap awal sebelum dilakukan pengolahan dan analisis data.
```
library(readxl)

data <- read_excel("C:/Users/ACER/Downloads/Estimasi Tingkat Distraksi Digital dalam Aktivitas Pembelajaran Mahasiswa Program Studi Statistika Universitas Mataram Menggunakan Two-Stage Cluster Sampling (Jawaban).xlsx")
View(data)
```

### 2. Uji Validitas dan Reliabilitas Instrumen Penelitian
#### Uji Validitas Instrumen Penelitian

Uji validitas dilakukan untuk mengetahui apakah setiap butir pernyataan mampu mengukur variabel yang diteliti.
```
library(psych)

hasil_validitas <- data.frame(
  Item = colnames(item),
  r_hitung = sapply(1:ncol(item), function(i){
    cor(
      item[, i],
      rowSums(item[, -i]),
      use = "complete.obs"
    )
  })
)

r_tabel <- 0.30

hasil_validitas$Keterangan <- ifelse(
  hasil_validitas$r_hitung > r_tabel,
  "Valid",
  "Tidak Valid"
)

hasil_validitas
```

#### Uji Reliabilitas Instrumen Penelitian

Uji reliabilitas dilakukan untuk mengetahui tingkat konsistensi instrumen penelitian.
```
library(psych)

# Menghitung Cronbach's Alpha
hasil_reliabilitas <- alpha(item)

# Menampilkan nilai Cronbach's Alpha
cronbach_alpha <- hasil_reliabilitas$total$raw_alpha

cat("Nilai Cronbach's Alpha =", round(cronbach_alpha, 3), "\n")

# Memberikan keterangan
if (cronbach_alpha >= 0.70) {
  cat("Keterangan : Instrumen Reliabel\n")
} else {
  cat("Keterangan : Instrumen Tidak Reliabel\n")
}
```

### 3. Menghitung Skor Total

Perhitungan skor total dilakukan untuk memperoleh skor keseluruhan setiap responden berdasarkan jumlah skor dari seluruh butir pernyataan pada kuesioner.
```
data$Skor_Total <- rowSums(item)

hist(
  data$Skor_Total,
  main = "Histogram Skor Total Distraksi Digital",
  xlab = "Skor Total",
  ylab = "Frekuensi",
  col = "skyblue",
  border = "black"
)
```
### 4. Cleaning Data

Cleaning data dilakukan untuk memeriksa keberadaan missing value, data duplikat, dan outlier sebelum dilakukan analisis lebih lanjut.
#### Cek Missing Value

Pemeriksaan missing value dilakukan untuk mengetahui apakah terdapat data yang hilang pada setiap variabel.
```
colSums(is.na(data))
```
#### Cek Data Duplikat

Pemeriksaan data duplikat dilakukan untuk memastikan tidak terdapat data yang tercatat lebih dari satu kali.
```
sum(duplicated(data))
```
#### Cek Outlier

Pemeriksaan outlier dilakukan untuk mengidentifikasi data yang memiliki nilai ekstrem sehingga dapat diketahui pengaruhnya terhadap hasil analisis.
```
boxplot(
  data$Skor_Total,
  main = "Boxplot Skor Total Distraksi Digital",
  ylab = "Skor Total"
)
boxplot.stats(data$Skor_Total)$out
```

### 5. Penerapan Two-Stage Cluster Sampling

Penerapan Two-Stage Cluster Sampling dilakukan untuk membentuk desain survei sesuai dengan proses pengambilan sampel dua tahap.
#### Pembentukan Primary Sampling Unit (PSU) & Secondary Sampling Unit (SSU)

Pembentukan PSU & SSU dilakukan untuk menentukan cluster yang menjadi unit sampling tahap pertama serta untuk mengidentifikasi unit sampling tahap kedua pada setiap cluster yang terpilih.
```
# Primary Sampling Unit (PSU)
data$Cluster <- paste(
  data$Angkatan,
  data$Kelas,
  sep = "_"
)
table(data$Cluster)

# Secondary Sampling Unit (SSU)
data$SSU <- ave(
  seq_len(nrow(data)),
  data$Cluster,
  FUN = seq_along
)
data$SSU <- as.numeric(data$SSU)
table(data$Cluster, data$SSU)
```

#### Pembobotan Sampel

Pembobotan sampel dilakukan berdasarkan peluang pemilihan pada setiap tahap pengambilan sampel untuk memperoleh bobot masing-masing responden.
```
# Tahap pertama
M <- 6      # jumlah cluster populasi
m <- 2      # jumlah cluster yang dipilih

P1 <- m/M

# Tahap kedua
N2023 <- 18
N2024 <- 26

n2023 <- 11
n2024 <- 19

P2_2023 <- n2023/N2023
P2_2024 <- n2024/N2024

# Bobot
Weight2023 <- 1/(P1 * P2_2023)
Weight2024 <- 1/(P1 * P2_2024)

# Menambahkan bobot ke data
data$Bobot <- ifelse(
  data$Cluster == "2023_A",
  Weight2023,
  Weight2024
)

table(data$Cluster, data$Bobot)
```
#### Pembentukan Desain Survei

Pembentukan desain survei dilakukan untuk mendefinisikan struktur sampling yang digunakan dalam proses estimasi menggunakan package survey.
```
library(survey)

desain <- svydesign(
  id = ~Cluster,
  weights = ~Bobot,
  data = data
)

desain
```
### 6. Estimasi Rata-rata

Estimasi rata-rata dilakukan untuk memperkirakan nilai rata-rata populasi berdasarkan data sampel yang diperoleh.
```
estimasi <- svymean(~Skor_Total, desain)
estimasi
```
### 7. Evaluasi Hasil Estimasi

Evaluasi hasil estimasi dilakukan untuk menilai tingkat ketelitian dan keandalan hasil estimasi yang diperoleh dari sampel terhadap parameter populasi.
#### Standard Error

Standard error digunakan untuk mengukur tingkat ketidakpastian dari hasil estimasi rata-rata yang diperoleh dari sampel.
```
SE(estimasi)
```
#### Interval Kepercayaan 95%

Interval kepercayaan 95% digunakan untuk menunjukkan rentang nilai yang diperkirakan mencakup rata-rata populasi sebenarnya dengan tingkat kepercayaan 95%.
```
confint(estimasi)
```
#### Design Effect (DEFF)

Design effect digunakan untuk mengukur seberapa besar pengaruh desain sampling kompleks terhadap varians estimasi dibandingkan dengan simple random sampling.
```
svymean(
  ~Skor_Total,
  desain,
  deff = TRUE
)
```
#### Relative Standard Error (RSE)

Relative Standard Error digunakan untuk menyatakan tingkat presisi estimasi dalam bentuk persentase terhadap nilai rata-rata estimasi.
```
mean_est <- coef(estimasi)

se_est <- SE(estimasi)

RSE <- (se_est / mean_est) * 100

RSE
if (RSE < 25) {
  cat("Keterangan: Estimasi layak digunakan")
} else if (RSE < 50) {
  cat("Keterangan: Estimasi perlu digunakan dengan hati-hati")
} else {
  cat("Keterangan: Estimasi kurang andal")
}
```
### Interpretasi Tingkat Distraksi Digital

Interpretasi Tingkat Distraksi Digital dilakukan untuk mengubah hasil estimasi rata-rata ke dalam skala Likert (1–5) sehingga lebih mudah diinterpretasikan dalam konteks tingkat distraksi digital mahasiswa.
```
# Mengubah hasil estimasi dari skala 10–50 ke skala Likert 1–5
mean_est_likert <- as.numeric(mean_est) / ncol(item)

cat("Estimasi rata-rata (Skala 10-50) =", round(as.numeric(mean_est), 3), "\n")
cat("Estimasi rata-rata (Skala 1-5) =", round(mean_est_likert, 3), "\n")
```



## Hasil dan Pembahasan
### Hasil Uji Validitas

Berdasarkan hasil pengujian, diperoleh hasil uji validitas sebagai berikut.
| Item | r<sub>hitung</sub> | Keterangan |
|:----:|-------------------:|:----------:|
| P1  | 0.5385 | Valid |
| P2  | 0.6414 | Valid |
| P3  | 0.3655 | Valid |
| P4  | 0.4981 | Valid |
| P5  | 0.3380 | Valid |
| P6  | 0.5921 | Valid |
| P7  | 0.5155 | Valid |
| P8  | 0.5560 | Valid |
| P9  | 0.7078 | Valid |
| P10 | 0.5835 | Valid |

Berdasarkan hasil uji validitas tersebut, seluruh item pernyataan (P1–P10) memiliki nilai r_hitung lebih dari 0.3, sehingga seluruh item dinyatakan valid. Nilai 0.3 merupakan nilai batas teoritis (rule of thumb) yang umum digunakan dalam penelitian untuk menunjukkan bahwa suatu item memiliki korelasi yang cukup dengan skor total, sehingga dianggap layak dalam mengukur variabel yang diteliti. Dengan demikian, seluruh butir pernyataan dapat digunakan untuk analisis selanjutnya.
### Hasil  Uji Reliabilitas

Uji reliabilitas dilakukan untuk mengetahui tingkat konsistensi internal dari instrumen penelitian dalam mengukur variabel yang sama. Berdasarkan hasil pengujian, diperoleh nilai Cronbach’s Alpha sebagai berikut.
| Cronbach's Alpha | Keterangan |
|-----------------:|:----------:|
| 0.839 | Reliabel |

Berdasarkan hasil tersebut, nilai Cronbach’s Alpha sebesar 0.839 menunjukkan bahwa instrumen penelitian memiliki tingkat konsistensi yang tinggi. Oleh karena itu, seluruh item pernyataan dinyatakan reliabel dan layak digunakan untuk analisis lebih lanjut.

### Hasil Perhitungan dan Distribusi Skor Total

Berdasarkan hasil pengolahan data, diperoleh skor total masing-masing responden yang kemudian digunakan untuk analisis lebih lanjut. Berikut ditampilkan cuplikan data (head data) dan visualisasi distribusi skor total.
#### Head Skor Total (6 Data Pertama)
| No | Skor_Total |
|:--:|-----------:|
| 1  | 29 |
| 2  | 40 |
| 3  | 39 |
| 4  | 42 |
| 5  | 35 |
| 6  | 36 |
#### Visualisasi Distribusi Skor Total
![Histogram Skor Total Distraksi Digital](Histogram%20Skor%20Total.png)

Berdasarkan histogram skor total distraksi digital dan enam data pertama, terlihat bahwa skor total distraksi digital mahasiswa berada pada kisaran 25 hingga 50, dengan sebagian besar skor terkonsentrasi pada rentang 35–40. Enam data pertama yaitu 29, 40, 39, 42, 35, dan 36, juga menunjukkan bahwa mayoritas skor berada pada rentang tersebut, sehingga mencerminkan pola yang konsisten dengan distribusi keseluruhan. Kondisi ini menunjukkan bahwa skor total distraksi digital responden cenderung terpusat pada nilai tengah, yang mengindikasikan bahwa sebagian besar mahasiswa memiliki tingkat distraksi digital yang relatif seragam, sedangkan hanya sebagian kecil responden yang memiliki skor lebih rendah maupun lebih tinggi dari rentang mayoritas tersebut.

### Hasil Cleaning Data
#### Missing Value
| Variabel         | Jumlah Missing Value |
|------------------|---------------------:|
| Timestamp        | 0 |
| Nama             | 0 |
| Kelas            | 0 |
| Angkatan         | 0 |
| Jenis Kelamin    | 0 |
| P1-P10           | 0 |

Berdasarkan hasil pemeriksaan missing value, seluruh variabel memiliki nilai 0 yang menunjukkan bahwa tidak terdapat data yang hilang (missing value) pada dataset. Dengan demikian, setiap variabel memiliki data yang lengkap sehingga seluruh data dapat digunakan dalam proses analisis.

#### Data Duplikat
| Pemeriksaan | Hasil |
|-------------|------:|
| Jumlah Data Duplikat | 0 |

Berdasarkan hasil pemeriksaan data duplikat menggunakan fungsi duplicated(), diperoleh jumlah data duplikat sebanyak 0. Hal ini menunjukkan bahwa tidak terdapat baris data yang memiliki isi yang sama secara keseluruhan pada dataset. Dengan demikian, seluruh data merupakan data yang unik dan dapat digunakan dalam proses analisis tanpa perlu dilakukan penghapusan data duplikat.

#### Outlier
![Boxplot Skor Total Distraksi Digital](Boxplot%20Outlier.png)

Berdasarkan boxplot skor total distraksi digital, terdapat satu nilai pencilan (outlier) pada skor sekitar 25, yang menunjukkan adanya satu responden dengan skor lebih rendah dibandingkan mayoritas responden. Sebagian besar skor berada pada rentang 35–41 dengan median sekitar 38, sehingga distribusi skor cenderung terpusat pada nilai tengah. Keberadaan outlier tersebut tidak menunjukkan adanya kesalahan data, sehingga tetap dipertahankan dalam proses analisis.
### Hasil Penerapan Two-Stage Cluster Sampling

Pada tahap ini dilakukan penerapan metode Two-Stage Cluster Sampling yang meliputi pembentukan Primary Sampling Unit (PSU), Secondary Sampling Unit (SSU), perhitungan probabilitas pemilihan pada setiap tahap, penentuan bobot sampel, serta pembentukan desain survei. Hasil dari setiap tahapan disajikan sebagai berikut.

#### Hasil Pembentukan Primary Sampling Unit (PSU)
Tahap pertama dalam metode Two-Stage Cluster Sampling adalah pembentukan Primary Sampling Unit (PSU), yaitu penentuan klaster yang akan dijadikan sampel penelitian. Hasil pembentukan PSU disajikan pada tabel berikut.
|  Item  | Jumlah Responden | Keterangan |
| :----: | ---------------: | :--------: |
| 2023 A |               11 |  Terpilih  |
| 2024 A |               19 |  Terpilih  |

Berdasarkan Tabel di atas, terpilih 2 klaster, yaitu kelas 2023 A yang terdiri atas 11 responden dan kelas 2024 A yang terdiri atas 19 responden, sebagai Primary Sampling Unit (PSU) dalam penelitian ini.

#### Hasil Pembentukan Secondary Sampling Unit (SSU)
Setelah Primary Sampling Unit (PSU) ditentukan, tahap selanjutnya adalah pembentukan Secondary Sampling Unit (SSU), yaitu penentuan unit sampel pada masing-masing klaster terpilih. Hasil pembentukan SSU disajikan pada tabel berikut.
| Cluster |  SSU |    Keterangan    |
| :-----: | :--: | :--------------: |
|  2023 A | 1–11 | Urutan responden |
|  2024 A | 1–19 | Urutan responden |

Berdasarkan Tabel di atas, Secondary Sampling Unit (SSU) dibentuk berdasarkan urutan responden pada setiap klaster, yaitu 1–11 untuk kelas 2023 A dan 1–19 untuk kelas 2024 A.

#### Probabilitas Tahap 1
Setelah pembentukan PSUdan SSU, dilakukan perhitungan probabilitas pemilihan pada tahap pertama untuk memperoleh peluang terpilihnya klaster dalam proses pengambilan sampel. Probabilitas tahap pertama dihitung menggunakan rumus:

$$
P_1=\frac{m}{M}
$$

dengan:
- \(P_1\) = probabilitas pemilihan tahap pertama,
- \(m\) = jumlah klaster yang dipilih sebagai sampel,
- \(M\) = jumlah seluruh klaster pada populasi.

Hasil perhitungan probabilitas tahap pertama disajikan pada tabel berikut.
|  M  |  m  |    P1 |
| :-: | :-: | ----: |
|  6  |  2  | 0.333 |

Berdasarkan Tabel di atas, diketahui jumlah keseluruhan klaster (M) sebanyak 6 klaster, dengan jumlah klaster yang dipilih (m) sebanyak 2 klaster. Berdasarkan kondisi tersebut diperoleh probabilitas pemilihan pada tahap pertama (P₁) sebesar 0,333, yang merupakan peluang terpilihnya suatu klaster pada tahap awal proses pengambilan sampel.

#### Probabilitas Tahap 2
Selanjutnya dilakukan perhitungan probabilitas pemilihan pada tahap kedua, yaitu peluang terpilihnya responden dalam setiap klaster yang telah dipilih pada tahap pertama. Probabilitas tahap kedua dihitung menggunakan rumus:

$$
P_2=\frac{n}{N}
$$

dengan:
- \(P_2\) = probabilitas pemilihan tahap kedua,
- \(n\) = jumlah responden yang dipilih pada setiap klaster,
- \(N\) = jumlah responden pada setiap klaster dalam populasi.

Hasil perhitungan probabilitas tahap kedua disajikan pada tabel berikut.
| Cluster |  N |  n |    P2 |
| :-----: | -: | -: | ----: |
|  2023 A | 18 | 11 | 0.611 |
|  2024 A | 26 | 19 | 0.731 |

Berdasarkan Tabel di atas, probabilitas pemilihan tahap kedua dihitung untuk setiap klaster yang telah terpilih. Pada klaster 2023 A, jumlah populasi dalam klaster (N) sebanyak 18 responden dengan sampel yang dipilih (n) sebanyak 11 responden, sehingga diperoleh nilai P₂ sebesar 0,611. Sementara itu, pada klaster 2024 A, jumlah populasi dalam klaster sebanyak 26 responden dengan sampel yang dipilih sebanyak 19 responden, sehingga diperoleh nilai P₂ sebesar 0,731.

#### Hasil Pembobotan
Berdasarkan probabilitas pemilihan pada tahap pertama dan tahap kedua, selanjutnya dilakukan perhitungan bobot sampel yang digunakan dalam proses estimasi. Bobot sampel dihitung menggunakan rumus:

$$
w=\frac{1}{P_1\times P_2}
$$

atau dapat dinyatakan sebagai:

$$
w=\frac{M}{m}\times\frac{N}{n}
$$

dengan:
- \(w\) = bobot sampel (*sampling weight*),
- \(P_1\) = probabilitas pemilihan tahap pertama,
- \(P_2\) = probabilitas pemilihan tahap kedua,
- \(M\) = jumlah seluruh klaster pada populasi,
- \(m\) = jumlah klaster yang dipilih sebagai sampel,
- \(N\) = jumlah responden pada klaster dalam populasi,
- \(n\) = jumlah responden yang dipilih pada setiap klaster.

Hasil pembobotan disajikan pada tabel berikut.
| Cluster |  Bobot |
| :-----: | -----: |
|  2023 A | 4.1053 |
|  2024 A | 4.9091 |

Berdasarkan Tabel di atas, diperoleh bobot sampel yang berbeda untuk setiap klaster berdasarkan probabilitas pemilihannya. Klaster 2023 A memiliki bobot sebesar 4,1053, sedangkan klaster 2024 A memiliki bobot sebesar 4,9091. Bobot tersebut selanjutnya digunakan dalam pembentukan desain survei dan proses estimasi parameter.

#### Hasil Pembentukan Desain Survei
Tahap terakhir adalah pembentukan desain survei berdasarkan hasil pembobotan dan struktur pengambilan sampel yang telah diperoleh. Desain survei tersebut digunakan sebagai dasar dalam proses estimasi parameter. Hasil pembentukan desain survei disajikan pada tabel berikut.
|   Item   |            Hasil           |
| :------: | :------------------------: |
|  Desain  | Two-stage cluster sampling |
| Struktur |  (2 cluster, 30 responden) |

Berdasarkan Tabel di atas, terbentuk desain survei menggunakan metode Two-Stage Cluster Sampling yang terdiri atas 2 klaster, yaitu 2023 A dan 2024 A, dengan total 30 responden sebagai sampel penelitian. Desain survei ini kemudian digunakan sebagai dasar dalam proses estimasi parameter menggunakan pendekatan survei.

### Estimasi Rata-rata

Estimasi rata-rata dilakukan untuk memperoleh nilai rata-rata skor total distraksi digital berdasarkan data hasil pengambilan sampel. Hasil estimasi disajikan dalam bentuk nilai rata-rata (mean) yang menggambarkan kecenderungan umum skor total responden. Hasil estimasi rata-rata disajikan pada tabel berikut.

|         Item        |  Nilai |
| :-----------------: | -----: |
|   Mean (rata-rata)  | 37.582 |
| Standard Error (SE) | 0.9369 |

Berdasarkan tabel di atas, diperoleh nilai estimasi rata-rata (mean) skor total distraksi digital sebesar 37,582. Nilai tersebut diperoleh dari proses estimasi terhadap data sampel yang telah dikumpulkan dan mencerminkan rata-rata skor total seluruh responden dalam penelitian. Nilai rata-rata ini selanjutnya digunakan sebagai dasar dalam menentukan tingkat distraksi digital mahasiswa pada tahap analisis berikutnya.

### Hasil Evaluasi Estimasi
Evaluasi estimasi dilakukan untuk menilai kualitas hasil estimasi rata-rata yang diperoleh dari data sampel. Evaluasi ini meliputi perhitungan Standard Error (SE), interval kepercayaan 95%, Design Effect (DEFF), dan Relative Standard Error (RSE). Hasil dari masing-masing ukuran evaluasi disajikan sebagai berikut.

#### Nilai Standard Error
Standard Error (SE) dihitung untuk mengetahui besarnya kesalahan baku dari nilai estimasi rata-rata yang diperoleh. Hasil perhitungan Standard Error disajikan pada tabel berikut.
|         Item        |   Nilai |
| :-----------------: | ------: |
| Standard Error (SE) |  0.9369 |

Berdasarkan tabel di atas, diperoleh nilai Standard Error (SE) sebesar 0,9369. Nilai ini menunjukkan besarnya kesalahan baku dari estimasi rata-rata yang diperoleh berdasarkan data sampel dan digunakan sebagai ukuran ketelitian hasil estimasi.

#### Nilai Interval Kepercayaan 95%
Interval kepercayaan 95% dihitung untuk memperoleh rentang nilai yang diperkirakan memuat nilai rata-rata populasi berdasarkan hasil estimasi. Hasil perhitungan interval kepercayaan 95% disajikan pada tabel berikut.

|         Item        |   Nilai |
| :-----------------: | ------: |
|  Lower Bound (2.5%) | 35.7460 |
| Upper Bound (97.5%) | 39.4184 |

Berdasarkan tabel di atas, diperoleh batas bawah (Lower Bound) sebesar 35,7460 dan batas atas (Upper Bound) sebesar 39,4184. Dengan demikian, interval kepercayaan 95% terhadap estimasi rata-rata skor total distraksi digital berada pada rentang 35,7460 hingga 39,4184.

#### Nilai Design Effect (DEFF)
Design Effect (DEFF) dihitung untuk membandingkan efisiensi desain pengambilan sampel yang digunakan terhadap Simple Random Sampling (SRS). Hasil perhitungan Design Effect disajikan pada tabel berikut.
| Item |  Nilai |
| :--: | -----: |
| DEFF | 1.5562 |

Berdasarkan tabel di atas, diperoleh nilai Design Effect (DEFF) sebesar 1,5562. Nilai ini menunjukkan bahwa penggunaan desain Two-Stage Cluster Sampling menyebabkan varians estimasi menjadi sekitar 1,56 kali lebih besar dibandingkan apabila menggunakan metode Simple Random Sampling (SRS).

#### Nilai Relative Standard Error (RSE)
Relative Standard Error (RSE) dihitung untuk mengetahui besarnya kesalahan baku relatif terhadap nilai estimasi rata-rata. Hasil perhitungan Relative Standard Error disajikan pada tabel berikut.
| Item |   Nilai |
| :--: | ------: |
|  RSE | 2.4929% |

Berdasarkan tabel di atas, diperoleh nilai Relative Standard Error (RSE) sebesar 2,4929%. Nilai tersebut menunjukkan bahwa besarnya kesalahan baku relatif terhadap nilai estimasi rata-rata adalah 2,4929%. Semakin kecil nilai RSE, semakin tinggi tingkat ketelitian hasil estimasi. Dengan nilai RSE sebesar 2,4929%, hasil estimasi memiliki tingkat ketelitian yang baik karena kesalahan relatif terhadap nilai estimasi tergolong kecil.

Berdasarkan hasil evaluasi estimasi secara keseluruhan, nilai Standard Error (SE), interval kepercayaan 95%, Design Effect (DEFF), dan Relative Standard Error (RSE) menunjukkan bahwa hasil estimasi yang diperoleh memiliki tingkat ketelitian yang memadai, sehingga layak digunakan sebagai dasar dalam penarikan kesimpulan penelitian.

### Interpretasi Tingkat Distraksi Digital
Interpretasi tingkat distraksi digital dilakukan berdasarkan hasil estimasi rata-rata skor total yang telah diperoleh. Nilai rata-rata tersebut kemudian dikonversi ke dalam skala Likert 1–5 dan dibandingkan dengan interval kategori yang telah ditentukan untuk mengetahui tingkat distraksi digital mahasiswa. Hasil interpretasi disajikan sebagai berikut.

#### Hasil Estimasi Rata-rata Skor Total
Hasil estimasi rata-rata skor total dikonversi dari skala total (10–50) ke skala Likert (1–5) agar memudahkan proses interpretasi terhadap tingkat distraksi digital. Hasil konversi disajikan pada tabel berikut.
|           Item          |  Nilai |
| :---------------------: | -----: |
|    Mean (Skala 10–50)   | 37.582 |
| Mean (Skala Likert 1–5) |  3.758 |

Berdasarkan tabel di atas, diperoleh nilai estimasi rata-rata skor total sebesar 37,582 pada skala 10–50. Setelah dikonversi ke dalam skala Likert 1–5, diperoleh nilai rata-rata sebesar 3,758, yang selanjutnya digunakan sebagai dasar dalam menentukan kategori tingkat distraksi digital.

#### Skala Pengukuran dan Interval Kategori
Untuk menentukan kategori tingkat distraksi digital, dilakukan pembentukan interval kategori berdasarkan rentang skala Likert yang digunakan dalam penelitian. Hasil perhitungan interval kategori disajikan pada tabel berikut.
|          Item          | Nilai |
| :--------------------: | ----: |
|  Skor Minimum (Likert) |     1 |
| Skor Maksimum (Likert) |     5 |
|     Jumlah Kategori    |     5 |
|    Panjang Interval    |   0.8 |

Berdasarkan tabel di atas, skala Likert yang digunakan memiliki rentang nilai 1 sampai 5 dengan 5 kategori penilaian. Berdasarkan rentang tersebut diperoleh panjang interval sebesar 0,8 yang digunakan sebagai dasar dalam penyusunan batas kategori tingkat distraksi digital.

#### Batas Kategori Interpretasi
Berdasarkan panjang interval yang telah diperoleh, selanjutnya ditentukan batas kategori interpretasi untuk mengelompokkan tingkat distraksi digital ke dalam lima kategori. Hasil pembentukan batas kategori disajikan pada tabel berikut.
|    Kategori   | Batas Bawah | Batas Atas |
| :-----------: | ----------: | ---------: |
| Sangat Rendah |         1.0 |        1.8 |
|     Rendah    |         1.8 |        2.6 |
|     Sedang    |         2.6 |        3.4 |
|     Tinggi    |         3.4 |        4.2 |
| Sangat Tinggi |         4.2 |        5.0 |

Berdasarkan tabel di atas, tingkat distraksi digital dikelompokkan ke dalam lima kategori, yaitu sangat rendah, rendah, sedang, tinggi, dan sangat tinggi. Batas interval setiap kategori digunakan sebagai acuan untuk menentukan kategori berdasarkan nilai rata-rata hasil estimasi.

#### Kategori Tingkat Distraksi Digital
Tahap terakhir adalah menentukan kategori tingkat distraksi digital berdasarkan nilai rata-rata pada skala Likert yang telah diperoleh. Hasil penentuan kategori disajikan pada tabel berikut.
|     Item    |  Nilai |
| :---------: | -----: |
| Mean Likert |  3.758 |
|   Kategori  | Tinggi |

Berdasarkan tabel di atas, nilai rata-rata pada skala Likert sebesar 3,758 berada pada interval 3,4–4,2, sehingga tingkat distraksi digital mahasiswa termasuk dalam kategori tinggi. Hasil ini menunjukkan bahwa rata-rata tingkat distraksi digital responden berada pada kategori tinggi berdasarkan interval interpretasi yang telah ditetapkan.

## Kesimpulan
Berdasarkan hasil penelitian yang telah dilakukan, dapat disimpulkan sebagai berikut.

1. Instrumen penelitian yang digunakan untuk mengukur tingkat distraksi digital mahasiswa Program Studi Statistika Universitas Mataram telah memenuhi kriteria valid dan reliabel, sehingga layak digunakan dalam proses pengumpulan dan analisis data.
2. Penerapan metode Two-Stage Cluster Sampling berhasil membentuk desain survei dengan 2 klaster terpilih, yaitu kelas 2023 A dan 2024 A, serta menghasilkan bobot sampel yang digunakan dalam proses estimasi rata-rata populasi.
3. Hasil estimasi menunjukkan bahwa rata-rata skor total distraksi digital mahasiswa sebesar 37,582, dengan nilai Standard Error (SE) sebesar 0,9369, Design Effect (DEFF) sebesar 1,5562, dan Relative Standard Error (RSE) sebesar 2,4929%. Hasil evaluasi tersebut menunjukkan bahwa estimasi memiliki tingkat ketelitian yang baik dan layak digunakan sebagai dasar dalam penarikan kesimpulan penelitian.
4. Berdasarkan hasil interpretasi terhadap skala Likert, diperoleh nilai rata-rata sebesar 3,758 yang berada pada interval 3,4–4,2 sehingga dapat disimpulkan bahwa tingkat distraksi digital dalam aktivitas pembelajaran mahasiswa Program Studi Statistika Universitas Mataram termasuk dalam kategori tinggi. Dengan demikian, tujuan penelitian untuk mengestimasi tingkat distraksi digital mahasiswa menggunakan metode Two-Stage Cluster Sampling telah tercapai.

## Rekomendasi
Berdasarkan hasil penelitian yang telah dilakukan, beberapa rekomendasi yang dapat diberikan adalah sebagai berikut.

1. Mahasiswa diharapkan dapat mengelola penggunaan perangkat digital secara lebih bijaksana selama kegiatan pembelajaran dengan memprioritaskan penggunaan teknologi untuk keperluan akademik serta mengurangi aktivitas digital yang tidak berkaitan dengan proses belajar.
2. Mahasiswa disarankan menerapkan strategi untuk meminimalkan distraksi digital, seperti mengaktifkan mode fokus (focus mode), membatasi notifikasi dari aplikasi yang tidak berkaitan dengan pembelajaran, dan mengatur waktu penggunaan media sosial agar konsentrasi belajar tetap terjaga.
3. Penelitian selanjutnya disarankan menggunakan jumlah sampel yang lebih besar atau melibatkan lebih banyak klaster agar hasil estimasi lebih representatif. Selain itu, penelitian selanjutnya dapat menambahkan variabel lain yang diduga memengaruhi tingkat distraksi digital, seperti intensitas penggunaan media sosial, motivasi belajar, manajemen waktu, maupun faktor lingkungan belajar.

## Link Kuisioner

https://forms.gle/u9bojCbF4XxwhpLh9
