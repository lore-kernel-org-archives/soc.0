Return-Path: <SRS0=GiCC=TI=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903B8C433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 10:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77785C340EF; Fri, 25 Feb 2022 10:36:28 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C11C9C340E7;
	Fri, 25 Feb 2022 10:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C11C9C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1645785388; x=1677321388;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EftYbk7qZvzRhEsbbScrpxClUk8WXoG28WiYm1iUh3M=;
  b=V2LdHcU1/iqHteZiVeJ0K4f/UOpiDeA42C/U6yG5wn6Id33FZSVNRlIS
   hK5eJkEbt9XH6EeT/+yhG642ObomyMKJ69cwGpmfopaJL18XgIvDizRLf
   9kgKjja1QKViUSkwh28xK6p4h77iXXa8J+E51fiPvdugE+2vbi/gdPOvr
   PgSb9MoxTuxYjw3iiEyy7nDPsI7JrKUUIHqVZzHgHMyRnB4TSukhjSTN7
   idtF7chBwdTPAsC+rI+h9zaJTs1tPJTxe5Zs3DN/dj+BJA9XbB5ksaQ2g
   D4VAQkz2wp9IpWuXv+QYLIiQONakBlcU+X56fr9ICZ68sdXv+j+K4ytIG
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="58751382"
X-IronPort-AV: E=Sophos;i="5.90,136,1643641200"; 
   d="scan'208";a="58751382"
Received: from mail-tycjpn01lp2174.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.174])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 19:35:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBbd6rw9ShBIf/W4W1s3pxenG0ylhZ7O6WjqsZAZyJq1L31zF6iYJ4qbZEeX2doImtbqzXSKUZ/Hm1axF9IKRfe5kCcPvzy9UFByh1cPP8B+D7srOpUtgYreSr8IdiBY1g0COQ3PDuQyp/ouQ8iaDpYXsk7xqVmspxCAr4Z2bs8W/BM9PDhjZbACBP4610AI6VE4xVzbto+jGLx6MU8Pf67zBN9gL47ST6nXMVVcFZ/jgFMLTyXwjhxyj/JO9h64DY+Rab5usDnY87vkLgT1GFOfItcAcE7ma6HrZQxyRWb0CYN3rfTZ5ty1eTMMWQVB7iO+hS1uBWpyQHZPGpP6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EftYbk7qZvzRhEsbbScrpxClUk8WXoG28WiYm1iUh3M=;
 b=KXd2NFvTVGdIERpdZBjy8wW+8Xr4PVh1tDmmfZNv+s0FxJw+BB35w7Ju+azulka+T57b6m5EsB0qWT52kLaswI8aqUPTtjLCIYMoKiG1El8MkiyIZ9AD+wCr2humG70J07JUCMf5vUSuMx6Qjs/+t+/ewJummYCS00gmiiHSo8uNP4Kky5zWEvG64nO65uhiz0VEKgpf2XPMeg9X7Wqu/ywnhWKrApLu+R9/ZKFQSsJ7HggHQ926NO5NKkSX6RMvlPdu9SxTMlHymKXTDx83nSetj0xtY0128R8z8ngkHD6rhzH9RXc6+TpF6wkqiQVuV3WFmDa25C2rLlThMuU27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EftYbk7qZvzRhEsbbScrpxClUk8WXoG28WiYm1iUh3M=;
 b=h4Ptwk5KR7Apgp2nsZHKh2GnqRerTnuZEFmaAJ2pikHEpKQDT8SOZbhLj2oYPG2fVr7tXrm70nkKc0ZgbAIa/rF06HeGvre4SzXa031UKwQYeYLlzEFKikvHU1NZp26fS9nYtce2DXkwA+ogtSc8Qb5KexPicb0b5yBJFYgaTYs=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by OSBPR01MB2646.jpnprd01.prod.outlook.com (2603:1096:604:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 10:35:10 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::e8a9:971f:52b9:8d07]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::e8a9:971f:52b9:8d07%7]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 10:35:10 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, Olof
 Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Thread-Topic: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Thread-Index: AQHYJKtWrul8ggSTx0iTWIouzkxBW6yZHSiAgAZKI9KABLN+gg==
Date: Fri, 25 Feb 2022 10:35:10 +0000
Message-ID:
 <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-02-25T10:33:32.424Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
suggested_attachment_session_id: f111973b-6199-cbcb-d874-d0d4bf04e84c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 515fabb5-0048-42d5-f13e-08d9f84a7fac
x-ms-traffictypediagnostic: OSBPR01MB2646:EE_
x-microsoft-antispam-prvs:
 <OSBPR01MB264686043A9B9128C3D75234EB3E9@OSBPR01MB2646.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uwb3OnbzXhMocoMfh+oSA+v/IPerBFbKAlG4YSy6/2KdF7kN/1iUJecBFrnIF/e5gcy/8L6CnjpcV5aa/1e85JdMmEKwXGbcisYrgpFBbiss9KGz1/CEWBHTIFSSKOnxHDWT2peQD+uDssS8LdzirvOg/t4kFA9ZcLm3clC/BTRcIFAzWwHDUT9/tixiV2QZyZOuAnTUAFvQQgsun7EW9P+SusxSOOcKaAHsDIQj6emAGj2pW50F/ub50yMyccE5wC38d8/JEG/40gMhmKMWyJAwryUt1EnRS7EQqOEVX5s1rkjyM0/6lHMR8KvtqBuZK33JyId5SL6ddk4heEVdKFHm3glyCcQ+9NPYq5/+eUn2ntcl555RiOoAfJcjVlIzBfihAYWF1DnItBgBYd0z5ArmrBDd/1bktME5zCgUkNx/yHjbubOVSkfNmLhSlCPsQzfa8d5fWgQpuP72zJCjcUasc7KwpcT6Mk1y28RIguaNGY/yqm/EFanAtnwfpRGaCfKo+sRdtz3yANzt7xkWinvN6VKj2Qq+O/4i6jfjLSgfjmfuXhA+SHaCT7We5/NCtC+k+3l6L7kbZCv31GtIhAQPKL4R8KErLS95rYqP9uLhD+qgXpU+BgapVKMj1HZTbC8dIojqL2gJ2//3Yo8emsw1F3pgQqhU2/UjWolW9KmjkjQfXcToz21b4E5JrLeNzGfwtvamBy/WrxSR3V/pQg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7050.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(110136005)(316002)(54906003)(38070700005)(55016003)(4744005)(5660300002)(86362001)(52536014)(76116006)(66946007)(8936002)(66556008)(122000001)(82960400001)(66476007)(64756008)(2906002)(66446008)(8676002)(4326008)(38100700002)(6506007)(71200400001)(7696005)(85182001)(9686003)(508600001)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?YnpPKzRMbDlnSVVtaXdOZ3JwMnZlY2pLdXgvK2p1dmZvajlWY2RZNlcy?=
 =?iso-2022-jp?B?ZHNCSXZFU1VXcHl3K2RpR0o4bnNRWlNXUWZJL1hFeklPZklabWJZNDBv?=
 =?iso-2022-jp?B?eUh6elg3aDZaSmlRTjArMno1b1VjOURSUjJwZDFPU09zRXpod1hYdnR2?=
 =?iso-2022-jp?B?NCtaOXB5ODBnTk90UXMyTXdVWStXakdYSXV0eENpdzdBclZGT3dXV0wr?=
 =?iso-2022-jp?B?dHgwZDVFYTB6NjFISnQ2ZFV0WTFoNmtoRUdpNDFLYWkyS01vcWhseVFU?=
 =?iso-2022-jp?B?OHhOQngxUkxoYmNaNSs1YmgzSmpqbGowd0FtdWRYM2VVS1REZ09STkt0?=
 =?iso-2022-jp?B?ZjB5bGtWRWYyTzB6bjc0Y1lhNGdZL0pBZTl2L2tiV3JEQ1FGRnR5RXp6?=
 =?iso-2022-jp?B?NjZiZlRHVERCZ3ZOSGdJWTNkZi9NeVFpUDM5RitXZmJidTZtY0xTVkFm?=
 =?iso-2022-jp?B?L1MrS1JlNzQvcUZha29WS1lWOXB3MkIvaGcyYklrUW9jTG5oTXgrWlFl?=
 =?iso-2022-jp?B?SC84bDVNd284ZmR6RERJVVRHUFpiRGE0b2RZWGZtMVNIZ2trRXNCT2tU?=
 =?iso-2022-jp?B?a2VOcFhwZGJ0aXhqRURFY0ozQWNFYWNYdXo0NjZZTzZiWE9KYU15VDFF?=
 =?iso-2022-jp?B?ZzlPeEdxV28yRlVPa1ZMcjM4MWlOZ041ZjNxWUIrN2pWOXMwOStXczc1?=
 =?iso-2022-jp?B?RlVQbDFVQ1FwRm1jUTkzejJUSTBTa2pnaFZQZWIybks2Y0Eya0JvQ2F0?=
 =?iso-2022-jp?B?TlpyRFh0aHcwYnFiSUIrcFRzT0lYbk4vK2RYbGRsdnNrS3h1TUZqbXVK?=
 =?iso-2022-jp?B?TWl5RUFoSzFLM2ZkcnJtNUtBMDlkODRybFZtTUZBcEZ2ayswYmFkSkpE?=
 =?iso-2022-jp?B?ODN0cUxGOVlsZUdlK2Z2TWpXVE5xS3QwZmN0T2ZYYWo5VkpCS2xmY2pQ?=
 =?iso-2022-jp?B?Y2V5NXN6bzFpQ1NJSUVmUmh6UTBXVDlTSTg5S0w1cTB2RWVsOVlNOUE5?=
 =?iso-2022-jp?B?ODJQS3MvaXBjS242a2JVdDcwdXlwV0ZTeTVnTVZ4dkN0YmZGNHV3b1pp?=
 =?iso-2022-jp?B?K3poR1ZoTHRBZlFoakUyRzFrVFR0SGhjb1JIeWZ6Y29CNFl4ZWFyaVpp?=
 =?iso-2022-jp?B?U1p3RHBNelc2dFB4OVN2U2g5dmFBMWF0MlhwM1JxZWdGeng4RnhhdW85?=
 =?iso-2022-jp?B?dzZrbDhWWllpUDNCdDFSZzZ0V1g0RkhlMlhMZWRLbXJlWWJPSVRqM1dV?=
 =?iso-2022-jp?B?ZzZ0Nzh2MFhtWE1VY3Zzdmc5MWFkcEpXK2FzeXVDRjNyUFpzZjg0SXJn?=
 =?iso-2022-jp?B?RldhWENLaDZCb0REZ2Z1Nmx6S0JwaVRjSG5KcU9mby8wU2daUFpaWlp1?=
 =?iso-2022-jp?B?THlJdEJETkNKbEVmREM1OWdCeTFHcCsyc0VUTkpuVGhETTlvd0ZlY2xq?=
 =?iso-2022-jp?B?MFgwWUZPZ2dKTVRoZzZqZTNMbjdpazFRaTFsQ3ViczlXQ2w4Q0VlRUNS?=
 =?iso-2022-jp?B?akV6a1l4MnF3UmdLWC9YUFI0a3VBVHVDRXVsQ3BDWXp0cXo4c2hMTytP?=
 =?iso-2022-jp?B?N2YrS1Vyb3h6d05UN0kvNEQzUGtqam9zdDBIeFdxU3l4a1E5ZGJMcEkr?=
 =?iso-2022-jp?B?SWF6UUNGbDFHYU1mQkJzMTIzK1l4K0lydkZIdjlUQU9KWktFc21OcnYx?=
 =?iso-2022-jp?B?ZW5pYVc1K2VnK0dlay9IZXorUWtKa240UnZvZnNCRDZiYUxlTC9IZ28x?=
 =?iso-2022-jp?B?ak5jVE83YStMeVFKMUQrY1RoMDdSRXhVNDdpTThZeEVKKzNOanZ2T1BD?=
 =?iso-2022-jp?B?Q1p0d2V5Mi96UmFwRG9xbmIvaHRqa2MrZkEzalB1eGRqZ0QvaExYSEV5?=
 =?iso-2022-jp?B?TTZlWXEyenpTMWJ2MllUNlVFanhVVEp5RXNFZmhsMmJRRXVkb2NSRllN?=
 =?iso-2022-jp?B?cjZRUEUvZFZuc09GK09MYUVtTGVCQ3FGMnQ0WnlNS2MrWEhJd3ZJUnlz?=
 =?iso-2022-jp?B?RWJLVk00VEtxVHY4djZOSTkrRS9wekFjTDdqOU9hUlAwSWVZNVJNUGgw?=
 =?iso-2022-jp?B?TXhZVDlRMTRwU1ozcG93RkJBZmZzTTQ0UUVGOWo0K3lOdHNkMW9hdHEv?=
 =?iso-2022-jp?B?RGgrNnZrMHA5cWQwWjFUQ2pLNDNaU3RvTWtoak9VY2xjS1NjanNKQmk3?=
 =?iso-2022-jp?B?SDUvM0dtSWMvemJwN0FERWt0eHA4ek5hbUIvL3ZIYmlkTG9wOGVPU1lV?=
 =?iso-2022-jp?B?YVlPbjNTbkpDRldKTzNNaHRNWC8vcVZOVGlvT3hzZUV6bEtHcFBZMUZZ?=
 =?iso-2022-jp?B?TUNUMTFBUWJBeWVoSUJLRzRmUWRQd0lxTXg1YU9rZUhsb3ZZOWpmbDJH?=
 =?iso-2022-jp?B?ZWg0TS9EWGRadFlOakNTNHZDM1IyNzRvZXZBdXVtUzFDZjRXNHY4RmR3?=
 =?iso-2022-jp?B?ZHJGMnd3PT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515fabb5-0048-42d5-f13e-08d9f84a7fac
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 10:35:10.2319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoGBllEDsOYEL2CBVuaAsOs5rCFzEIl1SFPlbhhERhEX12+UuVUD1cgGJ9QFoO/elu2FUjaKsJGnSWanyChge+jitOx96Kdgm5T1k/2CsAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2646

Hi Greg and Jiri,=0A=
=0A=
I'm trying to implement a feature for A64FX that will panic when=0A=
a diagnostic interrupt is received.=0A=
Arnd suggested that handle_sysrq() should be used=0A=
but I'm wonderingif it's ok to call it in NMI.=0A=
Would you please let me know if we can call handle_sysrq() in NMI?=0A=
=0A=
Thank you.=0A=
Hitomi Hasegawa=
