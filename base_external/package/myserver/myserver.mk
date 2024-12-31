
##############################################################
#
# MYSERVER
#
##############################################################

MYSERVER_VERSION = 'origin/master'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
MYSERVER_SITE = 'git@gitlab.axjz.com:backend/myserver.git'
MYSERVER_SITE_METHOD = git
MYSERVER_GIT_SUBMODULES = YES

define MYSERVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define MYSERVER_INSTALL_TARGET_CMDS

	$(INSTALL) -m 0755   $(@D)/myserver  $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 -T  $(@D)/service.sh  $(TARGET_DIR)/etc/init.d/S50myserver
endef

$(eval $(generic-package))
