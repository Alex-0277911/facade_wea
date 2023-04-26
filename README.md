// використання шаблону "facade" у Dart для отримання погодних даних з API:

// У цьому прикладі клас WeatherApi відповідає за виконання запиту до API для
// отримання погодних даних. Клас WeatherFacade виступає як простий інтерфейс
// до класу WeatherApi, надаючи два методи для отримання поточної температури
// та опису погоди. У функції main створюються екземпляри обох класів та
// використовуються методи фасаду для отримання даних. Таким чином, складність
// взаємодії з API прихована за простим інтерфейсом, що полегшує використання та підтримку коду.