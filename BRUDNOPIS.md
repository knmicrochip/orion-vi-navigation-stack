# TODO

- [ ] launchfile
- [ ] Dockerfile
  - [x] Podstawowy Dockerfile
  - [ ] Budowa paczki w Dockerfile (`colcon`)
- [ ] Graf/schemat nawigacji
- [ ] Konwersja mapy 3D na mapę kosztów
- [ ] Dobry SLAM to podstawa
- [ ] linter
- [ ] wifi na szufladzie

# Sekcja ROS2

- do rozważenia nav2 albo easymapping
- w ros2 launch rtabmap_examples realsense_d435i_color.launch.py 
wiadomość mapy topic /mapData

# Sekcja Docker
zbuduj paczkę:
```
source install/setup.bash
colcon build
```
zbuduj dockera:
```
docker build -f Dockerfile --tag orion
```
jeśli podman-remote jest używane to zamienić `docker` na `podmna-remote` (wskazówka: Użyj `alias` w `.bashrc`)


uruchom dockera:
```
docker run --rm -it  orion
```

# Sekcja organizacja - skróty itp

## ROS2
- nazwa paczki {nazwa}_pkg
- nazwa węzła {nazwa}_node

# PLAN na ERC

### Przed

 - konwersja mapy .e57 do jakiejś używalnej

### Dzień przed

 - test nawigacji na mapie od organizatorów
    - jeśli nie działa to robimy własną mapę