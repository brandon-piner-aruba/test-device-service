# Welcome to the internship test

We are excited for you to tackle our internship test. We have provided a few files to help you get started. There is **no requirement** to use our template and you are welcome to add or delete anything you want.

We will be assessing your ability to comprehend the problem statement by looking at the solution you submit. We are also going to be assessing the quality of your code and project structure.

# Background

We have thousands of devices which connect to the internet and run tests. There are multiple tests that can be run but we will narrow it down to a `ping` test and `trace route` test.

For this assessment, you will not need to know the details of those tests but if you were curious then you can read up about them here:

-   https://en.wikipedia.org/wiki/Ping_(networking_utility)
-   https://en.wikipedia.org/wiki/Traceroute

The devices will start by connecting to our API server and asking for its test configuration. This will tell the device which tests it needs to run. Not every device will run the same tests so it is important for the device to ask our API server for its configuration. Each device uses a GUID / UUID to uniquely identify itself.

Once it has its test configuration, the device will run through each test and store a result from the test. After running all the tests, the device will upload the results of the test to our API server.

## Example

Device with ID `5eb48fc2-e076-4ec2-9c32-800bd32caf12` asks our API server for its test configuration. The result of a GET request from our API server will have the JSON response:

```json
{
    "tests": [
        {
            "type": "ping",
            "target": "www.google.com"
        },
        {
            "type": "ping",
            "target": "www.facebook.com"
        },
        {
            "type": "traceroute",
            "target": "www.google.com"
        }
    ]
}
```

Another device with ID `341ebe72-06b4-4a2d-9825-2fdb3d50071c` also asks for its test configuration and gets the following response:

```json
{
    "tests": [
        {
            "type": "ping",
            "target": "www.google.com"
        }
    ]
}
```

Once the devices have run the tests they will upload the test results to our API server. The test results are uploaded individually. That means the first example device will make 3 POSTs to our API server. The POSTs will have the following JSON structure:

```json
{
    "type": "ping",
    "target": "www.google.com",
    "mean_ping_time": 23.987
}
```

```json
{
    "type": "ping",
    "target": "www.facebook.com",
    "mean_ping_time": 5.448
}
```

```json
{
    "type": "traceroute",
    "target": "www.google.com",
    "number_of_hops": 8
}
```

The second device would make 1 POST to our API server which would look like this:

```json
{
    "type": "ping",
    "target": "www.google.com",
    "mean_ping_time": 173.706
}
```

# Requirements

Your task is to build this API server. It needs to be able to handle GET requests from devices by responding with the device test configuration in a JSON format. It must also be able to handle POST requests from devices which are sending their test results in a JSON format.

We have included the sample device configurations in the folder [test_device_service/test_configurations](test_device_service/test_configurations)

You do not need to implement any database to store or retrieve test configurations or test results. Please do log the test results with the following format:
`Test result [<device ID>] <test type> <target> <test result>`

e.g. `Test result [341ebe72-06b4-4a2d-9825-2fdb3d50071c] ping www.google.com 173.706 ms`

You may also ignore the device ID and always return the same test configuration for every GET request.

# Bonus

1. Use the device ID to serve each device its specific test configuration
2. Store test results (save to file or database like sqlite)
