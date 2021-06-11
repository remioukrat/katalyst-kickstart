if(__EXPORTER_INCLUDED)
	return()
endif()
set(__EXPORTER_INCLUDED TRUE)

include(GNUInstallDirs)

function (install_and_export_library _project_name _alias_name)
    ###############
    # Installation
    ##

    set(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/${_project_name})

    install(TARGETS ${_alias_name}
    EXPORT ${_alias_name}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )

    set_target_properties(${_alias_name}
    PROPERTIES
        EXPORT_NAME ${_project_name}
    )

    install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    install(EXPORT ${_alias_name}-targets
    FILE 
        ${_project_name}Targets.cmake
    NAMESPACE 
        ${_project_name}::
    DESTINATION 
        ${INSTALL_CONFIGDIR}
    )

    include(CMakePackageConfigHelpers)
    write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${_project_name}ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
    )

    configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/cmake/${_project_name}Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${_project_name}Config.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIGDIR}
    )

    install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${_project_name}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${_project_name}ConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIGDIR}
    )

    ##############################################

    ## Exporting from the build tree
    export(EXPORT ${_alias_name}-targets FILE ${CMAKE_CURRENT_BINARY_DIR}/${_project_name}Targets.cmake NAMESPACE ${_project_name}::)

    #Register package in user's package registry
    export(PACKAGE ${_project_name})
endfunction()