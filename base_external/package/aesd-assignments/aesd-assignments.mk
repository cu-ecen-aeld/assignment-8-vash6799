

##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 'c56a5a7de7df3336d74c4ea1201198089e2a1121'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-vash6799.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server clean
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
        # Create target directories
        $(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
        $(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf

        # Install config files
        $(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/

        # Install scripts
        $(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/

        # Install writer binary (built in BUILD_CMDS)
        $(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/

        # Optional: if you have tester.sh in your A3 repo
        # $(INSTALL) -m 0755 $(@D)/finder-app/tester.sh $(TARGET_DIR)/usr/bin/

        # Install the executable to /usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
	# Install the init script to /etc/init.d/ with the S99 prefix
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
