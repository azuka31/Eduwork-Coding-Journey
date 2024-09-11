@echo off
git pull origin RiGunw --strategy-option ours
git add .
git commit -m "Auto-commit: %date% %time%"
git push origin RiGunw