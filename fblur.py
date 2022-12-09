import argparse
import cv2
import numpy as np

# Parse the command-line arguments
parser = argparse.ArgumentParser()
parser.add_argument('image_file', type=str, help='the image file to process')
args = parser.parse_args()

# Load the image from the file
img = cv2.imread(args.image_file, cv2.IMREAD_COLOR)
print(img.shape)

# Compute the Fourier transform of the image
fourier = [np.fft.fft2(img[:, :, i]) for i in range(3)]

# Create a VideoWriter object for the output video
fourcc = cv2.VideoWriter_fourcc(*'FMP4')
out = cv2.VideoWriter('output.avi', fourcc, 30, img.shape[:2])

# Iterate over the desired resolution levels
for level in range(1, img.shape[0] + 1):

    # Compute the inverse Fourier transform with the given resolution
    inverse = np.stack([np.fft.ifft2(fourier[i], (level, level)) for i in
                        range(3)])

    # Convert the complex result to a real-valued image
    result = np.abs(inverse)
    result = np.uint8(result / result.max() * 255)
    print(result.shape)

    # Resize the result to the original size of the image
    result = [cv2.resize(
        result[i], img[:, :, i].shape, interpolation=cv2.INTER_LINEAR)
        for i in range(3)]
    result = np.uint8(np.stack(result)).reshape(img.shape[:2] + (3,))
    print(result.shape, result.min(), result.max())

    # Add the frame to the output video
    out.write(result)

# Release the VideoWriter object
out.release()
cv2.destroyAllWindows()
