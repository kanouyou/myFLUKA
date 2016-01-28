extern "C" {
  void convertpdg_(int *flukaid, int *pdgcode);
}

void convertpdg_(int *flukaid, int *pdgcode)
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
    case 27: *pdgcode = 14; break;
    // muon anti-neutrino
    case 28: *pdgcode = -14; break;
    // anti-sigma-
    case 31: *pdgcode = -3222; break;
    // anti-sigma0
    case 32: *pdgcode = -3212; break;
    // anti-sigma+
    case 33: *pdgcode = -3112; break;
    // xi0
    case 34: *pdgcode = 3322; break;
    // anti-xi0
    case 35: *pdgcode = -3322; break;
    // xi-
    case 36: *pdgcode = 3312; break;
    // xi+
    case 37: *pdgcode = -3312; break;
    // omega-
    case 38: *pdgcode = 3334; break;
    // anti-omega
    case 39: *pdgcode = -3334; break;
    // tauon+
    case 41: *pdgcode = -15; break;
    // tauon-
    case 42: *pdgcode = 15; break;
    // tau neutrino
    case 43: *pdgcode = 16; break;
    // tau anti-neutrino
    case 44: *pdgcode = -16; break;
    // others
    default: *pdgcode = 999; break;
  }
}
