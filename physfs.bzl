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

def physfs():
    # PhysicsFS
    maybe(
        http_archive,
        name = "physfs",
        urls = [
            "https://www.icculus.org/physfs/downloads/physfs-3.0.2.tar.bz2"
        ],
        sha256 = "304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863",
        build_file_content = """
cc_library(
    name = "physfs",
    srcs = glob(
        include = [
            "physfs-3.0.2/src/*.c",
            "physfs-3.0.2/src/*.h",
        ]
    ),
    defines = [
        "PHYSFS_SUPPORTS_ZIP=1"
    ],
    hdrs = glob(
        include = [
            "physfs-3.0.2/src/*.h",
        ]
    ),
    includes = [
        "physfs-3.0.2/src"
    ],
    linkopts = select({
        "@bazel_tools//src/conditions:windows": [
            "Advapi32.lib",
            "User32.lib",
            "Shell32.lib"
        ],

        "//conditions:default": []
    }),
    visibility = ["//visibility:public"]
)
        """
    )
