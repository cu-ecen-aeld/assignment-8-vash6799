#   git rev-parse HEAD
LDD_VERSION = 4cb92d06fad4b86466cf47235fe02c2f1f192cfa

LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-vash6799.git
LDD_SITE_METHOD = git

LDD_LICENSE = GPL-2.0
LDD_LICENSE_FILES = COPYING

LDD_MODULE_SUBDIRS = misc-modules scull

$(eval $(kernel-module))
$(eval $(generic-package))
