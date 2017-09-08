import time
import os
import cv2

global fullscreen
fullscreen = True

def setupNeuralNetwork():
    """ insert your stuff here ... """
    pass

def getCameraCapture(id = 0):
    """ get video from the webcam """
    cap = skvideo.io.VideoCapture(id)
    shape = getShape(cap)
    return cap, shape


def getShape(cap):
    """ get dimensions from capture object """
    x = int(cap.get(3))
    y = int(cap.get(4))
    shape = (x, y)
    print('Capture Resolution is: {0} by {1}'.format(x, y))
    return shape


def toggleFullscreen():
    """ switch between windowed and fullscreen display """
    global fullscreen
    fullscreen = not fullscreen
    if fullscreen:
        # cv2.setWindowProperty('window', cv2.WND_PROP_FULLSCREEN, cv2.cv.CV_WINDOW_FULLSCREEN)
        cv2.setWindowProperty('window', cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_AUTOSIZE)
    else:
        # cv2.setWindowProperty('window', cv2.WND_PROP_FULLSCREEN, cv2.cv.CV_WINDOW_AUTOSIZE)
        cv2.setWindowProperty('window', cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_NORMAL)


def interact():
    """ keyboard interaction """
    keyCode = cv2.waitKey(1) & 0xFF
    key = chr(keyCode)
    if key == 'q': # quit program
        end()
    if key == ' ': # toggle fullscreen
        toggleFullscreen()
        return


def end():
    capture.release()
    cv2.destroyAllWindows()
    quit()


if __name__ == '__main__':

    # setup your neural net
    setupNeuralNetwork()

    # keep looking for the camera, until it's available
    while True:
        capture, shape = getCameraCapture(1)
        if capture and shape[0] > 0:
            break
        time.sleep(5)

    width = 1280
    height = 720

    # force the desired resolution
    capture.set(cv2.CAP_PROP_FRAME_WIDTH, width)
    capture.set(cv2.CAP_PROP_FRAME_HEIGHT, height)

    # create a window that can be resized to fullscreen
    cv2.namedWindow('window', cv2.WND_PROP_FULLSCREEN)
    cv2.setWindowProperty('window', cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_NORMAL)
    cv2.resizeWindow('window', width, height)

    start = time.time()
    frame = 0

    while True:

        # Capture frame-by-frame
        success, img = capture.read()
        # data = img
        # img = model.run(img)

        cv2.imshow('window', img)

        t = time.time()
        fps = frame / ( t - start )
        frame = frame + 1
        print(fps)

        interact()
