"""
    Copyright 2020 Robert MacGregor

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def jpeg():
    maybe(
        http_archive,
        name = "jpeg",
        sha256 = "75c3ec241e9996504fe02a9ed4d12f16b74ade713972f3db9e65ce95cd27e35d",
        url = "https://cfhcable.dl.sourceforge.net/project/libjpeg/libjpeg/6b/jpegsrc.v6b.tar.gz",
        build_file_content = """

filegroup(
    name = "jpeg_headers",
    srcs = glob(
        include = [
            "jpeg-6b/*.h"
        ]
    )
)
cc_library(
    name = "jpeg",
    srcs = glob(
        include = [
            "jpeg-6b/*.c",
            ":jpeg_headers"
        ],
        exclude = [
            "jpeg-6b/*mac*",
            "jpeg-6b/*dos*",
            "jpeg-6b/jpegtran.c",
            "jpeg-6b/rdjpgcom.c",
            "jpeg-6b/wrjpgcom.c",
            "jpeg-6b/cjpeg.c",
            "jpeg-6b/jmemname.c",
            "jpeg-6b/jmemnobs.c",
            "jpeg-6b/ckconfi.c",
            "jpeg-6b/ansi2knr.c",
            "jpeg-6b/djpeg.c"
        ]
    ),
    hdrs = [
        ":jpeg_headers"
    ],
    includes = [
        "jpeg-6b"
    ],

    visibility = ["//visibility:public"]
)
"""
    )
