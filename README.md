# Robot-arm in Gazebo
This is package for simulating the control process of a robot arm in Gazebo:

## Simulation Interface:
/home/atta/Downloads/robot_arm.gif
![Alt Text](images/robot_arm.gif)

## How to run stuff after `catkin_make`:
#### Once the `simple_arm` package has been built, you can launch the simulation environment using
```sh
$ roslaunch simple_arm robot_spawn.launch
```

#### Interact with the arm using the safe_move service
Open a new terminal and type the following:
```sh
$ cd /home/workspace/catkin_ws/
$ source devel/setup.bash
$ rosservice call /arm_mover/safe_move "joint_1: 0.0 joint_2: 0.0"
```

## How to view image stream from the camera?
Camera image stream is published to the following topic:
```
/rgb_camera/image_raw
```

This stream can be viewed by following command in separate terminal:
```sh
$ rosrun image_view image_view image:=/rgb_camera/image_raw
```


## Gazebo explained:

**1- Gazebo Server**


The first main component involved in running an instance of a Gazebo simulation is the Gazebo Server or also known by `gzserver`.


gzserver performs most of the heavy-lifting for Gazebo. It is responsible for parsing the description files related to the scene we are trying to simulate, as well as the objects within. It then simulates the complete scene using a physics and sensor engine.


**2- Gazebo Client**


The second main component involved in running an instance of a Gazebo simulation is the Gazebo Client or also known by gzclient.

gzclient on the other hand provides the very essential Graphical Client that connects to the gzserver and renders the simulation scene along with useful interactive tools. 


**3- World Files**


A world file in Gazebo contains all the elements in the simulated environment. These elements are the robot model, its environment, lighting, sensors, and other objects. The world file (with SDF: Simulation Description Format) usually has a `.world` extension and can be simulated as such: `gazebo foo.world` 

an example would be :


```sh
<?xml version="1.0" ?>
<sdf version="1.5">
  <world name="default">
    <physics type="ode">
      ...
    </physics>

    <scene>
      ...
    </scene>

    <model name="box">
      ...
    </model>

    <model name="sphere">
      ...
    </model>

    <light name="spotlight">
      ...
    </light>

  </world>
</sdf>
```

**4- Model Files**


For simplification, the SDF file of the robot with exactly the same format as the world file is created separately. This model file should only represent a single model (ex: a robot) and can be imported by the world file. The need to keep the robot model in a separate file is to use it in other projects. To include a model file of a robot or any other model inside the world file, the following code can be added to the world’s SDF file:


```sh
<include>
  <uri>model://model_file_name</uri>
</include>
```

**5- Environment Variables**


There are many environment variables that Gazebo uses, primarily to locate files (world, model, …) and set up communications between `gzserver` and `gzclient`. 

