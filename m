Return-Path: <SRS0=j4sj=WW=cqplus1.com=prvs=1162F1FB06=qinjian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546F8C43334
	for <soc@archiver.kernel.org>; Wed, 15 Jun 2022 03:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38B93C3411B; Wed, 15 Jun 2022 03:43:41 +0000 (UTC)
Received: from mx1.cqplus1.com (mx1.cqplus1.com [113.204.237.245])
	by smtp.kernel.org (Postfix) with ESMTP id E8A2CC34115
	for <soc@kernel.org>; Wed, 15 Jun 2022 03:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8A2CC34115
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cqplus1.com
X-MailGates: (flag:1,DYNAMIC,RELAY,NOHOST,LAN:PASS)(compute_score:DELIVE
	R,40,3)
Received: from 172.27.96.203
	by mx1.cqplus1.com with MailGates ESMTP Server V5.0(28626:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Wed, 15 Jun 2022 11:43:27 +0800 (CST)
Received: from CQEXMAIL01.cqplus1.com (172.27.96.203) by
 CQEXMAIL01.cqplus1.com (172.27.96.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Jun 2022 11:43:22 +0800
Received: from CQEXMAIL01.cqplus1.com ([::1]) by CQEXMAIL01.cqplus1.com
 ([::1]) with mapi id 15.01.2507.006; Wed, 15 Jun 2022 11:43:22 +0800
From: =?utf-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Russell King - ARM Linux
	<linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team
	<soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML
	<devicetree@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
Thread-Topic: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
Thread-Index: AQHYf8r5uo30wfgQ7kKLEgfDFgKMD61OMbmAgAGfqOA=
Date: Wed, 15 Jun 2022 03:43:22 +0000
Message-ID: <7846c32b2c134fca9ad723c026e345f5@cqplus1.com>
References: <cover.1655194858.git.qinjian@cqplus1.com>
 <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com>
 <CAK8P3a0p3M2Z7aaB3tGJSud3Tr+E7BtwQka6j5HS3VooV7L8XQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0p3M2Z7aaB3tGJSud3Tr+E7BtwQka6j5HS3VooV7L8XQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.28.110.18]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiANCj4gT24gVHVlLCBKdW4gMTQsIDIwMjIgYXQgMTA6MzEgQU0gUWluIEppYW4gPHFpbmppYW5A
Y3FwbHVzMS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIGNsb2NrIGRyaXZlciBmb3IgU3VucGx1
cyBTUDcwMjEgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUWluIEppYW4gPHFpbmppYW5A
Y3FwbHVzMS5jb20+DQo+ID4gLS0tDQo+ID4gRml4IHRoZSBjb21tZW50cyBmcm9tIFN0ZXBoZW4g
Qm95ZC4NCj4gDQo+IERvIHlvdSBtZWFuIHlvdSBzdGlsbCBuZWVkIHRvIGFkZHJlc3MgdGhlIGNv
bW1lbnRzIGZyb20gU3RlcGhlbiwgb3INCj4gdGhhdCB5b3UgaGF2ZQ0KPiBkb25lIHRoaXMgYWxy
ZWFkeT8NCj4gDQo+IEkgY2FuJ3QgYXBwbHkgdGhlIHNlcmllcyBpZiB0aGVyZSBhcmUgcGF0Y2hl
cyBpbiBpdCB0aGF0IHN0aWxsIG5lZWQgdG8NCj4gYmUgZml4ZWQgb3INCj4gZmluaXNoIHJldmll
dywgc28gSSBob3BlIHRoaXMgaXMgb25seSB3YWl0aW5nIGZvciBhIGZpbmFsIEFjay4NCj4gDQo+
ICAgICAgICAgQXJuZA0KDQpZZXMsIEkgZml4ZWQgY29tbWVudHMgZnJvbSBTdGVwaGVuJ3MgbGFz
dCByZXZpZXcuDQpBbmQgSSBnb3Qgc29tZSBuZXcgY29tbWVudHMgZnJvbSBoaW0sIHdoaWNoIGlz
IG5vdCBsaXN0ZWQgQCBsa21sIHN0cmFuZ2VseS4NClNlZSBteSByZXBseSBbMV0NCg0KWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYWFmOTY0OTFmMWE5NGI1Njk0MDAzNzk3ODUzYWE3
MzJAY3FwbHVzMS5jb20vVC8jbTVmMjg2ZmM3NzQ3Mjc5NGU1YWZhY2E1ZDFhODI1MjUxMzY5NWU2
YmINCg0KDQo=
