Return-Path: <SRS0=72kt=5N=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DB1C46467
	for <soc@archiver.kernel.org>; Mon, 16 Jan 2023 09:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F715C433F0; Mon, 16 Jan 2023 09:53:51 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FD33C433EF;
	Mon, 16 Jan 2023 09:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FD33C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673862830; x=1705398830;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=lWQx8MEF582d0YDHfda0eikt8/ZyyI5XAUitpuza3v4=;
  b=CXo06qPN0PyyP8aQu2PwVQmMzvlHzCxnJCHc1HbhMNCEZj+PHExXLBJw
   frGk4ZWMvn5OsdNbBKiwlVg315W6CKlkc1trQh02vCS0nePLHCRKTGgnN
   Fau9ur5UpEGrKAXAP/WppQjsuViM7IFANM6DLIc1MIlH82iNNOZKMgjNr
   x3BHvmJOdmQNPAbWnN5juDzYmix+s/oLK9Vg7movj3cub0/M4i+4TjDI/
   NQX9R22WKmVDj4EHsUpG1gq9mEiRZpdvU9XSji8Zu71/NfkU/Bp9rkdRN
   58Y+VNodAtoUmK/NK1jGLtVSxg3KVtpF6fGGqtVr8qQkayWtBOGiYKILS
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669100400"; 
   d="scan'208";a="196953849"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jan 2023 02:53:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 02:53:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 16 Jan 2023 02:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBqlt9Y15I6AelOk/kRRBGd7XjCq3TofJdOS72bjAQGXvUDItCo+O+EPGmNX74EVv7p4KhmtQ5bns4VPf/V3VkK4fsNYbB+lbwib42bl8J85nFZre1Py1DEsJvsAAA1xXh4y+ekzvaKnA4KWfzHbuihcf3dDPpd2FNk3/GZUQ20h7KN/1ZKGiNzf/grNp7iuZowBJuibge5u0Nk8ojDHRqxYXWGzclbzXH9YufRBBBX8CxoCLoXlS4aatW7tVXNOg/b/wyuOxAgRokBlAMHIfN6cnFvdjbVznD4eCY29uTm5Hgdy8ppC5RQraQjYYT4R3+DpEWmJSVhyMGsHttl2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWQx8MEF582d0YDHfda0eikt8/ZyyI5XAUitpuza3v4=;
 b=SQtCq9sDUq2EsxjEVTcATqQdqnl7KTcX1a/2m3FiyuekPcGdSf2upTqGs9Hz57cuGEFIf+uLhvW3hXYgcn881z5/rqDzWsLWJ2TwDSOJzE1uJ+VcrylGHFsk5SjozopHa/8kPNTxj0VxO3nAdxvwu7e7TDmInk0lEgcU/iYHW56VvWfl7a4Li6CU8J5G1Hw0ikMrhkieAMkBHpOL3yQXXc2wlgzFvO0SIhrc5f8hmGmKL8/UPLi8l6GnGwL8c+cCwxPxJF1i17dMkOw9Pg8P16uz53jMxUSb20LtbCLRAZwvyRr/om578w0jKVxkVPbT2hnMSnxALdK2OxLw1vhS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWQx8MEF582d0YDHfda0eikt8/ZyyI5XAUitpuza3v4=;
 b=kRA4D5WnqSmwqGQ4POGGzf20YFCnpJJf2J5yG3/tdMizNlEO6fWIaQ3ugVokgN0zxLf8d2qyQvO053UdryqqfMo5lanX75PVxa2zwgs0mJJRjYSaX0MBmLPh48LwoW5n1gg0qP2SnwG2Vpmz1pkhGBI8NKGj4jW6qcls1Y1wRB4=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH0PR11MB5808.namprd11.prod.outlook.com (2603:10b6:510:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 09:53:39 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5%9]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 09:53:39 +0000
From: <Claudiu.Beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <Durai.ManickamKR@microchip.com>, <Hari.PrasathGE@microchip.com>,
	<Balamanikandan.Gunasundar@microchip.com>, <Manikandan.M@microchip.com>,
	<Varshini.Rajendran@microchip.com>, <Dharma.B@microchip.com>,
	<Nayabbasha.Sayed@microchip.com>, <Balakrishnan.S@microchip.com>,
	<Cristian.Birsan@microchip.com>, <Nicolas.Ferre@microchip.com>,
	<krzysztof.kozlowski@linaro.org>, <alexandre.belloni@bootlin.com>,
	<davem@davemloft.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Kavyasree.Kotagiri@microchip.com>,
	<Horatiu.Vultur@microchip.com>, <robh+dt@kernel.org>, <andrew@lunn.ch>,
	<michael@walle.cc>, <Jerry.Ray@microchip.com>
Subject: Re: [PATCH v4 4/8] ARM: dts: at91: sam9x60: Specify the FIFO size for
 the Flexcom UART
Thread-Topic: [PATCH v4 4/8] ARM: dts: at91: sam9x60: Specify the FIFO size
 for the Flexcom UART
Thread-Index: AQHZKZBokB20GPw6+UyZq2S36AFRaA==
Date: Mon, 16 Jan 2023 09:53:39 +0000
Message-ID: <47a21ac3-5a57-c0f3-4f92-9c8cde4041aa@microchip.com>
References: <20230112110208.97946-1-durai.manickamkr@microchip.com>
 <20230112110208.97946-5-durai.manickamkr@microchip.com>
In-Reply-To: <20230112110208.97946-5-durai.manickamkr@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|PH0PR11MB5808:EE_
x-ms-office365-filtering-correlation-id: 6678844a-070d-4d18-9e63-08daf7a78b27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oi3WyhHIh5fxsWAhRTJK6c12Tf5U9ELVo+le2ijCMJT92Z4yJ78hPBA2+lRYTRTgha50CvQVmqEer1L18pY5fXDyE5zX9l8r7uZW64/w6LvzY+dNtY0Lm3m+yurAxyBvPsa4xWg4OsU5ywatWinA4c8Fk7WIKfbv4wkmsGlkuNUJkGDG8cZ12BoNdjZzY89BZ+DTmcoaUtKr2X8lbpyC6UjqHKb9gvvjS1jW4G+CvEFAf6NC29+WS1fOW+o7G9J+lFk94zXBr2EiaXPyn1v3XpFN+lelPfJAATzs6RsgtWIgqi444JqrPvvgu0e4X4Li4Ltexm26gdrFYvOOQO7um++IEpPxoOGleDxRqaDOfERCups0kuDkSApP59YNfk2qtIccxK6PpxDHIJmoEwQDfYdQBRhmgizsiwEujWBglsmi5AVSbzey2J3tsGN23eKlssGOaqSs0iu+99y4LnXeon0P2TCoz6cpvuSDpQZT9m/+ikKBtauOMZJvaZFqxe08v8cWWGVEUZkb5GZ5FjSnzPCibPWYtbCDumRBQhHLiuf00PnAYVR3vqMk2bG1Nf1zaPEx/ovP7CnoKA8hURmK+zNtCRzDduZ+IGL++i2iiOeggf0TCmgPS3mEvIjRY6lnEYy5fTSJ3icvJ7Dwb+jpdB/JHzRE5R91+wFqSo2cIJnjsnqm5/MQO1Ny8CGEXappfZhAAKh3LryIrgluJJN+/wW0HhW2fr2/QVabHdXGTDbfXaKdO59EgUB2achlioMQIKpl3qqEsu8xOTH/2ocJ26gS3MjnSoKm4Lar9JHblqI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(36756003)(53546011)(86362001)(6512007)(186003)(26005)(8676002)(64756008)(91956017)(66556008)(41300700001)(76116006)(2616005)(66476007)(66446008)(66946007)(316002)(71200400001)(6506007)(110136005)(31696002)(478600001)(6636002)(7416002)(122000001)(6486002)(38100700002)(4744005)(38070700005)(921005)(2906002)(83380400001)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ti9vM21BL2xoQ1dlOWV1YVJTRi92cFVlTnZ5VmVCOUEvNWwxTElqc3oxbGF6?=
 =?utf-8?B?UXZWYU9ybHJqY1p4MWxiOWJxQjJZbk5ZaEVuOU1hQXFDUVAwTnZZWEIrY253?=
 =?utf-8?B?aXJSUkNCSEZoYWg0RjlMSjNzNkNLOFcwOXYrVlRTM09YR2d4TUxiNzFVb2FY?=
 =?utf-8?B?NGpZbDc0UWhoMTdPL0RvUGtFZVFPWElrNmVNWWlEeXZCR2swVyt0UzVoaW9Y?=
 =?utf-8?B?VnA5NXRmck4xT1EyM0tTU2tsZGJlNitSbDVrMHQzREpRNGFlZVNVdHhEN0xs?=
 =?utf-8?B?RlZEZjRFNjQzVVlnUktrWlgyKzF5c2hVVlFzYWgzWGpZZEJ0TEJmL0d2MDh2?=
 =?utf-8?B?azR0Mkt1SWVjY29PUFlGR1k5S05aMHUvNE9MNmdDN0JmSVRlVzlUUDd4dUtv?=
 =?utf-8?B?NUJ4cVR6L2hvRmJMZTlDVUVRWHdmTGdsa0kzMzRsM2VkQmZ1T2RpN29DRVpJ?=
 =?utf-8?B?ckFJR3NRR2VUKzB6TzR0aEpWMEVCT3FPblFUSXBYakkrTnh3ZWoxMFlhOXFn?=
 =?utf-8?B?dFNQVXhob2JPVmVkZGZrY3ZJK1dhRFhTNFk1Wms2SG5yV0hWVlZhOEZhZURN?=
 =?utf-8?B?MXE5NEVsMVVJcTdQMGlKSHozUE55MCtRSVZTYWk1VVZZVlBuNGxENU1KL29l?=
 =?utf-8?B?RkI4Q1ZVY1V2U0VxU1lSNm9la2l0WG44QXRRcDFLd0cyOXJTUWovckd0MlFm?=
 =?utf-8?B?WFRlYXNvYndqbTB0a3N2bWRGSmNuTnMwam9DdWR3SDlaYkRFNXY1N2RTOHFw?=
 =?utf-8?B?R0FoOEg1K1FqSzRQUnQ2U1dDc1lMRXR1UC9ZOGhwVjJOWWJMQTdzVUg5czQ5?=
 =?utf-8?B?L0tVMUtmTGhBVUowYzR2NkxpSjBlKzYrZ3lLWWYxNnVmVWZ6ckhJbE1nNTlQ?=
 =?utf-8?B?WWxOVjhVT0tRSTQ2SGNZc3FxYVN4MWw5Sk1oTUJ4d2FpazhiaUZySlVYMGZJ?=
 =?utf-8?B?MXlFYWw4TDlLU3RNMHlxaWVaKzdxdlBYdG5pUUJSNFdNNkx6TTc5cWlNQXFs?=
 =?utf-8?B?NGZGbGdoMWl4WVJWa1lPb0hOQnlWaFh2cHowQjR6V2FtRXZLVEZwQ2FEcmtt?=
 =?utf-8?B?MGFWUWZyMEJITjVHcy9yb3JJZDdjQjNYSkpwSDkrc1pWb3pTc1ROUk42UnRi?=
 =?utf-8?B?aFhtQWZBaUljK0x2MVVuZ0c2cmtsYUNpWUdtK3J0N0g2WkFoR3RlTEdndnFH?=
 =?utf-8?B?a1lLWVJVbWRVdFdKeC9DZ3o4eWtYRkRaem9PNFdWSVI2Q0duc2dqMFVRcDNC?=
 =?utf-8?B?eHR0QVNoNDExQ3ZUOFd1ak5JNEZBbHlDOUtLa2R3NEw3S2hOK3FxVzJySlFE?=
 =?utf-8?B?djhEZmExNzM3cy91d25QM0ZwcDhXOEp2MVZZV3Npdm5TOUFOQ1pyRkRSdzdh?=
 =?utf-8?B?WlhWR1dzN0picUJEYm9acUluSjdhWmxYRlVPZUszeUJKR01sNVpId1hvSUs5?=
 =?utf-8?B?cDV6Mi9IM01XYnViT1ROdFBubE5xWkpzZWlMY3pOVDZYSG5nTk1HVHo4UzRL?=
 =?utf-8?B?Q1FQdVN4eG1vaDA4eDJjekFUM0tDQ0d0QjZmVjZjbmxod0paUUF0NHMxRFFT?=
 =?utf-8?B?cC9nT1NZUUpSc1lKR2JObVJlN2RhQXhGOVZ6UStmcU5vaFBtd0pBZHJTTUxy?=
 =?utf-8?B?Mlh6UUNob1VuS0dGaUZmWTZwelJNbUZFWjRodEtSMi9heTJjMENPWStyeFds?=
 =?utf-8?B?eTk4czlacm9RN2NnQVFuRGlQSENLWEpXUU1yWC9XMjhOODh1T2lyYVZBaWZR?=
 =?utf-8?B?RGhEWmVabDB2Sm5Ob2hPYThIVEtKWU9LTGhEanZQZE04MWgycy9YaXB2bkor?=
 =?utf-8?B?bHg1ZmFnak0rYnpnNmxDaGxVeitMZCtFZmt4ODF2T1pWdEJMcUJaaDVtTXNR?=
 =?utf-8?B?UFhJcWQxQURuRDcxY2NyY0pWbVBDVTRYZEpGaWtLbjd1a1JGNUhRWGhjQ1Ir?=
 =?utf-8?B?cVRoekExYURFbW5rcjN0NjF3V0VUT1BiSXJZejZpZmdWNUFCMldPUkJoYlZ5?=
 =?utf-8?B?d3lGUjc0R1JrbUkrajQwOGtDQlNCbDdpOWszRDZUbXdEMkEwOVExUVBxZDZS?=
 =?utf-8?B?NURJZkxJRUdyWVoyZVllY2svekErbkRxbEhxd3BVNEQwbHdKRUcvazFJT00r?=
 =?utf-8?B?R3B1VzBkOEwyaWkyMDZ5c1VES3lwTHNNeThZd3RmWkI2Vlg3eG5OVUN2aVBE?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D60DD442E6DE341A1A8F9235E5B2043@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6678844a-070d-4d18-9e63-08daf7a78b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 09:53:39.2418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsLccGfUOAdpNRtoHXxopoTa6bFL4eMoCJQrHzeuo87ks6FCa63K5RBMYOWko2JNaPG770SguarcBTjpdS+PI/u8tSF/cW/IB6Y8EGTfFAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5808

T24gMTIuMDEuMjAyMyAxMzowMiwgRHVyYWkgTWFuaWNrYW0gS1Igd3JvdGU6DQo+IEZyb206IE1h
bmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4gDQo+
IFRoZSBVQVJUIHN1Ym1vZHVsZSBpbiBGbGV4Y29tIGhhcyAxNi1ieXRlIFRyYW5zbWl0IGFuZCBS
ZWNlaXZlIEZJRk9zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFy
YW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEdXJhaSBN
YW5pY2thbSBLUiA8ZHVyYWkubWFuaWNrYW1rckBtaWNyb2NoaXAuY29tPg0KDQpSZXZpZXdlZC1i
eTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0KPiAt
LS0NCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3NhbTl4NjAuZHRzaSB8IDEgKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc2FtOXg2MC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc2FtOXg2MC5kdHNpDQo+IGluZGV4
IDc0YzkwMTU4ODAxYi4uZmJkZGUzYWIxMDg2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9zYW05eDYwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc2FtOXg2MC5kdHNp
DQo+IEBAIC0yMDksNiArMjA5LDcgQEAgQVQ5MV9YRE1BQ19EVF9QRVJfSUYoMSkgfA0KPiAgCQkJ
CQljbG9jay1uYW1lcyA9ICJ1c2FydCI7DQo+ICAJCQkJCWF0bWVsLHVzZS1kbWEtcng7DQo+ICAJ
CQkJCWF0bWVsLHVzZS1kbWEtdHg7DQo+ICsJCQkJCWF0bWVsLGZpZm8tc2l6ZSA9IDwxNj47DQo+
ICAJCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAJCQkJfTsNCj4gIAkJCX07DQoNCg==
