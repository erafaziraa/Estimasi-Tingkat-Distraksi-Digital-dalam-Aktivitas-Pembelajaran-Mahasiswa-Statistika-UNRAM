#===========================================================
# IMPORT DATA
#===========================================================

library(readxl)

data <- read_excel("C:/Users/ACER/Downloads/Estimasi Tingkat Distraksi Digital dalam Aktivitas Pembelajaran Mahasiswa Program Studi Statistika Universitas Mataram Menggunakan Two-Stage Cluster Sampling (Jawaban).xlsx")

View(data)

colnames(data)[6:15] <- paste0("P",1:10)
names(data)

# STRUKTUR DATA
str(data)
summary(data)

#===========================================================
# MENGAMBIL ITEM PERTANYAAN
#===========================================================

item <- data[, 6:15]

# Mengubah nama item menjadi P1-P10 (hanya pada objek item)
colnames(item) <- paste0("P", 1:10)

names(item)

#===========================================================
# UJI VALIDITAS
#===========================================================

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

#===========================================================
# UJI RELIABILITAS
#===========================================================

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

#===========================================================
# MENGHITUNG SKOR TOTAL DISTRAKSI DIGITAL
#===========================================================

data$Skor_Total <- rowSums(item)

# Melihat beberapa data pertama
head(data$Skor_Total)
# Visualisasi
hist(
  data$Skor_Total,
  main = "Histogram Skor Total Distraksi Digital",
  xlab = "Skor Total",
  ylab = "Frekuensi",
  col = "skyblue",
  border = "black"
)
#===========================================================
# STATISTIKA DESKRIPTIF
#===========================================================

summary(data$Skor_Total)
mean(data$Skor_Total)
sd(data$Skor_Total)
min(data$Skor_Total)
max(data$Skor_Total)

# CLEANING DATA
#===========================================================
# CEK MISSING VALUE
#===========================================================

colSums(is.na(data))
#===========================================================
# CEK DATA DUPLIKAT
#===========================================================

sum(duplicated(data))
#===========================================================
# CEK OUTLIER DENGAN BOXPLOT
#===========================================================

boxplot(
  data,
  main = "Boxplot Skor Total Distraksi Digital",
  ylab = "Skor Total"
)
boxplot.stats(data$Skor_Total)$out


#===========================================================
# PEMBENTUKAN PRIMARY SAMPLING UNIT (PSU)
#===========================================================

data$Cluster <- paste(
  data$Angkatan,
  data$Kelas,
  sep = "_"
)
table(data$Cluster)

#===========================================================
# PEMBENTUKAN SECONDARY SAMPLING UNIT (SSU)
#===========================================================

data$SSU <- ave(
  seq_len(nrow(data)),
  data$Cluster,
  FUN = seq_along
)
data$SSU <- as.numeric(data$SSU)
table(data$Cluster, data$SSU)

#===========================================================
# RESPONSE RATE
#===========================================================

jumlah_sampel <- 30

jumlah_responden <- nrow(data)

response_rate <- (jumlah_responden / jumlah_sampel) * 100

cat("Response Rate =", response_rate, "%")

#===========================================================
# PEMBOBOTAN TWO-STAGE CLUSTER SAMPLING
#===========================================================

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


#===========================================================
# MEMBUAT DESAIN SURVEI
#===========================================================

library(survey)

desain <- svydesign(
  id = ~Cluster+SSU,
  weights = ~Bobot,
  data = data
)

desain

#===========================================================
# ESTIMASI RATA-RATA
#===========================================================

estimasi <- svymean(~Skor_Total, desain)

estimasi

#===========================================================
# STANDARD ERROR
#===========================================================

SE(estimasi)

#===========================================================
# INTERVAL KEPERCAYAAN 95%
#===========================================================

confint(estimasi)

#===========================================================
# DESIGN EFFECT (DEFF)
#===========================================================

svymean(
  ~Skor_Total,
  desain,
  deff = TRUE
)

#===========================================================
# RELATIVE STANDARD ERROR (RSE)
#===========================================================

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

#===========================================================
# INTERPRETASI TINGKAT HASIL ESTIMASI
#===========================================================

# Mengubah hasil estimasi dari skala 10–50 ke skala Likert 1–5
mean_est_likert <- as.numeric(mean_est) / ncol(item)

cat("Estimasi rata-rata (Skala 10-50) =", round(as.numeric(mean_est), 3), "\n")
cat("Estimasi rata-rata (Skala 1-5) =", round(mean_est_likert, 3), "\n")

#===========================================================
# MENENTUKAN INTERVAL KATEGORI
#===========================================================

# Skor minimum dan maksimum skala Likert
skor_min <- 1
skor_max <- 5

# Jumlah kategori interpretasi
jumlah_kategori <- 5

# Menghitung panjang interval
panjang_interval <- (skor_max - skor_min) / jumlah_kategori

cat("Panjang Interval =", panjang_interval, "\n")

# Membentuk batas kategori secara otomatis
batas_kategori <- seq(
  from = skor_min,
  to = skor_max,
  by = panjang_interval
)

batas_kategori

# Menampilkan tabel interval kategori
interval_kategori <- data.frame(
  Kategori = c("Sangat Rendah",
               "Rendah",
               "Sedang",
               "Tinggi",
               "Sangat Tinggi"),
  Batas_Bawah = round(batas_kategori[1:5], 2),
  Batas_Atas  = round(batas_kategori[2:6], 2)
)

interval_kategori

#===========================================================
# MENENTUKAN TINGKAT HASIL ESTIMASI
#===========================================================

tingkat_estimasi <- cut(
  mean_est_likert,
  breaks = batas_kategori,
  labels = c("Sangat Rendah",
             "Rendah",
             "Sedang",
             "Tinggi",
             "Sangat Tinggi"),
  include.lowest = TRUE
)

cat("Kategori Tingkat Distraksi Digital =", as.character(tingkat_estimasi), "\n")

