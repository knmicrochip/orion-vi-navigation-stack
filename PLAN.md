# What is the plan?

1. Make jazzy docker container
	- [Installing Jazzy](https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debians.html)
2. Install ros-jazzy-realsense2
	- [Install the package](https://github.com/realsenseai/realsense-ros?tab=readme-ov-file#installation-on-ubuntu)
3. Install ros-jazzy-rtabmap-ros
	- [Install the package](https://github.com/introlab/rtabmap_ros?tab=readme-ov-file#installation)
4. …
5. Have a working rover
# Endless TODO
- [ ] Evaluate navigation libraries
- [ ] Automate docker build process
- [ ] Unknown Unknowns

# Bad Diagram
```
┌────────────────────────┐                                      
│                        │                                      
│ Intel realsense camera │                                      
│                        │                                      
└───────────┬────────────┘                                      
            │                                                   
            │                                                   
            │                                                   
┌───────────▼────────────┐                                      
│    ┌──────────────┐    │                                      
│    │librealsense2 │    │                                      
│    └──────────────┘    │                                      
│                        │                                      
│  ros-jazzy-realsense2  │                                      
│                        │                                      
└───────────┬────────────┘                                      
            │                                                   
            │                                                   
SLAM        │                                                   
┌───────────▼────────────┐                                      
│    ┌──────────────┐    │                                      
│    │rtab-map      │    │                                      
│    └──────────────┘    │                                      
│                        ◄──────┐                               
│  ros-jazzy-rtabmap-ros │      │                               
│                        │      │                               
└───────────┬────────────┘      │                               
            │                   │                               
            │                   │                               
NAVIGATION  │                   │                               
┌───────────▼────────────┐      │                               
│    ┌──────────────┐    │      │                               
│    │???           │    │      │                               
│    └──────────────┘    │      │                               
│                        ◄──────┤                               
│ ???                    │      │                               
│                        │      │                               
└───────────┬────────────┘      │                               
            │                   │                               
            │                   │                               
            │                   │                               
┌───────────▼────────────┐      │     ┌────────────────────────┐
│                        │      │     │                        │
│   ???                  │      └─────┘ Remote Control         │
│                        ├────────────►                        │
│                        ◄────────────┤                        │
│                        │            │                        │
│                        │            │                        │
└───────────┬────────────┘            └────────────────────────┘
            │                                                   
          MQTT                                                  
            │                                                   
┌───────────▼────────────┐                                      
│                        │                                      
│ Motors and other stuff │                                      
│                        │                                      
│                        │                                      
│                        │                                      
└────────────────────────┘                                      
```
