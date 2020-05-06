--[[
This is a lua script that will help you find out how big your music library will
be in multiple file formats. Please refer to the README for more information.

If you do modify it as your own application, please keep this comment block, so
people can know I am the original author. Thank you :)

Original Author: Kiiwii
Made in: May 2020
--]]

local filetypes={
	['flac'] = function(x) return x end,
	['mp3'] = function(x) return x end,
	['ogg'] = function(x) return x end,
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

local quality={
	['zero'] = function(x) return x end,
	['one'] = function(x) return x end,
	['two'] = function(x) return x end,
	['three'] = function(x) return x end,
	['four'] = function(x) return x end,
	['five'] = function(x) return x end,
	['six'] = function(x) return x end,
	['seven'] = function(x) return x end,
	['eight'] = function(x) return x end,
	['nine'] = function(x) return x end,
	['ten'] = function(x) return x end
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

local function errorquality()
	print 'Unknown quality! Did you spell out the number?'
end

print('How many songs are in your library?')
local num1 = io.read()

print('What file type your songs? (flac, mp3, ogg, wav)')
local file = filetypes[io.read()] or errorfile

if file == filetypes.mp3 then
	print('What is your bitrate? (medium = 192, good = 256, best = 320)')
end
local brate = bitrate[io.read()] or errorbitrate

if file == filetypes.ogg then
	print('What is the quality? (0-10 in word-form [ex: 0 is zero])')
end
local qual = quality[io.read()] or errorquality

print('What file size? (mb or gb)')
local sizes = size[io.read()] or errorsize

-- MP3 min, max and avg at 192kbps in MB
local mp3min192mb = file(num1*1.44)
local mp3max192mb = file(num1*5.76)
local mp3avg192mb = file((mp3min192mb+mp3max192mb)/2)

-- MP3 min, max and avg at 192kbps in GB
local mp3min192gb = mp3min192mb/1000
local mp3max192gb = mp3max192mb/1000
local mp3avg192gb = mp3avg192mb/1000

-- MP3 min, max and avg at 256kbps in MB
local mp3min256mb = file(num1*1.92)
local mp3max256mb = file(num1*7.68)
local mp3avg256mb = file((mp3min256mb+mp3max256mb)/2)

-- MP3 min, max and avg at 256kbps in GB
local mp3min256gb = mp3min256mb/1000
local mp3max256gb = mp3max256mb/1000
local mp3avg256gb = mp3avg256mb/1000

-- MP3 min, max and avg at 320kbps in MB
local mp3min320mb = file(num1*2.4)
local mp3max320mb = file(num1*9.6)
local mp3avg320mb = file((mp3min320mb+mp3max320mb)/2)

-- MP3 min, max and avg at 320kbps in GB
local mp3min320gb = mp3min320mb/1000
local mp3max320gb = mp3max320mb/1000
local mp3avg320gb = mp3avg320mb/1000

-- WAV min, max and avg in MB
local wavminmb = file(num1*10)
local wavmaxmb = file(num1*40)
local wavavgmb = file((wavminmb+wavmaxmb)/2)

-- WAV min, max and avg in GB
local wavmingb = wavminmb/1000
local wavmaxgb = wavmaxmb/1000
local wavavggb = wavavgmb/1000

-- FLAC min, max and avg in MB
local flacminmb = file(num1*5.58)
local flacmaxmb = file(num1*27.9)
local flacavgmb = file((flacminmb+flacmaxmb)/2)

-- FLAC min, max and avg in GB
local flacmingb = flacminmb/1000
local flacmaxgb = flacmaxmb/1000
local flacavggb = flacavgmb/1000

-- This prints out the size in MB
-- MP3 192kbps
if file == filetypes.mp3 and sizes == size.mb and brate == bitrate.medium then
	print('MP3 Minimum size: ', mp3min192mb,'mb')
	print('MP3 Maximum size: ', mp3max192mb,'mb')
	print('MP3 Average size: ', mp3avg192mb,'mb')
-- MP3 256kbps
elseif file == filetypes.mp3 and sizes == size.mb and brate == bitrate.good then
	print('MP3 Minimum size: ', mp3min256mb,'mb')
	print('MP3 Maximum size: ', mp3max256mb,'mb')
	print('MP3 Average size: ', mp3avg256mb,'mb')
-- MP3 320kbps
elseif file == filetypes.mp3 and sizes == size.mb and brate == bitrate.best then
	print('MP3 Minimum size: ', mp3min320mb,'mb')
	print('MP3 Maximum size: ', mp3mac320mb,'mb')
	print('MP3 Average size: ', mp3avg320mb,'mb')
-- WAV
elseif file == filetypes.wav and sizes == size.mb then
	print('WAV Minimum size: ', wavminmb,'mb')
	print('WAV Maximum size: ', wavmaxmb,'mb')
	print('WAV Average size: ', wavavgmb,'mb')
-- FLAC
elseif file == filetypes.flac and sizes == size.mb then
	print('FLAC Minimum size: ', flacminmb,'mb')
	print('FLAC Maximum size: ', flacmaxmb,'mb')
	print('FLAC Average size: ', flacavgmb,'mb')
end

-- This prints out the size in GB
-- MP3 192kbps
if file == filetypes.mp3 and sizes == size.gb and brate == bitrate.medium then
	print('MP3 Minimum size: ', mp3min192gb,'gb')
	print('MP3 Maximum size: ', mp3max192gb,'gb')
	print('MP3 Average size: ', mp3avg192gb,'gb')
-- MP3 256kbps
elseif file == filetypes.mp3 and sizes == size.gb and brate == bitrate.good then
	print('MP3 Minimum size: ', mp3min256gb,'gb')
	print('MP3 Maximum size: ', mp3max256gb,'gb')
	print('MP3 Average size: ', mp3avg256gb,'gb')
-- MP3 320kbps
elseif file == filetypes.mp3 and sizes == size.gb and brate == bitrate.best then
	print('MP3 Minimum size: ', mp3min320gb,'gb')
	print('MP3 Maximum size: ', mp3max320gb,'gb')
	print('MP3 Average size: ', mp3avg320gb,'gb')
-- WAV
elseif file == filetypes.wav and sizes == size.gb then
	print('WAV Minimum size: ', wavmingb,'gb')
	print('WAV Maximum size: ', wavmaxgb,'gb')
	print('WAV Average size: ', wavavggb,'gb')
-- FLAC
elseif file == filetypes.flac and sizes == size.gb then
	print('FLAC Minimum size: ', flacmingb,'gb')
	print('FLAC Maximum size: ', flacmaxgb,'gb')
	print('FLAC Average size: ', flacavggb,'gb')
end

-- This whole section is dedicated to the OGG format since there's eleven qualities.
local oggzeromin = file(num1*0.48)
local oggzeromax = file(num1*0.59)
local oggzeroavg = file((oggzeromin+oggzeromax)/2)

local oggonemin = file(num1*0.60)
local oggonemax = file(num1*0.71)
local oggoneavg = file((oggonemin+oggonemax)/2)

local oggtwomin = file(num1*0.72)
local oggtwomax = file(num1*0.83)
local oggtwoavg = file((oggtwomin+oggtwomax)/2)

local oggthreemin = file(num1*0.84)
local oggthreemax = file(num1*0.95)
local oggthreeavg = file((oggthreemin+oggthreemax)/2)

local oggfourmin = file(num1*0.96)
local oggfourmax = file(num1*1.10)
local oggfouravg = file((oggfourmin+oggfourmax)/2)

local oggfivemin = file(num1*1.20)
local oggfivemax = file(num1*1.43)
local oggfiveavg = file((oggfivemin+oggfivemax)/2)

local oggsixmin = file(num1*1.44)
local oggsixmax = file(num1*1.67)
local oggsixavg = file((oggsixmin+oggsixmax)/2)

local oggsevenmin = file(num1*1.68)
local oggsevenmax = file(num1*1.91)
local oggsevenavg = file((oggsevenmin+oggsevenmax)/2)

local oggeightmin = file(num1*1.92)
local oggeightmax = file(num1*2.30)
local oggeightavg = file((oggeightmin+oggeightmax)/2)

local oggninemin = file(num1*2.40)
local oggninemax = file(num1*3.76)
local oggnineavg = file((oggninemin+oggninemax)/2)

local oggtenmin = file(num1*3.75)
local oggtenmax = file(num1*5.10)
local oggtenavg = file((oggtenmin+oggtenmax)/2)

-- The buttload of if statements.
-- Megabytes first, biatch!
if file == filetypes.ogg and sizes == size.mb and qual == quality.zero then
	print('OGG quality zero size (Minimum): ', oggzeromin,'mb')
	print('OGG quality zero size (Maximum): ', oggzeromax,'mb')
	print('OGG quality zero size (Average): ', oggzeroavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.one then
	print('OGG quality one size (Minimum): ', oggonemin,'mb')
	print('OGG quality one size (Maximum): ', oggonemax,'mb')
	print('OGG quality one size (Average): ', oggoneavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.two then
	print('OGG quality two size (Minimum): ', oggtwomin,'mb')
	print('OGG quality two size (Maximum): ', oggtwomax,'mb')
	print('OGG quality two size (Average): ', oggtwoavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.three then
	print('OGG quality three size (Minimum): ', oggthreemin,'mb')
	print('OGG quality three size (Maximum): ', oggthreemax,'mb')
	print('OGG quality three size (Average): ', oggthreeavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.four then
	print('OGG quality four size (Minimum): ', oggfourmin,'mb')
	print('OGG quality four size (Maximum): ', oggfourmax,'mb')
	print('OGG quality four size (Average): ', oggfouravg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.five then
	print('OGG quality five size (Minimum): ', oggfivemin,'mb')
	print('OGG quality five size (Maximum): ', oggfivemax,'mb')
	print('OGG quality five size (Average): ', oggfiveavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.six then
	print('OGG quality six size (Minimum): ', oggsixmin,'mb')
	print('OGG quality six size (Maximum): ', oggsixmax,'mb')
	print('OGG quality six size (Average): ', oggsixavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.seven then
	print('OGG quality seven size (Minimum): ', oggsevenmin,'mb')
	print('OGG quality seven size (Maximum): ', oggsevenmax,'mb')
	print('OGG quality seven size (Average): ', oggsevenavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.eight then
	print('OGG quality eight size (Minimum): ', oggeightmin,'mb')
	print('OGG quality eight size (Maximum): ', oggeightmax,'mb')
	print('OGG quality eight size (Average): ', oggeightavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.nine then
	print('OGG quality nine size (Minimum): ', oggninemin,'mb')
	print('OGG quality nine size (Maximum): ', oggninemax,'mb')
	print('OGG quality nine size (Average): ', oggnineavg,'mb')
elseif file == filetypes.ogg and sizes == size.mb and qual == quality.ten then
	print('OGG quality ten size (Minimum): ', oggtenmin,'mb')
	print('OGG quality ten size (Maximum): ', oggtenmax,'mb')
	print('OGG quality ten size (Average): ', oggtenavg,'mb')
end

-- The same thing as above, but for gigabytes
-- Oh here it goes, here it goes, here it goes again...

-- Quality Zero
local oggzeromingb = oggzeromin/1000
local oggzeromaxgb = oggzeromax/1000
local oggzeroavggb = oggzeroavg/1000

-- One
local oggonemingb = oggonemin/1000
local oggonemaxgb = oggonemax/1000
local oggoneavggb = oggoneavg/1000

-- Two
local oggtwomingb = oggtwomin/1000
local oggtwomaxgb = oggtwomax/1000
local oggtwoavggb = oggtwoavg/1000

-- Three
local oggthreemingb = oggthreemin/1000
local oggthreemaxgb = oggthreemax/1000
local oggthreeavggb = oggthreeavg/1000

-- Four
local oggfourmingb = oggfourmin/1000
local oggfourmaxgb = oggfourmax/1000
local oggfouravggb = oggfouravg/1000

-- Five
local oggfivemingb = oggfivemin/1000
local oggfivemaxgb = oggfivemax/1000
local oggfiveavggb = oggfiveavg/1000

-- Six
local oggsixmingb = oggsixmin/1000
local oggsixmaxgb = oggsixmax/1000
local oggsixavggb = oggsixavg/1000

-- Seven
local oggsevenmingb = oggsevenmin/1000
local oggsevenmaxgb = oggsevenmax/1000
local oggsevenavggb = oggsevenavg/1000

-- Eight
local oggeightmingb = oggeightmin/1000
local oggeightmaxgb = oggeightmax/1000
local oggeightavggb = oggeightavg/1000

-- Nine
local oggninemingb = oggninemin/1000
local oggninemaxgb = oggninemax/1000
local oggnineavggb = oggnineavg/1000

-- Ten
local oggtenmingb = oggtenmin/1000
local oggtenmaxgb = oggtenmax/1000
local oggtenavggb = oggtenavg/1000

-- Again, all the fucking if statements. There's probably an easier way to do all of this now that I think about it ***THIS*** far in.
-- I feel like this is that joke calculator program made in python, you know the one.
if file == filetypes.ogg and sizes == size.gb and qual == quality.zero then
	print('OGG quality zero size (Minimum): ', oggzeromingb,'gb')
	print('OGG quality zero size (Maximum): ', oggzeromaxgb,'gb')
	print('OGG quality zero size (Average): ', oggzeroavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.one then
	print('OGG quality one size (Minimum): ', oggonemingb,'gb')
	print('OGG quality one size (Maximum): ', oggonemaxgb,'gb')
	print('OGG quality one size (Average): ', oggoneavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.two then
	print('OGG quality two size (Minimum): ', oggtwomingb,'gb')
	print('OGG quality two size (Maximum): ', oggtwomaxgb,'gb')
	print('OGG quality two size (Average): ', oggtwoavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.three then
	print('OGG quality three size (Minimum): ', oggthreemingb,'gb')
	print('OGG quality three size (Maximum): ', oggthreemaxgb,'gb')
	print('OGG quality three size (Average): ', oggthreeavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.four then
	print('OGG quality four size (Minimum): ', oggfourmingb,'gb')
	print('OGG quality four size (Maximum): ', oggfourmaxgb,'gb')
	print('OGG quality four size (Average): ', oggfouravggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.five then
	print('OGG quality five size (Minimum): ', oggfivemingb,'gb')
	print('OGG quality five size (Maximum): ', oggfivemaxgb,'gb')
	print('OGG quality five size (Average): ', oggfiveavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.six then
	print('OGG quality six size (Minimum): ', oggsixmingb,'gb')
	print('OGG quality six size (Maximum): ', oggsixmaxgb,'gb')
	print('OGG quality six size (Average): ', oggsixavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.seven then
	print('OGG quality seven size (Minimum): ', oggsevenmingb,'gb')
	print('OGG quality seven size (Maximum): ', oggsevenmaxgb,'gb')
	print('OGG quality seven size (Average): ', oggsevenavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.eight then
	print('OGG quality eight size (Minimum): ', oggeightmingb,'gb')
	print('OGG quality eight size (Maximum): ', oggeightmaxgb,'gb')
	print('OGG quality eight size (Average): ', oggeightavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.nine then
	print('OGG quality nine size (Minimum): ', oggninemingb,'gb')
	print('OGG quality nine size (Maximum): ', oggninemaxgb,'gb')
	print('OGG quality nine size (Average): ', oggnineavggb,'gb')
elseif file == filetypes.ogg and sizes == size.gb and qual == quality.ten then
	print('OGG quality ten size (Minimum): ', oggtenmingb,'gb')
	print('OGG quality ten size (Maximum): ', oggtenmaxgb,'gb')
	print('OGG quality ten size (Average): ', oggtenavggb,'gb')
end

print('Press ENTER to quit.')

io.read()
os.exit()
