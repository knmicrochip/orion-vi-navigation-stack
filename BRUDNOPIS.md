# TODO

- [ ] launchfile
- [ ] Dockerfile
  - [x] Podstawowy Dockerfile
  - [ ] Budowa paczki w Dockerfile
- [ ] Graf/schemat nawigacji
- [ ] Konwersja mapy 3D na mapę kosztów
- [ ] Dobry SLAM to podstawa

# Sekcja ROS2

- do rozważenia nav2 albo easymapping
- w ros2 launch rtabmap_examples realsense_d435i_color.launch.py 
wiadomość mapy topic /mapData

# Sekcja Docker

```
docker build -f Dockerfile --tag orion
```
jeśli podman-remote używane to zamienić `docker` na `podmna-remote` (wskazówka: Użyj `alias` w `.bashrc`)

```
docker run --rm -it  orion
```

# Sekcja organizacja - skróty itp

## ROS2
- nazwa paczki {nazwa}_pkg
- nazwa węzła {nazwa}_node