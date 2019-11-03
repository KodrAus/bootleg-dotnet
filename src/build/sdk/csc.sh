#!/bin/bash

set -o errexit -o nounset

export PATH="/dotnet/src/platform/corert/bin/Linux.x64.Debug/tools:$PATH"

mkdir -p /dotnet/src/sdk/csc
cp -r /dotnet/src/sdk/roslyn/artifacts/bin/csc/Debug/netcoreapp2.1/* /dotnet/src/sdk/csc

ilc /dotnet/src/sdk/csc/csc.dll -o:/dotnet/src/sdk/csc/csc.o \
  -r:/dotnet/src/sdk/csc/Microsoft.CodeAnalysis.dll \
  -r:/dotnet/src/sdk/csc/Microsoft.CodeAnalysis.CSharp.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/Microsoft.CSharp.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/Microsoft.VisualBasic.Core.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/Microsoft.VisualBasic.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/Microsoft.Win32.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/Microsoft.Win32.Registry.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/mscorlib.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/netstandard.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.AppContext.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Buffers.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Collections.Concurrent.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Collections.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Collections.Immutable.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Collections.NonGeneric.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Collections.Specialized.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ComponentModel.Annotations.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ComponentModel.DataAnnotations.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ComponentModel.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ComponentModel.EventBasedAsync.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ComponentModel.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ComponentModel.TypeConverter.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Configuration.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Console.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Core.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Data.Common.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Data.DataSetExtensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Data.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.Contracts.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.Debug.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.DiagnosticSource.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.FileVersionInfo.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.Process.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.StackTrace.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.TextWriterTraceListener.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.Tools.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.TraceSource.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Diagnostics.Tracing.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Drawing.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Drawing.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Dynamic.Runtime.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Globalization.Calendars.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Globalization.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Globalization.Extensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Compression.Brotli.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Compression.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Compression.FileSystem.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Compression.ZipFile.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.FileSystem.AccessControl.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.FileSystem.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.FileSystem.DriveInfo.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.FileSystem.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.FileSystem.Watcher.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.IsolatedStorage.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.MemoryMappedFiles.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Pipes.AccessControl.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Pipes.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.UnmanagedMemoryStream.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Linq.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Linq.Expressions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Linq.Parallel.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Linq.Queryable.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Memory.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Http.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.HttpListener.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Mail.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.NameResolution.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.NetworkInformation.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Ping.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Requests.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Security.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.ServicePoint.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Sockets.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.WebClient.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.WebHeaderCollection.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.WebProxy.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.WebSockets.Client.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.WebSockets.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Numerics.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Numerics.Vectors.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ObjectModel.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Private.DataContractSerialization.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Private.Reflection.Metadata.Ecma335.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Private.Uri.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Private.Xml.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Private.Xml.Linq.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.DispatchProxy.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.Emit.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.Emit.ILGeneration.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.Emit.Lightweight.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.Extensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.Metadata.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Reflection.TypeExtensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Resources.Reader.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Resources.ResourceManager.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Resources.Writer.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.CompilerServices.Unsafe.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.CompilerServices.VisualC.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Extensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Handles.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.InteropServices.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.InteropServices.RuntimeInformation.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Intrinsics.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Loader.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Numerics.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Serialization.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Serialization.Formatters.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Serialization.Json.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Serialization.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Runtime.Serialization.Xml.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.AccessControl.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Claims.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.Algorithms.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.Cng.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.Csp.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.Encoding.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.OpenSsl.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.Primitives.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.X509Certificates.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Principal.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Principal.Windows.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.SecureString.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ServiceModel.Web.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ServiceProcess.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Text.Encoding.CodePages.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Text.Encoding.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Text.Encoding.Extensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Text.Encodings.Web.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Text.Json.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Text.RegularExpressions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Channels.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Overlapped.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Tasks.Dataflow.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Tasks.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Tasks.Extensions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Tasks.Parallel.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Thread.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.ThreadPool.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Threading.Timer.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Transactions.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Transactions.Local.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.ValueTuple.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Web.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Web.HttpUtility.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Windows.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.Linq.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.ReaderWriter.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.Serialization.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.XDocument.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.XmlDocument.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.XmlSerializer.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.XPath.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Xml.XPath.XDocument.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/WindowsBase.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.CoreLib.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.DeveloperExperience.Console.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.DisabledReflection.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Interop.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Interop.Experimental.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Interpreter.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Jit.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Reflection.Core.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Reflection.Core.Experimental.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Reflection.Execution.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Reflection.Execution.Experimental.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.Reflection.Metadata.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.StackTraceGenerator.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.StackTraceMetadata.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.StackTraceMetadata.Experimental.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.TypeLoader.dll \
  -r:/dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/System.Private.TypeLoader.Experimental.dll \
  --verbose \
  -g \
  --initassembly:System.Private.CoreLib \
  --initassembly:System.Private.DeveloperExperience.Console \
  --initassembly:System.Private.StackTraceMetadata \
  --initassembly:System.Private.TypeLoader \
  --initassembly:System.Private.Reflection.Execution \
  --initassembly:System.Private.Interop \
  --completetypemetadata \
  --stacktracedata \
  --rootallapplicationassemblies \
  --scanreflection \
  --singlethreaded \
  --removefeature:CurlHandler

clang-3.9 /dotnet/src/sdk/csc/csc.o -o /dotnet/src/sdk/csc/csc \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/libbootstrapper.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/libRuntime.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/libSystem.Private.CoreLib.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk/libSystem.Private.TypeLoader.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Http.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Globalization.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.IO.Compression.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Net.Security.Native.a \
  /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework/System.Security.Cryptography.Native.OpenSsl.a \
  -g \
  -Wl,--as-needed \
  -pthread \
  -lstdc++ \
  -ldl \
  -lm \
  -lz \
  -lgssapi_krb5 \
  -lrt

cp /dotnet/src/sdk/csc/csc /dotnet/dist