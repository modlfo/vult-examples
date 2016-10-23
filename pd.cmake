
add_definitions(-DPD)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/pd-deps)

if(APPLE)
   set(LIB_SUFFIX ".pd_darwin")
   set(CMAKE_SHARED_LINKER_FLAGS "-undefined dynamic_lookup ${CMAKE_SHARED_LINKER_FLAGS}")
   set(LINK_LIBRARIES)
endif(APPLE)

if(UNIX AND NOT APPLE)
   set(LIB_SUFFIX ".pd_linux")
   set(LINK_LIBRARIES m c)
endif(UNIX AND NOT APPLE)

macro(add_pd_object name files)
   add_library(${name} SHARED ${${files}})
   set_target_properties(${name} PROPERTIES
      OUTPUT_NAME "${name}~"
      SUFFIX ${LIB_SUFFIX}
      PREFIX "")
   target_link_libraries(${name} ${LINK_LIBRARIES})
endmacro(add_pd_object)