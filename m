Return-Path: <SRS0=DB73=YA=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AD0C04A68
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 08:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA6C2C433D6; Wed, 27 Jul 2022 08:02:01 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 388A7C433D7;
	Wed, 27 Jul 2022 08:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 388A7C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658908921; x=1690444921;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MwVlqPfSLH3TBnxrpKmu23QoKQbifuCCCwLsXAeJjvs=;
  b=n2pQ36eeAyWFvyPA3XZ6In5h9K9SNSfUUH9AE8hGZq/8JMW7Zud83Vw3
   qIrJRCU0FeQviklc5PdAgmWCGqtiShYHp74Gdnrhn8yZVj0WclPyPu+XM
   0PAtJUliSajg2wJXYi3k5zIfd1vYx1vmma2X7Ai/YVxZHkUxGHJAya97+
   g0GPMjL24mzpN98rPD/Q7+yFSsmZXWFuPAVTJkYPvwgYZFzH0UdlFtlI8
   81zgOXc/zMRSkpHUgRNyhBW260680tsQrXKjsqL8g/arwm9SBBFlYrGfX
   r73Kr803HFkc5Lpm9tYiJAfcgiyg7ogFMtWeWSC76Kcc6suuTB2qleF1h
   A==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="183924235"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 01:02:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 01:01:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 01:01:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+2axBAhj2Ru3I55wFmOcYQiMEDVVW9gl8w6R6UdPUJh3UvCNAw4K09F8rBgTvA9BlqvPtj1VA1sdgY4uLG+gBTb3LkkxHyPxULJhfQeFVQwc9OBdikOTEslqeS8fz7OgeEiy9MRlxXsjOGV73EuXcBYdSM5A/vSgiqilisUBffF7scs4TKIypRKSGo0TJWzYem0xYtvkxDkE9ZNcPkGeh32OrPY05BSU6hjcoCqYDLEUvmmb57amSjtPHMlcIOl6YnOXPAJ7kiOnNFwgnXp2Xak6oo1gKszv2Y7V6RAyjjMirkmvKWGO7Bt3T+skPMeVyHPpg46Fj8xZsW2j5e44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwVlqPfSLH3TBnxrpKmu23QoKQbifuCCCwLsXAeJjvs=;
 b=NHBS5RqD1ffgw53n/bbc49xP6zGFzafyx5YtGtwC2ARi6GUAI8ImDtTroNOIIUyC7Fb0zl8qcNArEGTJyv/z7boipUjscDhXDNnGjqJoMAi1adFXZCV53gE4XUXJNKWbRkZ/Zbp94aYSDpPxwl8eebMQF/DWZZqOSqiL0NIz12A/lipSLUC0HQdPhMK5W8azjGksR3JMsH56J/VzWzYzg5joXDRPo0e883QfDVZwAEUWqGMVKUEajMOc0Y/yK1wFDvX6y1g8w428XOPnRZQ5iNHW0ZVLbMd2FRu2u79+cs3fA+oVOFrEZ6DRZpTHVbWcndjCmF164GxkhwGxiHXwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwVlqPfSLH3TBnxrpKmu23QoKQbifuCCCwLsXAeJjvs=;
 b=XYgXpcdtDBt1dNAYwKqEG/gjYa0Zez4dL1tAs5KdbOlc35OmeVvzmW6jL0iw3M4PvBOROQBFaLdI76sZ1Sq7HfeEi/HCit4KC8gF0yWXaK9k15hx5iAoD1U2dpZ2t28Z2/244yTRBpHaE/mVfm4sLJjipSYXm7qRUle6Kmn8Lo0=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 08:01:54 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 08:01:54 +0000
From: <Claudiu.Beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] T91 device tree updates for v5.20 #4
Thread-Topic: [GIT PULL] T91 device tree updates for v5.20 #4
Thread-Index: AQHYoY8iBUHl5KccSESnp+szLQHBuA==
Date: Wed, 27 Jul 2022 08:01:54 +0000
Message-ID: <64d7a64f-cf78-36f3-0226-31d42cf9f149@microchip.com>
References: <20220727075749.2445000-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220727075749.2445000-1-claudiu.beznea@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85c22712-e523-47a0-b721-08da6fa6452f
x-ms-traffictypediagnostic: MN0PR11MB6206:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nXeHIQl8PHp9k1kozNImak8FwW7Tbw304fK13SmNhaHd7ci2mO+No0/WMMj4I+Vs3cgP0yfpvkeTZ4nWlecmZNs0jhHf+NqtzVmd+pEUwiEYH7ffzzV33Q2TV6Xjr57ohbOD1jLW8HBRwWQjEPs1R4awYgCKyqMt2fW/vBSEfKOy9DsCYGTm3oVucWKZtDvuiC6XAGtSrjVeZ5PWfVewnR4sgL6IdFAY2nIcjXhXGcq1sMMUQBuacQvAJGHflWyR0zbRaRVrmIZmXCXxDvwrUgsbCaJPH9GNSYI4Bn6baUQRuaR2b/cu7+vFO5KDIPzTtr7nMdzXh/oL2lVuQTV10Ml6AHMMs82HuYO9i1hKJbjNyLOk3tuhqOGKBVwW5ileDEulfRFQmCsy2KwBZCgE6VRQWCpK5y83ndRtoaweIYXtgmbfLGyb3OdGpetvfOUAqkLq7uqIrpWMpdvdcAj4wOOlmksG2hiDHE8dBJYAEa+LlZM0SjcshBzg2i1XDTcbXiQ+E2EL1I0T3l0bdJljzc/cCfawCQpq4GmAtaVu2fAuP98FNBlcqpy1WebuFWbTIZXKH5RaowTcdNpmvX9hueBuaUtUPADcEFV89SscNEp3m5PaZb6TZFpAd7VI9pf0qbnFWOJ6+iEnnKveUVhRUUKiPbj9SEv+3muNFP/Jpfc32BLmkYVCE3VWbowvzk/xk5GTFbo9wgBKf/wPW/VJP1yLK8k/FMlJl8r7T+orckF1tCCbD8GXmieSXvZ9PcAqNaAOgIvZK2ihP2s394LSqWZIWk19H4GVLmxCxft2ik0Fe0Q6Wz7Id8X57C3e9VHT7qMsz5SIVd2Bs895LfCNsdLxfIgXRFFZi4CXg4w9DB8G0CBpf5dD/pDmUzEe/iPj003fwg00uJjMgQTQw6yV58b5OujVFS1nycxb6ksqCkBLMVY4xEI938nZeA4SgE7a
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(396003)(366004)(66556008)(2616005)(66446008)(66946007)(76116006)(186003)(8676002)(91956017)(64756008)(83380400001)(54906003)(6506007)(66476007)(110136005)(36756003)(2906002)(31686004)(6512007)(15650500001)(41300700001)(86362001)(8936002)(966005)(31696002)(53546011)(122000001)(26005)(38070700005)(38100700002)(478600001)(5660300002)(4326008)(316002)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXFzOWFIbngwbCtlUXRvVC9SWTBmY1VOem5qVFdGMDJ2VnpnaWpFcTcrUWt1?=
 =?utf-8?B?SlpOZDFQMTZLM21ZSG1YS3lEOXY4cXlRbDBORE5YcWFNcEtDMTEzUDJ6RzAr?=
 =?utf-8?B?OTNEM1pjcHMzZ1Z5Qll5aCtMSDk1aVdCZVk5b21WN3FSbFJlaENNbnZNenF5?=
 =?utf-8?B?UjhKNWNESkZ4QTBFakdqSkFkSFhvUWlaSm9ybUtpMWdvckdtMkNGRmRJdE5H?=
 =?utf-8?B?UnFuTnFoWW9RUjYxelZ6QlE0RFNuVlk5RFl6cU5aS0NYOWpCZWZVYnhMMDVI?=
 =?utf-8?B?MDNzSytyMTVpV0srNG9JTHJvL0dnWWJIV1VDMVZwVUhqUmxvWjVWMDdKc0hH?=
 =?utf-8?B?eWZWQ2tIR3A3aFhBMjRIdjJEbUNvYlZBTG1IZnNWY2Z6a3IvcWdWcVkvYnhK?=
 =?utf-8?B?OXpIRHBzb1FYODM0VnN4MmlvbVJ1dzRoQ3hZMXA4clpsa0R6c0VUQjBrcG9O?=
 =?utf-8?B?SnVVb3RERnc4ejdKaXByNGV4MDM4U0RxWE5aU1F4ODBGZlIzczZXRFg4M1VI?=
 =?utf-8?B?K0kwL3RRZkJXWnVlL0ZqcG5LNGVoMXBGcjZSTXd0T1FGTWY0Njl0SThWZEp3?=
 =?utf-8?B?dUdQcTJzY09yT0lDWDBRL2ErbHhRQ1o1YjlXREU0ZTF2eEExMWRWYXRWR2FZ?=
 =?utf-8?B?ZE5HajlEbENNbVlSL0ZxVWtkSEk1eUdCRlpNWkZ3bmVZeEJkSkZjUXdHakha?=
 =?utf-8?B?VDBxNkQ0QXJHcnpZR3VlY2F0TmI4WGVoZlZ0elFOY2EzSkVwTC9tTVltTXpZ?=
 =?utf-8?B?UytaZTAzQ296WEhTY3BFTHA1cGhWQ1dubzBINjNEemJYU3UzMlE0YU56TGM0?=
 =?utf-8?B?dmxodWU0MWNiRHRoSEF2MUFrMThiK1pOT1VvdG94c1duUEszZFVxbjZ3YUdI?=
 =?utf-8?B?MkpXbXhiNlFqSFZFRzNmaEszQUQ1eHRoUCtJT3hNTUh3citGYUlZTEVMYlAr?=
 =?utf-8?B?Q0tld2tHLzFCWnZVdVVlWTVGWVRhakMwMHBoYmFlZEZ5RkFuTVVoa05TOGgw?=
 =?utf-8?B?bjBxYXlDdVpTY0FBQ25hdkR1OWcvbThEb2RWSEJ5cFVGa3lYWEUxb1RIWlNM?=
 =?utf-8?B?M0VIbzVTd1I1NFV5VU8zL3hnQVlTN0RRazZoS3lsZ2VvNUEwN3htZDBxTE5W?=
 =?utf-8?B?Y25TcDBkSWZGcUdiSldDbU1WSW4xaDhWSzY5SENvNGlHd3JKelJoa2NYSGlh?=
 =?utf-8?B?bHllbHpBVnlEZUtSM0o0N0Zvam5yRmozbTkvTkEzRjhWVllUbXJodWRESC9X?=
 =?utf-8?B?ZDBNSHlRZHJ0bHYvTkdNdGVRQ0hTdWE0TkFlSk1JeDAyUkZTR1VwcnNNVG9X?=
 =?utf-8?B?V3RzYitRM1ZGM0VwNVh4ODdkanQxMWxRN2FaK2VadEozdHRLZktnNkxua1U0?=
 =?utf-8?B?OU41Y0E1OGpKZk1nRFlPUHdUaWxMK3VXU0NBUkdYMmtOWWNVcEpDYWx3VENI?=
 =?utf-8?B?bWVKdUlLN01nZ2FRNjF2K3BwblF5NzhpWEdSYkJUMDJtR0VNZ2Z6NmhGRVlN?=
 =?utf-8?B?NXFUa0pERUxUK3JueWE2Ui9URDFuRTJmeUR2VUpwQ3ErMTZWODFON2tadW5w?=
 =?utf-8?B?VkltY25KdkdXZklibXNpTW5GSXZaMWFsMzVuOU1ONUxjNjZxbEhHcDMxNHcw?=
 =?utf-8?B?VGpJSVdZNVJtZWRSblU2Q0tTMGU5dnMvb3BxV1pZdEZhM2xPM25hNDdQbGRW?=
 =?utf-8?B?by85TG9IRURxZUVRNkt1TUV5eWRmYTBOSGVVV3NYbVZ5YUVPQzJ3TTlST2Nq?=
 =?utf-8?B?cC9mamdDQXh4YUxxVlEyblpmWlNBYUduckVubXZkeEpGeVlsWTcrZk5WazAv?=
 =?utf-8?B?MnlHOFhnNzc4QUFsL2Fpd3ZreTU1UCtyV0J5dFlWQVg0OWk3S0tXSVZ3Z3NT?=
 =?utf-8?B?N2F1bGJTN2J4aENIWG9nL3BJdHpsYUtjY3lmOVZxWExtdEx0cVpYTUN5V3BH?=
 =?utf-8?B?N0pCaWV1bHFwa2ZVNzJFeEt5TzNsVkpQa0pNSTRHLzQwSWRpbkV6WERlNFdR?=
 =?utf-8?B?cUdOMUR0RU93bFpoanVsQm9RbjlCR2lsSzh5MW9JbVNBbVZ1Z1V1UUEwTzVY?=
 =?utf-8?B?c1U5SkRUTk40aDVKVVIrWHFNbzVEbitUOWJPNmpDNGpCQk1HRTREcElOeE5U?=
 =?utf-8?B?bHZuY0wrd0Z6Yklmc2FNZlBmYk5HUExSRXlhWjRPTnVsQlZ3eGs0U2p1Slh0?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD046C26054BB249902432B3E5831DB9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c22712-e523-47a0-b721-08da6fa6452f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 08:01:54.1887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmMkg3G3uUk2jE3q/nV5i8cUwQDLLITziovyi3Q7jU7j/X5vaKfKc2ecFIsw2NLQKqmKbIfIzZhTuYFcU7sq+xAxtJYWCtT64DT9v2vFNxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206

cy9UOTEvQVQ5MQ0KDQpPbiAyNy4wNy4yMDIyIDEwOjU3LCBDbGF1ZGl1IEJlem5lYSB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSwgQXJuZCwNCj4g
DQo+IFRoZXJlIHdlcmUgZmV3IHVwZGF0ZXMgcG9zdGVkIGxhdGVseS4gSWYgaXRzIG5vdCB0b28g
bGF0ZSwgcGxlYXNlIHB1bGwuDQo+IA0KPiBUaGFuayB5b3UsDQo+IENsYXVkaXUgQmV6bmVhDQo+
IA0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGQzZTcxYTJlYWUxZjQzZmQz
MTg5MjI2OTRiODQzZDM0YjQ5MjBiMDc6DQo+IA0KPiAgIEFSTTogZHRzOiBsYW45NjZ4OiBFbmFi
bGUgbmV0d29yayBkcml2ZXIgb24gcGNiODI5MSAoMjAyMi0wNy0yMiAxNzo1NDowOSArMDMwMCkN
Cj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hdDkxL2xpbnV4
LmdpdCB0YWdzL2F0OTEtZHQtNS4yMC00DQo+IA0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gZTQ4ZWY5YTljNTI5NzJkMTRjNzg4ZDU5MDI0ZGNjN2Y1NjZlZDJjOToNCj4gDQo+ICAg
ZHQtYmluZGluZ3M6IHNvYzogbWljcm9jaGlwOiB1c2UgYWJzb2x1dGUgcGF0aCB0byBvdGhlciBz
Y2hlbWEgKDIwMjItMDctMjcgMDk6NTA6MTEgKzAzMDApDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IEFUOTEg
RFQgZm9yIHY1LjIwICM0DQo+IA0KPiBJdCBjb250YWlucyBvbmUgbmV3IExBTjk2NiBiYXNlZCBi
b2FyZCwgbmFtZWx5IHBjYjgzMDksIGEgY2xlYW51cA0KPiBvbiBNYWtlZmlsZSB0byBzb3J0IGFs
cGhhYmV0aWNhbGx5IExBTjk2NiBlbnRyaWVzIGFuZCAyIGNsZWFudXBzDQo+IG9uIGJpbmRpbmdz
Lg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiBDbGF1ZGl1IEJlem5lYSAoMSk6DQo+ICAgICAgIEFSTTogZHRz
OiBsYW45NjZ4OiBrZWVwIGxhbjk2NiBlbnRyaWVzIGFscGhhYmV0aWNhbGx5IHNvcnRlZA0KPiAN
Cj4gSG9yYXRpdSBWdWx0dXIgKDIpOg0KPiAgICAgICBkdC1iaW5kaW5nczogYXJtOiBhdDkxOiBh
ZGQgbGFuOTY2IHBjYjgzMDkgYm9hcmQNCj4gICAgICAgQVJNOiBkdHM6IGxhbjk2Nng6IGFkZCBz
dXBwb3J0IGZvciBwY2I4MzA5DQo+IA0KPiBLcnp5c3p0b2YgS296bG93c2tpICgyKToNCj4gICAg
ICAgZHQtYmluZGluZ3M6IHNvYzogbWljcm9jaGlwOiBkcm9wIHF1b3RlcyB3aGVuIG5vdCBuZWVk
ZWQNCj4gICAgICAgZHQtYmluZGluZ3M6IHNvYzogbWljcm9jaGlwOiB1c2UgYWJzb2x1dGUgcGF0
aCB0byBvdGhlciBzY2hlbWENCj4gDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXRt
ZWwtYXQ5MS55YW1sICAgICAgICB8ICAgNiArLQ0KPiAgLi4uL3NvYy9taWNyb2NoaXAvYXRtZWws
YXQ5MXJtOTIwMC10Y2IueWFtbCAgICAgICAgfCAgIDYgKy0NCj4gIC4uLi9taWNyb2NoaXAvbWlj
cm9jaGlwLG1wZnMtc3lzLWNvbnRyb2xsZXIueWFtbCAgIHwgICA0ICstDQo+ICBhcmNoL2FybS9i
b290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQ0KPiAgYXJj
aC9hcm0vYm9vdC9kdHMvbGFuOTY2eC1wY2I4MzA5LmR0cyAgICAgICAgICAgICAgfCAxODQgKysr
KysrKysrKysrKysrKysrKysrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRz
L2xhbjk2NngtcGNiODMwOS5kdHMNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwNCg0K
