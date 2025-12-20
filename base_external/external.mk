# Achte auf die Kleinschreibung von project_base!
$(info Pfad ist: $(BR2_EXTERNAL_project_base_PATH))
include $(sort $(wildcard $(BR2_EXTERNAL_project_base_PATH)/package/*/*.mk))