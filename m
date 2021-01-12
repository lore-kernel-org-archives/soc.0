Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D9CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 10:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73326222B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 10:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73326222B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1q1Zze6eE79GmzPLsFzWkIbatOhDyHVWoBmY0osApyo=; b=cdQ7gEcJLLGXa9ZJN5XwqKsiY
	Y13IZVKehSQObjSL3KE1wKhyLVz9Ba0yAUSQxQTErttj6YKQB69ANp0M9oEw/RQiMaxAIR7sDft4K
	DdYlYT5DYgKG1KGK48J8dxNFIPP+eDCcvHtL/Ecq7xV5OLWMLoZorAqCQ+bOpw9Afpdfzl/FdIHch
	0DZbzQTvql9oeywQeUh1GaKlTl19A2xbRq+IWpok1r+EgRK7LmrLsHD7htbXHfSSgynxBDJeDBO1j
	df8mLsYuc161d1EX70Az8GsjItKIUDaDOs8i9Vn5aIKvXn4xIz/UfFjkft/QFJOYvkd8AuhGn2pnb
	5zNlIQRuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzH7a-0000je-0R; Tue, 12 Jan 2021 10:41:54 +0000
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzH7R-0000hk-Q1
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 10:41:46 +0000
IronPort-SDR: H/o2Ajk5K+auWMdZEqUjvVEF93tMCwc6cjl92rxr9SrUeYNnllRmYzjoeHKHlNQ/Bz6+2HRbbz
 BoHUFN+nax9wDxvDY9Q2fxFOn2nFD36vrjCVc3Mkwo7aiS7nsi9t4I5a3Oq9OOMpNyhkp8Gmkm
 y2gvW/pB76GqQzwGi2xLIb1Cnzc+3gWmLsb4Nnjl1l0ExIi1Ah/wQcPRG+6iBjTgpDHQq3Vs6W
 rAxPxFGZE/qlbOnb+bcvBBoZh9CJI0jTbzzz5OqQ7qhQ7l8RkVUYDNGzqw+rCW6tPKR2E3pTBg
 mNM=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24264050"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; d="scan'208";a="24264050"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 19:41:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfUuo32Ou4vnG8TPCZx8NvrlYgxdVAHWFBsbzKOJIgax/ITCvTdkyAnSyFMgyQlER3PhiY8D8G1lEkbReoJZU4yTRWtRZM2FYyZ3AyFOEtutFqwMSoRqx+u+EEMlCYFuUxV5o84cJS4NTem55UDfRggj+dUesetLRifmOlFzDSzq8cTwYjDyXVcE+OpgY3bDsIEIOrUMlgg1SxuMjtsTUEHwY6v0sZyhwfz8FM9ZsKJUR7ZIaUuTWGaUUaKVmtLaQSKUkZS1zhsUvbdRgQv0KF8FCqKiLHkBgVbK4ouoUbxokHcQX8FkkHPD9eTfarXTk738xfYruk6oZrywwprsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqq5CgB0bTbK3Tnz6drkUkkgCHaqQGGWOZceDRmI4G0=;
 b=UzbrjKaDuyni0CHclLWwyfv0K97PH61bAHpL+BCb3om6mqECo323xQVEx/UAkfV0H4LzKrdiwNbXjSTjexD7hMvh6bAqjMHl9rhI5JOw59uXoZWafaKmvpUtuBkJlxcrrfL9T9EKbDR4rkYhSCozEPF9sGmXxdX9RZofCyhZWwehzTN+JAFLNNvewBz1sLmXWlANRFywmlpwSY2FfdkTdSTv+i4Clrc51yHzZc2rOXU/MTzlbk48M6BruOghMfJYapIBRdW7dZx9KaDw4ZUugeUBoZDXLqmhhTgGnsxVjXQs652OB/95v21eIaVGEPCt1rWCwAzwHNK32u02vXsnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqq5CgB0bTbK3Tnz6drkUkkgCHaqQGGWOZceDRmI4G0=;
 b=SgPAwKUnxOp02KBZu/ux6MJOVAHsXHTcn+D775p9zDKkberY4AMAiK25/Zh4t2CYa0ZWzIuWIvQAHM+cPiOeaOveNkq8vpu+b3AnmjZTPxKq7pHNCjIHa4O9RvkrLQrfIc7TJmmDMnd0Dqu69ZCaTFfSbX3Fd7t3oLuF+TcZe9E=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB2181.jpnprd01.prod.outlook.com (2603:1096:603:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 10:41:40 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:41:40 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
Subject: RE: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
Thread-Topic: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
Thread-Index: AQHW5aq6N2+pwZvoo0md0aNDejRMEqoduLYAgAYaIpA=
Date: Tue, 12 Jan 2021 10:40:36 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:41:36 +0000
Message-ID: <OSBPR01MB45823CBE99E05753A6308264E5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
In-Reply-To: <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: e609471c34d74a3f8b63b81c24bff94c
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26ec27b0-28c5-4615-6e45-08d8b6e6a509
x-ms-traffictypediagnostic: OSBPR01MB2181:
x-microsoft-antispam-prvs: <OSBPR01MB218117C436DA9C1DECD9C773E5AA0@OSBPR01MB2181.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6KcUzG1I+pd0tcjovt2BegtavhzVWjGlm5AE5BhTG7SXfLIAbpp3eG7Glz++AIXVHXm5zDSlK/AJrNsF96oE2BnrfBV7FdZe982udHfZajBh1bfv8fho6WECXYJZVI6jNqs5z8EJGA8CD0g+pf3fXDCbtDHSxq0MBmIgSefPvrpNI7w7wlcjUMT5g1AYwccC1E8BKn1ZunSjP8OjHqWFiEz5ZicAHk7XqCU/T6L4S31x1MVnhrDnCiTCWV7ipvC8/3GAG9Uw9D67qhoj1WHHHvwjaPohIJaCcgVEUSYhCVr/qAXY42dRL0f2AowxESJ8U95Xo93SFsBZbL6lCSbDWbJa3d0fZy/oiuDC52qcGBZOZoGOUqSJlMVmdWOzvLGhavWNveziCrkOB1RWB3uR+WSL98KjKQetEStoRCiqmTUwveZGL/P5PSWmfck5Or8x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6666004)(66476007)(76116006)(4744005)(66556008)(53546011)(7696005)(5660300002)(8936002)(52536014)(64756008)(66446008)(66946007)(55016002)(85182001)(6506007)(9686003)(2906002)(186003)(478600001)(4326008)(26005)(6916009)(316002)(33656002)(8676002)(86362001)(71200400001)(54906003)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MVJOeVB4bW54azIxZ1BvQ1A0ME5odUMrMjc3alZsc2p1cHhGR2dJNGtDVUlP?=
 =?utf-8?B?dDVMSE41d0ZEN1MwbEQyN0xTYmpEaFNtTU1ZU091djRjMWMyZkJqOEtTcEhJ?=
 =?utf-8?B?YTBjM0hyRGNnLy83Zkw5Q0x4clpPME90YVd2S1h4N1dIaUtkR0VzVlhOMXVO?=
 =?utf-8?B?N0FkRTZpTEFmNFA5WTBOZFBwN3FpNGZBQVpONEFMcTVPSHpLaTBDSzErb2kv?=
 =?utf-8?B?MEs2NFBwNnpVeHYwSEVDbzNveElQaU52VERPa05zM1c3NUpyRktqMWVSdVVj?=
 =?utf-8?B?OU9lNmd4YVFLMkpoOFF4bW1ZaWxBMXFnSDhXVjZHeGhMUW03WUd6VWx1a2o0?=
 =?utf-8?B?YzJVQlRObXBrdmFqRGZ2b2RlVnhVTHErZW42K3IrclJDYVJrVXo5OThoNm1J?=
 =?utf-8?B?ZFlkMi9ZRW1PdFJwOTN3NlgyT21KdFdMRXdBazY1Qy9zanhhS3pUTzB6SlFo?=
 =?utf-8?B?SSs3UnhGYmIya3Q1N2J5Rkp0cldRbG5ZcHNGRFMwbzN5RkJTV2MyU2tEOFZu?=
 =?utf-8?B?cHU3ajdkR0F0ZHlLZVdHQjVPQnJTRXBEd2t3a3g5azhqK2VsMFRkUzVaKzhL?=
 =?utf-8?B?R3ZjQmVJZ3p4OGVtaGE5dS9PbGFhUlgveXkzQk9vcGV0MGdmbDFiZGtpa0xX?=
 =?utf-8?B?cDRJcWNMWFFXMDlIbUVqZUZZeGhBMC9KZ0QxODJBMWFSbExoc092OHBEaXNB?=
 =?utf-8?B?NVgrbFVCMW5pVlpoeHVoazVwaWVieG1xTHhxNk85YktXdjFMT3h6WjZlL250?=
 =?utf-8?B?UER2TjlMNjJ1WityZmVpYzE4L2ZaTEVkYVk0VitTYkJxTE1YODVpUTg4Z3Ay?=
 =?utf-8?B?NFRJYXptR0Y0OXBXYko4ZEc0SE9LdUJqL1NXWi9UT1V2OUkzRml6Q1BBUyt5?=
 =?utf-8?B?RmlVbFh5eHRWcXFlMWwwZlc4YjBrRGcxYWRLc3dHd0JrdHh5ZlFGT3BCTDht?=
 =?utf-8?B?NGk5MW5CSzFiQ21IV2g1RE5qUUkzb2Y3VHVNazczNWJuQUdkcGZqNXRENzI2?=
 =?utf-8?B?UU1NMG9tNUN6QVIxNVY3U3BQaWx0YU9PelJSaktRWVEzRVFwcE9zZVVCL1hU?=
 =?utf-8?B?NFl5Q290Yjg0bEpURVllL2ptTTZmOTdJN0FGZnhwdDVPL0w1K2FCSDFydm5j?=
 =?utf-8?B?eXZ3SUZWdzBzbGhzSHhDK25CemNyTW8vVTR5ZUhUSU0rQmNlNCtra1pWRzhG?=
 =?utf-8?B?QXhET212elROYzVrTkZuRkpjYkdwWnluVDdOMGlEbjVKMCt4YjFtRDQwL3ha?=
 =?utf-8?B?WDhvdWMzUHdYeUtOdXhRTWJxQ3p2alhOYzBJa0JWNHYyYi9FWFhsdmdIRFF4?=
 =?utf-8?Q?Y7gttedfB4XA4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec27b0-28c5-4615-6e45-08d8b6e6a509
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:41:39.9887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFblgWkJnIW3Gf+nE2+NoAk/5g7K9nAE1rdWgkMK0OL1beiq/xVwKx5Tk1olMWeWvXGzw3nqU+a8NORI0ESGQStMvdcGPLHOnPpUY98GhHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_054146_057974_4132B256 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210112104036.ezPtJ110Oc1JDEYOKBQY9Mjwe8UGemYAJ_s3bq2aPWs@z>

> On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
> <misono.tomohiro@jp.fujitsu.com> wrote:
> >
> > This adds sysfs entry per CMG to show running barrier driver status
> > for debugging user application. The following entries will be created:
> >
> > /sys/class/misc/fujitsu_hwb
> >  |- hwinfo ... number of CMG/BB/BW/pe_per_cmg on running system
> >  |- CMG0
> >      |- core_map      ... cpuid belonging to this CMG
> >      |- used_bb_bmap  ... bitmap of currently allocated BB
> >      |- used_bw_bmap  ... bitmap of currently allocated BW
> >      |- init_sync_bb0 ... current value of INIT_SYNC register 0
> >      |- init_sync_bb1 ... current value of INIT_SYNC register 1
> >      ...
> >  |- CMG1
> >   ...
> 
> If this is meant as a stable interface, it should be documented in
> Documentation/ABI/
> 
> However, if it's purely for debugging and may not get maintained
> forever, you might want to use debugfs instead.
> 

As you guess this is only for debugging purpose, so I will try debugfs.

Thanks for review,
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
