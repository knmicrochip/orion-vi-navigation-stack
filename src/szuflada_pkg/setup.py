from setuptools import find_packages, setup

package_name = 'szuflada_pkg'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='ludrol',
    maintainer_email='jot.s.gam@gmail.com',
    description='Package to operate yellow szuflda robot, test vehicle before rover.',
    license='Apache',
    extras_require={
        'test': [
            'pytest',
        ],
    },
    entry_points={
        'console_scripts': [
            'slam_node = szuflada_pkg.slam_node:main'
            'telemetry_node = szuflada_pkg.telemetry_node:main'
        ],
    },
)
