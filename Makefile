# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /ide-desktop/clion/backend/bin/cmake/linux/x64/bin/cmake

# The command to remove a file.
RM = /ide-desktop/clion/backend/bin/cmake/linux/x64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/MPI2324Study

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/MPI2324Study

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "No interactive CMake dialog available..."
	/ide-desktop/clion/backend/bin/cmake/linux/x64/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/ide-desktop/clion/backend/bin/cmake/linux/x64/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /workspace/MPI2324Study/CMakeFiles /workspace/MPI2324Study//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /workspace/MPI2324Study/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named ejemplo01

# Build rule for target.
ejemplo01: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 ejemplo01
.PHONY : ejemplo01

# fast build rule for target.
ejemplo01/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/build
.PHONY : ejemplo01/fast

#=============================================================================
# Target rules for targets named ejemplo03_completo

# Build rule for target.
ejemplo03_completo: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 ejemplo03_completo
.PHONY : ejemplo03_completo

# fast build rule for target.
ejemplo03_completo/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo03_completo.dir/build.make CMakeFiles/ejemplo03_completo.dir/build
.PHONY : ejemplo03_completo/fast

MPIstudy.o: MPIstudy.cpp.o
.PHONY : MPIstudy.o

# target to build an object file
MPIstudy.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/MPIstudy.cpp.o
.PHONY : MPIstudy.cpp.o

MPIstudy.i: MPIstudy.cpp.i
.PHONY : MPIstudy.i

# target to preprocess a source file
MPIstudy.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/MPIstudy.cpp.i
.PHONY : MPIstudy.cpp.i

MPIstudy.s: MPIstudy.cpp.s
.PHONY : MPIstudy.s

# target to generate assembly for a file
MPIstudy.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/MPIstudy.cpp.s
.PHONY : MPIstudy.cpp.s

ejemplo01.o: ejemplo01.cpp.o
.PHONY : ejemplo01.o

# target to build an object file
ejemplo01.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo01.cpp.o
.PHONY : ejemplo01.cpp.o

ejemplo01.i: ejemplo01.cpp.i
.PHONY : ejemplo01.i

# target to preprocess a source file
ejemplo01.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo01.cpp.i
.PHONY : ejemplo01.cpp.i

ejemplo01.s: ejemplo01.cpp.s
.PHONY : ejemplo01.s

# target to generate assembly for a file
ejemplo01.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo01.cpp.s
.PHONY : ejemplo01.cpp.s

ejemplo02.o: ejemplo02.cpp.o
.PHONY : ejemplo02.o

# target to build an object file
ejemplo02.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo02.cpp.o
.PHONY : ejemplo02.cpp.o

ejemplo02.i: ejemplo02.cpp.i
.PHONY : ejemplo02.i

# target to preprocess a source file
ejemplo02.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo02.cpp.i
.PHONY : ejemplo02.cpp.i

ejemplo02.s: ejemplo02.cpp.s
.PHONY : ejemplo02.s

# target to generate assembly for a file
ejemplo02.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo02.cpp.s
.PHONY : ejemplo02.cpp.s

ejemplo03_completo.o: ejemplo03_completo.cpp.o
.PHONY : ejemplo03_completo.o

# target to build an object file
ejemplo03_completo.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo03_completo.dir/build.make CMakeFiles/ejemplo03_completo.dir/ejemplo03_completo.cpp.o
.PHONY : ejemplo03_completo.cpp.o

ejemplo03_completo.i: ejemplo03_completo.cpp.i
.PHONY : ejemplo03_completo.i

# target to preprocess a source file
ejemplo03_completo.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo03_completo.dir/build.make CMakeFiles/ejemplo03_completo.dir/ejemplo03_completo.cpp.i
.PHONY : ejemplo03_completo.cpp.i

ejemplo03_completo.s: ejemplo03_completo.cpp.s
.PHONY : ejemplo03_completo.s

# target to generate assembly for a file
ejemplo03_completo.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo03_completo.dir/build.make CMakeFiles/ejemplo03_completo.dir/ejemplo03_completo.cpp.s
.PHONY : ejemplo03_completo.cpp.s

ejemplo_matrices.o: ejemplo_matrices.cpp.o
.PHONY : ejemplo_matrices.o

# target to build an object file
ejemplo_matrices.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo_matrices.cpp.o
.PHONY : ejemplo_matrices.cpp.o

ejemplo_matrices.i: ejemplo_matrices.cpp.i
.PHONY : ejemplo_matrices.i

# target to preprocess a source file
ejemplo_matrices.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo_matrices.cpp.i
.PHONY : ejemplo_matrices.cpp.i

ejemplo_matrices.s: ejemplo_matrices.cpp.s
.PHONY : ejemplo_matrices.s

# target to generate assembly for a file
ejemplo_matrices.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/ejemplo01.dir/build.make CMakeFiles/ejemplo01.dir/ejemplo_matrices.cpp.s
.PHONY : ejemplo_matrices.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... ejemplo01"
	@echo "... ejemplo03_completo"
	@echo "... MPIstudy.o"
	@echo "... MPIstudy.i"
	@echo "... MPIstudy.s"
	@echo "... ejemplo01.o"
	@echo "... ejemplo01.i"
	@echo "... ejemplo01.s"
	@echo "... ejemplo02.o"
	@echo "... ejemplo02.i"
	@echo "... ejemplo02.s"
	@echo "... ejemplo03_completo.o"
	@echo "... ejemplo03_completo.i"
	@echo "... ejemplo03_completo.s"
	@echo "... ejemplo_matrices.o"
	@echo "... ejemplo_matrices.i"
	@echo "... ejemplo_matrices.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

