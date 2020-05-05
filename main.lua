--[[
This is my calculator to see how big your music library will be in the WAV 
format. The WAV format is a uncompressed, lossless audio type. It's basically
like your listening straight from the CD itself.

If you do modify it as your own application, please keep this comment block, so
people can know I am the original author. Thank you :)

Original Author: Kiiwii
Made in: May 2020
--]]

print('How many songs are in your library?')
local num1 = io.read()

-- This will hold the minimum, maximum and average of the file size in megabytes.
local min = num1*10
local max = num1*40
local avg = (min+max)/2

-- This will print the min, max, and avg of the music library in megabytes
print('Minimum size: ', min,'mb')
print('Maximum size: ', max,'mb')
print('Average size: ', avg,'mb')

os.exit()
