*$ CREATE STUPRF.FOR
*COPY STUPRF
*
*=== stuprf ===========================================================*
*
      SUBROUTINE STUPRF ( IJ, MREG, XX, YY, ZZ, NPSECN, NPPRMR )

      INCLUDE '(DBLPRC)'
      INCLUDE '(DIMPAR)'
      INCLUDE '(IOUNIT)'
*
*----------------------------------------------------------------------*
*                                                                      *
*     Copyright (C) 1997-2005      by    Alfredo Ferrari & Paola Sala  *
*     All Rights Reserved.                                             *
*                                                                      *
*                                                                      *
*     SeT User PRoperties for Fluka particles:                         *
*                                                                      *
*     Created on  09 october 1997  by    Alfredo Ferrari & Paola Sala  *
*                                                   Infn - Milan       *
*                                                                      *
*     Last change on  14-jul-05    by    Alfredo Ferrari               *
*                                                                      *
*                                                                      *
*----------------------------------------------------------------------*
*
      INCLUDE '(EVTFLG)'
      INCLUDE '(FLKSTK)'
      INCLUDE '(TRACKR)'

c     Add by Y.Yang
      INCLUDE '(GENSTK)'

*

c Added by Y.Yang
*     record decay
      IF (LDECAY) THEN
        SPAREK(1,NPFLKA) = ETRACK
        SPAREK(2,NPFLKA) = XX
        SPAREK(3,NPFLKA) = YY
        SPAREK(4,NPFLKA) = ZZ
        ISPARK(1,NPFLKA) = IJ
*     inelastic
      ELSE IF (LINEVT) THEN
        ISPARK(2,NPFLKA) = KPART(NPSECN)
        ISPARK(3,NPFLKA) = MREG
        SPAREK(5,NPFLKA) = XX
        SPAREK(6,NPFLKA) = YY
        SPAREK(7,NPFLKA) = ZZ
        SPAREK(8,NPFLKA) = PLR(NPSECN) * CXR(NPSECN)
        SPAREK(9,NPFLKA) = PLR(NPSECN) * CYR(NPSECN)
        SPAREK(10,NPFLKA) = PLR(NPSECN) * CZR(NPSECN)
      END IF

*
      LOUSE   (NPFLKA)  = LLOUSE
      DO 100 ISPR = 11, MKBMX1
         SPAREK (ISPR,NPFLKA) = SPAUSR (ISPR)
  100 CONTINUE
      DO 200 ISPR = 4, MKBMX2
         ISPARK (ISPR,NPFLKA) = ISPUSR (ISPR)
  200 CONTINUE
*  Increment the track number and put it into the last flag:
      IF ( NPSECN .GT. NPPRMR ) THEN
         IF ( NTRCKS .EQ. 2000000000 ) NTRCKS = -2000000000
         NTRCKS = NTRCKS + 1
         ISPARK (MKBMX2,NPFLKA) = NTRCKS
      END IF
      RETURN
*=== End of subroutine Stuprf =========================================*
      END

