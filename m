Return-Path: <SRS0=/xGG=PK=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B6EC433F5
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 10:26:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 36A5A6120D; Fri, 22 Oct 2021 10:26:41 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D571E611F2;
	Fri, 22 Oct 2021 10:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D571E611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634898400; x=1666434400;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z0U/KmxnGtJJ+/AhqrBTCbA2EppUcB35yKOGQ/JwpXU=;
  b=hB+ax/39uv2X64T3xZku2qKkZ/m0yfEgtsJZbR/0uF0xQghrlfZw+/+a
   MuOYp7fY8XsaLhxqpTMbtBX83qwtinTALEpGGLG7nkOFKUPSbxG9PawPH
   4nxdjrcoSxk7Fnf+J7VgbrQ0P26MIoxdW6i/QhyiMFMCnsGLMEdUOcU2y
   fOsw+pYxRkWprKD1FkJEVITD5RxYyrgveoXgeaDol7yTva7U9F7pFDbQg
   YCnTQM1V+65EH6Ss/zYcg4bdANuZzdOlGOm3KVY/dLoEHFY0ZEcPVrmuv
   uuy6kboudjCthRbuc5Vjg+rSEPnimALsL5qourK/E4bnQxrE5v0MdFvJm
   w==;
IronPort-SDR: YMpkXATlP9XJOoo2POj4EEgd+Klq8fthW1XNOKs5GEvd5nniXD3UZNxiVje42TR6WsytjPrAuk
 cS7n3MYkEJAhzo8abYqotS+kZQmBwD50LFI7qY5mhoC5dnvBWDMamfLUgq1kTfSc5lwRYwKnl6
 DfNU+iVFUVZ32YWSVjaBhYV27YGWU5E8a7nQKezVGWsrifPrDnuCbAh4vTnkCurOjuVLb+wXr0
 juAQwOPd7AmnGLGEPJ0Mcu4TsEHNUvHVN3vKt7vLOgIcZzVTPvCpr0Vzv/fY4TQz+TaLhEmQiF
 hAcDI2GIad6jRC8rsgH3cAlp
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="73947177"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 03:26:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 03:26:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 03:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jE44ykRaNOAX3jloJAPcXSAJCTlv2lZfQ1H1GkhD0MFSOphgMaWYuc9xAvBCYbY//eMDD1ZJBgVlVB6vl+AvxmIip8BFwrun95wMFvc6AWXqdFOMZL9MHbM+2sCU0rkRurNlxGOQaUawmsrJvSNdFlILNsxrdlxNVKVquApKdmJ2eKoKHNJ1vxR7sBiELPf4g1s7ZqiAODNGafr/27Tqo7XYl9By++4noKLNMaJKxDzRgkzkDNpy0YC9QsPBKDNVFSaQcKkevH31EBtdOBAWHghRIjZJibZ5CViiUJB5Zq05AiWPyIjbGjl2WDyOv42GyMqsHxbUMgFf8ixVn0S/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0U/KmxnGtJJ+/AhqrBTCbA2EppUcB35yKOGQ/JwpXU=;
 b=er7pI6uFOuE1D9wYHjx/j4hoyIG7CW9UpVvTh3jR8P6dx+TvKDzs/rhctu4HPtoMZaDBn0/qShHTL+ap5YxlQh/XPtvJFe0tVh0Hn6Rq0KIqdF23E+UtTTAPx6Z3YtzoBI/qR8qDdQf+JXKpRz2DDprOSNgZhG4CmlWHwxe54+BmMemW9KZsRMRDXS/JgEQYXodO+9URWW1Z/UmguusBPjlrS2wJlNr+V1AwvdDm1IbSsDJhBp8I7mhQh0TaLO76if8eIBXYryFcUuXGcghaD8OIWAU2flieoxtmDZ1s69M4Z92CCSeXXQK3zx9l0NywVUdbvNvfhhuapw475nWpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0U/KmxnGtJJ+/AhqrBTCbA2EppUcB35yKOGQ/JwpXU=;
 b=OiXluX8lihOkNdtyf/ghqATcQCeXqQ83fiJELJnnOTfK2SJFFCCmE/V57Z2NAC4DpoYVet/ZoYj6Xz7HAcI1DdT9hBKKf+fx/kfOduMqLXK9KXxVjpM3QHXhoOJjzZqDjKG5c7NLv3EsVNS/r4DTPQh2pA5Qk07AWokLvOTVRmY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 10:26:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 10:26:24 +0000
From: <Conor.Dooley@microchip.com>
To: <arnd@arndb.de>, <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
CC: <olof@lixom.net>, <soc@kernel.org>, <robh+dt@kernel.org>,
	<Damien.LeMoal@wdc.com>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>,
	<paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>, <Cyril.Jean@microchip.com>,
	<Daire.McNamara@microchip.com>, <Atish.Patra@wdc.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
Thread-Topic: [PATCH] soc: add polarfire soc system controller
Thread-Index: AQHXuecsmqsF21x/+Uu/rugU1FwxCqvdh0SAgAAufICAACsgAIABCgKA
Date: Fri, 22 Oct 2021 10:26:23 +0000
Message-ID: <155badcd-80df-862b-ecf6-d6dd6b690a0c@microchip.com>
References: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
 <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
 <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
In-Reply-To: <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10c28479-441c-4d8d-b5e1-08d995466606
x-ms-traffictypediagnostic: MW3PR11MB4588:
x-microsoft-antispam-prvs: <MW3PR11MB458801A2A0AA30CFE3BF773998809@MW3PR11MB4588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t8pu/1+kKYhfEqDCn38Wu9KDRDfS+vWTNbpxPNSGYBBwZ4kBiLLVM2TSz5vwVEdkxMBbRrN/4aHpWr5/hOrBub50SZdeC1mebyl6POB2Bg7tjhhmv9K9JRG6M2Ts2aTPMIn6sq7K2Pi+mcKgIWcd/wNMj7pQEFBeWDHHaY+OW212BDJHcqQ2T6nV5ktJt6hZJuVPtuKtnnktLlByAdreqGlg+m2TOYbSzI90kt0/IGAt5OqlOeA76iDsTyShaTGfsXkTnPVyoMAs8Q2LW14cQr+jvzpoGI7+nE1I29Poy6qAoCT8Vpk4F+MeerY+UIDeQtFlc16cfKHnLwX1Q3UCxjGcQoHoaVHCwEmEaGx4lzb+MbYFuhOlWLKbUdHImbVOSxI3Y7Kb8HvUWnkxzYnsmu2e5l2nkrwByBgBRQdDNofG0WgwH3GzkRTzIP6CPD79ElHMN/TXgahm/wTkWFnjv81SqicFWBvkqnAWTOLPBqQU/ZM78Urzv1I8fy86LLzNmYiiPyzO9+GNgrRQYuxM8XZBz5EoxSM6+yoChBO4da8sv3ZZd/WDvMKrD0XZEjtvMsU1hrhyc9perFKinem/1a/oBGTHTkEM4bUTvUNZG8OhAuziU5qt2pgqWKPZblc794pktduVRK4R1LPHgSi/NFmdKnbJwcrP0tOxI6d9UqIt43pvGF6KP1/LKvXTA/ALiIfr+/YWjpM1vyC30OICenmU6ofFysgK6zZAHMeMINNmpVcy700UivKBNBLJf/bdeLBjPJUxLFmjXini5tdS1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(86362001)(7416002)(4326008)(186003)(66476007)(66556008)(66446008)(53546011)(316002)(31696002)(64756008)(83380400001)(26005)(91956017)(76116006)(54906003)(2616005)(8936002)(8676002)(38100700002)(66946007)(110136005)(6486002)(122000001)(508600001)(5660300002)(2906002)(6512007)(36756003)(107886003)(6506007)(31686004)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXRCRHhiYjJQYVBUZGFiRmV3a1Y4Wi8xQ0hwVVBEK296NXlyazN3SURYamVT?=
 =?utf-8?B?OXExUmc5QWUxcitqM0dlakIwL1p2cmk0TlluRWNvMm5URlhBRzBISE56cUYr?=
 =?utf-8?B?YUdDdVM2aU9GWlEwUmVINWxKSlZ5K1M2ZmpLMkY4QXY2SEpNQ0FJZkZCTXFN?=
 =?utf-8?B?akdHSmYyYTd0eW8zLzZFY2RMV1VZYXdPaHBPOE5LeHk0T0diYk5hY3NLYkNM?=
 =?utf-8?B?TFNScTV5S3dDZE52NDd3VkhHNVdxMDJFbnFHNllNM01BMU9ReXdtMDQwRi9I?=
 =?utf-8?B?aXFBUWVoYzlRWU44SjU3NVhYSHJNelB0c2M3bVdyaVBXWVdpdm9iQ2xUc2JT?=
 =?utf-8?B?b2ZCMVRjcVgySDIrUmVUclRubzJNWC91cW5QNUZjNVNPOUNHMVdWWVRweHR1?=
 =?utf-8?B?SUZoOXROb2ZNczNYSFFVWm9DRDFHL1ZqcThySmUxam9XbVp1VnRQNlEvZHpa?=
 =?utf-8?B?QWc3cGw3SXdQR0d1QmQ5eTBwTXN6Ykp4WnpKRXg2ZWVRMGhOOWlpaVkrSEsz?=
 =?utf-8?B?Q0lZU3owOVVtemdCekVWaXB5TG9ZMDBoQTFJMUtGRHhEdnRZWEc0Rnkvdk1I?=
 =?utf-8?B?Y2o2Ky94T0c0a2NRNXRnZHhWVHBsa2FTTXYybG1CcVI1cVJ0dWR2Mkg2SUI2?=
 =?utf-8?B?NnVPaFJ0bFRWdTVJc0ovK2tSb2pTRGdLZFZxdWF5dUxNVk13TDdiR0Jnbk5k?=
 =?utf-8?B?eWREQzgzZ1h3NmFmc3ExVVFUUHZ4c3d6TjFDSStjNXYzT2FGczRReUVpbm9t?=
 =?utf-8?B?c0RyOFdwVzZaVnFweVdIdjgxdEJxSi9SeFFQM2w4THJ3RG5ONjdWM3JnT3pX?=
 =?utf-8?B?VC9WVE1HYm83a3JRTnZpOUxQSmtrdHVjcGwxdUp0YTNLZzViU0hRRWZyemJ4?=
 =?utf-8?B?LzR6eFpxemZXUC9OekpScW9OQWlhWWFqaXlhYXZ6ajJzS3hoeG9jVThNZ3Zy?=
 =?utf-8?B?d0lRRU5hNEs3amxaNDNmaXZDMlhkL0xkWTNrSHBaTHVCdDNVM0F3TXR1VVR5?=
 =?utf-8?B?aW91T2hnY3ZBS1gydXZsRnlGMWM3TjZEcXNqYVlGY01vaXBXdC9qaGROMTBN?=
 =?utf-8?B?cm1ocDBkSncxQUdTTzlPSVNtam0yNjVXOEs5L1ZMV2FlemtSZk5oemJBRDVF?=
 =?utf-8?B?NElBL1F6RnI1NFB6OE9KVStKeEV1endVRmlwa0d3ekFWcnRTYmVjTHplb1k1?=
 =?utf-8?B?RkxtZWdobGZsczRkRldSYitSNUY3NnFIdloxTmtYVlhNVEJ6MVZhL2hkTmxC?=
 =?utf-8?B?WDkrODJSNytNOFZNWWovSEZGVi82MytCVDNnc2FsejZhUEFCVXpvNUJPWVFI?=
 =?utf-8?B?MXpzUktxRGlSMDY0allSOE5uQk1ERHZOWldVbk1veis4ZVpNM2lpTCtIVm90?=
 =?utf-8?B?OFBHMDhBcGJxYlk1aVVyM0FZdFZvWlJ3TDF4QXd0My9oYnlLUElLSTVTMlFE?=
 =?utf-8?B?dWtSOURZT3FYdGtTQjdDZExla3JxWlE1bnUxR3lTUVRSZVBhZ1pYWERUNFJC?=
 =?utf-8?B?dFFFQmF5aEszbEFoOThNRjFlc2pqNllDT0U2RnM3dkVNN1Rjd0xDR0YxdHRT?=
 =?utf-8?B?YWQvVXdkS2F2NTlrc05TOUJPaTlKbVA2UE9IbzQxZExqVG43Qm5JNUgyaCty?=
 =?utf-8?B?NjNjMmZJN2hSeHM1RzI0REpzMHA1U1djQVFHTTFZYnliWDZ2RERDcjBJV1NX?=
 =?utf-8?B?eE9jOHhHblNidmZpQWh5MW5nenV2VTJuLzliOEZPU0tSSk5YVkxWMitIL2Fs?=
 =?utf-8?B?eE9jL21MaVcrY0RldHVwYVV4Zy9CSWpjTk5sZkFBY0pvSFhtM1k5M1RHNGFM?=
 =?utf-8?B?YnQyQmVVeENkUUdCYThhMzNBT3AwL095RzZtcVhScU9vR0M4MmNpYTRWQmdX?=
 =?utf-8?B?QmhwQitZbm8xMHMyLzRIQzh4MmRVaXozbk9VV29Fdms0RHV1WG5mY1BKT3I3?=
 =?utf-8?Q?N8jQOQmSFUo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D2FB07745101F4CAF25A824E8F104F3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c28479-441c-4d8d-b5e1-08d995466606
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 10:26:24.0147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: conor.dooley@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588

cmVzZW5kaW5nLCB0aGluayBpIGFjY2lkZW50YWxseSBjbGlja2VkIGEgZm9ybWF0dGluZyBvcHRp
b24gYW5kIHRoZSBtYWlsIA0KZ290IGNvbnZlcnRlZCB0byBodG1sLg0KDQpPbiAyMS8xMC8yMDIx
IDE5OjM0LCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgT2N0IDIxLCAyMDIxIGF0IDY6MDAgUE0gUGFsbWVyIERh
YmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6DQo+PiBPbiBUaHUsIDIxIE9jdCAyMDIx
IDA2OjEzOjM1IFBEVCAoLTA3MDApLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToN
Cj4NCj4+ICtBcm5kLCBPbG9mLCBhbmQgdGhlIFNPQyBsaXN0LiAgVGhleSBwcm9iYWJseSB1bmRl
cnN0YW5kIHRoaXMgYmV0dGVyDQo+PiB0aGFuIEkgZG8sIHdlJ3JlIGtpbmQgb2YgbmV3IHRvIGhh
dmluZyBTT0NzIGluIFJJU0MtViBsYW5kLg0KPj4NCj4+IEkgZ3Vlc3MgSSB3YXMgYXNzdW1pbmcg
dGhhdCBzb21lb25lIG1haW50YWluZWQgZHJpdmVycy9zb2MsIGJ1dCBmcm9tDQo+PiBwb2tpbmcg
YXJvdW5kIGl0IHNlZW1zIGxpa2UgdGhlcmUncyBubyBlbnRyeSBmb3IgaXQgYW5kIGluc3RlYWQg
aXQncw0KPj4ganVzdCBhIGJ1bmNoIG9mIGVudHJpZXMgZm9yIHRoZSBzdWItZGlyZWN0b3JpZXMu
ICBBcyBhIHJlc3VsdCB0aGUNCj4+IHNjcmlwdHMgYXJlbid0IHBpY2tpbmcgdXAgYW55b25lIHRv
IHNlbmQgdGhlc2UgdG9vLCBhbmQgSSdkIGFzc3VtaW5nDQo+PiB0aGF0IGJlY2F1c2UgdGhleSdy
ZSBub3QgaW4gYXJjaC9yaXNjdiB0aGF0IHRoZXkncmUgbm90IGZvciB0aGUgUklTQy1WDQo+PiB0
cmVlLg0KPj4NCj4+IFRoYXQgc2FpZCwgaXQgbG9va3MgbGlrZSBJIHB1dCB0aGUgS2VuZHJ5dGUg
c3R1ZmYgaW4gdGhlcmUgKHNvIHNvcnJ5IGlmDQo+PiBJIHNjcmV3ZWQgYW55dGhpbmcgdXApLiAg
SSdtIGhhcHB5IHRvIHRha2UgdGhlc2UgdmlhIHRoZSBSSVNDLVYgdHJlZSBhcw0KPj4gd2VsbCwg
SSdtIGFzc3VtaW5nIHRoYXQgbWVhbnMgdGhlcmUgc2hvdWxkIGJlIGEgTUFJTlRBSU5FUlMgZW50
cnkgZm9yDQo+PiB0aGlzIG5ldyBzdWItZGlyZWN0b3J5IHNvIGNoYW5nZXMgdG8gaXQgYXJlIGxl
c3MgbGlrZWx5IHRvIGdldCBsb3N0Lg0KPj4gU29ycnkgaWYgSSB3YXMgY29uZnVzaW5nIGJlZm9y
ZSwgSSBndWVzcyBJIGZvcmdvdCBhYm91dCBob3cgdGhpcyBmaXRzDQo+PiB0b2dldGhlci4NCj4+
DQo+PiBBcm5kOiBhc2lkZSBmcm9tIHRoZSBsYWNrIG9mIGEgbWFpbnRhaW5lciwgdGhlc2UgZ2Vu
ZXJhbGx5IGxvb2sgZmluZSB0bw0KPj4gbWUuICBMTUsgaWYgeW91IHdlcmUgZXhwZWN0aW5nIHRo
aXMga2luZCBvZiBzdHVmZiB0byBnbyB0aHJvdWdoIHRoZQ0KPj4gUklTQy1WIHRyZWUuDQo+IA0K
PiBJdCBwcm9iYWJseSBoZWxwcyBhdm9pZCBtZXJnZSBjb25mbGljdHMgdG8gZ28gdGhyb3VnaCB0
aGUgc29jIHRyZWUsDQo+IGFzIHRoZXJlIGFyZSBnZW5lcmFsbHkgbW9yZSBjaGFuZ2VzIGZvciBh
cm0gc3BlY2lmaWMgc29jcyBpbiB0aGVyZS4NClllYWgsIHRoYXQgc291bmRzIGxpa2UgYSBnb29k
IGlkZWEuIFNwb2tlIHRvIE5pY29sYXMgdGhpcyBtb3JuaW5nIGFuZCANCndpbGwgc2VuZCBhIHJl
dmlzZWQgdmVyc2lvbiBvZiB0aGlzIHcvIHlvdXIgY29tbWVudHMgYWRkcmVzc2VkIGFuZCANCmZ1
dHVyZSBwb2xhcmZpcmUgc29jIGFkZGl0aW9ucyB2aWEgdGhlIGF0OTEvc2FtIHRyZWUuDQo+IA0K
PiBIb3dldmVyLCB3ZSB1c3VhbGx5IHRha2UgcHVsbCByZXF1ZXN0cyBmcm9tIHBsYXRmb3JtIG1h
aW50YWluZXJzLA0KPiBub3QgaW5kaXZpZHVhbCBwYXRjaGVzLiBGb3IgTWljcm9jaGlwJ3MgQVJN
IGJhc2VkIHBsYXRmb3JtcywgdGhvc2UNCj4gcGF0Y2hlcyB3b3VsZCBnbyB0aHJvdWdoIHRoZSBB
VDkxL1NBTUE1IG1haW50YWluZXJzIChhZGRlZCB0bw0KPiBDYykuIFlvdSBjYW4gYXNrIHRoZW0g
aWYgdGhleSBhcmUgd2lsbGluZyB0byB0YWtlIGZ1dHVyZSBwYXRjaGVzIGZvcg0KPiB0aGUgcG9s
YXJmaXJlIHNvYyBhcyB3ZWxsIGFuZCBmb3J3YXJkIHRoZW0gdG8gc29jQGtlcm5lbC5vcmcgYWxv
bmcNCj4gd2l0aCB0aGUgb3RoZXIgc3R1ZmYuDQo+IA0KPj4+PiAraW50IG1wZnNfYmxvY2tpbmdf
dHJhbnNhY3Rpb24oc3RydWN0IG1wZnNfc3lzX2NvbnRyb2xsZXIgKm1wZnNfY2xpZW50LCB2b2lk
ICptc2cpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgaW50IHJldDsNCj4+Pj4gKw0KPj4+PiArICAgIG11
dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmdHJhbnNhY3Rpb25fbG9jayk7DQo+IA0KPiBXaGVuIHlv
dSBkbyBhIG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgpLCB5b3UgaGF2ZSB0byBjaGVjayBpdHMg
cmV0dXJuIGNvZGUgYW5kDQo+IGhhbmRsZSB0aGUgaW50ZXJydXB0aW9uLCB1c3VhbGx5IGJ5IHBh
c3NpbmcgZG93biAtRUlOVFIgdG8gdGhlIGNhbGxlci4NCj4gDQo+Pj4+ICtzdHJ1Y3QgbXBmc19z
eXNfY29udHJvbGxlciAqDQo+Pj4+ICttcGZzX3N5c19jb250cm9sbGVyX2dldChzdHJ1Y3QgZGV2
aWNlX25vZGUgKm1zc19ub2RlKQ0KPj4+PiArew0KPj4+PiArICAgIHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG1zc19ub2RlKTsNCj4+Pj4gKw0K
Pj4+PiArICAgIGlmICghcGRldikNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPj4+
PiArDQo+Pj4+ICsgICAgcmV0dXJuIHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPj4+PiAr
fQ0KPj4+PiArRVhQT1JUX1NZTUJPTChtcGZzX3N5c19jb250cm9sbGVyX2dldCk7DQo+IA0KPiBU
aGVyZSBzaG91bGQgcHJvYmFibHkgYmUgYSBjaGVjayBpbiBoZXJlIHRvIGVuc3VyZSB0aGF0IHRo
aXMgaXMgYWN0dWFsbHkNCj4gYSBzeXN0ZW0gY29udHJvbGxlciBhbmQgaXQncyBib3VuZCBkbyB0
aGlzIGRyaXZlciwgcmF0aGVyIHRoYW4gcmV0dXJuaW5nIGENCj4gcmFuZG9tIGRldmljZSdzIGRy
aXZlciBkYXRhLg0KPiANCj4gSXQgbWlnaHQgYWxzbyBoZWxwIHRvIG1ha2UgdGhpcyB0YWtlIGEg
cGhhbmRsZSBpbnN0ZWFkIG9mIGEgZGV2aWNlIG5vZGUNCj4gZm9yIGxvb2t1cCwgdG8gc3BhcmUg
dGhlIGNsaWVudCB0aGUgZXh0cmEgcGhhbmRsZSB0byBub2RlIGNvbnZlcnNpb24uDQo+IA0KPiAg
ICAgICAgIEFybmQNCj4gDQoNCg==
