FROM node:18-slim

# Build dependencies yükle
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

---

## 📝 GitHub'da 2 Dosya Güncelle:

### 1. package.json
https://github.com/duaey/music/blob/main/package.json

Yukarıdaki artifact'ı yapıştır

### 2. Dockerfile  
https://github.com/duaey/music/blob/main/Dockerfile

Yukarıdaki Dockerfile'ı yapıştır

---

## 🎯 Bu Neler Çözüyor?

1. ✅ **@discordjs/opus** eklendi (Opus encoding için)
2. ✅ **sodium-native** + **tweetnacl** (Encryption için)
3. ✅ **node:18-slim** (Alpine yerine, daha az sorun)
4. ✅ **Python + build tools** (native modüller için)

---

## ⏱️ Son Adım:

Her iki dosyayı da commit ettikten sonra Koyeb **otomatik deploy** edecek.

Build **5-7 dakika** sürebilir (native modüller compile ediliyor).

---

Commit ettikten sonra Koyeb **Logs** sekmesini aç ve build'i izle. Başarılı olunca:
```
✅ Bot hazır! WRD music#9557 olarak giriş yapıldı
📊 1 sunucuda aktif
Instance is healthy.
