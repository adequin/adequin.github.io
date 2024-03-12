import rhinoscriptsyntax as rs
import Rhino.Geometry as rg
import math
import copy

############################################################
################ CREATING CELL VERTICES #################### 
############################################################

#input parameters
cap_len = 10 #dimension of base square
arm_len = 10 #length of "arms" extending from base square
arm_width = 10 #width of the arms
arm_angle = math.pi/3 #fold angle of the arm

# final dictionary cell_coords = {"1", "2", "3", "4", "1A", "1B", "1F", "2A", "2B", "2F", "3A", "3C", "3F", "4A", "4B", "4F", "5", "6", "7", "8"}
# "F" is for fold, the vertices folded in the corners
# "A" and "B" is for each vertex at the edges extending from the base square
# "1" - "8" is the bottom 4 and top 4 vertices
    
cell_coords = {} #main vertex dictionary
height = math.sin(arm_angle)*arm_len
dist = math.cos(arm_angle)*arm_len
mid = cap_len/2
#constraint: domain of fold angle ends when coords of "1A" = "4A"
#this happens when mid - arm_width/2
if (mid-arm_width/2 <= -dist):
    arm_angle = math.acos((arm_width - cap_len)/(2*arm_len)) 
height = math.sin(arm_angle)*arm_len
dist = math.cos(arm_angle)*arm_len
############### create 4 base points in bottom level #################
vert_bot = {"1":[0,0,0], 
            "2":[cap_len, 0, 0], 
            "3":[cap_len, cap_len, 0], 
            "4":[0, cap_len, 0]}
cell_coords.update(vert_bot)

############### create 8 points in middle level ######################
#gets midpoints of caps to use arm_width
midpoints = {"12":[mid, -dist, height],
            "23":[cap_len+dist, mid, height],
            "34":[mid, cap_len+dist, height],
            "41":[-dist, mid, height]}


#create the 8 edge points by offsetting the midpoints
vert_arm = {}
for idx in range(1,5):
    midcoord = (midpoints[str(idx)+str(idx%4+1)]) #creates copy so it doesnt point to same address?
    vert_arm[str(idx)+"A"] = copy.deepcopy(midcoord) #sets value as midpoint coordinates temporarily
    vert_arm[str(idx)+"B"] = copy.deepcopy(midcoord) #sets value as midpoint coordinates temporarily

    if idx%2:
        vert_arm[str(idx)+"A"][0] = vert_arm[str(idx)+"A"][0] - arm_width/2 #offsets norm1 value by width parameter
        vert_arm[str(idx)+"B"][0] = vert_arm[str(idx)+"B"][0] + arm_width/2 #offsets norm1 value by width parameter the other way
    else:
        vert_arm[str(idx)+"A"][1] = vert_arm[str(idx)+"A"][1] - arm_width/2 #offsets y value by width parameter 
        vert_arm[str(idx)+"B"][1] = vert_arm[str(idx)+"B"][1] + arm_width/2 #offsets y value by width parameter the other way #offsets y value by width parameter the other way
cell_coords.update(vert_arm)

################## create fold intersections points ################
#get axis vectors starting at midpoints of arm verts ending at midpoints of bottom verts
axis1 = [0,0,0]
axis2 = [0,0,0]
for i in range(3):
    axis1[i] = [mid,0,0][i] - midpoints["12"][i] 
    axis2[i] = [0,mid,0][i] - midpoints["41"][i]


#normalize by finding norm
def distance(coord, origin):
    """returns the distance between 2 points given as coordinate lists [x,y,z]"""
    distance = ((coord[0]-origin[0])**2 + (coord[1]-origin[1])**2  + (coord[2]-origin[2])**2 )**(0.5)
    return distance
norm = distance(axis1, [0,0,0]) #calculate norm

for i in range(3): 
    axis1[i] = axis1[i]/norm #normalize
    axis2[i] = axis2[i]/norm

c1 = cell_coords["1A"] #circle 1 origin
c2 = cell_coords["4A"] #circle 2 origin

# implement cross product to find orthogonal vectors
def cross(v1,v2):
    a = (v1[1]*v2[2]-v1[2]*v2[1])
    b = (v1[0]*v2[2]-v1[2]*v2[0])
    c = (v1[0]*v2[1]-v1[1]*v2[0])
    return [a,-b,c]
    
a1 = [1,0,0] # first vector normal to axis1
b1 = cross(a1,axis1) # get second normal vector
a2 = [0,1,0] # first vector normal to axis2
b2 = cross(axis2,a2) # get second normal vector 
 
#using define variables
r = (cap_len - arm_width)/2 + arm_len # circle radius 
c = (c1[0]-c2[0])/r 
a = a1[0]-a2[0] 
b = b1[0]-b2[0]

#solve for parameter using x equations for circle1 and circle2
t1 = math.acos((c*a+b*(a**2+b**2-c**2)**(1/2))/(a**2+b**2)) #parameter for intersection 1 (upper)
t2 = math.acos((c*a-b*(a**2+b**2-c**2)**(1/2))/(a**2+b**2)) #parameter for intersection 2 (lower)

#circle parametric equation
def coords(t,a,b,r,c):
    """returns coordinates of a point on a circle defined by 
    angle parameter t
    plane vectors a 
    plane vectorb
    radius r
    origin c"""
    return [c[0] + r*math.cos(t)*a[0] + r*math.sin(t)*b[0],
            c[1] + r*math.cos(t)*a[1] + r*math.sin(t)*b[1],
            c[2] + r*math.cos(t)*a[2] + r*math.sin(t)*b[2]]

#plug in parameter for circle 1 to find intersection coordinates
intsec = coords(math.pi-t1,a1,b1,r,c1)
intsec2 = coords(math.pi+t2,a1,b1,r,c1) # add pi because acos is only 0<t<pi

#using rhino methods for circle intersection
# plane1 = rg.Plane(rs.coerce3dpoint(cell_coords["1A"]), rs.coerce3dvector(axis1))                     
# circle1 = rg.Circle(plane1, r) #creates 1A circle

# plane2 = rg.Plane(rs.coerce3dpoint(cell_coords["4A"]), rs.coerce3dvector(axis2)) 
# circle2 = rg.Circle(plane2, r) #create 4A circle

# intsec = rg.Intersect.Intersection.CircleCircle(circle1, circle2)[1] # takes top intersection point


#create 4 fold points
fold_vert = {}

if (arm_angle==0): #if angle is flat
    xf = intsec[0]
    yf = intsec[1]
    zf = intsec[2]
    shift = cap_len-2*xf #same for norm1 and y shifts
    fold_vert["1F"] = [xf, yf, zf]
    fold_vert["2F"] = [xf+shift, yf, zf]
    fold_vert["3F"] = [xf+shift, yf+shift, zf]
    fold_vert["4F"] = [xf, yf+shift, zf]
else:
    #use "intsec" to "1" line equation set equal to height
    coef = [0,0,0]
    for i in range(3): #calculate coef vector
        coef[i] = intsec[i] - cell_coords["1"][i]
    t = (height - cell_coords["1"][2])/coef[2] #calculate parameter using z
    xf = coef[0]*t
    yf = coef[1]*t
    zf = coef[2]*t
    shift = cap_len-2*xf #same for norm1 and y shifts
    fold_vert["1F"] = [xf, yf, zf]
    fold_vert["2F"] = [xf+shift, yf, zf]
    fold_vert["3F"] = [xf+shift, yf+shift, zf]
    fold_vert["4F"] = [xf, yf+shift, zf]
    
cell_coords.update(fold_vert)


############### create 4 points in top level #################
vert_top = {"5":[0,0,2*height], 
            "6":[cap_len, 0, 2*height], 
            "7":[cap_len, cap_len, 2*height], 
            "8":[0, cap_len, 2*height]}
cell_coords.update(vert_top)

############################################################
################ CREATING RHINO OBJECTS #################### 
############################################################

############### create point objects in rhino #################
def addvert(point_dict, coord_dict):
    """adds points to dictionary 1 using vertex coordinates from dictionary 2"""
    for key, pt in coord_dict.items():
        point_dict[key] = rs.CreatePoint(pt)
cell_points={}
addvert(cell_points, cell_coords)

# ############### create surface objects in rhino #################  
def addfaces(face_dict, vert_dict):
    """adds surfaces to dictionary 1 using vertices from dictionary 2"""
    face_dict["bot"] = rg.NurbsSurface.CreateFromCorners(   vert_dict["1"], vert_dict["2"], vert_dict["3"], vert_dict["4"])
    face_dict["top"] = rg.NurbsSurface.CreateFromCorners(   vert_dict["5"], vert_dict["6"], vert_dict["7"], vert_dict["8"])  

    #create 4 bottom arm face_dict                                                                                                      
    face_dict["arm12"] = rg.NurbsSurface.CreateFromCorners( vert_dict["1"], vert_dict["2"], vert_dict["1B"], vert_dict["1A"])                                                                                                                                            
    face_dict["arm23"] = rg.NurbsSurface.CreateFromCorners( vert_dict["2"], vert_dict["3"], vert_dict["2B"], vert_dict["2A"])
    face_dict["arm34"] = rg.NurbsSurface.CreateFromCorners( vert_dict["3"], vert_dict["4"], vert_dict["3A"], vert_dict["3B"])
    face_dict["arm41"] = rg.NurbsSurface.CreateFromCorners( vert_dict["4"], vert_dict["1"], vert_dict["4A"], vert_dict["4B"])
                                                        
    #create 4 top arm face_dict                                                    
    face_dict["arm56"] = rg.NurbsSurface.CreateFromCorners( vert_dict["5"], vert_dict["6"], vert_dict["1B"], vert_dict["1A"])
    face_dict["arm67"] = rg.NurbsSurface.CreateFromCorners( vert_dict["6"], vert_dict["7"], vert_dict["2B"], vert_dict["2A"])
    face_dict["arm78"] = rg.NurbsSurface.CreateFromCorners( vert_dict["7"], vert_dict["8"], vert_dict["3A"], vert_dict["3B"])
    face_dict["arm85"] = rg.NurbsSurface.CreateFromCorners( vert_dict["8"], vert_dict["5"], vert_dict["4A"], vert_dict["4B"])
                                                        
    #create 8 bottom fold face_dict
    face_dict["bot1A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["1"], vert_dict["1A"], vert_dict["1F"])
    face_dict["bot1B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["2"], vert_dict["1B"], vert_dict["2F"])
    face_dict["bot2A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["2"], vert_dict["2A"], vert_dict["2F"])
    face_dict["bot2B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["3"], vert_dict["2B"], vert_dict["3F"])
    face_dict["bot3A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["3"], vert_dict["3B"], vert_dict["3F"])
    face_dict["bot3B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["4"], vert_dict["3A"], vert_dict["4F"])
    face_dict["bot4A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["4"], vert_dict["4B"], vert_dict["4F"])
    face_dict["bot4B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["1"], vert_dict["4A"], vert_dict["1F"])

    #create 8 top fold face_dict
    face_dict["top1A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["5"], vert_dict["1A"], vert_dict["1F"])
    face_dict["top1B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["6"], vert_dict["1B"], vert_dict["2F"])
    face_dict["top2A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["6"], vert_dict["2A"], vert_dict["2F"])
    face_dict["top2B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["7"], vert_dict["2B"], vert_dict["3F"])
    face_dict["top3A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["7"], vert_dict["3B"], vert_dict["3F"])
    face_dict["top3B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["8"], vert_dict["3A"], vert_dict["4F"])
    face_dict["top4A"] = rg.NurbsSurface.CreateFromCorners( vert_dict["8"], vert_dict["4B"], vert_dict["4F"])
    face_dict["top4B"] = rg.NurbsSurface.CreateFromCorners( vert_dict["5"], vert_dict["4A"], vert_dict["1F"])

cell_faces = {}
addfaces(cell_faces,cell_points)
facelist=[]
for face in cell_faces.values():
    facelist.append(face)




