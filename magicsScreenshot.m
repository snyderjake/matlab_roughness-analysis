
test = screenShot();

%BW = imbinarize(rgb2gray(imgData));
gr = rgb2gray(test);
BW = imbinarize(gr);
imshow(gr)

robot.mouseMove(1572,194)
robot.mousePress(InputEvent.BUTTON1_MASK)
robot.mouseRelease(InputEvent.BUTTON1_MASK)
pause(0.1)

robot.mouseMove(1572,230)
robot.mousePress(InputEvent.BUTTON1_MASK)
robot.mouseRelease(InputEvent.BUTTON1_MASK)
pause(0.1)

robot.keyPress(KeyEvent.VK_LEFT)


function imgData = screenShot()
    import java.awt.event.*;
    robot = java.awt.Robot();
    pos = [9 100 1492 900]; % [left top width height]
    rect = java.awt.Rectangle(pos(1),pos(2),pos(3),pos(4));
    cap = robot.createScreenCapture(rect);
    % Convert to an RGB image
    rgb = typecast(cap.getRGB(0,0,cap.getWidth,cap.getHeight,[],0,cap.getWidth),'uint8');
    imgData = zeros(cap.getHeight,cap.getWidth,3,'uint8');
    imgData(:,:,1) = reshape(rgb(3:4:end),cap.getWidth,[])';
    imgData(:,:,2) = reshape(rgb(2:4:end),cap.getWidth,[])';
    imgData(:,:,3) = reshape(rgb(1:4:end),cap.getWidth,[])';
end