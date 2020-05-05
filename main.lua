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

local bitrate={
	['medium'] = function(x) return x end,
	['good'] = function(x) return x end,
	['best'] = function(x) return x end
}

-- If the user inputs anything that isn't a file type implemented.
local function errorfile()
	print 'Unknown file type!'
end

-- If the user inputs anything that isn't a known file size.
local function errorsize()
	print 'Unknown file size!'
end

-- If the user inputs anything that isn't a known bitrate.
local function errorbitrate()
	print 'Unknown bitrate!'
end

print('How many songs are in your library?')
local num1 = io.read()

print('What file type your songs? (mp3 or wav)')
local file = filetypes[io.read()] or errorfile

if file == filetypes.mp3 then
	print('What is your bitrate? (medium = 192, good = 256, best = 320)')
end
local brate = bitrate[io.read()] or errorbitrate

print('What file size? (mb or gb)')
local sizes = size[io.read()] or errorsize

-- MP3 min, max and avg at 192kbps in MB
local mp3min128mb = file(num1*1.44)
local mp3max128mb = file(num1*5.76)
local mp3avg128mb = file((mp3min128mb+mp3max128mb)/2)

-- MP3 min, max and avg at 192kbps in GB
local mp3min128gb = mp3min128mb/1024
local mp3max128gb = mp3max128mb/1024
local mp3avg128gb = mp3avg128mb/1024

-- MP3 min, max and avg at 256kbps in MB
local mp3min256mb = file(num1*1.92)
local mp3max256mb = file(num1*7.68)
local mp3avg256mb = file((mp3min256mb+mp3max256mb)/2)

-- MP3 min, max and avg at 256kbps in GB
local mp3min256gb = mp3min256mb/1024
local mp3max256gb = mp3max256mb/1024
local mp3avg256gb = mp3avg256mb/1024

-- MP3 min, max and avg at 320kbps in MB
local mp3min320mb = file(num1*2.4)
local mp3max320mb = file(num1*9.6)
local mp3avg320mb = file((mp3min320mb+mp3max320mb)/2)

-- MP3 min, max and avg at 320kbps in GB
local mp3min320gb = mp3min320mb/1024
local mp3max320gb = mp3max320mb/1024
local mp3avg320gb = mp3avg320mb/1024

-- WAV min, max and avg in MB
local wavminmb = file(num1*10)
local wavmaxmb = file(num1*40)
local wavavgmb = file((wavminmb+wavmaxmb)/2)

-- WAV min, max and avg in GB
local wavmingb = wavminmb/1024
local wavmaxgb = wavmaxmb/1024
local wavavggb = wavavgmb/1024

-- Calculates 128kbps MP3 in megabytes
if file == filetypes.mp3 and sizes == size.mb and brate == bitrate.medium then
	print('MP3 Minimum size: ', mp3min128mb,'mb')
	print('MP3 Maximum size: ', mp3max128mb,'mb')
	print('MP3 Average size: ', mp3avg128mb,'mb')
-- Calculates 256kbps MP3 in megabytes
elseif file == filetypes.mp3 and sizes == size.mb and brate == bitrate.good then
	print('MP3 Minimum size: ', mp3min256mb,'mb')
	print('MP3 Maximum size: ', mp3max256mb,'mb')
	print('MP3 Average size: ', mp3avg256mb,'mb')
-- Calculates 320kbps MP3 in megabytes
elseif file == filetypes.mp3 and sizes == size.mb and brate == bitrate.best then
	print('MP3 Minimum size: ', mp3min320mb,'mb')
	print('MP3 Maximum size: ', mp3mac320mb,'mb')
	print('MP3 Average size: ', mp3avg320mb,'mb')
-- Calculates WAV in megabytes
elseif file == filetypes.wav and sizes == size.mb then
	print('WAV Minimum size: ', wavminmb,'mb')
	print('WAV Maximum size: ', wavmaxmb,'mb')
	print('WAV Average size: ', wavavgmb,'mb')
end

-- Calculates 128kbps MP3 in gigabytes
if file == filetypes.mp3 and sizes == size.gb and brate == bitrate.medium then
	print('MP3 Minimum size: ', mp3min128gb,'gb')
	print('MP3 Maximum size: ', mp3max128gb,'gb')
	print('MP3 Average size: ', mp3avg128gb,'gb')
-- Calculates 256kbps MP3 in gigabytes
elseif file == filetypes.mp3 and sizes == size.gb and brate == bitrate.good then
	print('MP3 Minimum size: ', mp3min256gb,'gb')
	print('MP3 Maximum size: ', mp3max256gb,'gb')
	print('MP3 Average size: ', mp3avg256gb,'gb')
-- Calculates 320kbps MP3 in gigabytes
elseif file == filetypes.mp3 and sizes == size.gb and brate == bitrate.best then
	print('MP3 Minimum size: ', mp3min320gb,'gb')
	print('MP3 Maximum size: ', mp3max320gb,'gb')
	print('MP3 Average size: ', mp3avg320gb,'gb')
-- Calculates WAV in gigabytes
elseif file == filetypes.wav and sizes == size.gb then
	print('WAV Minimum size: ', wavmingb,'gb')
	print('WAV Maximum size: ', wavmaxgb,'gb')
	print('WAV Average size: ', wavavggb,'gb')
end

print('Press ENTER to quit.')

io.read()
os.exit()
