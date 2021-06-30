import math

def hilbert(points, x0, y0, xi, xj, yi, yj, n):

    if not n:
        line_x = x0 + (xi + yi)/2
        line_y = y0 + (xj + yj)/2
        points.append((line_x, line_y))
    else:
        n -= 1
        hilbert(points, x0,               y0,               yi/2, yj/2, xi/2, xj/2, n),
        hilbert(points, x0 + xi/2,        y0 + xj/2,        xi/2, xj/2, yi/2, yj/2, n),
        hilbert(points, x0 + xi/2 + yi/2, y0 + xj/2 + yj/2, xi/2, xj/2, yi/2, yj/2, n),
        hilbert(points, x0 + xi/2 + yi,   y0 + xj/2 + yj,  -yi/2,-yj/2,-xi/2,-xj/2, n),

# COLORS = [
#     (237,248,251, 220),
#     (129,15,124, 220),
#     (179,205,227, 220),
#     (136,86,167, 220),
#     (140,150,198),
# ]

COLORS = [ (255,175,204),
     (129,178,154, 220),
     (168,218,220, 220),
    (69,123,157, 220),
     (242,132,130),
          ]
def setup():
    size(1000, 1000)
    background(255)
    strokeWeight(3)
    global points, previous, counter, inc_counter
    points = []
    inc_counter = True
    counter = 1
    hilbert(points, 0, 0, width / 2, 0, 0, height / 2, counter)
    previous = points.pop()
    stroke(*COLORS[counter-1])

def draw():
    global points, previous, counter, inc_counter
    if not len(points):
        if not counter:
            inc_counter = True
        if counter == 5 and inc_counter:
            inc_counter = False
            counter += 1

        delay(1000)
        if inc_counter:
            counter += 1
            stroke(*COLORS[counter-1])
        else:
            counter -= 1
            stroke(255)
        hilbert(points, 0, 0, width / 2, 0, 0, height / 2, counter)
        previous = points.pop()
    else:
        h, w = height, width
        rotate_y = (h - math.sqrt((w / 2) ** 2 * 2)) / 2
        current = points.pop()
        pushMatrix()
        translate(width / 6, height/2)
        rotate(radians(-45))
        line(previous[0], previous[1], current[0], current[1])
        popMatrix()
        previous = current
