<h1 align="center">UniWeather</h1>

<p align="center">
<img src="https://user-images.githubusercontent.com/47645762/163752067-611073d0-7784-4225-aa76-554093f592a0.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163751964-9926f63e-5677-4408-aef6-7b218347be5f.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163751837-1e007822-63fe-48d7-b86a-aebd9731fd63.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752061-fa6d7f26-edc1-4299-8fb4-dd6477b08320.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752062-4cdd77c8-ec8d-463e-b62d-523ee8d207e6.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752064-514d64a6-fee6-4db4-8f58-93f4886f5c7d.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752068-570e1535-007f-4913-ab3c-e507fa66cdcc.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752070-12ea33a3-9845-4a29-9781-a6535b497d9d.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752072-4eafdd3b-ed3a-462b-89e2-d72e69e210f8.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752075-5d891d42-a1a4-42bc-96db-1e8cedf30c21.png" width="20%"></img> 
<img src="https://user-images.githubusercontent.com/47645762/163752076-701c25b5-fe3f-4569-8564-f46e3533159d.png" width="20%"></img> 
</p>


# UniWeather

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
   git clone https://github.com/rochawennis/Projeto_Flutter_Weather
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