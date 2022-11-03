Return-Path: <SRS0=yFmA=3D=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445DC433FE
	for <soc@archiver.kernel.org>; Thu,  3 Nov 2022 05:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE8C8C433B5; Thu,  3 Nov 2022 05:12:48 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FC5BC433D6
	for <soc@kernel.org>; Thu,  3 Nov 2022 05:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FC5BC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667452367; x=1698988367;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=Thf94nZ94rlVY9CuFnECd4S70pyd1SwgCHfy58i0k30=;
  b=JCG/zGkVwTJexFLX19EL47qA0HDZRHp/YNGtbxs7EV+7out0nEOj2baO
   lPy0Qvs05NDH484/KrYpDNhFzWhplIwTNAfDwaHhb9aO00olkLxy3tOdW
   KfXZmpasUr5VNWWTt3Zxw77SKT7ihGq7ElmoRbWhuZ/rIA2BiRW9Aasoe
   2ar/5Zd2qWu9kCC/WNrfyc+ihi+AosfTiiKyfMuxP/fs6AWW51a1thQa+
   rxbqLnhNIZOT79gSc2b1OvdPJo+sRF0eLtowY3ppxL0uDXvYuVjPTYVHu
   Wh00OUavaYYm8xGd7d2lRL/vP1MRL5/xPLlSgVslQRe4AIv/oYvsQ951R
   A==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="187397814"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Nov 2022 22:12:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 2 Nov 2022 22:12:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 2 Nov 2022 22:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiO/R1UNRfkXnbrXa/BLFglzUz+NUI1XSCSNP2qYb0SfiZuB2XTyTMT/IP2pFIYcE888fGwwwrIjw6TmJ7Sp145J8vSzxPFS3aY845WIYIyDI/cgMUzteY8cbmIJaCM0e24xNr1eHxIlKuuNCntfuVu+mNndOPNyv5pvDITXXrWv4/QAsE+kiF7YX9l5dV0EL8eSH8tOrSdhY5LS88WIe4jNmknjRFsiEvLZMdUd1hjHxAvIbnMMreI6xLKYFdOBzoLzGQBmaj8uv/ncYt5/NezOpDVrigKyBkzzaqzj1DvsA7ZTM0btbiHUDW86pc9hORdkb4yzmL4zMdMNX08CAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thf94nZ94rlVY9CuFnECd4S70pyd1SwgCHfy58i0k30=;
 b=gYENUPcx3/jXcSCTP+XH53N45YMNiebWKWbwXGHpgraYE4y0siLMgzcR1yEOG6RaMBQ9Y/ObxwN+RvaJiUM9WpQjKMoIHOAcFA3GD+U5LbmdfQegZb4vC0+dKporsM1acKR/qYnBeLSQ8/aIbD5oQA0UTFkhB7ENHdHaS1e79WwzfhxVlCToT050D/H52342TN40nlGEIz9+zPoYG+so/PmlcI2ajcmOfnaVmo+jMutXhJ31OCNpmRyX+BMRhko/UlmH6KuguTVtwe2Moo9Rv2G+Q6rIZUEiXHXw8TqAYWr1ZucJMv5H21zURI7QZo5N6eupfIzvzZefDC9FyqtTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thf94nZ94rlVY9CuFnECd4S70pyd1SwgCHfy58i0k30=;
 b=cM/UlHEC6GYM94BbU9/yTmFGeh6+PJDBY3kWkPFJXNyVvyp50zYJ+ilVkOWLxgaZU+SWdvqGN8Tu+d0XSOX66sMk74N5Xce0wL5qpPSCq/DJZZpUWEpdJ/Okej+HE/uM1drJhBYV/iKhOvRtPJSCgSoFt13jhkmFNnClqAxBPnI=
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Thu, 3 Nov 2022 05:12:37 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::528:2322:90ab:b06a]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::528:2322:90ab:b06a%8]) with mapi id 15.20.5769.019; Thu, 3 Nov 2022
 05:12:37 +0000
From: <Durai.ManickamKR@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <krzysztof.kozlowski@linaro.org>, <Claudiu.Beznea@microchip.com>,
	<Nicolas.Ferre@microchip.com>, <Cristian.Birsan@microchip.com>,
	<Hari.PrasathGE@microchip.com>, <davem@davemloft.net>,
	<krzysztof.kozlowski+dt@linaro.org>, <alexandre.belloni@bootlin.com>,
	<arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Manikandan.M@microchip.com>,
	<Kavyasree.Kotagiri@microchip.com>, <Horatiu.Vultur@microchip.com>
Subject: Re: [PATCHv1 0/8] Add support for sam9x60 curiosity board
Thread-Topic: [PATCHv1 0/8] Add support for sam9x60 curiosity board
Thread-Index: AQHY7NogEDOWXHjghkGBJAuM8e3YBa4oSxiAgAPLtICAAJVDAA==
Date: Thu, 3 Nov 2022 05:12:37 +0000
Message-ID: <85e7227d-6c99-f246-ef91-3cfbaeed6d95@microchip.com>
References: <20221031033653.43269-1-durai.manickamkr@microchip.com>
 <2902eb0e-815a-9147-49e4-182376df378d@microchip.com>
 <f984b1b4-c9a5-bbcf-65f2-08e3f231dc96@linaro.org>
In-Reply-To: <f984b1b4-c9a5-bbcf-65f2-08e3f231dc96@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|CH0PR11MB5217:EE_
x-ms-office365-filtering-correlation-id: d361ec53-90af-4138-b9c3-08dabd5a05ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GmvOwrvRBzv5U4mKHUVHqQcL7x5NQpVio/esV7OPlFZOWMakQK3Ykcip1RNckEIXBMSAH+3abzBRLsgBocfgeJCeQWunP1n09CLvo7+qSWbSdHdy1q9g4EhQjT5wH9JtAzxJSaEKKSXu6+4mh9IuIIMgQT75GS640FNuswX30IGy7bKVneQX27KtghlRfXS6yfZTZMdNzBhJ8b0PEJtXdElTLLKc6YCIsjkR59neyqzgONw/nsCb1rvIoJzFNPmhM0bdSLBhx2MPkC84WEA0OQpBGNOZcQ1zz7W0W3bu1eDf/fVPG+m5SveFmFsvsWMjQSXvvcKy73daoJ1NL2DQOf2rBSW5wsODG0uTIuSAdK4jKDzZeSAlRopJ2EUyJ/foAIVSoc2CgkG+nrerKKI2dcreWAamsSZiQ7IuVwcNYzwg9UwjP0SlgcwLJ4DnKuXksD3bFzP2lpTcrf47pK1DBmY2T7K2uqBC0P5fiOizvwUND+rY4fgm+KuE2cwB8oux/icbCPSTboZl3lhHRwuXqS3GJC5xLNAhE2UyJaECAvZKzIbeszoPLigwPkHi0WzbfpmA36wCZYDFQ15PLVMj3yHazhTCurvYajBJWqCO3Dcpd+5qKfWQzQnoAezU9DH+i1jDUPbIIrJZRR7StndJHtji8lmP2+/3QtYjwl6SdQdvB3C0cu9+O/j10q/pohwRny7VTjKFQMpERip5dSRgxMe+aPVbXuwyiDz02cbh31zy4aSgq2eviB89HqNqh38n37KC3WP06Mj5aRhc+uB6ZItUHiSICIMMANmW6m5tx5oXqViVhUty+kJzVgHuLgXW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199015)(316002)(5660300002)(6636002)(110136005)(36756003)(38070700005)(66446008)(8936002)(7416002)(64756008)(66946007)(76116006)(91956017)(53546011)(6512007)(66476007)(31696002)(41300700001)(66556008)(8676002)(6506007)(26005)(71200400001)(2616005)(186003)(921005)(86362001)(38100700002)(478600001)(966005)(122000001)(6486002)(31686004)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0UzYkJIdFZMekNtRTVNdGFpdVZkdEJGTVdDTEtub2RQVmkveUtBeGlQOUFl?=
 =?utf-8?B?V1NIM2FFMG9QTUxKQU5OQjdzeE42MERMTk9jMXdnWnd0RlhRNkhZbnRnMXJx?=
 =?utf-8?B?b2doWXhtbVlyeWthYVpqaUhwKytHLzJrS3JNcDZuZ2JpRXhGeGxVenpiem9l?=
 =?utf-8?B?RzduS3MzZC9mQ2tMemN3RXNqU3V5dnVDVnVWd08vSCtsRzhqTUVMTUlCcTRN?=
 =?utf-8?B?U041RjRQeVZuTFU0b0Yrc2RsQkpWRS8xVCtxV0tnSVR4K1hIME5MdzMwcVJk?=
 =?utf-8?B?VVRJek5CckNKcmZQVi9DeEtMOGc0TnpMK3RjM2d5MFo4c2RpL3FtVmhDaitn?=
 =?utf-8?B?NC9iL0RrQmd0TGFWOG1JcFIwUDZQOHVxMzdTeWplTDhySXU1TjJDaWlZaGx4?=
 =?utf-8?B?bGhGdzVnTjFiWlRhbGUzVzNiQ2oreXRFaWlWVjdUTUFQOUgxbUJMRGI1RXZD?=
 =?utf-8?B?TUgrdys3Z2paMWs1RldoZ3NPdzIzVGI4WFZNbW10NWp0N09hV29naC91Vi9q?=
 =?utf-8?B?M0xhcTJxTnZiTHZyd2VlREk3NmRaVWppUFpSRFlGZVdDbTg1OXJnbFh0MnhM?=
 =?utf-8?B?ckNBdG4wRkE5aVJwK09YL3lZNUZob1REQWlXWE1EWDdQVDVhdUdvdEZSbjZO?=
 =?utf-8?B?WWNsNXV0MGROYngvbDhNS2xVd2E2cUwrUUZHeUxTKysxd2M4Mi9FVE5VM2ZC?=
 =?utf-8?B?a0hSSUI2aEFZaVc5dEVYdkpITWRhUUp6N0cvSEV6cHcvWnc3Tk4raWZlKzd0?=
 =?utf-8?B?M1A4c0ZhT2U5QmhMQmlsNTVTUFhLRVIyVUdMODN4K0RoLzFaNDMySkRHSUlO?=
 =?utf-8?B?czRabmRoZjlNNFhnVDhLaXhPKzRvVjNsa3o5QVJqN1owOXhYeHJWVkFaSFht?=
 =?utf-8?B?Unp1d09iZWU4SGNmOGQvSmhLL21ZTXRCRXRPS2NjcUpTNkpvOVhNQ2JJeVhD?=
 =?utf-8?B?bEFodEFHTjJXSkVEeXJsUnZramtzYVA0dE5tampmbDRMNXNaRzZvTmhZWDlv?=
 =?utf-8?B?SG9lYitJbXZqdksxTnNCSmd0TUM5V3Jqa3IyeHd0dytMU0t0aS8rd2oxWWlk?=
 =?utf-8?B?TFlPRHFFakVhMlU3clY1RVM2RkllblBrN2NGcTVzMHNuc2FscXhkNU4wa3ZZ?=
 =?utf-8?B?cE9FRERxbHkyR2xIcURIV0hJL3Z5dzdBTEd6b1JDU1JiV1hmN09yb05kZWNu?=
 =?utf-8?B?KzBxekVDNnhWMWVMclBGTFV0VVZMMUJLZ1VTTnRpZklFMlkvY1ovQk5ZUE1E?=
 =?utf-8?B?bFJEQStOOW9EaEJUWVRhWHR2c0JPcGZ6MEJjZzFWQWxCYWJoakltZE13cjVV?=
 =?utf-8?B?M3NYUUJiUGhBYzBkRHVtTmoxTWhPd2Q3QnArWGFWdkhucEtHeG10Nnh2eEVz?=
 =?utf-8?B?S3AwcGZCcE1oQVdaTXdBR3FtbFpGcTY4R3NiVmthVlgvQ0tldHRYbFRDeUVC?=
 =?utf-8?B?OFFVeHJ6eHhLbHcweXRUcjBVUnhsZUhPSjdpdmxvWWxiejloYVVybktPaFds?=
 =?utf-8?B?QU1IcDlsWGpzNCtOV0hMWXVuaW0vblljUFBCU0ZWNjFlSnBTaERPZVlrcHNX?=
 =?utf-8?B?WHJhNzMzSndhZTJIbjR3NFFRaVNhU21LZVVRc0FHU2pkSC9GQSsyYmRsbm9s?=
 =?utf-8?B?RWQrOEtkeFdHSWtteFNpNEI0TnJBOVVqbnlIWkJyZlYvZnI0ZW5qTk1iTkNK?=
 =?utf-8?B?VktYbEJ0TDFVUGk4MVI4UXd0N05SanV4QUwyT0RwcHhPZ0l4OHJjaFRQRWNa?=
 =?utf-8?B?SmFPTW5SY0IzVUt1S1ZYQy9vYjRTV3BReGRrd2hBbnFRVStZVk1kNCtWaWUv?=
 =?utf-8?B?WTE5akg4c2RFMjBYdkE2ZzdlQ2JNUnV2TjhVOHphalRScHUvZlVadGNYQzY4?=
 =?utf-8?B?WnVkVTZRZnM4NEJ0TStMMU1iVGRrc3ZxTHg2OTkwSmxkUHBEQ2pWVWd1YXpa?=
 =?utf-8?B?UGxIK3B0WndUNGNubHBZVk92djZuRURpMWVDUCtTV3cvZHFZUWgwMDU0NERm?=
 =?utf-8?B?L3RMa2tCa1VWb2Z6THhpRW50RElSaDM2OVh6OWI3YmFZbldLNWJlVkd2d0Rq?=
 =?utf-8?B?bnNaNDBvUTFNU3BvWlUyL1ZHNk85WWo3eE4rWEZ3ZDVPQ2pvdXRqQzczOU0w?=
 =?utf-8?B?dExhaVBOaGtxT1BpanNNeHlpMUdtYlZQYThpUWwvNXJVTkZjSTR1N3N5QzlU?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E5BD9DBC3241B46A5D3020AE421A7A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d361ec53-90af-4138-b9c3-08dabd5a05ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 05:12:37.0115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TH7qaPhY144pVJc/B42h/aCCMbuy35nO99vPthAu5VRR97Ji4c4TzHfHrYh79sy10W3BiYyZAAXYcPdqWrg6HoSPgzf56rmfL5uXI6iyLaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217

T24gMDMvMTEvMjIgMDE6NDgsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFtZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20ga3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnLiBM
ZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+DQo+IE9uIDMxLzEwLzIwMjIgMDY6MjAsIENsYXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5j
b20gd3JvdGU6DQo+PiBPbiAzMS4xMC4yMDIyIDA1OjM2LCBEdXJhaSBNYW5pY2thbSBLUiB3cm90
ZToNCj4+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZzoNCj4+PiAt
IE1vdmluZyBvZiBmbGV4Y29tIGRlZmluaXRpb25zIGZyb20gYm9hcmQgZmlsZSB0byBTb0MgZmls
ZSBhbmQNCj4+PiAgICBzb21lIG1pbm9yIGNoYW5nZXMgdG8gaXRzIHByb3BlcnRpZXMuDQo+Pj4g
LSBBZGQgc3VwcG9ydCBmb3IgdGhlIG5ldyBzYW05eDYwIGN1cmlvc2l0eSBib2FyZCBiYXNlZCBv
biB0aGUNCj4+PiAgICBleGlzdGluZyBzYW05eDYwIFNvQy4NCj4+Pg0KPj4+IENoYW5nZXMgaW4g
djE6DQo+PiBUaGlzIHNlcmllcyBpcyBhY3R1YWxseSB2Mi4gQWxzbyBJIGNhbm5vdCBsb2NhdGUg
eW91ciBwYXRjaGVzIG9uDQo+PiBsb3JlLmtlcm5lbC5vcmcgZG9uJ3Qga25vdyB3aHkuLi4NCj4+
DQo+IEkgd2FzIG5vdCBjY2VkIG9uIHRoaXMgc3VibWlzc2lvbiAtIEkgZ290IG9ubHkgcmVwbHkg
ZnJvbSB5b3Vycy4gQXMgeW91DQo+IHBvaW50ZWQgb3V0IHRoaXMgdjEgd2hpY2ggaXMgdjIgaWdu
b3JlcyBzZXZlcmFsIG9mIG15IGNvbW1lbnRzLg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KPg0KSGkgS3J6eXN6dG9mLA0KDQpJIHdpbGwgYWRkcmVzcyBhbGwgdGhlIGNvbW1lbnRz
IHJlY2VpdmVkwqAgYW5kIHdpbGwgc2VuZCBhcyBwYXRjaCB2My4NCg0K
