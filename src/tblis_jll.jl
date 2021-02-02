# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule tblis_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("tblis")
JLLWrappers.@generate_main_file("tblis", UUID("9c7f617c-f299-5d18-afb6-044c7798b3d0"))
end  # module tblis_jll
