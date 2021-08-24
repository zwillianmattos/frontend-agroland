# Agroland

Agroland é uma plataforma que auxilia os agricultores, consultores, estudantes de agronomia e entusiastas do assunto sobre diversos conteúdos do mercado como: os cuidados com o cultivo, guia sobre plantas, central de notícias, área de aprendizagem e capacitação. Ele possui ferramentas que facilitam o acesso à informação, solução de dúvidas, capacitação e gerenciamento do negócio. Além disso, contém um marketplace que possibilitará que os usuários realizem compras e vendas na plataforma.

## Tools

### Build Runner
Rodar o build runner para gerar os arquivos
```bash
fvm flutter pub run build_runner  watch --delete-conflicting-outputs
```
### Run Chrome
```bash
fvm flutter run -d chrome --web-renderer html --dart-define=FLUTTER_WEB_USE_SKIA=true 
```

### Run Mobile
```bash
fvm flutter run
```
### Build Web
Build para navegadores
```bash
fvm flutter build web --release --web-renderer html --dart-define=FLUTTER_WEB_USE_SKIA=true
```

### Build Android
Build para dispositivos android
```bash 
flutter build apk
```

### Build and Install on Android Device
Build para dispositivos android e instalacao automatica
```bash 
fvm flutter build apk && adb install -r build/app/outputs/flutter-apk/app-release.apk
```