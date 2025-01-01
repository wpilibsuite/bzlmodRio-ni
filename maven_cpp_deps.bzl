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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2025.2.0/chipobject-2025.2.0-headers.zip",
        sha256 = "5b0f685890fe02fc5da0c64a8b7755a1e4cc1debd107717673f17ba1c0e37742",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2025.2.0/chipobject-2025.2.0-linuxathena.zip",
        sha256 = "496744d042da65a3550a0dcf9a789b91bc00b63605a54aa81a649ebdd19a4118",
        build_file = "@bzlmodrio-ni//private/cpp/chipobject:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2025.2.0/visa-2025.2.0-headers.zip",
        sha256 = "fad1ef38ba5a709a91a933a5d521e7d146f1407edf29d987265f33d61f16da0c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2025.2.0/visa-2025.2.0-linuxathena.zip",
        sha256 = "f2dde55ef52bf6aecdfdae1f43716dbbc011dfcfe5b943bf81f4faf03d619f8c",
        build_file = "@bzlmodrio-ni//private/cpp/visa:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_runtime_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/runtime/2025.2.0/runtime-2025.2.0-linuxathena.zip",
        sha256 = "2ed343829504083dfda65e552b734b91ed5c9d3bd96451a0ff2c183775600d39",
        build_file = "@bzlmodrio-ni//private/cpp/runtime:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2025.2.0/netcomm-2025.2.0-headers.zip",
        sha256 = "9a652d8bffe6304ab80bedeabf74352421413b3751ff0e7eec54f6fe1262112a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2025.2.0/netcomm-2025.2.0-linuxathena.zip",
        sha256 = "b724a736c9924a2dc0d99cf5e0979fb582185d577cdcce768335825ab2f4b9f0",
        build_file = "@bzlmodrio-ni//private/cpp/netcomm:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_ni_cpp_dependencies():
    __setup_bzlmodrio_ni_cpp_dependencies(None)

setup_bzlmodrio_ni_cpp_dependencies = module_extension(
    __setup_bzlmodrio_ni_cpp_dependencies,
)
