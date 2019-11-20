using System;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Net.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;

namespace Host
{
    static class Proxy
    {
        public static async Task HandleAsync(HttpContext ctx)
        {
            var kind = ctx.Request.Headers["X-KIND"].FirstOrDefault();

            if (kind != "coreclr-jit" && kind != "coreclr-r2r" && kind != "corert-aot")
            {
                throw new ArgumentException("unexpected kind");
            }

            var proxyWatch = Stopwatch.StartNew();

            using var process = StartChildProcess(kind);
            using var res = await ProxyRequestAsync(ctx);

            proxyWatch.Stop();

            ctx.Response.Headers["X-TAKEN"] = proxyWatch.ElapsedMilliseconds.ToString();
            ctx.Response.StatusCode = (int) res.StatusCode;
            await res.Content.CopyToAsync(ctx.Response.Body);
        }

        static CaptiveProcess StartChildProcess(string kind)
        {
            return kind switch
            {
                "coreclr-jit" => new CaptiveProcess("dotnet", $"{Environment.CurrentDirectory}/App/out/{kind}/App.dll --urls http://localhost:5004"),
                _ => new CaptiveProcess($"{Environment.CurrentDirectory}/App/out/{kind}/App", "--urls http://localhost:5004")
            };
        }

        static async Task<HttpResponseMessage> ProxyRequestAsync(HttpContext ctx)
        {
            using var client = new HttpClient();
            var watch = Stopwatch.StartNew();
            var timeout = TimeSpan.FromSeconds(10);
            while (true)
            {
                try
                {
                    using var req = new HttpRequestMessage
                    {
                        Method = HttpMethod.Get,
                        RequestUri = new Uri($"http://localhost:5004{ctx.Request.GetEncodedPathAndQuery()}")
                    };

                    return await client.SendAsync(req);
                }
                catch
                {
                    if (watch.Elapsed > timeout)
                    {
                        throw;
                    }
                }
            }
        }
    }
}
