## PARROT BINARY DECODER

#### WHAT USED:

* gem 'rails-api' it creates rails app without useless folders such as views, assets, ...

* gem 'date_validator', DateTime validator for AR models

* gem 'bindata' parsing bin data

* gems rspec, factory-girl, shoulda-matchers

* ruby 2.2.1, rails 4.2.4

#### DESCRIPTION

In your csv example there are 2 sensor_id fields, but when i tried to parse the test buffer i got error(read bytes error).
So i created the sensor_values table only with one sensor_id field

I added view_models layer. I wrote Api::SensorValues::SensorValuesIndexViewModel view model. Because we need to validate that the sensor_id param is not empty and some validations for start_time and end_time params. I didn't want to do it in  the controller.

I added presenters layer to return response json.
If request has any problems i return 400 status and error at the response body.
It request is correct i return 200 status and if it has some data i return it in the response.

#### ENHANCEMENTS

* to parse a binary data i use bindata. For now i think it's better to parse it by myself and should be more quickly and should take less ROM memory.

* Move all test data to yml.(Data Driven Testing)

* It's good to add some caching

#### HOW TO

All you need is create database.yml and secrets.yml and run `bundle`

To start the app

```
rails s
```

To run tests
```
rspec
```



#### LOGGING

I added after_save callback to sensor_value model. For next tasks i think it's good to make some LoggerObserver
If it has not saved it the db already has such record i log this message to log file:
```
Trying to insert a duplicate for #<SensorValue id: nil, sensor_id: 22226, capture_time: "1989-02-27 08:00:37", air_temperature: 65535, light: 378, soil_moisture: 681, created_at: nil, updated_at: nil>
```
#### TIME LOG
| Activity        | Time           |
| ------------- |:-------------:|
| Looking how to parse the data      | 40m |
| Write code & tests      | 6h 30m      |
| Write the report | 30m      |
|TOTAL| 7h 40m |

#### SCREENSHOTS 

Validation error at GET /api/sensor_values/
![alt tag](https://github.com/yahorzhylinski/parrot-binary-decoder/blob/master/screenshots/error_index.png)

VAlidation error on upload buffer
![alt tag](https://github.com/yahorzhylinski/parrot-binary-decoder/blob/master/screenshots/error_upload.png)

Success Index
![alt tag](https://github.com/yahorzhylinski/parrot-binary-decoder/blob/master/screenshots/success_index.png)

TESTS
![alt tag](https://github.com/yahorzhylinski/parrot-binary-decoder/blob/master/screenshots/tests_result.png)

Upload success
![alt tag](https://github.com/yahorzhylinski/parrot-binary-decoder/blob/master/screenshots/upload_success.png)
