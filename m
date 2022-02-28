Return-Path: <SRS0=pcdy=TL=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D6C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 08:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2D76C340F1; Mon, 28 Feb 2022 08:52:09 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 955C1C340E7;
	Mon, 28 Feb 2022 08:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 955C1C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1646038328; x=1677574328;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/nIeUm0iZ0vbt5bhZzyZZwd5INKwO8AvCUjHl8jpYOo=;
  b=aMzVczfETnX6uwlSyocAZ/b/tYyrn4cThgNV35b5vxOp8/ETl7Mdrbfi
   19qOPCQOQ/iZ+3NrYE1418if7rLHmrB2URsYYIW87W9Q2FP9+/I0Fibwk
   rNuaG4KEFSfakJ67vSWBJyNo2RAUQrb9gCiEfV6tEshwUc3WQPF3Er6q0
   Fjzt8mGOyf1kW40R6fH69YR/yQTdzLBmEK9ANmLMhvZBvwkjKMtWu21uG
   qfkOmjeqHBnTeY7y7+G53oYqT0A7MqW2y/bUKW1CyTvfscx2f2a8/+Zal
   oYVH54IXhkwd3WuVbuYTLvgRqK3MHiaeIZGRQZg6umBbI/pFPm/59sO8g
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="50703191"
X-IronPort-AV: E=Sophos;i="5.90,142,1643641200"; 
   d="scan'208";a="50703191"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 17:51:57 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laqpX+AYHod69DAVVVJRFt54CpCWiJpLoycisMvvGDFAYvgupbZ2M8UjIFltAvm2a/vy7BJTzaKRSk6Igxmvlw+C5qIUeLYgns5Nbn3JTduq/gbgbvCWw0qOqV8FFYmIpli1Y2dCPjdarCtKoQi5I97V1cCNZ5q0E7Rq6aKRd6uWlEzAyM8x5GBdWIlMmFY1G5yx1htrH3t+Iem/t2di4/dvnfy8Gendv44PwVTuEeAXu5fq4IqKopX2eWb0mWJRIE/cfJ1eEgW3xIut/SLKOi+7wFi1+Iv8KFPPQ/hf8iPeIMHUhUk0e+Kpx5QYbGIGAERYgS0JI17mGsGZPTBAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nIeUm0iZ0vbt5bhZzyZZwd5INKwO8AvCUjHl8jpYOo=;
 b=adFcA4pk2Ur6NX73V7oeaZ12jYh5gI/CrV7zsOQ3TGZ5EsvrIsjqzd73maPRwSNbT8buh27PozD+VCq4CAbt7+TSSiTLio3JT7D0CINHdDwp68cYSWx3tT8VnVMxAGvtIfJd5nj4H3fTNYQrMX/RxJ5IrYSJGeVw/VulJEiWowWwiTAUNeI/fo7f6IHucRGgHV4Vwfdnt9J0p3Cw0tnwO7NygL/Q0LCtSmXUo5ZpvNbLjzX3yn2t5b/+HAHpwMSnfh8NwMD+0GiibyuKXCB9jujc/apbysnJYU9yGdUqkfMabXpwvA+M8KWEvEHOyVm6+wy/VxNzvx0FPU0LSZaZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nIeUm0iZ0vbt5bhZzyZZwd5INKwO8AvCUjHl8jpYOo=;
 b=nrQ/APiZskdyPiHdeQ6ymFl9rAuiCbOgsA1kz52T0aLJXe+6HQH9/xgVR0TKQGalp9U8tNchl1gJOYEwUxjIaIycwq69k4WdGuBg29RV0SpKY4g97e7YurXjKWj5eDvFF8zKWtHJV4KMZKeU5brvACbXSK50EH7NPBFHWD0vJf0=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TYCPR01MB9400.jpnprd01.prod.outlook.com (2603:1096:400:194::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 08:51:54 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::e8a9:971f:52b9:8d07]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::e8a9:971f:52b9:8d07%7]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 08:51:54 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Sumit Garg <sumit.garg@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
CC: "jirislaby@kernel.org" <jirislaby@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, Olof
 Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Thread-Topic: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Thread-Index:
 AQHYJKtWrul8ggSTx0iTWIouzkxBW6yZHSiAgAZKI9KABLN+goAAD0aAgASAkgCAAAqoIg==
Date: Mon, 28 Feb 2022 08:51:54 +0000
Message-ID:
 <OSZPR01MB705031330FAFEF3737F81085EB019@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <CAK8P3a0T1eP9a_1UhYRg0wHBsjyLLORoKB+44PAPM4zj3ryVcA@mail.gmail.com>
 <CAFA6WYMqO9rnHaYgyrY=+zV9saS1jrayiVoB_FwSm_yCBRhu5g@mail.gmail.com>
In-Reply-To:
 <CAFA6WYMqO9rnHaYgyrY=+zV9saS1jrayiVoB_FwSm_yCBRhu5g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-02-28T08:51:54.050Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
suggested_attachment_session_id: 1a188e79-bb0b-554f-62b8-b7e1d0d21e0e
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afce7cf2-4d29-4d6d-f9b2-08d9fa9791d6
x-ms-traffictypediagnostic: TYCPR01MB9400:EE_
x-microsoft-antispam-prvs:
 <TYCPR01MB9400DB8B03DB6EB4B4699626EB019@TYCPR01MB9400.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ksrwh2EO+JlttKOBFJOnvtqXmJA+5sVMxa7sNeRdoOCGXKcQuybUdhs2XUlNbKGLBvk82MEWNM5B7naY+gJ0zlvgjL2qFxDTp9guwwnAmRJiavje6vBg/z/GKl+fkxoDvpIVOoJTAkPMDBZhckPJ9YM33dBjau3L6tyZd9Q5+bZMKc9OtVzfN8O0+9yXG22FAyO35Ia7cyZkvZbJUNABiTV3AJvvCw2n0Y6W/5eYpa+Ag1S+FEVK/EIL/AQMGqHeXzNGixir7JjHlqSPtaHjBWGwAZWcL/A2ztR5I7g7nx1CLRNgRgmzpUfLpm48xWZOnUVNFhI8QrXn1s60U/9ROIP357F+ZtJ/txuqQNg9RfhQIkJE54qB3qqtWH86VHbqtl35YUZ9jRfD/clad6A/AN7fZ7z7tuEkM+5vCwMqLzw24CHcgQplV6XST5KBGzvi4mURiNKIxm1Yl8bcvpoMm/YxOyFRyaN72GRXdbzSD+VrIBLI1M7ED+6B1SCZEF2GAnCwiUXDwnVPcwGS0MKcsVN9L+Ax6Qb0/aIrYEH4hm9k9dUFj22pbM7mOR1yHZiOYb//jvtEhARcMaWC/RcZLXrKvsL1OHbN3kxUlvLq4T5YPfy1a+H8dC0AKMVtExUqwK3p++3XtV/frD6rbR6L4CFp6r9oE775QypOb/uBaP60ZwmpaNkRtML01nYA6MEh9lZEAzoWL+X9vtMDeJ7jAQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7050.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(110136005)(71200400001)(2906002)(33656002)(186003)(122000001)(316002)(85182001)(66946007)(54906003)(66476007)(64756008)(8676002)(4326008)(76116006)(55016003)(66556008)(52536014)(8936002)(6506007)(9686003)(7696005)(86362001)(5660300002)(558084003)(82960400001)(38100700002)(508600001)(38070700005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?Z05Ba2dCSVpnSjFOZDhsMFg1elAwUTdMSDdFNzN4U2hwZU1lTDM3S3Jj?=
 =?iso-2022-jp?B?a1JYQ3p4VjkxY2h5c24wNWdiYnA4NEt3bkU5NVNjWkNWS054SUZ0Qmtp?=
 =?iso-2022-jp?B?VW9WaG5KR2wyeW9Qd2VuWDhnVVhHQlkwcTd0NVNvZDNBQXM3T0VMTXcx?=
 =?iso-2022-jp?B?aElpcXVMYnhmNU9xc3QxZVhtWVFVbzNseThXN2JCZFpQZndDSGFuSlRr?=
 =?iso-2022-jp?B?MDllRU1SblFDMGxSMlNyQ3dNeVJwcW5qeFQ5dHZDV3l2emZTaWtIdlI2?=
 =?iso-2022-jp?B?VGpQRGYrZ1NpWHZPdzBPWW5aSW16S0t2NmM3eHBlM3NVZCtXcGY0NG80?=
 =?iso-2022-jp?B?RVFiMjdwVnp5amh3VHlYdjFKbDNBNGhWR1BFMVplUHVieS9wNjRtWDRT?=
 =?iso-2022-jp?B?ek96TUZjMnRaeVRDWXB1b3NDeHJYLy80dzYwc2hCdlplcHRBZ3BKbkc4?=
 =?iso-2022-jp?B?S0d4WEdpL0s3S0k5N3puOTR6YUFFMU9sVlRhN3B0dTBNMDBTSW1HcDV4?=
 =?iso-2022-jp?B?b0ZZL2pQN2xMenp5TDdIWmJOTlg5emNqVDUvQlByVXdlclMwaHExV29K?=
 =?iso-2022-jp?B?MTJWUzdtYk9EZGNrdFJWMk5qK3dkNkhWOXBXNVVQMXpKSEhkNndubm5U?=
 =?iso-2022-jp?B?UUNxeDNqV1pDSXFyN1NYTUxraW5iRWFwcTJoSzQweFp2NnRycVA0ZjRR?=
 =?iso-2022-jp?B?aExzbzB0N1I4WitwenNZUEtJelkwWUZVVU9MVGF4emluNmlwbDIxcTA3?=
 =?iso-2022-jp?B?MFFHMjNLMUk4VWtZNDBjd0EyWnB5ZGFqc1EyalplY0NVci9UTHZKSElG?=
 =?iso-2022-jp?B?ZVh0bmRwTDJETUsyL0hNcy8zN0RyMGlZVGdHbXFjRXo5ekpPVCtvdmZM?=
 =?iso-2022-jp?B?UzMyb2ZoMW83bGJNd25xYlBNUXNvUTJNdGxGOW9vNi9uM3JyaSs5T3VG?=
 =?iso-2022-jp?B?U3h0dGRYS2Jvcm5HR0diOTVGQ2grd25hQ3k0SkJBN2h3VXQyMytxMjlI?=
 =?iso-2022-jp?B?cWU1Q1pyRFRLT1FKQ2RxZ1NVVnExWldESG9wQ1FHRFJ4Vk96c2lwQWp4?=
 =?iso-2022-jp?B?VGFxTkJ4Q2N4akRNcXgwSkk1R2hkNFdVS1ZxSzJyaXI5YldkNXNrM0Fk?=
 =?iso-2022-jp?B?Sm54cTRYVXhGYlc5RXB0aDFzTjhFNmw0am40ck8wQmUvZy91UlRQWnh4?=
 =?iso-2022-jp?B?bGxoaHZ3cmZxM2xNT0N3OFdLem5yaGc0OHpyNjlzdktLd0tEaXJKdndh?=
 =?iso-2022-jp?B?K0hyVVl0d0hXMEhra3ZxVXZvV0JCeG0yTHdPTkcrbGd4cS82dVBuTERi?=
 =?iso-2022-jp?B?UmpuaFl6Vjljcnd5bGc4QkpyWnNqTmJ0TUdwMmdCbGxiTE5IcnAyMXpT?=
 =?iso-2022-jp?B?eTBxSUFYYWd3NU5xcUY5N0dqQ1NBV1pXdC9iNVY4SGw5K3JpOVVrVk5B?=
 =?iso-2022-jp?B?NGZQTkpjNXF6a2R6bG8vYmdIYVUwMzBFLzJ4ZHI2bEJrQkFrTFRGZTdt?=
 =?iso-2022-jp?B?d3pwVGJwa2twZHNuejRYbDg3ekNtbTdxeWdoSXhmcW1icVdKTDhKWXF3?=
 =?iso-2022-jp?B?bW83R2p3SzJmSVl6UVVDV3o3OVdtWFhoSkZhU1BLVW5mMk1Qb091dEh0?=
 =?iso-2022-jp?B?Wm5zSEc5RTdCOXloNncrdFp2SjVNUHhhdXNPV05CTFBUbjNUN3dYbnRs?=
 =?iso-2022-jp?B?cktYRjFjUTA1allWMG1mVmxuNVZ0bXBuSGcxT2tlbDgzV1BYaFJsZUJP?=
 =?iso-2022-jp?B?YzhaS0RFNDQ0UURKaGZzaDZ5VUVzVVhkUDNwcUZncUpiR1NVekZTQkRl?=
 =?iso-2022-jp?B?U2RxZkJVNjZBV2ZzZ3dJb3lWRWxRNzlmTGFPa2xpNUpJWW1nbzdnL2po?=
 =?iso-2022-jp?B?ZGxKTzduVy8vdzVDM05NVVVOcDdYZHhpWjRaVVZ5dnVFUER4WmtsTTBE?=
 =?iso-2022-jp?B?eWFjSnhQaThrYnM3N2FKcDBNeGJhRWU0VnZ4bEVqcDBHd3MrSGgvTE8v?=
 =?iso-2022-jp?B?VkJDL0EvLzhnczhleWRrWGs4SGxtamJBVWZvaXYxU3hjUGNHa1ZHdUtU?=
 =?iso-2022-jp?B?NnQ2dzc3alBlaUkweGdTaGhsRHF6eE0yTFdZNUIvdFQvTURYNWVYTzFy?=
 =?iso-2022-jp?B?N0RSbUpmMUZMSENrcHNacDh1blJuRGduYzkySnpubnVuUG1aTEYyenRV?=
 =?iso-2022-jp?B?VzQxb2ROc0xwN2t4T1hSOW1nQTJ5NGlneC9sM2QwQ3V2M1JQOVQ2Rnpx?=
 =?iso-2022-jp?B?VGpQdHArUnVTZldZRU9mSlBaQlhSMjJON1R6empadE5uTHY2dWMweWNQ?=
 =?iso-2022-jp?B?aUNHWEtsajZLMml4UmQxUEVqTzJSY2ZXQUZRL0crUDJlQ25PQWZScVJp?=
 =?iso-2022-jp?B?SCtyZlRtLzlYcENiKzcxaHE4d3dtYnhpdlptelFzL1ZLc2l5bFpabHdC?=
 =?iso-2022-jp?B?YzVjMC9nPT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afce7cf2-4d29-4d6d-f9b2-08d9fa9791d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 08:51:54.2801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mK8aHOKYzvzwObKb/z00fPNgEPsVcIsWje0N0/aia8lHBy1P81zzj6DzjBN8EIopSUjx3B0+Mw5ITk1hy4fql2EQqvxSqKSruyd1AZuX/AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9400

Hi Greg, Arnd, and Sumit,=0A=
=0A=
Thank you for your comments and information. I did not know there is =0A=
already a related patch.=0A=
I will test Sumit's v2 patch and reply there with the results later. Also, =
I=0A=
will make the v2 patch, based on that patch.=0A=
=0A=
Thank you=0A=
Hitomi Hasegawa=0A=
