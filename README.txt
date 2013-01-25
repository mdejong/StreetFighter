Note that License.txt applies to the source code include in Classes, but does
not include the Classes/LZMASDK files which are in the public domain. The
video and audio resources were downloaded off the internet, no claim of
ownership or license is made on these files.

The movie files were encoded to the .mvid format from the original .mov (Quicktime)
files. The .mvid file format stored pixel data in the format most optimal for
efficient display on iOS hardware. Multiple .mvid input files were then compressed
into a single archive using the 7zip library. The 7zip library compresses video data
much better than gzip, libz, or bzip2.

These instructions shows how to use the mvidmoviemaker command line util.

Commands to create RyuMvids.7z Archive:

Each .mvid file is larger than the corresponding .mov file, but smaller
once compressed with 7zip. In this simple example, compressing 4 movies
with 7zip saves about 60K. If many video files were included in the app
then the space savings would be much larger.

RyuMovs.zip : 263041 bytes (263 K)
RyuMovs.7z  : 215821 bytes (216 K)
RyuMvids.7z : 198946 bytes (199 K)

$ mvidmoviemaker RyuFireball.mov RyuFireball.mvid
wrote RyuFireball.mvid

$ mvidmoviemaker RyuHighKick.mov RyuHighKick.mvid
wrote RyuHighKick.mvid

$ mvidmoviemaker RyuStance.mov RyuStance.mvid
wrote RyuStance.mvid

$ mvidmoviemaker RyuStrongPunch.mov RyuStrongPunch.mvid
wrote RyuStrongPunch.mvid

$ 7za a -mx=9 RyuMvids.7z RyuFireball.mvid RyuHighKick.mvid RyuStance.mvid RyuStrongPunch.mvid

The contents of RyuMvids.7z can be listed like this:

$ 7za l RyuMvids.7z