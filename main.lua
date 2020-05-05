--[[
This is a lua script that will help you find out how big your music library will
be in multiple file formats. Please refer to the README for more information.

If you do modify it as your own application, please keep this comment block, so
people can know I am the original author. Thank you :)

Original Author: Kiiwii
Made in: May 2020
--]]

local filetypes={
	['mp3'] = function(x) return x end,
	['wav'] = function(x) return x end
}

local size={
	['mb'] = function(x) return x end,
	['gb'] = function(x) return x end
}

local function errorfile()
	print "Unknown file type!"
end

local function errorsize()
	print "Unknown file size!"
end

print('How many songs are in your library?')
local num1 = io.read()

print('What file type your songs? (mp3 or wav)')
local file = filetypes[io.read()] or errorfile

print('What file size? (mb or gb)')
local sizes = size[io.read()] or errorsize

-- MP3 min, max and avg at 128kbps in MB
local mp3minmb = file(num1*1)
local mp3maxmb = file(num1*3)
local mp3avgmb = file((mp3minmb+mp3maxmb)/2)

-- MP3 min, max and avg at 128kbps in GB
local mp3mingb = mp3minmb/1024
local mp3maxgb = mp3maxmb/1024
local mp3avggb = mp3avgmb/1024

-- WAV min, max and avg in MB
local wavminmb = file(num1*10)
local wavmaxmb = file(num1*40)
local wavavgmb = file((wavminmb+wavmaxmb)/2)

-- WAV min, max and avg in GB
local wavmingb = wavminmb/1024
local wavmaxgb = wavmaxmb/1024
local wavavggb = wavavgmb/1024

-- Calculates sizes in MB
if file == filetypes.mp3 and sizes == size.mb then
	print('MP3 Minimum size: ', mp3minmb,'mb')
	print('MP3 Maximum size: ', mp3maxmb,'mb')
	print('MP3 Average size: ', mp3avgmb,'mb')
elseif file == filetypes.wav and sizes == size.mb then
	print('WAV Minimum size: ', wavminmb,'mb')
	print('WAV Maximum size: ', wavmaxmb,'mb')
	print('WAV Average size: ', wavavgmb,'mb')
end

-- Calculates sizes in GB
if file == filetypes.mp3 and sizes == size.gb then
	print('MP3 Minimum size: ', mp3mingb,'gb')
	print('MP3 Maximum size: ', mp3maxgb,'gb')
	print('MP3 Average size: ', mp3avggb,'gb')
elseif file == filetypes.wav and sizes == size.gb then
	print('WAV Minimum size: ', wavmingb,'gb')
	print('WAV Maximum size: ', wavmaxgb,'gb')
	print('WAV Average size: ', wavavggb,'gb')
end

print('Press ENTER to quit.')

io.read()
os.exit()
