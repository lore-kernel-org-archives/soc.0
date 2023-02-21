Return-Path: <SRS0=PiqR=6R=nxp.com=hongxing.zhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DA4C61DA3
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 02:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86474C433D2; Tue, 21 Feb 2023 02:57:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6327FC433EF;
	Tue, 21 Feb 2023 02:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6327FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMet3yOp6p9Nx7Wr4la3j+MEa+3p1zFYXU0pqBSCWUrEEOJFMB3bTj61d6KkywDkrS2xNY09WnWyqpH9vFSKGte21XU0ciUmTWsLWniKuCaGMC/aUaZvryuikAt2141PDGG5hEzFlRDhmeFWrVbY5+0UAALWdnxe52NQ7E1TN1j6juTeu8d8w6glsEkr67/gEhVkwG6YbLLsjKrlQZQRW12Qu8/EL3Ck2lVeqL0NIJlO25UPLxS1NqJr7/miiulkOqdRZRdT/X6tRM78wXAr9Dbv5kEFnNwoQn2A+sTWaqR5ePO+s2negS84zTSA6jSUY9CxZbDDaH0L1XP7txM5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU/kqxN3RgymS4mUFGUYRKTL73vIJypM/q7vpfows5E=;
 b=T9K0fMTg1sZZZocPSqkeZwQYBbbRQ2MaCqSIFt3QbrNUR8+lSgDBhWSr2ojQ4TuF3FQ7tWZrE3ljNIE7HL1UPzebdnYdMN1yQjWCvRjBlDkrmvt512YLw2wH5ITQ1TJnve+hUg8s7nWefOw5iyfSH1n2w3L9s9Pc9roK8k1cqQwAxFXOKVRT/4AYeySyDwfBlfcy4jZ9vuexvgjuEyonscx80W+Ieqsf+2lg+c4UeXJd7A9EStYf83fVqTGS2mJhe+Hb8xOh11sKW7A4DV3RwyCSWBwDMxB0Qj26unaby+Ti1HuldlJcJ+2NosrDTFbbgQtg3RrnCmW13EHZrHUTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU/kqxN3RgymS4mUFGUYRKTL73vIJypM/q7vpfows5E=;
 b=AkyAomuwgCQ1yls3q9KISixIrzKB9zbnIfLIzlBxivOit45p4uzlXVDuSMcNvdHEaM5E/vXaDX0+OzU7VH/rgN4tx3YjwIfuQxvHdmEIkSBzd4ssUfg/RXu2e1KbL8knv3bh6C5V3UK1nBf/lbl4ASwjMfm41QWys8m493+W5mY=
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by AS4PR04MB9313.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Tue, 21 Feb
 2023 02:57:16 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::4dcb:740c:bf92:954a]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::4dcb:740c:bf92:954a%9]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 02:57:16 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
List-Id: <soc.lore.kernel.org>
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "soc@kernel.org"
	<soc@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Lucas Stach
	<l.stach@pengutronix.de>
CC: Michael Walle <michael@walle.cc>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kw@linux.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Manivannan Sadhasivam
	<mani@kernel.org>, kernelci.org bot <bot@kernelci.org>
Subject: RE: [PATCH] arm64: defconfig: Fix unintentional disablement of PCI on
 i.MX
Thread-Topic: [PATCH] arm64: defconfig: Fix unintentional disablement of PCI
 on i.MX
Thread-Index: AQHZRV73tfo7LZyawE2LoqvaWtEA+a7YtJ+w
Date: Tue, 21 Feb 2023 02:57:16 +0000
Message-ID:
 <AS8PR04MB86761A0A428F55B3E63C374F8CA59@AS8PR04MB8676.eurprd04.prod.outlook.com>
References: <20230220-imx-pci-defconfig-v1-1-2210cf08340e@kernel.org>
In-Reply-To: <20230220-imx-pci-defconfig-v1-1-2210cf08340e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8676:EE_|AS4PR04MB9313:EE_
x-ms-office365-filtering-correlation-id: 47e8fdfa-2dd1-449f-db2f-08db13b75744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7zCC4HbOWhxnIkNh1+VM89NDp+UcVSHAgoesTJmERINatJ+iCQ2VqSzfC5N66Fb/lKHVdN9HlDDBmYJMpfx/SspAEZLdw45Id7ZgnRvdqvACBoAE6NNWtkRI/gE9pVPP35LwZRU97lv3A7ENZXQJHZUEk3xn5oN14NrqSYH80yOHEQ79192EszOViXhGAwjv9DO4mlFvNo6oUgvzHLkgX9QhYieHYedHowJ+Y1BnSzFmYQ4IAeWEJMkazO86X+CaiOSDqRms/zFs/mKbHndSdVP7VIqXy0IEc5h1Eh1EVzoXLASrqPxmxlu/6mcZwlUxIEi2lIHZ4l84FWbB+TxYziThHzQD5ck10I6808KgDf0JntJccF00V1y0DdreDGvD3sMN4tSSnFgsJJfRAP1+oxNmDPZB+KUqN9oAKT5RyJ+ZnWMSN+ctDgmS/6H4NQUpRE7pJ1yH7azLoU489zQyI57k94VLVXElxNUwjMkZY5QV4g07YMACCeJm7kXtPia7i4GquE4z1vnATnnFHe7+chWcn12JSP/1RSLSD3kMb1wj8+/7Ki816wl++U8sVn6KhXYnnXNZ+zyMy42cyGwO276F35hI7hbnJxv1IhaQNbqQCR3anQGWcioBocIjanMv+sKnpIrWZN8ZeQT9dogkZHGJFnGDfEOOs40TM/o8uGGPeBft/5PMc9CBMYZvjfkBwK7qPtZJKoM2CeWZuUHmjA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(66556008)(64756008)(66476007)(66946007)(4326008)(76116006)(66446008)(8676002)(41300700001)(7696005)(110136005)(54906003)(71200400001)(52536014)(8936002)(44832011)(316002)(2906002)(7416002)(478600001)(6506007)(53546011)(26005)(9686003)(186003)(66574015)(83380400001)(5660300002)(86362001)(33656002)(122000001)(38070700005)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3BNejh1UWl4eGVvbHZZQlArVmxacnc3cXFxejEzeUJNZTV4Um9IdGlWcWlp?=
 =?utf-8?B?MGNkekxwTDRXWjBnOHMwT2hHQzd2amtKb0RTT1lZWlZ4dUljd25zRm1HVTdC?=
 =?utf-8?B?Z1h1L2JyRk54VElXdkhIOTl4bE9HcmpiY3F1aXdsS09mckx5ejF3d1lpTzk3?=
 =?utf-8?B?bUJiZlZyZE95emNzRlJVY2dleEhBbHVCV24zTEtSWUtYY3VEYW52Y3VPNkxN?=
 =?utf-8?B?ekhyZnpRV0ErejdMVGk2dEl6bm8vTy9GRENWZWVlZUwwQmcvZFVqeGlBdUdS?=
 =?utf-8?B?aktxUjBaU3BrUVkxcGxINWYxaWQ4eWJwWC9LRU42M3VEb29aYmx3YmZvY3pt?=
 =?utf-8?B?TTN0aWxSazRtZnIyc2V4SmYwc1ZEWjdhNm1NZmxNNVFMbTJYdTA3NG15RExL?=
 =?utf-8?B?M1RhRjF5L3pRNldzZkxmSjJ4ekRJaWRqYkNjamgzbGNyT1I5Y0FMTlJCeHpS?=
 =?utf-8?B?NFVCclQ1UDdXR25tbmVmS0gzVGo5NTJNWXhxVlNscWpvUTBlSkhDcGFmaTVR?=
 =?utf-8?B?QTg2Y1luRDZ5OFVib1ZWQkFOdUdVcVhjR3R3cDRtclpuVklydXNtRzhHTFZW?=
 =?utf-8?B?ZE82MnA1UXl5WTJsQW9nUUIzV1RXaThVaDdiZmI1UGRlbmxpU0hEUWhyVlh4?=
 =?utf-8?B?cXE0SmRaRDhBMlF6WFk3clkxeUxOSHZvU3k0MUJCYndNNDdCMldJd09OWnJI?=
 =?utf-8?B?ZU1JbHJQZUZSQWhpR09TbnF2Z0lMRnVEeWxSbnFMTHhwd2FNNE1TVEJnTU9D?=
 =?utf-8?B?SjZUQTJHakswRUtPZmpuOWRQWC9Tbm5BdGxGZ21pZzFuYS9XUnVWcFVjWkd6?=
 =?utf-8?B?ZW1QeVZueVlRVzNjcnUyTSt0WDRYMzgxWnVnWUFUT2xvMHpPTXFNSjJnbFhz?=
 =?utf-8?B?bWZNS0JvMnBhN0REdDE1NGpDS2hoeEl4c21jaHlpeEgzdEFwRzFtMDFEVnNq?=
 =?utf-8?B?RXNIT21vS2IrbjN0M0lVQ3ZTV2ptSFBPRnZsOUxFbFVCM3lLY1JqYWlVcUZu?=
 =?utf-8?B?a204czJxY0xKSjBzOVN2TlcvWXF6cng5U2IzWnA0Q0hEa2I1RGNnTXcxdFd2?=
 =?utf-8?B?UTdSdElyOURXMlNlcndPeHQvbVlqbDNZbFBQVjE3cTF6ckNLQ1RDSGlSUkJS?=
 =?utf-8?B?ZjRBSmpHSXdpVkY4dFU1MkgwdzVZVDBLdC9vdGgzdTE5L2Zrb3o2TGhBT2Zl?=
 =?utf-8?B?dWkrb0VuRHBGaGpvbGFCd0V1by9LYmdZQ0N0WkF6NngyRUwzanZyKzBXU3R6?=
 =?utf-8?B?ZVZMdE9wbEFWREZvSHNrQVloWSt4VEF1dG5NTVduekJBaFlLa1BaZkJKcVpk?=
 =?utf-8?B?T0pjYVFBazVNTkVvVkRGYmplOXo2UmxKWGFPOHlZT1NMdWVYTWFPdWMzUW8z?=
 =?utf-8?B?cEJlL0xFZ3JKWGxiTzFvZ3VwT3FLbEdKWWJBaGhZUFFSWmNqWktzdktrb0RW?=
 =?utf-8?B?bnM0ZXBDdnpRdWJSQkRRMDB3ZWRINVp5bTlhcS94MngvOFlwYUZSN2NKTDkv?=
 =?utf-8?B?VTdKd3R3RTlqTnRRRnhiYytIc29PSEhZZzZ2NjF3eEhzckVUSXdQK2NRT1do?=
 =?utf-8?B?NTY5YzdXb1AyZ0tGYW15eGQrdGxsTE5HTEZJSHlkQitnSk1rNGRLTnVTU3Jv?=
 =?utf-8?B?bjNFOVN6UmtuNVkwb0ZUcytQM3QzZGVGZmhrV0hnUkh6UXp2MHdHejRGYUcx?=
 =?utf-8?B?MzBmODFYbnJqYWRjZUlQV1pvY21FVHN5NTF0VEd0UDk2QmMwbHNobWpzNk4w?=
 =?utf-8?B?N3R3NWFGNHVKdE1ZVmgyMGR1eFNRWmVsaXlHRlFaM2c3L053Y3VZcHdJYTY4?=
 =?utf-8?B?WjF3QWJUekNnTmtYYjNLOGJScFFBN2RCeHJkelNMOEJwb0NVNUtjZ3plS0Rn?=
 =?utf-8?B?OVd0VnRjcUh2UGNXdDBlVGJuRXJZZjFSc3FvNDJGODhVaTBkR044SitLZ2tB?=
 =?utf-8?B?NGduUkh1bGdQUUJkeWNFZDhuVnNnNXFlZ2cxWmZ5ellTSmpYb00xdHVpTDdJ?=
 =?utf-8?B?RjJVL2o3WE40WGp3TW1XeFQ3SkhZZFlHNjNieTYwRVRRNVA1ZXV3UG14QU9w?=
 =?utf-8?B?TkN1ejZsQUliTTA3ajNaZVdVaFlkMEEzZkwwK0ptR1NHZVlzUm5iOWhJblFH?=
 =?utf-8?Q?+I78wEPggBy3Unmag/ufstJ9M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e8fdfa-2dd1-449f-db2f-08db13b75744
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 02:57:16.6505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPV2s4jflt6sT20wra2USJEM8Jfjn+gWfWzvLh+SJL55UyM+JmWe7Lu7MUxRYnlnyO8kgj8QRnVOMX/WuuMRNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9313

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjPlubQy5pyIMjHml6UgMzoxMA0KPiBUbzogQ2F0YWxp
biBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT47IFdpbGwgRGVhY29uDQo+IDx3aWxs
QGtlcm5lbC5vcmc+OyBzb2NAa2VybmVsLm9yZzsgSG9uZ3hpbmcgWmh1IDxob25neGluZy56aHVA
bnhwLmNvbT47DQo+IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+OyBI
b25neGluZyBaaHUNCj4gPGhvbmd4aW5nLnpodUBueHAuY29tPjsgTHVjYXMgU3RhY2ggPGwuc3Rh
Y2hAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNj
PjsgS3J6eXN6dG9mIFdpbGN6ecWEc2tpDQo+IDxrd0BsaW51eC5jb20+OyBLaXNob24gVmlqYXkg
QWJyYWhhbSBJIDxraXNob25Aa2VybmVsLm9yZz47DQo+IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgTWFuaXZhbm5hbg0KPiBT
YWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+OyBrZXJuZWxjaS5vcmcgYm90IDxib3RAa2VybmVs
Y2kub3JnPjsgTWFyaw0KPiBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBb
UEFUQ0hdIGFybTY0OiBkZWZjb25maWc6IEZpeCB1bmludGVudGlvbmFsIGRpc2FibGVtZW50IG9m
IFBDSSBvbg0KPiBpLk1YDQo+IA0KPiBBIHJlY2VudCB1cGRhdGUgdG8gc3VwcG9ydCBQQ0kgZW5k
cG9pbnQgbW9kZSBvbiBpLk1YIHBsYXRmb3Jtcw0KPiB1bmludGVudGlvbmFsbHkgZGlzYWJsZWQg
UENJIGhvc3Qgc3VwcG9ydCBmb3IgaS5NWCBpbiBkZWZjb25maWcuICBUaGUgZXhpc3RpbmcNCj4g
UENJX0lNWDYgd2FzIG1hZGUgYSBoaWRkZW4gb3B0aW9uLCBzZWxlY3RlZCBieSBuZXcgb3B0aW9u
cw0KPiBQQ0lfSU1YNl9IT1NUIChmb3IgdGhlIGV4aXN0aW5nIHN1cHBvcnQpIGFuZCBQQ0lfSU1Y
Nl9FUCAoZm9yIHRoZSBlbmRwb2ludA0KPiBtb2RlKSwgYnV0IHRoZXJlIGhhcyBiZWVuIG5vIGNv
cnJlc3BvbmRpbmcgdXBkYXRlIHRvIGRlZmNvbmZpZyBzbyB0aGUNCj4gUENJX0lNWDYgZW5kcyB1
cCBnZXR0aW5nIGRpc2FibGVkLiAgU3dpdGNoIGRlZmNvbmZpZyB0byBQQ0lfSU1YNl9IT1NUIHRv
DQo+IHByZXNlcnZlIHRoZSBleGlzdGluZyBmdW5jdGlvbmFsaXR5Lg0KPiANCj4gRml4ZXM6IDc1
YzJmMjZkYTAzZiAoIlBDSTogaW14NjogQWRkIGkuTVggUENJZSBFUCBtb2RlIHN1cHBvcnQiKQ0K
PiBSZXBvcnRlZC1ieTogImtlcm5lbGNpLm9yZyBib3QiIDxib3RAa2VybmVsY2kub3JnPg0KPiBT
aWduZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQo+IC0tLQ0KVGhh
bmtzIGEgbG90IGZvciB5b3VyIGZpeC4NClJldmlld2VkLWJ5OiBSaWNoYXJkIFpodSA8aG9uZ3hp
bmcuemh1QG54cC5jb20+DQoNCkJlc3QgUmVnYXJkcw0KUmljaGFyZCBaaHUNCg0KPiAgYXJjaC9h
cm02NC9jb25maWdzL2RlZmNvbmZpZyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvY29u
Zmlncy9kZWZjb25maWcgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQo+IGluZGV4IGI0
NTJkOGQ3YTMyYy4uMzZmNWM5ZWNjODcxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2NvbmZp
Z3MvZGVmY29uZmlnDQo+ICsrKyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCj4gQEAg
LTIxOSw3ICsyMTksNyBAQCBDT05GSUdfUENJX0hPU1RfVEhVTkRFUl9FQ0FNPXkNCj4gQ09ORklH
X1BDSUVfUk9DS0NISVBfSE9TVD1tICBDT05GSUdfUENJRV9NRURJQVRFS19HRU4zPW0NCj4gQ09O
RklHX1BDSUVfQlJDTVNUQj1tIC1DT05GSUdfUENJX0lNWDY9eQ0KPiArQ09ORklHX1BDSV9JTVg2
X0hPU1Q9eQ0KPiAgQ09ORklHX1BDSV9MQVlFUlNDQVBFPXkNCj4gIENPTkZJR19QQ0lfSElTST15
DQo+ICBDT05GSUdfUENJRV9RQ09NPXkNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogZDJhZjBm
YTRiZmE0ZWMyOWQwM2I0NDljY2Q0M2ZlZTM5NTAxMTEyZA0KPiBjaGFuZ2UtaWQ6IDIwMjMwMjIw
LWlteC1wY2ktZGVmY29uZmlnLThhM2EyODNiNzk4YQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAt
LQ0KPiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQoNCg==
