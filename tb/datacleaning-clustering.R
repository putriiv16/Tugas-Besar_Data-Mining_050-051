# Mengatur lokasi kerja
lokasi_kerja <- "D:/tb" 
setwd(lokasi_kerja) 
getwd()

# Mengimport dataset
dataset <- read.csv("cases.csv", sep = ",") 
head(dataset)
str(dataset)

# Mengatasi Missing Value dengan Mean
rawdata=dataset
for(i in 1:ncol(rawdata)){
  rawdata[is.na(rawdata[,i]), i] <- mean(rawdata[,i],na.rm = TRUE)
}

# Clustering
cl <- kmeans(rawdata[2:12], 3)

# Melihat Hasil
cl
cl$size
plot(rawdata[2:3], col = cl$cluster)
(col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex =2)
cl$cluster

# Membuat tabel Untuk mempermudah melihat data yang telah di cluster
final=data.frame(rawdata, cl$cluster)
View(final)
