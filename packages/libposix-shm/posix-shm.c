//
// A shm_open(), shm_unlink() workaround for Android
//
// Copyright (C) 2018 Leonid Plyushch
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.
//

#ifdef __ANDROID__
#include <android/log.h>
#define LOG_E(...) __android_log_print(ANDROID_LOG_INFO, "shmem", __VA_ARGS__)
#endif

#include <errno.h>
#include <fcntl.h>
#include <linux/limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef __ANDROID__
#include <sys/stat.h>
#endif

#include <sys/types.h>
#include <unistd.h>

#include "posix-shm.h"

int shm_open(const char *name, int oflag, mode_t mode) {
	char shm_file_name[PATH_MAX] = {0};
	char *shm_dir = NULL;
	struct stat st;

	if ((shm_dir = getenv("TMPDIR")) == NULL) {
#ifdef __ANDROID__
		shm_dir = "/data/data/com.termux/files/usr/tmp";
#else
		shm_dir = "/tmp";
#endif
	}

#ifdef __ANDROID__
	if (stat(shm_dir, &st) != -1) {
		if (!S_ISDIR(st.st_mode)) {
			LOG_E("shm_open(): file '%s' is not a directory", shm_dir);
			return -1;
		}
	} else {
		LOG_E("shm_open(): cannot access SHM directory '%s': %s", shm_dir, strerror(errno));
		return -1;
	}
#endif

	if (snprintf(shm_file_name, PATH_MAX-1, "%s/%s.shm", shm_dir, name) < 0) {
		return -1;
	}

	return open(shm_file_name, oflag, mode);
}

int shm_unlink(const char *name) {
	char shm_file_name[PATH_MAX] = {0};
	char *shm_dir = NULL;
	struct stat st;

	if ((shm_dir = getenv("TMPDIR")) == NULL) {
#ifdef __ANDROID__
		shm_dir = "/data/data/com.termux/files/usr/tmp";
#else
		shm_dir = "/tmp";
#endif
	}

#ifdef __ANDROID__
	if (stat(shm_dir, &st) != -1) {
		if (!S_ISDIR(st.st_mode)) {
			LOG_E("shm_open(): file '%s' is not a directory", shm_dir);
			return -1;
		}
	} else {
		LOG_E("shm_open(): cannot access SHM directory '%s': %s", shm_dir, strerror(errno));
		return -1;
	}
#endif

	if (snprintf(shm_file_name, PATH_MAX-1, "%s/%s.shm", shm_dir, name) < 0){
		return -1;
	}

	return unlink(shm_file_name);
}
