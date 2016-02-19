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

c     Added by Y.Yang
      INCLUDE '(GENSTK)'

*
      INTEGER REAC
      INTEGER PDG
*

c     Added by Y.Yang
      CALL convertpdg(IJ,PDG)

*     give an integer number to each reaction
      IF (LELEVT) THEN
        REAC = 0
      ELSE IF (LINEVT) THEN
        REAC = 1
      ELSE IF (LDECAY) THEN
        REAC = 2
      ELSE IF (LDLTRY) THEN
        REAC = 3
      ELSE IF (LPAIRP) THEN
        REAC = 4
      ELSE IF (LBRMSP) THEN
        REAC = 5
      ELSE IF (LANNRS) THEN
        REAC = 6
      ELSE IF (LANNFL) THEN
        REAC = 7
      ELSE IF (LPHOEL) THEN
        REAC = 8
      ELSE IF (LCMPTN) THEN
        REAC = 9
      ELSE IF (LCOHSC) THEN
        REAC = 10
      ELSE IF (LLENSC) THEN
        REAC = 11
      ELSE IF (LOPPSC) THEN
        REAC = 12
      ELSE IF (LELDIS) THEN
        REAC = 13
      ELSE IF (LRDCAY) THEN
        REAC = 14
      ELSE
        REAC = 999
      END IF

*     record data
      ISPARK(1,NPFLKA) = REAC
      ISPARK(2,NPFLKA) = PDG
      ISPARK(3,NPFLKA) = MREG
      ISPARK(4,NPFLKA) = NPSECN
*      ISPARK(5,NPFLKA) = NPSECN
      SPAREK(1,NPFLKA) = XX
      SPAREK(2,NPFLKA) = YY
      SPAREK(3,NPFLKA) = ZZ
      SPAREK(4,NPFLKA) = PLR(NPSECN) * CXR(NPSECN)
      SPAREK(5,NPFLKA) = PLR(NPSECN) * CYR(NPSECN)
      SPAREK(6,NPFLKA) = PLR(NPSECN) * CZR(NPSECN)

*     record decay
*      IF (LDECAY) THEN
*        SPAREK(1,NPFLKA) = ETRACK
*        SPAREK(2,NPFLKA) = XX
*        SPAREK(3,NPFLKA) = YY
*        SPAREK(4,NPFLKA) = ZZ
*        ISPARK(1,NPFLKA) = PDG
*     inelastic
*      ELSE IF (LINEVT) THEN
*        ISPARK(2,NPFLKA) = PDG
*        ISPARK(3,NPFLKA) = MREG
*        SPAREK(5,NPFLKA) = XX
*        SPAREK(6,NPFLKA) = YY
*        SPAREK(7,NPFLKA) = ZZ
*        SPAREK(8,NPFLKA) = PLR(NPSECN) * CXR(NPSECN)
*        SPAREK(9,NPFLKA) = PLR(NPSECN) * CYR(NPSECN)
*        SPAREK(10,NPFLKA) = PLR(NPSECN) * CZR(NPSECN)
*      END IF

*
      LOUSE   (NPFLKA)  = LLOUSE
      DO 100 ISPR = 7, MKBMX1
         SPAREK (ISPR,NPFLKA) = SPAUSR (ISPR)
  100 CONTINUE
      DO 200 ISPR = 6, MKBMX2
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

