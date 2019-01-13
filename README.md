# Software Challenge
UBC Snowbots Repository for the Software Challenge

## Table of Contents
- [Installation and Setup](#installation-and-setup)
  - [Important Notes](#important-notes)
- [Conventions](#conventions)
  - [Github](#github-conventions)
  - [Coding Conventions](#coding-conventions)
- [Testing](#testing)
  - [GTest](#gtest)
  - [Rostest](#rostest)
- [Debugging Tips](#debugging-tips)

## Installation and Setup

You will be downloading an Ubuntu ISO and multiple ROS packages with their respective dependencies.
It is highly recommended that you have access to high speed internet while doing this entire setup; 
if you're on campus use the `ubcsecure` or `resnet` networks for best results.

1. Install Ubuntu 16.04 (NOTE: To run you should get 16.04, as other Ubuntu Versions will be much more painful to setup with our repo **not** another version) (**Backup your important data first**) (We recommend you use a minimum of 30GB of space) 
    - For dual-booting: [Windows Instructions](https://www.tecmint.com/install-ubuntu-16-04-alongside-with-windows-10-or-8-in-dual-boot/), [Mac Instructions](https://www.maketecheasier.com/install-dual-boot-ubuntu-mac/)
    - _Note_: You should always choose the "install alongside Windows/OSX" during your installation (step 7 in the windows tutorial)
2. If you haven't done so already, setup your UBC alumni email account [here](https://id.ubc.ca/) 
3. Using your UBC email account, get a JetBrains education account [here](https://www.jetbrains.com/shop/eform/students)
    - _JetBrains will send an initial email to confirm the UBC email you inputted, 
    once you've confirmed another email will be sent to activate your new education account; 
    you will use this account to set up CLion later on_
4. Boot into Ubuntu for the remaining steps
5. Install git by running `sudo apt-get install git`
6. Clone this repository by running `git clone https://github.com/ubc-subbots/Software_Challenge.git ~/Software_Challenge`
7. To start set-up run `cd ~/Software_Challenge && ./get_started.sh` **(Do not run this script as root)**
    - _Just choose yes and enter your password when the terminal prompts you_ 
8. Build the ROS project by running `source /opt/ros/kinetic/setup.bash` and `cd ~/Software_Challenge && catkin_make` 
    - If everything compiles correctly and you don't get any errors, then you're good to go!
    
## The challenge!
1. The challenge is to get the turtle in the turtlesim simulator to perform a sinusoidal motion in the simulation area.
2. First you'll need to run the turtilesim, to run the turtlesim, follow the instructions at http://wiki.ros.org/turtlesim.
3. Use the solution.cpp to implement a solution where the turtlesim performs a sinusoidal wave. This can be done by publishing (http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28c%2B%2B%29) a geom_msgs/twist message to the /turtle1/cmd_vel topic. 
4. Once you've finished your solution contact Cam to demo it!

<p>
All of our development is done on Linux, more specifically Ubuntu. So, your first challenge is to get Ubuntu and our software	
                    stack up and running. </br>We've written some instructions to help you along, which	
                    can be found in our <a href="https://github.com/UBC-Snowbots/Software_Challenge#installation-and-setup">github repository</a>.	
                </p>	

                 <blockquote>	
                    <b>Note:</b> If you can complete the challenges through something other then a native Ubuntu install,	
                    such as through a VM or other Linux distro, that's fine too, but we're not going to offer any help getting	
                    non-native Ubuntu setup's running.	
                </blockquote>	

                 <h2>Challenge 2: TurtleSim Sine Wave</h2>	
                <p>	
                    OK, for this challenge, you'll need some pretty advanced mathematical skills. We're talking basic knowledge of what a sine	
                    function is... and that's about it. Seriously though, you don't need to know any advanced maths to join	
                    this team. Like I said in the intro, we're looking for people willing to learn	
                </p>	

                 <p>	
                    <b>As such, your challenge is to have <a href="http://wiki.ros.org/turtlesim">turtlesim</a> draw out a sine wave.</b>	
                </p>	
                <p>	
                    Since the build system for <a href="http://wiki.ros.org/">ROS</a> can be kinda complicated, we've provided	
                    you most of the framework for what you'll need.	
                </p>	
                <p>	
                    In <code>~/Software_Challenge/src/challenge/src/solution.cpp</code> you'll find a skeleton project, with a main	
                    function and a while loop, alongside a bunch of <a href="#Resources">resources down below</a>. You don't	
                    have to use this skeleton project, but we'd recommend it. You should be aiming for a final result that	
                    looks something like this:	
                </p>	

                 <img src="images/turtlesim-sine-wave-solution.gif"></img>	

                 <blockquote>	
                    <b>Note:</b> Please don't just use the keyboard controls to draw this. Yes. We thought of that. As pretty	
                    as I'm sure yours is, we're more concerned with your code!	
                </blockquote>	

                 <blockquote>	
                    <b>Note 2:</b> You can also write your solution in python get started	
                    <a href="http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber(python)">here</a>, but the resources	
                    below are C++ focused, and that's the language we'd prefer you use.	
                </blockquote>	



                 <p>	
                    <b>	
                        We'd suggest you start by understanding how ROS works <a href="http://robohub.org/ros-101-intro-to-the-robot-operating-system/">here</a>, 	
                        then walking through the <a href="http://wiki.ros.org/ROS/Tutorials">ROS Tutorials</a> (at least all of section 1.1)	
                    </b>	
                </p>	
                <p>	
                    We've done a lot of this stuff already, but it's important that you at least understand it. In particular, <b>#5-6</b>,	
                    <b>#11</b>, and <b>#13</b> are important for this challenge. After that, you should be pretty much ready	
                    to start! To run the skeleton project we've provided, first source the project by running:	
                </p>	

                 <p><code>$ cd ~/Software_Challenge && source devel/setup.sh</code></p>	
                <p>then run</p>	
                <p><code>$ rosrun challenge solution</code></p>	

                 <p>	
                    While you're working, we'd suggest you have the	

                     <a href="http://wiki.ros.org/turtlesim">turtlesim reference</a> open (mostly for <b>2.1.1</b> and <b>2.1.2</b>).	
                    It also contains some video tutorials, which may be of use. Make sure to take a look at the references	
                    for:	
                    <ul>	
                        <li>	
                            <a href="http://docs.ros.org/api/geometry_msgs/html/msg/Twist.html">geometry_msgs/Twist</a> (The	
                            command you send to the turtlebot)	
                        </li>	
                        <li>	
                            <a href="http://docs.ros.org/api/turtlesim/html/msg/Pose.html">turtlesim/Pose</a> (what the turtlebot	
                            is sending you).	
                        </li>	
                    </ul>	
                </p>	

                 <blockquote>	
                    <b>Note: </b> You might however, not have to use the <a href="http://docs.ros.org/api/turtlesim/html/msg/Pose.html">turtlesim/Pose</a>,	
                    as there are several ways to solve this problem.	
                </blockquote>	

                 <h2> Bonus: Make The Turtle Do Something Else</h2>	
                <p>	
                    The title sums this one up pretty nicely. You don't have to do this challenge, if you've gotten to this point, you've already	
                    done pretty well; but we encourage people to try things out and bring it to the interview, it helps us	
                    know how familiar you are with our system.	
                </p>	

                 <h2> Super Bonus: Testing</h2>	
                <p>	
                    This one's a fair bit harder, than the previous ones, so don't worry if you don't get it.	
                </p>	
                <p>	
                    For this, we want you to re-write the <b>Challenge</b> package into the non-simple configuration specified	
                    in the <b>README</b> (the one with testing) and write (and run) some unit tests for your solution!	
                </p>

### Important Notes:
- To run CLion with ROS, you must first go in to terminal, navigate to your project (`cd ~/Software_Challenge`), run `source devel/setup.sh` and then **from the same terminal** run `clion`
- CLion will not support auto-completion in your *.cpp* and *.h* files until you've added them to the CMake file

### Coding Conventions
- Every **.cpp** and **.h** file should start with 
```
/*
 * Created By: Someone
 * Created On: December 1st, 2000
 * Description: A quick description of what this file does/is for
 */
```

- Functions should be commented a la JavaDoc
- The Javadoc comment (below) should be directly above every function in the header file
```
/**
 * One line description of the function
 *
 * A longer and more in depth description of the function
 * if it is needed.
 * 
 * @param param_one the first parameter of the function
 * @param param_two the second parameter of the function whose
 *                  description goes longer than one line
 * @return what the function returns if it returns anything
 * 
 */
```

- Classes are **CamelCase**
- Variables are **non_camel_case**
- Constants are **ALL_CAPS_WITH_UNDERSCORES**
- Functions are **camelCase** - Indentations are 4 spaces

### Coordinate Systems
- We try to follow ROS standards, which can be found [here](http://www.ros.org/reps/rep-0103.html)
- x : forward
- y : left
- z : up
```
              +X
              ^
              |
      +θ  +<----->+ -θ
          |   |   |
          V   |   V
+Y <---------------------> -Y
              |
              |
              |
              V
              -X
```

## Creating a new node
- If your node is at all complicated, then this format should be followed. For simple nodes, please [see below](#creating-a-new-simple-node)
- Each node should be class based
- **MyNode.h** should contain your class declaration
- **MyNode.cpp** should contain your class definition
- **my_node.cpp** should be relatively small, and should just contain a **main** function to run your node
- **my-node-test.cpp** should contain all your gtest (unit test)
- **my_node_rostest.cpp** should contain your rostest (integrated test)
- For an example of this, please see `src/sample_package`
<pre>
some_ros_package
|  CMakeLists.txt
|  package.xml
└───src
|   | <b>MyNode.cpp</b> 
|   | <b>my_node.cpp</b>
|
└───launch
|   | <b>my_node.launch</b>
|
└───include
|   | <b>MyNode.h</b>
| 
└───test
|   | <b>my-node-test.cpp</b>
|   | <b>my_node_rostest.cpp</b>
|   | <b>sample_package_test.test</b>
</pre>

## Creating a new **simple** node
- You will not be able to write unit tests for this type of node, so it must be extremely simple
- **my_node.cpp** will contain the entire node, and will probably contain a `while(ros::ok()){}` loop
<pre>
some_ros_package
|  CMakeLists.txt
|  package.xml
└───src
|   | <b>my_node.cpp</b>
</pre>

## Testing
### GTest
- GTest is our primary testing tool at the moment. The ROS wiki has a quick intro to it [here](http://wiki.ros.org/gtest), and we also strongly recommend you read Google's introduction to it [here] (https://github.com/google/googletest/blob/master/googletest/docs/Primer.md), then setup and write a few example tests before you start using it with ROS.
- Once you've setup your tests in ROS, run `catkin_make run_tests` to run them
- To test a specific package, run `catkin_make run_tests_MY_PACKAGE_NAME`

### Rostest
- For tests which require more than one active node, i.e. integrated testing, the rostest framework provides a way to launch your test alongside all the nodes it requires. This is an extension on roslaunch enabling it to run test nodes. Special test nodes are nested within a `<test></test>` tag. This also needs a special entry under CMakelists as shown in the sample package. See more details [here](http://wiki.ros.org/rostest)
- Similar to launch files, the command is: `rostest package_name package_test_file.test`.

## Debugging Tips
- If something is happening that does not seem to correspond to your code, (ex. if your node is subscribing to the totally wrong topic) try deleting the `build` and `devel` folders (if present) to remove any "cached" information

