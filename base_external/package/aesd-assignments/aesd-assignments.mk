##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Trage hier den Hash deines letzten Commits aus Assignment 3 ein
AESD_ASSIGNMENTS_VERSION = af3aff7aa3c8a7b64bedf4a49750a8b0e778006b
# Nutze die SSH-URL deines Repositories
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-FabSpi.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

#cross-compile all files in finder-app
define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # Erstelle die Verzeichnisse auf dem Embedded Linux Zielsystem (Target)
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/bin
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf/

    # Kopiere die Skripte und die ausführbare 'writer' Datei nach /usr/bin
    $(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/

    # Kopiere die Konfigurationsdateien nach /etc/finder-app/conf/
    $(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
    
    # Optional: Falls benötigt, kopiere die Autotest-Skripte
    $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))