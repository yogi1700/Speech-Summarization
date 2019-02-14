

from sphfile import SPHFile
sph =SPHFile(
    'GrahamHill_2010.sph'
)
# Note that the following loads the whole file into ram
print( sph.format )
# write out a wav file with content from 111.29 to 123.57 seconds
sph.write_wav( 'GrahamHill_2010.wav', 0, 493 )
