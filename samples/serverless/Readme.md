# Serverless sample

This sample demonstrates a common scenario in a serverless environment; having to start in instance of your app to service a request. The time taken to complete the request includes the time taken to start the app.

We've got two projects here:

- `App`: the actual app, based on ASP.NET's weather forecast API. It can be build as a standard dll that will be just-in-time compiled at runtime, it can pre-JIT using Ready-to-run, or it can be fully ahead-of-time compiled.
- `Host`: our sample serverless environment. When a request hits the host it will start a fresh instance of the app and proxy the request/response.

## Running the sample

```shell
$ ./build.sh
$ ./start.sh
```

Then, in a separate terminal window:

```shell
$ ./call.sh jit api/weather
```
