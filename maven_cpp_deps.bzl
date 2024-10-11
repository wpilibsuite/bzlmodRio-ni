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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2025.0.0/chipobject-2025.0.0-headers.zip",
        sha256 = "d21054ef17b22206d777236f60794f0686c61f4a00621e6803570ce7481cdcce",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2025.0.0/chipobject-2025.0.0-linuxathena.zip",
        sha256 = "2ab0f076e85898941c3465015a99be5d1ff823215986f423b2f3eb99bd8ab6ab",
        build_file = "@bzlmodrio-ni//private/cpp/chipobject:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2025.0.0/visa-2025.0.0-headers.zip",
        sha256 = "a712c5d89d1920d04a82cc079f74f63f477415be2260e28683d920fdbc38efec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2025.0.0/visa-2025.0.0-linuxathena.zip",
        sha256 = "0529b9332268e47bf0b67641e465c953b9aec1e663b2ba96988c4ae9920c91a7",
        build_file = "@bzlmodrio-ni//private/cpp/visa:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_runtime_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/runtime/2025.0.0/runtime-2025.0.0-linuxathena.zip",
        sha256 = "b4e857ef8a6e065f1f06d2350b80a61c8d5e3b51435bd7bd54862259d153c821",
        build_file = "@bzlmodrio-ni//private/cpp/runtime:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2025.0.0/netcomm-2025.0.0-headers.zip",
        sha256 = "4e5e78c30bcc91abb650701c16b7b4718672e40f2ad8b28299e848ccc8d150f1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2025.0.0/netcomm-2025.0.0-linuxathena.zip",
        sha256 = "cf64ac6fbeb960865ccfa711efc8d78d31a3bebf1762199156e891368a65c69e",
        build_file = "@bzlmodrio-ni//private/cpp/netcomm:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_ni_cpp_dependencies():
    __setup_bzlmodrio_ni_cpp_dependencies(None)

setup_bzlmodrio_ni_cpp_dependencies = module_extension(
    __setup_bzlmodrio_ni_cpp_dependencies,
)
