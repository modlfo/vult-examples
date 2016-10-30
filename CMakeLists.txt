
cmake_minimum_required(VERSION 2.8)

include(pd.cmake)

set(CMAKE_BUILD_TYPE Release)

set(CMAKE_MACOSX_RPATH 1)

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

set(osc_noise_src src/osc_noise.vult)
vult_pd(osc_noise osc_noise_src)

set(osc_triangle_src src/osc_triangle.vult)
vult_pd(osc_triangle osc_triangle_src)

# Filters
set(flt_svf_src src/flt_svf.vult)
vult_pd(flt_svf flt_svf_src)

set(flt_moog_src src/flt_moog.vult)
vult_pd(flt_moog flt_moog_src)

# Effects
set(fx_bitcrush_src src/fx_bitcrush.vult)
vult_pd(fx_bitcrush fx_bitcrush_src)

set(fx_delay_src src/fx_delay.vult)
vult_pd(fx_delay fx_delay_src)

set(fx_reverb_src src/fx_reverb.vult)
vult_pd(fx_reverb fx_reverb_src)

# Modulators
set(env_adsr_src src/env_adsr.vult)
vult_pd(env_adsr env_adsr_src)

set(env_ad_src src/env_ad.vult)
vult_pd(env_ad env_ad_src)

set(env_swept_src src/env_swept.vult)
vult_pd(env_swept env_swept_src)

# Midi inputs
set(midi_monocv_src src/midi_monocv.vult)
vult_pd(midi_monocv midi_monocv_src)

set(midi_polycv_src src/midi_polycv.vult)
vult_pd(midi_polycv midi_polycv_src)

set(midi_gates_src src/midi_gates.vult)
vult_pd(midi_gates midi_gates_src)

# Units

set(unit_drum_src
	src/osc_triangle.vult
	src/env_ad.vult
	src/env_swept.vult
	src/osc_noise.vult
	src/unit_drum.vult)
vult_pd(unit_drum unit_drum_src)
