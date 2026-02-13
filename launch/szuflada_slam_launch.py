from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription(
        [
            Node(
                package='szuflada_pkg',
                namespace='szuflada',
                executable='slam_node',
                name='szuflada',
                arguments=[]
                )

        ]
    )