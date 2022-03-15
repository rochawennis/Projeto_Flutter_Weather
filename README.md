 <h1 align="center">FlutterWeather</h1>

<p align="center">
<img src="https://user-images.githubusercontent.com/47645762/158294665-dbfa289b-9327-4c6f-ae4a-5a37a0ace137.png" width="30%"></img> 
 
</p>

# FlutterWeather

Um app de Previsão do Tempo simples usando [Flutter](https://flutter.dev/) e [Dart](https://dart.dev/) e usando API da [OpenWeatherMap](https://openweathermap.org/)

## Recursos
- Atualização para sua localização atual
- Pesquise lugares
- Informações sobre as próximas 24 horas
- Informações dos próximos 7 dias

## Como rodar em sua máquina
1. Crie um conta em [OpenWeatherMap](https://openweathermap.org/).
2. Em seguida, obtenha sua chave de API de https://home.openweathermap.org/api_keys.
3. Clone o repositório
   ```sh
   git clone https://github.com/rochawennis/FlutterWeather-main
   ```
4. Instale todos os pacotes digitando
   ```sh
   flutter pub get
   ```
5. Acesse a arquivo **lib/provider/weatherProvider.dart** e cole sua chave de API na variável apiKey
   ```dart
   String apiKey = 'Paste Your API Key Here';
   ```
6. Rode o App

