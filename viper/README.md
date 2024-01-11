
# VIPER Movies

Simple **iOS Movie**s app integating **VIPER architecture**.

| Language | UI     |
| :-------- | :------- |
| Swift | `UIKit` | 

<img width="500" alt="Screenshot 2024-01-08 at 1 27 01 PM" src="https://github.com/manuelsalinas-mx/ios-archutectures/assets/110424672/f78707d6-3b2c-40c2-b94c-ae6b4f108514">

<img width="500" alt="Screenshot 2024-01-09 at 2 04 10 PM" src="https://github.com/manuelsalinas-mx/ios-architectures/assets/110424672/ce587972-0e04-4354-93bb-607c83438672">


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
- **Viper Template:** [VIPER Template.zip](https://github.com/manuelsalinas-mx/ios-architectures/files/13895538/VIPER.Template.zip)


## Demo

- **Movies**

![Viper](https://github.com/manuelsalinas-mx/ios-archutectures/assets/110424672/11588ae7-8047-441f-9b9e-701e37fd5831)

--- 
- **Navegation**

![Simulator Screen Recording - iPhone 15 Pro - 2024-01-10 at 17 39 19](https://github.com/manuelsalinas-mx/ios-architectures/assets/110424672/e3961d31-2c71-4f07-89dd-6cfb917da49e)

