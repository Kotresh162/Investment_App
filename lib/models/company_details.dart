class CompanyDetail {
  final String logo;
  final String companyName;
  final String description;
  final String isin;
  final String status;
  final Points prosAndCons;
  final Financial financials;
  final IssuerDetails issuerDetails;

  CompanyDetail({
    required this.logo,
    required this.companyName,
    required this.description,
    required this.isin,
    required this.status,
    required this.prosAndCons,
    required this.financials,
    required this.issuerDetails,
  });

  factory CompanyDetail.fromJson(Map<String, dynamic> json) {
    return CompanyDetail(
      logo: json['logo'] ?? '',
      companyName: json['company_name'] ?? '',
      description: json['description'] ?? '',
      isin: json['isin'] ?? '',
      status: json['status'] ?? '',
      prosAndCons: Points.fromJson(json['pros_and_cons'] ?? {}),
      financials: Financial.fromJson(json['financials'] ?? {}),
      issuerDetails: IssuerDetails.fromJson(json['issuer_details'] ?? {}),
    );
  }
}

class Points {
  final List<String> pros;
  final List<String> cons;

  Points({
    required this.pros,
    required this.cons,
  });

  factory Points.fromJson(Map<String, dynamic> json) {
    return Points(
      pros: List<String>.from(json['pros'] ?? []),
      cons: List<String>.from(json['cons'] ?? []),
    );
  }
}

class Financial {
  final List<FinancialEntry> ebitda;
  final List<FinancialEntry> revenue;

  Financial({
    required this.ebitda,
    required this.revenue,
  });

  factory Financial.fromJson(Map<String, dynamic> json) {
    return Financial(
      ebitda: (json['ebitda'] as List? ?? [])
          .map((e) => FinancialEntry.fromJson(e))
          .toList(),
      revenue: (json['revenue'] as List? ?? [])
          .map((e) => FinancialEntry.fromJson(e))
          .toList(),
    );
  }
}

class FinancialEntry {
  final String month;
  final int value;

  FinancialEntry({
    required this.month,
    required this.value,
  });

  factory FinancialEntry.fromJson(Map<String, dynamic> json) {
    return FinancialEntry(
      month: json['month'] ?? '',
      value: json['value'] ?? 0,
    );
  }
}

class IssuerDetails {
  final String issuerName;
  final String typeOfIssuer;
  final String sector;
  final String industry;
  final String issuerNature;
  final String cin;
  final String leadManager;
  final String registrar;
  final String debentureTrustee;

  IssuerDetails({
    required this.issuerName,
    required this.typeOfIssuer,
    required this.sector,
    required this.industry,
    required this.issuerNature,
    required this.cin,
    required this.leadManager,
    required this.registrar,
    required this.debentureTrustee,
  });

  factory IssuerDetails.fromJson(Map<String, dynamic> json) {
    return IssuerDetails(
      issuerName: json['issuer_name'] ?? '',
      typeOfIssuer: json['type_of_issuer'] ?? '',
      sector: json['sector'] ?? '',
      industry: json['industry'] ?? '',
      issuerNature: json['issuer_nature'] ?? '',
      cin: json['cin'] ?? '',
      leadManager: json['lead_manager'] ?? '',
      registrar: json['registrar'] ?? '',
      debentureTrustee: json['debenture_trustee'] ?? '',
    );
  }
}
