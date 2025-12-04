load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_ni_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2026.1.0/chipobject-2026.1.0-headers.zip",
        sha256 = "77c60c8b9288df0b8fc28b2202d9d40cd9e0fc44001f260582b16be471f33228",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2026.1.0/chipobject-2026.1.0-linuxathena.zip",
        sha256 = "84dc94f502be6ca0d4385bf6564dcf350dfcdb54e409ea1350c6acc08c1f8ed6",
        build_file = "@bzlmodrio-ni//private/cpp/chipobject:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2026.1.0/visa-2026.1.0-headers.zip",
        sha256 = "65f3fc529ed2260b458f1cfc800578b297b4e7fab9d14f000db1b3ef254a5c0f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2026.1.0/visa-2026.1.0-linuxathena.zip",
        sha256 = "7961ec53abfcde252189e4bbb1452cf7e700cd799a2386156e4d4d77a02f490c",
        build_file = "@bzlmodrio-ni//private/cpp/visa:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_runtime_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/runtime/2026.1.0/runtime-2026.1.0-linuxathena.zip",
        sha256 = "be5873ba03c2bae88b2c8b23b2003b077370fb1767e700e8042bcfdae854e5a2",
        build_file = "@bzlmodrio-ni//private/cpp/runtime:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2026.1.0/netcomm-2026.1.0-headers.zip",
        sha256 = "bd3d004d6c24bdd31b9b00721da89d3159a855f4aeb9c41d7001507519870141",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2026.1.0/netcomm-2026.1.0-linuxathena.zip",
        sha256 = "49252087166fabbb2f31d73d1c9ecb9341953e2b0b42abe59baab70008db21f9",
        build_file = "@bzlmodrio-ni//private/cpp/netcomm:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_ni_cpp_dependencies():
    __setup_bzlmodrio_ni_cpp_dependencies(None)

setup_bzlmodrio_ni_cpp_dependencies = module_extension(
    __setup_bzlmodrio_ni_cpp_dependencies,
)
