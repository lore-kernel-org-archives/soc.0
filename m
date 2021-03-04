Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F39FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 10:37:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDB1264F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 10:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDB1264F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2wHM+5QzyAwopSMn6f79D5JlYdNrceM13awpJZiwPbc=; b=OLodZF5yIFGjBQpFCb8JnemeU
	pNO1Dm7zEP9ZHCbf5RZObGPl+xOFbjOvkuC6uJ4FoJFA1iUG5XyqXiCOnjkBD/+zvRM+oQuN3oaNw
	afsr6qi/3xIXfM1elT5x7u5jviPZIuv8sdIKO0uP91FRLkzbRGWiHx120Vcv+Siu+8RAKrpExPAqp
	j6JOovBSHv5flF0mnEPeKapzzRJD32v38IrNKZiSkuzp3ExjAtJhSvWM3AyuQ9jbNxrX8XGmmk3ED
	zunRhAMuR1nRsx6cNU+JuvJ2aAnpmNFHlxSPHRLW9r8aF9R6nhSxHPSW9l7BP4bTcUr8GkC3fxfOE
	On8NNvjyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHlJs-008MaB-F7; Thu, 04 Mar 2021 10:35:00 +0000
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHlJk-008MZE-0u
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Mar 2021 10:34:57 +0000
IronPort-SDR: FHIIXuun2kM/sPDy83c5eBMXUYvy03o7hv3r0JE1HzW97eomuhnvfAmppkMwdwJNG6xa92+WYG
 7VoK76dMZF9GYxzWWTA8xMCmRMvEoQbGb6yhzSFRmEExFatERooCUSVer28PUl+XITvO98R4YM
 P5q6WOpic16+ofTGvHnuPzNs2E2hdoz8Qy4Wl7329/jgpRIer5vt+NrJUyRJ9UVhnRm06vn0Qf
 SLz8KsR6qkObv33I5N0n06VrbZhd3sI7hcwnilmxqPDnHvhF8oETZZk/YGXS7B2VywMx22jif8
 mF8=
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="35179012"
X-IronPort-AV: E=Sophos;i="5.81,222,1610377200"; d="scan'208";a="35179012"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 19:34:47 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6ovH2bPW0rrg/djR2r2ndskFCxnUKmmOH/sM7jFQ503L0scr0cPrwffK1su/mNsBmtzKUrwof90YoUktBPNz52v+396WOZcJpXP4cD6SoGK59ppk0fgm4OMjJW3URBZed6DmkBSfEa3zEIU4AbfgTl+38/HWAkV3UcNvaxaWf8pl73tl/U7MAtlcfuFZO64SWT2HHOWIGdBAmDr+AwS2w4Z6AFRUCo9stGfvz7yqu9qSBi2EjWWt8+Pitm/ZdscD9sgHHAOCC/c3YHK7S00EROmanCXtys9SG8+l5GyJ6s73Yb8cG9LCMjYqM6JNrpKL+oaU6PIpGjraAPPknfHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTr1/GKBZidKlJxEDayivnQ5so87qYboXmdd5IXfdIQ=;
 b=OS3y664EFnriH8OLC1H4dTXYRu+obqc9tBHehft0VgwuBo4KFVv6VDen/K0JfYBPHabSmQ+GdxZgq1caeI/0yuwV3raJUeYUV5/tT3O6+K9MLDZJ1sCT7AFu9MfOyp2/m8WpXoU0SS4TfMfpJb6zULGAaiWbX6X8lRYqnJEn5eeDFNNhyUEJsWv9qAq0RSLGiZ56UfSNEyGiHGgFBz0VgBtPMnzIakHCq3K6/2mmPlKBBH/49V2L1kqLnN1lRbuElDjd3yetE41pSskBs4MELjtmfMCFgdsrALXKTFjV5UTd3NmCah3aF1XJfSd9TLItEms0QXsWLi4x/dXa2Jm7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTr1/GKBZidKlJxEDayivnQ5so87qYboXmdd5IXfdIQ=;
 b=hxZaxZ/BpS6AwqjtUQn3nIIO8VKLCd+cqxqUVoJAe4FjVn3KPOTIDxTQS1mKXdV8APFnzT6xQCDkA7nMiWh3n8N0NxUjE6JGavW4biKxFlweclqFB34hpffv8DbVC733+TuVCoVhUBZzO87qhyJcIDK7jfIIxcDPWli0I0lQWAI=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OSBPR01MB2374.jpnprd01.prod.outlook.com (2603:1096:604:19::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 10:34:44 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 10:34:44 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: 'Arnd Bergmann' <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
 <soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index: AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFA=
Date: Thu, 4 Mar 2021 10:34:43 +0000
Message-ID: <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
In-Reply-To: <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 243a54bc-c9db-4d4d-e1f6-08d8def9202b
x-ms-traffictypediagnostic: OSBPR01MB2374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB237400D87114AFF970D1BCAB8B979@OSBPR01MB2374.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6pNr5e9xw+BrOjz2r6nJXOFUfkYaiqRSqmgdU3t/zEcYZzQ1ZE/1vMaYg3iiqwKxxH5N00GRtkLkOlqzB3y+bzfXKh/eE8inHFSTUisxN8mhkbQfHygRPlfwrkwsKo4z0CzievYgpMmHmH2VFuxvOrOqazggQo1XjBjuxGknv2M7/wO+L++EurxI4TiR7EOa+PZyATSNFv5LbBvrSGNVtQo3TdqkWq56yHj3mAsIS/SNHaL8avFxsP9WbFzpfU7l85pUr4/R4CWL3SnTGCFJvh9g1fSbu/hgPdPcCUzu2bf4mBxJfcctNYT1g+GqAN0HkFI478KHJ84rT7z0yd58hxV1j5TAuUOIOKaqRvD86Pp12EPlpoEGBl46i51BDizXZE6R8j4v+FJ9OVt6Mbt/q43jdTpGqC14jsfsFskQMgmSxGNCtxWc7kAAclQ1gpG/NQV8hF0cnS44FdI5UwwRMmPhKdh0KAMPzDK4fS395xX/Auf0Pzrbx3HcH8zZrMVhiahZPou6YgWTjqE7gBE8uA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB2146.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(83380400001)(186003)(33656002)(53546011)(4326008)(55016002)(26005)(6506007)(86362001)(107886003)(8676002)(6916009)(8936002)(7696005)(9686003)(64756008)(76116006)(66556008)(71200400001)(316002)(54906003)(478600001)(85182001)(66446008)(2906002)(5660300002)(66476007)(52536014)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZDV6bTFmTmZLdExoaC9Ea1JYNkZ3T1VZazYweWc4NkhkeWpGUjJoOHRvdU9E?=
 =?utf-8?B?bVFaR2IzUjlvRU5iT2VIY1NUdk50T0ZObEVGVnp4ZWp5dWg5S2lDQ3dJdlE5?=
 =?utf-8?B?UndldllIRUF2eXdsaUdYU0gwQ1BDYU9KTTEwM1dRNE5rS3BlMUgyZndpREsv?=
 =?utf-8?B?dnBvT2gwQ1h4amRqNVlNLzM5ZkQ0M2ZYekdLd2ZxUE1tVW94THNPL3Rzcmxz?=
 =?utf-8?B?U1FlaHFCTThhQ2loZEJFT0J6SXNmUUl3dnVvNUV4U3dkU05OLzhaMkp0cXZM?=
 =?utf-8?B?QXIvM1lPVVRzVStHU0wvU2Z2TVkyT0tGd2dtKytZdEJRd1Bha1VQRTNhdjVD?=
 =?utf-8?B?STJKSmNBa3NiMG4zYWprdDRGOHJqTUkza2xqaUlkditGcmdQWkJRNjZ6YjIz?=
 =?utf-8?B?MFJnR1ZRaExiM2NucDZqWE9Pc3g1L1gyZWQzaWhJS0ZYbVM0RzNFb0UzNjd4?=
 =?utf-8?B?TEU0Uy9RS1ZxaDEwUzZGemlxcW52Ukd3NGJkbnZZV2lUdmtZOVdhYzAwTXEr?=
 =?utf-8?B?Q1hudHBZR2hId3BGMHdKWXBiWEsreVFiTzlpUUpyL0FLdFhxM3k5dldQZGhF?=
 =?utf-8?B?SnNxaUFCc2FnaWV3WWhIWVZNWU5xbDE0dk9KNFltQXlrMTJqZ2hvbDVaS0xq?=
 =?utf-8?B?NmZoU1gxV0FLZWhnT0o4MWltVnlmdzNwb3pLNElTUkEzTFd6NnE1QUhZaHMv?=
 =?utf-8?B?ZURaZ1FpUzFjc09YR3JraDNGWnkwVUY1M2NrbTUwbVdPcWpMd1QrZEhUUmJF?=
 =?utf-8?B?SjVDTVVwYXNQM2VCb3NMWUtaZFlXQnJRU09OM1R5ZTg0MC9PVkNuK2tFZVF6?=
 =?utf-8?B?U1hHZ3ZjdkFMRXJSVm1ZNDN1SS9pR3pSKzNJRktyVjRFYTNLYk9rYU82T2Qr?=
 =?utf-8?B?dU1pMTVTMzl5UTloYUIxdmZkSVphanhxTFJDU0ZoTTFxcWlNdUNkOGV6N0ZR?=
 =?utf-8?B?clpQSzI0anp3Vnd4SG1tTFplSHlKK1lLWERiZkNrTEhqaFpaUm5YbEJDaDJ6?=
 =?utf-8?B?L1M2S1pNNWx5d2ZablgvbCt5RzIyUzc2UHhTZlFhakUxZlQvQkIrQzNDMVU1?=
 =?utf-8?B?Z1VHcFcrYUVQVDU1MEpIMHM0MjZTTGU1M3d4T3liVEV2MDhncEl2UVo2UDZ3?=
 =?utf-8?B?SUJDRXZ2UDExSzRIS2s1SlZkU1I4Y0YxQkdtbEtnL3VBcEtiek1VajNORS9y?=
 =?utf-8?B?WU1oZi9seGFOck52Zlc3dWJqRzRHZC9sR2RUQnkvL0R1ZjFXQm41a2ltNkpo?=
 =?utf-8?B?WjhlNGZPMStYT0Y4ZkVGYkVvYkw1cS84NTlWeFNRV0M4bE9ISjBTdVFyK0xr?=
 =?utf-8?B?b25nTHk0aHY2RHJCZ25kQkZlbk9McGJNNVY3WXVJY1UzMWFEcERQWjUyZkg1?=
 =?utf-8?B?T3pzSmNha2RTdDZPMGd4UEo5UUY2SVdiNUxqSGJsSFJTMGxLVkdDM0oydzA4?=
 =?utf-8?B?VUdBNGkvR1RVMlVGRjBIU283eDFyaE1yb1lrZzdXM0hSUHBqdEpnVkJ5U25N?=
 =?utf-8?B?RXpnWTNVZ0VhakxDM0s2TFZlc1JwK2tSNDZVWjNTR1hyUjB1TTh0MkpHM042?=
 =?utf-8?B?QzFaY0JFRmc3R0JqTnpObnNZWURYMHI3ZmEwN3JRcnBWdHJ5L3JwVysyTmYw?=
 =?utf-8?B?Ull3ZWJ1Vm1PQ1VlclQrQm9KQVhXamlxS0pGQ3lzaUZSVG91WndiMXBXbnpD?=
 =?utf-8?B?dElKRjRXRVdQQkVDcXR3TFdkcmE1YWtIeHJBa0hvdFBKZEY2cVh4aWFBL1Rr?=
 =?utf-8?Q?YsKlZDA1u69c6NgWO3TiGLfKxY5ssE+UreErKqR?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243a54bc-c9db-4d4d-e1f6-08d8def9202b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 10:34:43.9935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RV6VNIbmKFhX8k7F/9LazFWbsdYTeGWEEs6iMn/W7s57qpY9C4jD9Ge6U31wfWGd01/Bjz0jyLcvF+Fq+7HWSXHU6rCvudsmjehHL3JUJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2374
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210304103443.UCt444Vo7yb7TEyXIje-Gk24bKchAW6Do0U5udr0h4E@z>

Hi, 
 
Thanks for your comments

> On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> <tan.shaopeng@jp.fujitsu.com> wrote:
> > +
> > +config FUJITSU_CACHE
> > +        tristate "FUJITSU Cache Driver"
> > +        depends on ARM64_VHE || COMPILE_TEST
> > +        help
> > +          FUJITSU Cache Driver
> > +
> > +          This driver offers cache functions for A64FX system.
> > +         Loading this cache driver, control registers will be set to enable
> > +         these functions, and advanced settings registers will be set by
> default
> > +         values. After loading this driver, you can use the default values of
> the
> > +         advanced settings registers or set the advanced settings registers
> > +         from EL0. Unloading this driver, control registers will be clear to
> > +         disable these functions.
> > +          When built as a module, this will be called as "fujitsu_cache".
> 
> My feeling is that this code should be in arch/arm64/, as the cache
> is generally considered part of the CPU, rather than part of the wider
> SoC design, or something that can be controlled separately from the
> core kernel and memory management code.

Thanks for your advice. I also would like to hear the opinions from 
other soc&arm maintainers, and then consider whether to add this to 
arch/arm64/. 

> > +module_param(tagaddr_ctrl_reg, ulong, 0444);
> > +MODULE_PARM_DESC(tagaddr_ctrl_reg, "HPC tag address override
> control register");
> > +module_param(hwpf_ctrl_reg, ulong, 0444);
> > +MODULE_PARM_DESC(hwpf_ctrl_reg, "hardware prefetch assist control
> register");
> > +module_param(sec_ctrl_reg, ulong, 0444);
> > +MODULE_PARM_DESC(sec_ctrl_reg, "sector cache control register");
> > +module_param(sec_assign_reg, ulong, 0444);
> > +MODULE_PARM_DESC(sec_assign_reg, "sector cache assign register");
> > +module_param(sec_set0_l2_reg, ulong, 0444);
> > +MODULE_PARM_DESC(sec_set0_l2_reg, "sector cache L2 way
> register(sector=0,1)");
> > +module_param(sec_set1_l2_reg, ulong, 0444);
> > +MODULE_PARM_DESC(sec_set1_l2_reg, "sector cache L2 way
> register(sector=2,3)");
> 
> My feeling is that the actual settings need to be on a higher level, not tied
> to the specific register-level implementation of this chip. Normally,  the L2
> cache is set up by the firmware according to local policy, and the settings
> can either be read by the kernel from registers or passed down through the
> device tree. It sounds like you want to control the policy at runtime in the
> operating system rather than at boot time, so for each setting you wish to
> override, there should be description of what the setting does and what
> the purpose of overriding the firmware setting is.

OK, I will change module parameter from specific register-level to 
a higher level. And, I will modify the description of module parameters. 
To be clear, we don't suppose these parameters (EL1 registers) are 
often changed at runtime.

> Looking at the first one in the list, I see the specification mentions
> multiple distinct features that can be enabled or disabled, so these
> should probably get controlled individually.

It is not necessary to enable/disable every feature individually. 
There are no plans to use these features individually.  

> I also see that it is possible
> to control this for TTBR1 and TTBR0 separately, and we probably
> cannot allow user space (through module parameters or any other
> interface) to control TTBR1, which is where the kernel resides.

This driver does not change the values of TTBR0 and TTBR1, 
and the values of TCR_EL1.TBI0 and TCR_EL1.TBI1.
The cache functions can be used when TBI is already enabled.

> The TTBR0 settings in turn would seem to interact with
> CONFIG_ARM64_MTE, and should not be controlled independently
> but through the same interfaces as that if we find that it does need
> to be controlled at all.

MTE is not supported on A64FX. 
So, this function does not conflict with MTE.

> I have not looked at any further details, but that should help get an
> idea of what I think would happen with the other registers.
> 
> > +static int __init fujitsu_drv_init(void)
> > +{
> > +       int ret;
> > +
> > +       if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU)
> > +               return -ENODEV;
> > +       if (read_cpuid_part_number() != FUJITSU_CPU_PART_A64FX)
> > +               return -ENODEV;
> 
> The module_init function should not return an error when it is running on
> incompatible hardware, please just change this to silently return success
> to avoid warning about the failed initcall if the driver is built into a generic
> kernel.

OK, I will change these codes to return success. 

Best regards, 
Tan Shaopeng  

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
