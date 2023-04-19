import random
import numpy as np
from enum import Enum


class Direction(Enum):
    RIGHT = -1
    LEFT = 1

    def opposite(self):
        return Direction.RIGHT if self == Direction.LEFT else Direction.LEFT


class Ring(Enum):
    HORIZONTAL = 0
    VERTICAL_FRONT = 1
    VERTICAL_SIDE = 2


class ANSIColor(Enum):
    Green = 1
    White = 2
    Blue = 3
    Yellow = 4
    Red = 5
    Magenta = 6  # no ANSI orange ):


colorTranslations = {
    ANSIColor.Green.value: "\u001b[32m",
    ANSIColor.White.value: "\u001b[37m",
    ANSIColor.Blue.value: "\u001b[34m",
    ANSIColor.Yellow.value: "\u001b[33m",
    ANSIColor.Red.value: "\u001b[31m",
    ANSIColor.Magenta.value: "\u001b[35m"
}


def createSide(color: ANSIColor):
    mat = np.full((3, 3, 2), (5, color.value))
    i = 1
    for row in range(3):
        for col in range(3):
            mat[row, col, 0] = i
            i += 1
    return mat


def rotateSide(side: np.ndarray, dir: Direction) -> np.ndarray:
    c = 1
    if dir == Direction.RIGHT:
        c = 3
    rotated = np.rot90(side, c, (0, 1))
    return rotated


class Cube:
    def __init__(self) -> None:
        self.top = createSide(ANSIColor.Magenta)
        self.front = createSide(ANSIColor.Green)
        self.right = createSide(ANSIColor.White)
        self.back = createSide(ANSIColor.Blue)
        self.left = createSide(ANSIColor.Yellow)
        self.bottom = createSide(ANSIColor.Red)

        self.horizontalRing = [self.front, self.right, self.back, self.left]
        self.verticalFrontRing = [self.top, self.back, self.bottom, self.front]
        self.verticalSideRing = [self.top, self.right, self.bottom, self.left]

    def __str__(self) -> str:
        result = ""
        for row in self.top:
            for item in row:
                result += colorTranslations[item[1]] + str(item[0])
            result += "\n"

        for row in range(3):
            for side in [self.front, self.right, self.back, self.left]:
                for item in side[row]:
                    result += colorTranslations[item[1]] + str(item[0])
                result += " "
            result += "\n"

        for row in self.bottom:
            for item in row:
                result += colorTranslations[item[1]] + str(item[0])
            result += "\n"
        return result[:-1] + colorTranslations[ANSIColor.White.value]

    def rotate(self, ring: Ring, index, direction: Direction):
        if (not 0 <= index < 3):
            print("Invalid index.")
            exit(1)

        if ring == Ring.HORIZONTAL:
            tmp = self.horizontalRing[0][index].copy()
            for i in range(0, 4*direction.value, direction.value):
                self.horizontalRing[i][index] = self.horizontalRing[direction.value *
                                                                    (abs(i+direction.value) % 4)][index]
            self.horizontalRing[3*direction.value][index] = tmp

            if (index == 0):
                self.top = rotateSide(self.top, direction)
            elif (index == 2):
                self.bottom = rotateSide(self.bottom, direction)

        elif ring == Ring.VERTICAL_FRONT:
            if direction == Direction.RIGHT:
                tmp = self.top[:, index].copy()
                self.top[:, index] = self.front[:, index]
                self.front[:, index] = self.bottom[:, index]
                self.bottom[:, index] = self.back[:, 2-index][::-1]
                self.back[:, 2-index] = tmp[::-1]

            else:
                tmp = self.bottom[:, index].copy()
                self.bottom[:, index] = self.front[:, index]
                self.front[:, index] = self.top[:, index]
                self.top[:, index] = self.back[:, 2-index][::-1]
                self.back[:, 2-index] = tmp[::-1]

            if index == 0:
                self.left = rotateSide(self.left, direction.opposite())
            elif index == 2:
                self.right = rotateSide(self.right, direction)

        elif ring == Ring.VERTICAL_SIDE:
            if direction == Direction.LEFT:
                tmp = self.top[index][::-1].copy()
                self.top[index] = self.right[:, 2-index]
                self.right[:, 2-index] = self.bottom[2-index][::-1]
                self.bottom[2-index] = self.left[:, index]
                self.left[:, index] = tmp

            else:
                tmp = self.bottom[2-index].copy()
                self.bottom[2-index] = self.right[:, 2-index][::-1]
                self.right[:, 2-index] = self.top[index]
                self.top[index] = self.left[:, index][::-1]
                self.left[:, index] = tmp

            if index == 0:
                self.front = rotateSide(self.front, direction)
            elif index == 2:
                self.back = rotateSide(self.back, direction.opposite())

    def shuffle(self, turns):
        for i in range(turns):
            direction = random.choice([Direction.LEFT, Direction.RIGHT])
            ring = random.choice([Ring.HORIZONTAL, Ring.VERTICAL_FRONT])
            index = random.randint(0, 2)
            self.rotate(ring, index, direction)

    def printPrologConfiguration(self):
        abbr = {
            ANSIColor.Green.value: "Fr",
            ANSIColor.White.value: "Ri",
            ANSIColor.Blue.value: "Ba",
            ANSIColor.Yellow.value: "Le",
            ANSIColor.Red.value: "Bo",
            ANSIColor.Magenta.value: "To"
        }

        res = "["
        for side in [self.top, self.front, self.right, self.back, self.left, self.bottom]:
            res += "[\n"
            for row in side:
                res += "["
                for val, color in row:
                    res += f"{abbr[color]}{val},"
                res = res[:-1]
                res += "],\n"
            res = res[:-2]
            res += "\n],"
        res = res[:-1]
        res += "]\n"

        print(res)





if __name__ == "__main__":
    for i in range(3):
        print("rotateVerticalSide(")
        cube = Cube()
        cube.printPrologConfiguration()
        print(",\n")
        cube.rotate(Ring.VERTICAL_SIDE, i, Direction.RIGHT)
        cube.printPrologConfiguration()
        print(").")

