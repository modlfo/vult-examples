
cmake_minimum_required(VERSION 2.8)

include(pd.cmake)

set(CMAKE_BUILD_TYPE Release)

set(CMAKE_MACOSX_RPATH 1)

function(vult_pd output source)
   set(OUTPUT_FILES ${CMAKE_CURRENT_BINARY_DIR}/${output}.cpp ${CMAKE_CURRENT_BINARY_DIR}/${output}.h)
   execute_process(
      COMMAND vultc -deps ${source}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      OUTPUT_VARIABLE DEPENDENCIES_STRING)

   string(REPLACE " " ";" DEPENDENCIES ${DEPENDENCIES_STRING})

   add_custom_command(
      OUTPUT ${OUTPUT_FILES}
      DEPENDS ${source} ${DEPENDENCIES}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMAND vultc ${source} -real fixed -ccode -template pd -o ${CMAKE_CURRENT_BINARY_DIR}/${output})
   add_custom_target(${output}_code ALL DEPENDS ${output}.cpp ${output}.h)
   set(src ${OUTPUT_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/vultin.c ${CMAKE_CURRENT_SOURCE_DIR}/src/vultin.h)
   add_pd_object(${output} src)
endfunction(vult_pd)


include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

# Oscillators

vult_pd(osc_phasor src/osc_phasor.vult)

vult_pd(osc_phd src/osc_phd.vult)

vult_pd(osc_sin src/osc_sin.vult)

vult_pd(osc_saw src/osc_saw.vult)

vult_pd(osc_blit src/osc_blit.vult)

vult_pd(osc_noise src/osc_noise.vult)

vult_pd(osc_noisef src/osc_noisef.vult)

vult_pd(osc_wave src/osc_wave.vult)

vult_pd(osc_sawcore src/osc_sawcore.vult)

vult_pd(osc_tricore src/osc_tricore.vult)

# Filters
vult_pd(flt_svf src/flt_svf.vult)

vult_pd(flt_moog src/flt_moog.vult)

# Effects
vult_pd(fx_bitcrush src/fx_bitcrush.vult)

vult_pd(fx_delay src/fx_delay.vult)

vult_pd(fx_reverb src/fx_reverb.vult)

vult_pd(fx_saturate src/fx_saturate.vult)

# Modulators
vult_pd(env_adsr src/env_adsr.vult)

vult_pd(env_ad src/env_ad.vult)

vult_pd(env_drum src/env_drum.vult)

vult_pd(env_swept src/env_swept.vult)

vult_pd(env_lfo src/env_lfo.vult)

# Midi inputs
vult_pd(midi_monocv src/midi_monocv.vult)

vult_pd(midi_polycv src/midi_polycv.vult)

vult_pd(midi_gates src/midi_gates.vult)

# Units

vult_pd(unit_drum src/unit_drum.vult)

vult_pd(unit_drum9 src/unit_drum9.vult)

vult_pd(unit_voice src/unit_voice.vult)

