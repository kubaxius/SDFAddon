# Signed Distance Fields

Collection of Signed Distance Functions in the form of Godot Visual Shader Language nodes.

SDFs are shape-defining functions. You give them a point in n-dimensional space, and they tell you it's distance from the shape's surface. If the distance is negative, the point is inside, if it's positive, the point is outside. They are used mostly to generate images with use of raymarching, but they can be very useful in many scenarios.

This addon focuses on 3D space, but I will also add some 2D shapes in the future, mostly because you will be able to extrude/rotate them, to bring them to 3 dimensions.
## Thank you

Before I start, I would like to thank Inigo Quilez, for assembling a list of SDFs on 
[his awesome website](https://iquilezles.org/). This addon would not be possible without his work.
## Usage/Examples

There are two ways to use this addon. The first one is via **Visual Shaders**. There you just have to create an instance of a node that you are interested in, and then do whatever you want with it.

For example, you could use varying to get pixel positions from vertex shader in fragment shader. Then you could change every pixel inside the shape to a different color, and you could also animate transform of the shape, like this:

![App Screenshot](https://github.com/kubaxius/SDFAddon/blob/main/images/node_usage.PNG?raw=true)

And this would be the outcome:

![App Screenshot](https://github.com/kubaxius/SDFAddon/blob/main/images/torus_sphere.gif?raw=true)

You could also use it to generate shapes in smoke:

![App Screenshot](https://github.com/kubaxius/SDFAddon/blob/main/images/node_usage2.PNG?raw=true)
![App Screenshot](https://github.com/kubaxius/SDFAddon/blob/main/images/smoke_circle.PNG?raw=true)

### Non-visual Shaders
The second way is to use the addon in non-visual shaders. You just have to include the correct file, and use its function:

![App Screenshot](https://github.com/kubaxius/SDFAddon/blob/main/images/shader_includes.PNG?raw=true)

![App Screenshot](https://github.com/kubaxius/SDFAddon/blob/main/images/box_shader.PNG?raw=true)

In most files there are two functions: first is almost always a direct copy from [Inigo Quilez website](https://iquilezles.org/articles/distfunctions/). The second one is to make the first one more verbose, so I would advise to use it.
## Acknowledgements

 - [How you can use SDF functions in Godot](https://www.youtube.com/watch?v=0BXBXy8zaaI&)
 - [Library of 3D SDFs](https://iquilezles.org/articles/distfunctions/)
 - [Library of 2D SDFs](https://iquilezles.org/articles/distfunctions2d/)

