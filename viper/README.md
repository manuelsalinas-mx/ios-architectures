
# VIPER Movies

Simple **iOS Movie**s app integating **VIPER architecture**.


<img width="500" alt="Screenshot 2024-01-08 at 3 55 34 PM" src="https://github.com/manuelsalinas-mx/viper-ios-movies/assets/110424672/856e956c-77f5-4f2e-acb2-57c9a303ab75">

## VIPER Responsabilities
- **View:** It's the view that user can see and interact. It contains the **Presenter**.
- **Interactor:** It's in charge of get the information from the datasource (HTTP request, database, local storage, etc).
  - Implement the **_Interectable_** protocol
- **Presenter:** Communication between **View**, **Interactor** and **Router**.
  - Implement the **_Presentable_** protocol
- **Entities:** All our local models parsed from datasources (HTTP request, database, etc).
- **Router:** Receive the order from **Presenter** to navigate to other screens.
  - Implement the **_Routing_** protocol


### Resources
- **Remote API from** https://www.themoviedb.org/

## Demo

![Viper](https://github.com/manuelsalinas-mx/ios-archutectures/assets/110424672/11588ae7-8047-441f-9b9e-701e37fd5831)

