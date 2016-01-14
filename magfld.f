*$ CREATE MAGFLD.FOR
*COPY MAGFLD
*
*===magfld=============================================================*
*
      SUBROUTINE MAGFLD ( X, Y, Z, BTX, BTY, BTZ, B, NREG, IDISC )

      INCLUDE '(DBLPRC)'
      INCLUDE '(DIMPAR)'
      INCLUDE '(IOUNIT)'
*
*----------------------------------------------------------------------*
*                                                                      *
*     Copyright (C) 1988-2010      by Alberto Fasso` & Alfredo Ferrari *
*     All Rights Reserved.                                             *
*                                                                      *
*                                                                      *
*     Created  in     1988         by    Alberto Fasso`                *
*                                                                      *
*                                                                      *
*     Last change on 06-Nov-10     by    Alfredo Ferrari               *
*                                                                      *
*     Input variables:                                                 *
*            x,y,z = current position                                  *
*            nreg  = current region                                    *
*     Output variables:                                                *
*            btx,bty,btz = cosines of the magn. field vector           *
*            B = magnetic field intensity (Tesla)                      *
*            idisc = set to 1 if the particle has to be discarded      *
*                                                                      *
*----------------------------------------------------------------------*
*
      INCLUDE '(CMEMFL)'
      INCLUDE '(CSMCRY)'

*     values to comunicate with C code
      DOUBLE PRECISION xc, yc, zc, bxc, byc, bzc, btotc
      COMMON/rzforc/xc, yc, zc, bxc, byc, bzc, btotc
*
*  +-------------------------------------------------------------------*
*  |  Earth geomagnetic field:
*      IF ( LGMFLD ) THEN
*         CALL GEOFLD ( X, Y, Z, BTX, BTY, BTZ, B, NREG, IDISC )
*         RETURN
*      END IF
*  |
*  +-------------------------------------------------------------------*
      IDISC = 0

*     call function from CoilMapReader.c      
      xc = X*10
      yc = Y*10
      zc = Z*10

      CALL readfieldfrommap()
*      WRITE (*,*) "magfld", xc, yc, zc, bxc, byc, bzc
      B = SQRT(bxc*bxc + byc*byc + bzc*bzc)

      IF (B .NE. 0) THEN
        BTX   = bxc / B
        BTY   = byc / B
        BTZ   = bzc / B
      ELSE
        BTX   = 0
        BTY   = 0
        BTZ   = 1
      ENDIF


*      WRITE (*,*) BTX, BTY, BTZ, B

      RETURN
*=== End of subroutine Magfld =========================================*
      END

