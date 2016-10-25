
cmake_minimum_required(VERSION 2.8)

include(pd.cmake)

set(CMAKE_BUILD_TYPE Release)

function(vult_pd output source)
	set(OUTPUT_FILES ${CMAKE_CURRENT_BINARY_DIR}/${output}.cpp ${CMAKE_CURRENT_BINARY_DIR}/${output}.h)
	add_custom_command(
		OUTPUT ${OUTPUT_FILES}
		DEPENDS ${${source}}
		WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		COMMAND vultc ${${source}} -ccode -template pd -o ${CMAKE_CURRENT_BINARY_DIR}/${output})
	add_custom_target(${output}_code ALL DEPENDS ${output}.cpp ${output}.h)
	set(src ${OUTPUT_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/vultin.c ${CMAKE_CURRENT_SOURCE_DIR}/src/vultin.h)
	add_pd_object(${output} src)
endfunction(vult_pd)


include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

# Oscillators

set(osc_phd_src src/osc_phd.vult)
vult_pd(osc_phd osc_phd_src)

set(osc_sin_src src/osc_sin.vult)
vult_pd(osc_sin osc_sin_src)

set(osc_saw_src src/osc_saw.vult)
vult_pd(osc_saw osc_saw_src)

set(osc_blit_src src/osc_blit.vult)
vult_pd(osc_blit osc_blit_src)

# Filters
set(flt_svf_src src/flt_svf.vult)
vult_pd(flt_svf flt_svf_src)

set(flt_moog_src src/flt_moog.vult)
vult_pd(flt_moog flt_moog_src)

# Effects
set(fx_bitcrush_src src/fx_bitcrush.vult)
vult_pd(fx_bitcrush fx_bitcrush_src)

# Modulators
set(env_adsr_src src/env_adsr.vult)
vult_pd(env_adsr env_adsr_src)

# BeatStep Pro inputs
set(bsp_inst_src src/bsp_inst.vult)
vult_pd(bsp_inst bsp_inst_src)
