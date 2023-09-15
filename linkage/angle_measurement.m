function angle_measurement(im)
% Create figure, setting up properties
%figure('Name','My Angle Measurement Tool',...
%     'NumberTitle','off',...
%      'IntegerHandle','off');
% Display image in the axes % Display image
%imshow(im)
% Get size of image.
%m = size(im,1);
%n = size(im,2);
X=get(gca,'Xlim');
Y=get(gca,'Ylim');
m=X(1,2)-X(1,1);
n=Y(1,2)-Y(1,2);
% Get center point of image for initial positioning.
midy = ceil(m/2);
midx = ceil(n/2);
% Position first point vertically above the middle.
firstx = midx;
firsty = midy - ceil(m/4);
lastx = midx + ceil(n/4);
lasty = midy;
% Create a two-segment right-angle polyline centered in the image.
h = impoly(gca,[firstx,firsty;midx,midy;lastx,lasty],'Closed',false);
api = iptgetapi(h);
initial_position = api.getPosition()
% Display initial position
updateAngle(initial_position)
% set up callback to update angle in title.
api.addNewPositionCallback(@updateAngle);
fcn = makeConstrainToRectFcn('impoly',get(gca,'XLim'),get(gca,'YLim'));
api.setPositionConstraintFcn(fcn);
%

% Callback function that calculates the angle and updates the title.
% Function receives an array containing the current x,y position of
% the three vertices.
function updateAngle(p)
% Create two vectors from the vertices.
% v1 = [x1 - x2, y1 - y2]
% v2 = [x3 - x2, Y3 - y2]
v1 = [p(1,1)-p(2,1), p(1,2)-p(2,2)];
v2 = [p(3,1)-p(2,1), p(3,2)-p(2,2)];
% Find the angle.
theta = acos(dot(v1,v2)/(norm(v1)*norm(v2)));
% Convert it to degrees.
angle_degrees = (theta * (180/pi));
% Display the angle in the title of the figure.
title(sprintf('(%1.0f) degrees',angle_degrees));