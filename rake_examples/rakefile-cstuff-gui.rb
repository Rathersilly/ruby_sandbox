# frozen_string_literal: true

# rakefile for my c++ gui project 22.01.24

require 'rake/clean' # to auto clean/clobber
require 'colorize'
require 'json'

# TODO: add task to update ctags based on SRC_FILES maybe

Rake.application.options.trace_rules = true
# Conditions
debugging = true

# CC = 'g++'
# CPP_VERSION = '-std=c++2a '
CC = 'clang++'
CPP_VERSION = '-std=c++20 '
PROJECT_ROOT = '/home/rsil/cstuff/gui'
IMGUI_DIR = 'imgui'

OBJ_DIR = 'obj'
OUT_FILE = 'gui.out'
OUT_STR = "-o #{OUT_FILE}"

# when debugging, include -g3 -O0, according to this:
# https://developers.redhat.com/blog/2021/04/30/the-gdb-developers-gnu-debugger-tutorial-part-1-getting-started-with-the-debugger#compiler_options
DEBUG_STR = '-g3 -O0'

LDFLAGS = ' `sdl2-config --libs` -lSDL2_image -lXext -lX11 -lm -lglfw -lGL -ldl'

CFLAGS =  " `sdl2-config --cflags` -Wall -I#{PROJECT_ROOT}/#{IMGUI_DIR} "\
          " -I#{PROJECT_ROOT}/#{IMGUI_DIR}/backends "\
          " #{DEBUG_STR if debugging} "
# CFLAGS =  "`sdl2-config --cflags`  -Wall -I#{IMGUI_DIR} -I##{IMGUI_DIR}/backends"

MAIN_FILE = 'main.cpp'
SRC_FILES = Rake::FileList.new(MAIN_FILE, 'init_window.cpp', 'init_imgui.cpp',
                               'init_imgui_style.cpp', 'draw.cpp',
                               'mygui.cpp', 'cleanup.cpp',
                               "#{IMGUI_DIR}/imgui*.cpp",
                               "#{IMGUI_DIR}/backends/imgui_impl_sdl2.cpp",
                               "#{IMGUI_DIR}/backends/imgui_impl_opengl3.cpp",
                               "#{IMGUI_DIR}/backends/imgui_impl_glfw.cpp")
# puts "SRC_FILES : #{SRC_FILES}".light_green

OBJ_FILES = SRC_FILES.pathmap('obj/%X.o')
# puts "OBJ_FILES : #{OBJ_FILES}".light_green

# find the source file needed for an object file
def source(obj_file)
  SRC_FILES.find do |src_file|
    src_file.pathmap('%f').ext('') == obj_file.pathmap('%f').ext('')
  end
end

# Compile source files
rule '.o' => ->(obj_file) { source(obj_file) } do |ftask|
  # ftask is a FileTask < Task object
  # FileTasks are not run unless needed
  sh "mkdir -p #{ftask.name.pathmap('%d')}"

  # sh "#{CC} #{CPP_VERSION} -c #{ftask.source} #{CFLAGS} #{LDFLAGS} "\
  sh "#{CC} #{CPP_VERSION} -c #{ftask.source} #{CFLAGS} "\
    "-o #{ftask.name}"
end

desc 'Link object files'
file OUT_FILE => OBJ_FILES do |f|
  p f
  p f.class
  p f.name
  sh "#{CC} #{CPP_VERSION} #{OBJ_FILES} #{CFLAGS} #{LDFLAGS} -o #{OUT_FILE}"
end

# Default task
task default: OUT_FILE

# clangd config - generate compile_commands.json"
desc 'clangd config - generate compile_commands.json'
task :cconfig do
  puts 'cconfig'.blue
  config_string = {}
  config_string['directory'] = PROJECT_ROOT
  config_string['command'] = COMMAND
  config_string['file'] = MAIN_FILE

  File.open('compile_commands.json', 'w') do |f|
    f.write JSON.pretty_generate([config_string])
  end
end

# Clean task
CLEAN.include(OBJ_DIR, OUT_FILE)
CLOBBER.include(OBJ_DIR, OUT_FILE)
