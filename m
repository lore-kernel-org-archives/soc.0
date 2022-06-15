Return-Path: <SRS0=j4sj=WW=cqplus1.com=prvs=1162F1FB06=qinjian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77D2C43334
	for <soc@archiver.kernel.org>; Wed, 15 Jun 2022 02:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B407C3411D; Wed, 15 Jun 2022 02:25:38 +0000 (UTC)
Received: from mx1.cqplus1.com (mx1.cqplus1.com [113.204.237.245])
	by smtp.kernel.org (Postfix) with ESMTP id 2B8B2C3411B
	for <soc@kernel.org>; Wed, 15 Jun 2022 02:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B8B2C3411B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cqplus1.com
X-MailGates: (flag:1,DYNAMIC,RELAY,NOHOST,LAN:PASS)(compute_score:DELIVE
	R,40,3)
Received: from 172.27.96.203
	by mx1.cqplus1.com with MailGates ESMTP Server V5.0(28633:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Wed, 15 Jun 2022 10:25:26 +0800 (CST)
Received: from CQEXMAIL01.cqplus1.com (172.27.96.203) by
 CQEXMAIL01.cqplus1.com (172.27.96.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Jun 2022 10:25:22 +0800
Received: from CQEXMAIL01.cqplus1.com ([::1]) by CQEXMAIL01.cqplus1.com
 ([::1]) with mapi id 15.01.2507.006; Wed, 15 Jun 2022 10:25:22 +0800
From: =?utf-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
To: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
	"soc@kernel.org" <soc@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
Thread-Topic: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
Thread-Index: AQHYf8r5uo30wfgQ7kKLEgfDFgKMD61Ow22AgAD0FaA=
Date: Wed, 15 Jun 2022 02:25:22 +0000
Message-ID: <aaf96491f1a94b5694003797853aa732@cqplus1.com>
References: <cover.1655194858.git.qinjian@cqplus1.com>
 <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com>
 <20220614192555.86436C3411B@smtp.kernel.org>
In-Reply-To: <20220614192555.86436C3411B@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.28.110.18]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstc3A3MDIxLmMgYi9kcml2ZXJzL2Nsay9j
bGstc3A3MDIxLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MC4uMGNhZWYxYmM3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2Ns
ay1zcDcwMjEuYw0KPiA+IEBAIC0wLDAgKzEsNzI1IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gDQo+IFRoaXMgaXNu
J3QgYSBjb21tb24gbGljZW5zZSBvbiBkcml2ZXIgZmlsZXMuIElzIGl0IGludGVuZGVkPyBPcg0K
PiBjb3B5L3Bhc3RlIGZyb20gRFQ/DQoNClllcywgSSBjb3B5L3Bhc3RlIGZyb20gRFQuDQpEaWQg
SSBuZWVkIGNoYW5nZWQgaXQgdG8gJ0dQTC0yLjAtb25seSc/DQoNCj4gDQo+ID4gKy8qDQo+ID4g
KyAqIENvcHlyaWdodCAoQykgU3VucGx1cyBUZWNobm9sb2d5IENvLiwgTHRkLg0KPiA+ICsgKiAg
ICAgICBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPiA+ICsgKi8NCj4gWy4uLl0NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgc3A3MDIxX2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiA+ICt7DQo+IFsuLi5dDQo+ID4gKw0KPiA+ICsgICAgICAgLyogZ2F0ZXMgKi8NCj4gPiAr
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNwX2Nsa19nYXRlcyk7IGkrKykgew0K
PiA+ICsgICAgICAgICAgICAgICBjaGFyIG5hbWVbMTBdOw0KPiA+ICsgICAgICAgICAgICAgICB1
MzIgaiA9IHNwX2Nsa19nYXRlc1tpXS5yZWc7DQo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBj
bGtfcGFyZW50X2RhdGEgKnBkID0gc3BfY2xrX2dhdGVzW2ldLmV4dF9wYXJlbnQgPyAmcGRfZXh0
IDogJnBkX3N5czsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHNwcmludGYobmFtZSwgIiUw
MmRfMHglMDJ4IiwgaSwgaik7DQo+ID4gKyAgICAgICAgICAgICAgIGh3c1tpXSA9IGNsa19od19y
ZWdpc3Rlcl9nYXRlX3BhcmVudF9kYXRhKGRldiwgbmFtZSwgcGQsIDAsDQo+IA0KPiBUaGlzIG5l
ZWRzIHRvIGJlIGRldm0gYXMgd2VsbC4gT3RoZXJ3aXNlIGlmIHRoZSBkcml2ZXIgaXMgdW5ib3Vu
ZCB3ZSdsbA0KPiBsZWFrIHRoZXNlIHJlZ2lzdGVyZWQgY2xrcy4NCj4gDQoNCmNsay1wcm92aWRl
ci5oOg0Kc3RydWN0IGNsa19odyAqX19kZXZtX2Nsa19od19yZWdpc3Rlcl9nYXRlKHN0cnVjdCBk
ZXZpY2UgKmRldiwNCgkJc3RydWN0IGRldmljZV9ub2RlICpucCwgY29uc3QgY2hhciAqbmFtZSwN
CgkJY29uc3QgY2hhciAqcGFyZW50X25hbWUsIGNvbnN0IHN0cnVjdCBjbGtfaHcgKnBhcmVudF9o
dywNCgkJY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSAqcGFyZW50X2RhdGEsDQoJCXVuc2ln
bmVkIGxvbmcgZmxhZ3MsDQoJCXZvaWQgX19pb21lbSAqcmVnLCB1OCBiaXRfaWR4LA0KCQl1OCBj
bGtfZ2F0ZV9mbGFncywgc3BpbmxvY2tfdCAqbG9jayk7DQojZGVmaW5lIGRldm1fY2xrX2h3X3Jl
Z2lzdGVyX2dhdGUoZGV2LCBuYW1lLCBwYXJlbnRfbmFtZSwgZmxhZ3MsIHJlZywgYml0X2lkeCxc
DQoJCQkJICBjbGtfZ2F0ZV9mbGFncywgbG9jaykJCQkgICAgICBcDQoJX19kZXZtX2Nsa19od19y
ZWdpc3Rlcl9nYXRlKChkZXYpLCBOVUxMLCAobmFtZSksIChwYXJlbnRfbmFtZSksIE5VTEwsIFwN
CgkJCSAgICAgICBOVUxMLCAoZmxhZ3MpLCAocmVnKSwgKGJpdF9pZHgpLAkJICAgICAgXA0KCQkJ
ICAgICAgIChjbGtfZ2F0ZV9mbGFncyksIChsb2NrKSkNCg0KU2hvdWxkIEkgdXNlIF9fZGV2bV9j
bGtfaHdfcmVnaXN0ZXJfZ2F0ZSgpIHdpdGggcGFyZW50X2RhdGENCm9yDQpkZXZtX2Nsa19od19y
ZWdpc3Rlcl9nYXRlKCkgd2l0aCBwYXJlbnRfbmFtZT8NCg0K
