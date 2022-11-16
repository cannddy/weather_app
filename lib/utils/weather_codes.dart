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
    case 61:
      mode = "Rain(Slight)";
      break;
      case 63:
      mode = "Rain(Moderate)";
      break;
      case 65:
      mode = "Rain(heavy)";
      break;
      case 66:
      mode = "Freezing Rain(Light)";
      break;
      case 67:
      mode = "Freezing Rain(Heavy)";
      break;
      case 71:
      mode = "Snow fall(Slight)";
      break;
      case 73:
      mode = "Snow fall(Moderate)";
      break;
      case 75:
      mode = "Snow fall(Heavy)";
      break;
      case 77:
      mode = "Snow grains";
      break;
      case 80:
      mode = "Rain showers(Slight)";
      break;
      case 81:
      mode = "Rain showers(Moderate)";
      break;
      case 82:
      mode = "Rain showers(violent)";
      break;
      case 85:
      mode = "Snow showers(Slight)";
      break;
      case 86:
      mode = "Snow showers(Heavy)";
      break;
      case 95:
      mode = "Thunderstorm(Slight or moderate)";
      break;
      case 96:
      mode = "Thunderstorm(slight)";
      break;
      case :
      mode = "Thunderstorm(Heavy hail)";
      break;
      case :
      mode = "()";
      break;
      case :
      mode = "()";
      break;
      case :
      mode = "()";
      break;
      case :
      mode = "()";
      break;
    default:
  }
  return mode;
}
