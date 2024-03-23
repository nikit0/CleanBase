@echo off

if exist cache (
    rmdir /Q /S cache
)

artifacts\FXServer.exe +exec config/config.cfg