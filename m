Return-Path: <SRS0=bu2r=P3=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F35C433F5
	for <soc@archiver.kernel.org>; Mon,  8 Nov 2021 15:19:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27D4B6125F; Mon,  8 Nov 2021 15:19:32 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC486124D;
	Mon,  8 Nov 2021 15:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBC486124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384772; x=1667920772;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dy1RalEXNmMl6w+YQKBxcZkJM9HllmDSogGrGG9m/gI=;
  b=h5TVA0eGtrZACx4NQihXN5QKcQGIU/gb9BxNgQJ6EHmiienRQ4AuQJAl
   SZjkKWs9kRuTzzDIfqO//KnlwRPwQmciknjYrNU7H8Gu+/HmG6essoLXR
   XbwLwvVwua0BhmSwB1awnqBJ20OJoZsLFE/3T+SgVATMRftgRrw3t0Xzo
   1Ddpv49oe1BSyidzkqDYIc8PPpAxNHOYIHkj3iOgegKvMOxIuHlJYs+So
   LhAm4DuWwvADL30YJLs0XLoiGc/+Kf0Nd5OEffRGBxWS2m/TOpd//lGVT
   uGZ8jh/4FYTpuyZMWUJGB0VCJ4sCGUdSeiCww/iHMcYjCCDW1iykTI9Vx
   g==;
IronPort-SDR: R/CnJymjbmGEX5aOBh0dAsC/P3YNPXT4OGPRQRjiM/Rlig4tmWG3G/oMfLMz0/gAZ7P//qLnBs
 BhcHCqNBn2r1YpTjsIUfxiVpGHMLqkiE8BusE6Sodqp37yah5FlKEhlK75FwaYyzuqcTU54Zws
 IVzllZrUzjDbSpWmKN/deWFRWigZhSkN5jlw89ptBOtvuMXBxNbOV4AhuQeT+aEvn0suio7m7f
 EyrDKYAWGctxJe2sxW2DDjnP1bLeHbZTVGDPcRBEys/xsasaZSfI9XlPZ4+3z0oKSTw5YsN496
 FZtdM+6ZJoefqQ+B0dSPwNwu
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="138384696"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:19:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:19:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 08:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0tlaKqimi4Xr5nmkTGas527YGN50ISlZBfNBoZlnJPptiiu06IkCv6T1+KwzH65uCtyoe4VeGwkIlxqgmcXJvdJMniNyIAY5K4viWAxulCUBwh8Yq1jJ9Xwbo8kXZ+S8s7l9hR4+XeYmTvybZWzoZRXBlTv+5gSo20smmcwA4qP/vDduXNHL6L3oRgLuUL6gLVT6CSfZExLn70IfLO7UkCuhoGzZKUxP1+omSuD32QDTz5eXjM3+LUO1DlxLh7WTbiQAKi3T+kMdnB/70NmVhiQbEEmgzvO7UWmESenKncOwaWILSTgO0nniG11JEsApNPFJH8oSAyzw4S+pZ1FFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy1RalEXNmMl6w+YQKBxcZkJM9HllmDSogGrGG9m/gI=;
 b=AZvf1PxnG/9nhPzRI5S6yfB3vXjXJ5m2ZT6zh2oqlLFQe7WiZ1RZtFl48nHM34r+g5ZOMNFggq1uje577nwer5pcsy0dIpPPKGulANrlXBCSuJtnO8lSVe8pp+q1BMSb6dZplh2KsSHDTH3hKyQFUSfMk/Z9+j6jE/t63X3cDfYykJ3nJKYK6F3cB+vJ+RwoA8wojffWONd/kJYr0bRLaprO1hpas8AM5hjzDw3VGou2jLPYBCHIUHh0HtRgGxa0+zisy/4FZqdbAHqyBtUx1sQEXaSngP5CiEU8cfr+RKDlmLzTxON5942oREJHfP52eFaM+KRTrHW6DaPCV3fK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy1RalEXNmMl6w+YQKBxcZkJM9HllmDSogGrGG9m/gI=;
 b=iRICyxN5KURRaSVZ3sziEgQpSpdh4WfbG+RieMV/LxYWijr2ltINzcfzk/8xEzK/zjuBWh9Hs6zX21mEa/HsxUK0iyBqkI2Sq2yk2FUsm0youhCScEKCWvjcMHFt3NRTITyYxWqivU6/rDNtr8Lq/jVBiThIVIBHz2Ny+rjUptM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1407.namprd11.prod.outlook.com (2603:10b6:300:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 15:19:28 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%7]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 15:19:28 +0000
From: <Conor.Dooley@microchip.com>
To: <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: <olof@lixom.net>, <soc@kernel.org>, <robh+dt@kernel.org>,
	<Damien.LeMoal@wdc.com>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>,
	<paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>, <Cyril.Jean@microchip.com>,
	<Daire.McNamara@microchip.com>, <Atish.Patra@wdc.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<Ludovic.Desroches@microchip.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
Thread-Topic: [PATCH] soc: add polarfire soc system controller
Thread-Index: AQHXuecsmqsF21x/+Uu/rugU1FwxCqvdh0SAgAAufICAACsgAIAcE4qA
Date: Mon, 8 Nov 2021 15:19:27 +0000
Message-ID: <46f04c45-cd50-9484-de41-be8c390bf8e3@microchip.com>
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
x-ms-office365-filtering-correlation-id: d38e587b-53c0-4c8e-7ddb-08d9a2cb27f2
x-ms-traffictypediagnostic: MWHPR11MB1407:
x-microsoft-antispam-prvs: <MWHPR11MB140766F1D0569F8287B5ED4A98919@MWHPR11MB1407.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UmICr9NHAEIPMV25AY9HP07yCuK0wCa3WLpYmZtxqHF7RDpHhCY6WhUX1QEKFcJSW/jQzbGoXWapIJcPRg0PIb5wol+7SveyOntXsuucPv0Ygb/uKokrl4huvklrfjuGJ/NsJkLUI7RCWsLBXfYf9NwBJ5kdroKKEBeb//XtkGooAe1ULSwPnSkpaMJpjz3qHhJjQaQsYPsOCwPPXqo3xexJMDc6QAnGoOC/Es9rZ14s0VDzu2xgIw8ZIc6nAQUkcalSRhI/I6wi6fF/ehA32JlwBXLRe2Ub+pt18LaqUPWq/Sli3rRmGCn6FXxaXkSU07OswSfLa0qRbLdb6ps1tsHTENDGb6WN/dCdqssAXUou3NLQS5Gx5Wf4CwZtTrLMcbNgbDSl6DgLKddojUv544o88sUrgG9r0u3krNf4p2rhIa/SEboyAtXi01Hbo1cDw8Wc8WosyhOnmy0yOrMcVcmx32KQvFY7CKcjzu2/vOIjLTq3SRFd1beTZCuk0hxoHAAf+I1RTetb6XovaWG1jJyLJdXxSCqvgbYoVSfSkirw4bZI8VSnfOkrKP7m/5jmaMiwnxyFg4Ti0a+MhMw7t4UhQbBDd2prBfXmDZI+n3/02qxgpuEE71zBzTeG5Jq86QQBWYjCEpQGj8FTympN9fr2zsg1H3mYBcFTgwxysA+QkQMafQOMgNDeatfGHrYBB5JCu2ZxJrgACwK+eFPyMwCc1G8kkwMZP0MTnKfun2PRs7mzU7gD0HkHYZXqZZOuU6HGnnj6SmUkVj4rYYj71w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(186003)(2616005)(26005)(508600001)(38070700005)(36756003)(53546011)(31686004)(4326008)(5660300002)(6506007)(83380400001)(6916009)(122000001)(38100700002)(2906002)(31696002)(316002)(8936002)(66946007)(64756008)(6512007)(7416002)(54906003)(66556008)(66446008)(76116006)(91956017)(6486002)(86362001)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnZ0dThXQXcwYUt3ejNsd21ocWFjMHVoaWhCZlQzclN3Ry80RDMwRGlUanM4?=
 =?utf-8?B?bVNqTTlLMm1vcEdDOEVKZ244Y2dzYUNOTnNhaE04V3d5KzRKcmtNOXVzZlNM?=
 =?utf-8?B?M0xUYm41Z1U1ODVnOWd6WXlFNXdJVzZYclhlZmY0N3VnOUg0ZjkxWkdsWFB4?=
 =?utf-8?B?Q1E0QkxXZXY2eXR5U2Rsa0l3NVdGTGI5RlNWY1I2UTA2RTMycXdrU1hVSzgz?=
 =?utf-8?B?Q00zYXlHZGNPREovTkZ1UzZzRFkrMVpuRzNKMWxPZTBiV3BReU12ZlVkY1BE?=
 =?utf-8?B?ai9hRjZ1Mm16YXFMZ0g5Y09VYkVTb3FRMXhFTk91eTB0WEpqN2JlZElvYXVG?=
 =?utf-8?B?d3dkdE9KVU50M3BJSkRwaTVHaVFIS0tKd3BVM203Ly9TbWc1Y3J0WjFMNXFv?=
 =?utf-8?B?Ri9kSmREZW16cjY0QXNmamYxdG9QcTV6K2xtVXBNMXd3dkw0VDdqV3NpTk9p?=
 =?utf-8?B?YnF2WURPK01sNGg1UzY1WFoySEtjSi95bUxpWnlRSEJqRUVMYURzZnB5a3kz?=
 =?utf-8?B?WUpUNVQ0Y290c1pZK2l4Zm02RFJaamxkU3Z5dllReDZrTllwQWE5a2l5S2w1?=
 =?utf-8?B?SldBekcyT09hTXVjZWFWVStmaWliVFN3K3NiKzRDV053K3dtRTNqOTNMSkR0?=
 =?utf-8?B?NDUzZWdLWVJxRGZzZzdSR1U2SUpic3Y5WEl1ckRMRkI3RDRiQWYzemZKYjlp?=
 =?utf-8?B?ZlEzRnVaaFFEWmd4VFBnTndaTXBJUlc1WUlja2lTVHpLa3FKTy9za3R3d3kr?=
 =?utf-8?B?SVBhYXJaamxudk5VNVRXTlNJVFFGeC9lck1tZk9MdU1PdzBNWEpBcHp6T2xW?=
 =?utf-8?B?R3BpWVhKLzdKNUNXcmJHbVUvTGZpU2pKekdGeDBjMTZLVGkwMXcxTUx2ZExE?=
 =?utf-8?B?L3o5L0EwaDgyeU5rTTRtc3N1V051YTZwelZMTTVEMll1eUh6MEZHeVRCV1BJ?=
 =?utf-8?B?R0d1ZlZPUEYweGY0cEMrdnNTN2ViVnZmcTRXeXNod2NPWHZtNmpLUzJOekJk?=
 =?utf-8?B?WlFzY1MyTjQrUTBIUFIwVHNSNEZHaWFCd0hyRU1PalZ3bkpTYmorWjU2ZkZN?=
 =?utf-8?B?YkgrNFgvZU1KZHNOa3dxMElKNDNyS1FNaXovYUV5Uyt2RUx2aktvQ2ZVM1gz?=
 =?utf-8?B?YU9WbXY5dVAyY1FIb0NsSjgrVVFaQ24wNkFlZG9ZUjlaOXlHUUdudUNKZE1t?=
 =?utf-8?B?ajVqSFlUeHYzbFE2NktIa2RXRTc5cVE4VzZoWWxKSDAvdWtCUVhPYnRsaEdY?=
 =?utf-8?B?Z1Z3YTVRdWhqejNpS3g2b2pLaXRkVElZbVRTREQxK0dCOW5qbzRhV0NYSmlD?=
 =?utf-8?B?YjU5Ymd4cjlMZ0RxRDRTZEhJT09rWkRrUWZZOUhhckZYMng3ZFhhcFFUZTdq?=
 =?utf-8?B?VmRQS3gySGtuZkhsOFBkNFkyeFQ2YUVqOW82ZnVXc28ybUJDSjc0RmI4ZGJC?=
 =?utf-8?B?QVplR3d5THVmK0xJSEZLdXFNV2w0TlkxOWtWZ1pLZHdSZUI2eFlxb3EzZ0Iv?=
 =?utf-8?B?ZW5zN0tuVFhCV2tlQnF5Q0diZlU3VzBLVDNpZ3hOajZpejVFVDE2aVRybWVm?=
 =?utf-8?B?TTNYRGgvWE1CZHU0Y01iK3dzbzRSSmhRQkZQQWNoVHpFSHBmSFkreUs2aXVn?=
 =?utf-8?B?N0J5TCtZbE5hSFd2KzVIb3U2U3hFVVR2UWJDR3VvRVluQmE0NTYyVEljMWpj?=
 =?utf-8?B?RGZaUnFEQlREWklpOUd6cTcwNHllRWF0Yk9PaXlKVTJoSmRQSytXTWJlQWU5?=
 =?utf-8?B?clVKb0NORG1mWFJsWEtEY3FBNzRNWUpTWHRNZSsxeVoxamdnZENoTDZHRGhR?=
 =?utf-8?B?cit1Nk5LOW1sSU44MFRkeW1hV2FpbzM2WEV3NGpxMkI3ZGljWlBFR1ZJbTNn?=
 =?utf-8?B?RkczbzRXbDVjSThwK1g1TXRMRHZCYU90SEFxUHVJeXFmK0lFcnpsMVFmVkZp?=
 =?utf-8?B?S0UrRHlvdUhhVFRWSG5ZS2diUVc5UE0yUmJsOXBvRnd1Qk5oM1gxT3pGRys3?=
 =?utf-8?B?dElDRk5qd2dJajlXZUo1bUZXUkJoaEhqaTY4YTBydEEwbC9pZG9Kemo3VGZx?=
 =?utf-8?B?UFZyT1NMKzRpRjRXc0hzL0VMamd1b3hGaDA1a2VXMXYremRBbThzaUFuQUlr?=
 =?utf-8?B?dEhuTWQ1OXdFMmhUNW44dU9Ccmw5eTFnWVdnNjdsWVh6M2J4ZEgwMmNLYjlT?=
 =?utf-8?B?MEZLbzZud0FPV2FtZkNHaWlhbnhBcGx1WWhMdzN4aW5XWlp2RWVLY2FQV2ta?=
 =?utf-8?B?WWtHRlpBYnV3WkhQZjVpV2FaaURnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47979C8CE5E995499F6876D8CF37196A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38e587b-53c0-4c8e-7ddb-08d9a2cb27f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 15:19:28.0117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9BDHe1XVbQU+bj3iMzsGhuY8fvheufe0oFM/RTKoCNq7ANKGtpqZDHDx285ktCEMiBuK2V/MKkNkh8RoMQmowjwQM1vK+ZapT2/MQ30vXbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1407

T24gMjEvMTAvMjAyMSAxOTozNCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4+Pj4gK2ludCBtcGZz
X2Jsb2NraW5nX3RyYW5zYWN0aW9uKHN0cnVjdCBtcGZzX3N5c19jb250cm9sbGVyICptcGZzX2Ns
aWVudCwgdm9pZCAqbXNnKQ0KPj4+PiArew0KPj4+PiArICAgIGludCByZXQ7DQo+Pj4+ICsNCj4+
Pj4gKyAgICBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnRyYW5zYWN0aW9uX2xvY2spOw0KPiAN
Cj4gV2hlbiB5b3UgZG8gYSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoKSwgeW91IGhhdmUgdG8g
Y2hlY2sgaXRzIHJldHVybiBjb2RlIGFuZA0KPiBoYW5kbGUgdGhlIGludGVycnVwdGlvbiwgdXN1
YWxseSBieSBwYXNzaW5nIGRvd24gLUVJTlRSIHRvIHRoZSBjYWxsZXIuDQo+IA0KPj4+PiArc3Ry
dWN0IG1wZnNfc3lzX2NvbnRyb2xsZXIgKg0KPj4+PiArbXBmc19zeXNfY29udHJvbGxlcl9nZXQo
c3RydWN0IGRldmljZV9ub2RlICptc3Nfbm9kZSkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShtc3Nfbm9kZSk7
DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIXBkZXYpDQo+Pj4+ICsgICAgICAgICAgICByZXR1cm4g
TlVMTDsNCj4+Pj4gKw0KPj4+PiArICAgIHJldHVybiBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsNCj4+Pj4gK30NCj4+Pj4gK0VYUE9SVF9TWU1CT0wobXBmc19zeXNfY29udHJvbGxlcl9nZXQp
Ow0KPiANCj4gVGhlcmUgc2hvdWxkIHByb2JhYmx5IGJlIGEgY2hlY2sgaW4gaGVyZSB0byBlbnN1
cmUgdGhhdCB0aGlzIGlzIGFjdHVhbGx5DQo+IGEgc3lzdGVtIGNvbnRyb2xsZXIgYW5kIGl0J3Mg
Ym91bmQgZG8gdGhpcyBkcml2ZXIsIHJhdGhlciB0aGFuIHJldHVybmluZyBhDQo+IHJhbmRvbSBk
ZXZpY2UncyBkcml2ZXIgZGF0YSA+DQo+IEl0IG1pZ2h0IGFsc28gaGVscCB0byBtYWtlIHRoaXMg
dGFrZSBhIHBoYW5kbGUgaW5zdGVhZCBvZiBhIGRldmljZSBub2RlDQo+IGZvciBsb29rdXAsIHRv
IHNwYXJlIHRoZSBjbGllbnQgdGhlIGV4dHJhIHBoYW5kbGUgdG8gbm9kZSBjb252ZXJzaW9uLg0K
RmluYWxseSBnb3QgYXJvdW5kIHRvIHRoaXMgYWdhaW4sIGlzIGl0IHN1ZmZpY2llbnQgdG8ganVz
dCBjaGVjayB0aGF0IA0KcGxhdGZvcm1fZ2V0X2RydmRhdGEgcmV0dXJucyBub24gbnVsbCwgb3Ig
c2hvdWxkIEkgYWxzbyBjaGVjayBpZiB0aGUgDQpwZGV2IG1hdGNoZXMgdGhlIGRyaXZlcnMgY29t
cGF0aWJsZSBzdHJpbmdzPyBPbmx5IGZvdW5kIG9uZSBleGFtcGxlIG9mIA0KdGhlIGxhdHRlciBh
bmQgYSBtaXggb2YgdGhlIGZvcm1lciAmIHdoYXQgSSBoYWQgZG9uZSB3aGVuIEkgd2VudCBsb29r
aW5nIA0KYXJvdW5kIGF0IG90aGVyIGRyaXZlcnMuDQpDb25vci4NCg0K
