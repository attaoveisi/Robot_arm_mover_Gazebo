# Robot_arm_mover_Gazebo
This is package for simulating the control process of a robot arm in Gazebo:




___________________________________________________________________________
Gazebo explained:
**1- Gazebo Server**


The first main component involved in running an instance of a Gazebo simulation is the Gazebo Server or also known by `gzserver`.


gzserver performs most of the heavy-lifting for Gazebo. It is responsible for parsing the description files related to the scene we are trying to simulate, as well as the objects within. It then simulates the complete scene using a physics and sensor engine.


**2- Gazebo Client**


The second main component involved in running an instance of a Gazebo simulation is the Gazebo Client or also known by gzclient.

gzclient on the other hand provides the very essential Graphical Client that connects to the gzserver and renders the simulation scene along with useful interactive tools. 


**3- World Files**


A world file in Gazebo contains all the elements in the simulated environment. These elements are the robot model, its environment, lighting, sensors, and other objects. The world file (with SDF: Simulation Description Format) usually has a `.world` extension and can be simulated as such: `gazebo foo.world` 

an example would be :


```
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


```
<include>
  <uri>model://model_file_name</uri>
</include>
```

**5- Environment Variables**


There are many environment variables that Gazebo uses, primarily to locate files (world, model, …) and set up communications between `gzserver` and `gzclient`. 

