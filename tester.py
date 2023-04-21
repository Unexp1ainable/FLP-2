from argparse import ArgumentParser
import os
import subprocess
import time
from cube_generator import *

def parse_args():
    args = ArgumentParser()
    args.add_argument("-c", "--count", type=int, default=1, help="How many tests.")
    args.add_argument("-s", "--shuffles", type=int, default=5, help="How many rotations will be executed on a sorted cube before throwing it to the solver. (used only if -c was specified)")
    args.add_argument("-t", "--timeout", type=int, default=10, help="Timeout for one process run in seconds.")
    args.add_argument("-f", "--file", help="Path to a file with a cube.")
    args.add_argument("-d", "--dir", help="Path to a directory with files with cubes.")
    return args.parse_args()


def cubeResultGen(result: str):
    gen = vGen(result)
    while True:
        yield loadCube(gen)

def verifyResult(result: str) -> bool:
    if (result.strip() == ""):
        print("\u001b[31m---- FAILED  ----\u001b[37m")
        print("Solver did not return a solution")
        return False

    gen = cubeResultGen(result)

    try:
        firstCube = gen.__next__()
        shouldEnd = firstCube.isSolved()
    except ValueError:
        print("\u001b[31m---- FAILED  ----\u001b[37m")
        print("Invalid output format")
        return False

    while True:
        try:
            nextCube = gen.__next__()
            if not nextCube.isNextState(firstCube):
                print("\u001b[31m---- FAILED  ----\u001b[37m")
                print("Invalid rotation")
                print("From:")
                print(firstCube)
                print("\nTo:")
                print(nextCube)
                return False
            shouldEnd = nextCube.isSolved()
            firstCube = nextCube

        except:
            if (shouldEnd):
                print("\u001b[32mPASSED\u001b[37m")
                return True
            
            else:
                print("\u001b[31m---- FAILED  ----\u001b[37m")
                print("Solution did not end in completed state.")
                print("Last state:")
                print(firstCube)
                return False

    raise NotImplementedError("Achievement earned: How did we get here?")


def cubeGen(shuffles):
    while True:
        cube = Cube()
        cube.shuffle(shuffles)
        yield cube.nStr()
    
def cubeGenFiles(files):
    for filestr in files:
        print(filestr)
        cube = ""
        with open(filestr) as file:
            cube = file.read()
        yield cube

if __name__ == "__main__":
    args = parse_args()
    passed = 0

    files = []
    if args.dir:
        for path in os.listdir(args.dir):
            if os.path.isfile(os.path.join(args.dir, path)):
                files.append(f"{args.dir}/{path}")

    if args.file:
        files.append(args.file)

    gen = None
    test_count = 0
    if files:
        gen = cubeGenFiles(files)
        test_count = len(files)
    else:
        gen = cubeGen(args.shuffles)
        test_count = args.count


    for i in range(test_count):
        print("-------------------------")
        print(f"Test {i+1}/{test_count}")
        cube = gen.__next__()
        
        test_result = ""
        try:
            start_time = time.time()
            test = subprocess.run(["./flp22-log"], input=cube.encode(), stdout=subprocess.PIPE, timeout=args.timeout)
            end_time = time.time()

            if test.returncode != 0:
                print("\u001b[31m---- FAILED  ----\u001b[37m")
                print("Solver was not able to find a solution")
                continue

            test_result = test.stdout.decode("utf-8")
            vres = verifyResult(test_result)
            if vres:
                passed += 1
            print(f"Time: {round(time.time() - start_time, 2)} s")
        except subprocess.TimeoutExpired:
            print("\u001b[31m---- FAILED  ----\u001b[37m")
            print("Process timed out")
            print("Input cube:")
            print(cube)

    print("\n--------------------------")
    print(f"Passed {passed} out of {test_count} tests.")

