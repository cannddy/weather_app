String convertWeatherCode(int weatherCode) {
  String mode = "";
  switch (weatherCode) {
    case 0:
      mode = "Clear sky";
      break;
    case 1:
      mode = "Mainly clear";
      break;
    case 2:
      mode = "partly cloudy";
      break;
    case 3:
      mode = "overcast";
      break;
    case 45:
      mode = "Fog";
      break;
    case 48:
      mode = "depositing rime fog";
      break;
    case 51:
      mode = "Light Drizzle";
      break;
    case 53:
      mode = "Moderate Drizzle";
      break;
    case 55:
      mode = "Dense & intense drizzle";
      break;
    case 56:
      mode = "Freezing Drizzle(Light)";
      break;
    case 57:
      mode = "Dense & intense freezing drizzle";
      break;
    default:
  }
  return mode;
}
