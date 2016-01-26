extern "C" {
  void ConvertPDG_(int *flukaid, int *pdgcode);
}

void ConvertPDG_(int *flukaid, int *pdgcode)
{
  switch (*flukaid) {
    // 4He
    case -6: *pdgcode = 2000004; break;
    // 3He
    case -5: *pdgcode = 2000003; break;
    // triton
    case -4: *pdgcode = 1000003; break;
    // deuteron
    case -3: *pdgcode = 1000002; break;
    // proton
    case  1: *pdgcode = 2112; break;
    // anti-proton
    case  2: *pdgcode = -2112; break;
    // electron
    case  3: *pdgcode = 11; break;
    // positron
    case  4: *pdgcode = -11; break;
    // electron neutrino
    case  5: *pdgcode = 12; break;
    // electron anti-neutrino
    case  6: *pdgcode = -12; break;
    // photon
    case  7: *pdgcode = 22; break;
    // neutron
    case  8: *pdgcode = 2112; break;
    // anti-neutron
    case  9: *pdgcode = -2112; break;
    // muon+
    case 10: *pdgcode = -13; break;
    // muon-
    case 11: *pdgcode = 13; break;
    // K0 long
    case 12: *pdgcode = 130; break;
    // pion+
    case 13: *pdgcode = 211; break;
    // pion-
    case 14: *pdgcode = -211; break;
    // K+
    case 15: *pdgcode = 321; break;
    // K-
    case 16: *pdgcode = -321; break;
    // lambda
    case 17: *pdgcode = 3122; break;
    // anti-lambda
    case 18: *pdgcode = -3122; break;
    // K0 short
    case 19: *pdgcode = 310; break;
    // sigma-
    case 20: *pdgcode = 3112; break;
    // sigma+
    case 21: *pdgcode = 3222; break;
    // sigma0
    case 22: *pdgcode = 3212; break;
    // pion0
    case 23: *pdgcode = 111; break;
    // K0
    case 24: *pdgcode = 311; break;
    // anti-K0
    case 25: *pdgcode = -311; break;
    // muon neutrino
    case 26: *pdgcode = 14; break;
    // muon anti-neutrino
    case 27: *pdgcode = -14; break;
  }
}
