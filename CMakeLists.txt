cmake_minimum_required(VERSION 3.1.2)
project(Camera_Transformation)

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source")
set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Resources/include")
set(SOURCES "${SRC_DIR}/main.cpp" "${SRC_DIR}/texture.cpp" "${SRC_DIR}/Resources/Headers/Shader_new.h")

if(WIN32)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
endif(WIN32)


add_executable(${PROJECT_NAME} ${SOURCES} )
target_include_directories(${PROJECT_NAME} PRIVATE "${SRC_DIR}")
#set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)

# GLFW
set(GLFW_DIR "${LIB_DIR}/GLFW")
set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "Build the GLFW example programs")
set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "Build the GLFW test programs")
set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "Build the GLFW documentation")
set(GLFW_INSTALL OFF CACHE INTERNAL "Generate installation target")
add_subdirectory("${GLFW_DIR}")
target_link_libraries(${PROJECT_NAME} "glfw" "${GLFW_LIBRARIES}")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLFW_DIR}/include")
target_compile_definitions(${PROJECT_NAME} PRIVATE "GLFW_INCLUDE_NONE")

# glad
set(GLAD_DIR "${LIB_DIR}/glad")
add_library("glad" "${GLAD_DIR}/src/glad.c")
target_include_directories("glad" PRIVATE "${GLAD_DIR}/include")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")
target_link_libraries(${PROJECT_NAME} "glad" "${CMAKE_DL_LIBS}")


if(WIN32)
	#glm
	set(GLM_DIR "${LIB_DIR}/glm")
	add_subdirectory("${GLM_DIR}")
	target_include_directories(${PROJECT_NAME} PUBLIC "${GLM_DIR}")
ENDIF(WIN32)