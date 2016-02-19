#ifndef IFLUKARootDraw_HH
#define IFLUKARootDraw_HH

#include "IFLUKALinker.h"

using COMET::IFLUKALinker;

static IFLUKALinker *fLinker = NULL;

extern "C" {
  void openfile_();
  void filefill_(int &pdg, double &x , double &y , double &z,
                           double &px, double &py, double &pz);
  void fileclose_();
}

void openfile_()
{
  fLinker = new IFLUKALinker();
}

void filefill_(int &pdg, double &x , double &y , double &z,
                         double &px, double &py, double &pz)
{
  fLinker->Fill(pdg,x,y,z);
}

void fileclose_()
{
  fLinker->Close();
}

#endif
