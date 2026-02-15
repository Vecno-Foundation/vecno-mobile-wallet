import 'contact.dart';

const vVecnoDevelopmentFundAddress =
    'vecno:qp9wy9425nv7xy6tn9hytk839gnv3ky6nd7qhrzhg333dztgm3r4ugssphplt';

const vCommunityFundAddress =
    'vecno:qpyr8yp7jmantyaatyqtpwuzv3fcthe2r7jz6n55nl4hdd0288e8jljunnqgv';

const vVecnoTreasuryAddress =
    'vecno:qqlf4w8kfx6wv00hz7dsgu688mdcmcrcams0fetnanku2panxhu3uzw3vhljx';

const kDonationAddresses = const [
  Contact(
    name: 'Vecno Development Fund',
    address: vVecnoDevelopmentFundAddress,
  ),
  Contact(
    name: 'Community Fund',
    address: vCommunityFundAddress,
  ),
  Contact(
    name: 'Vecno Team Treasury',
    address: vVecnoTreasuryAddress,
  ),
];

final labeledAddresses = Map.fromEntries(
  kDonationAddresses.map((e) => MapEntry(e.address, e)),
);
