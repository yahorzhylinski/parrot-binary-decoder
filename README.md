== PARROT BINARY DECODER

==== WHAT USED:

* gem 'rails-api' it creates rails app without useless folders such as views, assets, ...

* gem 'date_validator', DateTime validator for AR models

* gem 'bindata' parsing bin data

* gems rspec, factory-girl, shoulda-matchers

* ruby 2.2.1, rails 4.2.4

==== DESCRIPTION

I added view_models layer. I wrote Api::SensorValues::SensorValuesIndexViewModel view model. Because we need to validate that the sensor_id param is not empty and some validations for start_time and end_time params. I didn't want to do it controller.

I added presenters layer to return response json.
If request has any problems i return 400 status and error at the response body.
It request is correct i return 200 status and if it has some data i return it in the response.

==== ENHANCEMENTS

* to parse a binary data i use bindata. For now i think it's better to parse it by myself and should be more quickly and should take less ROM memory.

* Move all test data to yml.(Data Driven Testing)

* It's good to add some caching

==== LOGGING

I added after_save callback to sensor_value model.
If it has not saved it the db already has such record i log this message to log file:

Trying to insert a duplicate for #<SensorValue id: nil, sensor_id: 22226, capture_time: "1989-02-27 08:00:37", air_temperature: 65535, light: 378, soil_moisture: 681, created_at: nil, updated_at: nil>

==== TIME LOG

* looking how to parse the data 40m
* write code & tests 6h 30m
* write the report 30m
* total time 7h 40m

==== SCREENSHOTS 

[!(https://github.com/yahorzhylinski/parrot-binary-decoder/blob/master/screenshots/error_index.png)]
