# Autogenerated wrapper script for tblis_jll for x86_64-apple-darwin14-cxx03
export tblis, tci

using Hwloc_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `tblis`
const tblis_splitpath = ["lib", "libtblis.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
tblis_path = ""

# tblis-specific global declaration
# This will be filled out by __init__()
tblis_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const tblis = "@rpath/libtblis.0.dylib"


# Relative path to `tci`
const tci_splitpath = ["lib", "libtci.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
tci_path = ""

# tci-specific global declaration
# This will be filled out by __init__()
tci_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const tci = "@rpath/libtci.0.dylib"


# Inform that the wrapper is available for this platform
wrapper_available = true

"""
Open all libraries
"""
function __init__()
    # This either calls `@artifact_str()`, or returns a constant string if we're overridden.
    global artifact_dir = find_artifact_dir()

    global PATH_list, LIBPATH_list
    # Initialize PATH and LIBPATH environment variable listings
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Hwloc_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Hwloc_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global tblis_path = normpath(joinpath(artifact_dir, tblis_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global tblis_handle = dlopen(tblis_path, RTLD_LAZY | RTLD_DEEPBIND)
    push!(LIBPATH_list, dirname(tblis_path))

    global tci_path = normpath(joinpath(artifact_dir, tci_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global tci_handle = dlopen(tci_path, RTLD_LAZY | RTLD_DEEPBIND)
    push!(LIBPATH_list, dirname(tci_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()