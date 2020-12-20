Return-Path: <SRS0=H5mR=FY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1BCC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Dec 2020 15:10:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 584952251D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Dec 2020 15:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 584952251D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=leica-geosystems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryYlLoUMLkoDyfk+7yJ6mJ3hVsjkIzO8e29jQIxHxmU=; b=GBEPY7zkPg3TgFXJpxqyyOSg6h
	BzbzF3iz5TSK1096KYbXUAG/CoOB6Zz9r/weyjtqA7sUOx6t/vnqqPDFlHNlrhzqNWOG1D59elNXB
	4dIW8cu8fq1JP0/iP1RF7R2C7ZcCdhVh1V4iLk3Qi1Vx5hrFGpjk9LKtD0h5jdsvmXDrI7mF27Iqn
	XD92M1+VS8wEWwTVASiYsnx38CUz8pAGFPLj2GIoFmloGqzuDn9c3kMRl6K7J19ZiJPYZM/t95qCA
	cvoet4oEQ9aSTv2EwJYaM2mXuERMnjkGtPzXdQNmKGeyMAykvYjrkc7503b10UCqkKtwymgfR/8z0
	QkVnZJig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr0Jg-0003By-5t; Sun, 20 Dec 2020 15:08:12 +0000
Received: from mail-eopbgr80103.outbound.protection.outlook.com
 ([40.107.8.103] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr0JY-0003BL-Vl
 for linux-arm-kernel@lists.infradead.org; Sun, 20 Dec 2020 15:08:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cmf8yR9P2aArYbkrQiloe2/sQmKLBLwAx7XA9A8J93nDmicM8FhTrYhsgDpRzq5hQeCkBcGQWXNgzZsvglwsdIUMUMz2KegAodyQj19Ca4gZlo/uPdVRWaVZK/HJY058mUFIbbCF8cr5MFdCi1oojQg/dFf0xkPvKsUyNRv1E6yrVhwIPtQko8DESnex3MXY7bqr7kZaWYSFvEjUHHPv++7jW+ObthwjAusnUtqsWVSmEr6SSL5RgJ3YW+QMGpYxgum+PZp4r6/+vN87stZT3hxKfld5tUxsmQMjc1mVPh5CezHjDVIo2VTEg0L5z5x3KzpLT0BHmd8aQQDDYE0gVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLlkerezhXVnu7URcUV/Pwpz7ZLot/3yHJb6bD2N8UI=;
 b=RZkPOUDWrY3jh+8UMFfZ3BEHGzcNFGILbv2Phf21KQbCKAdgZYaalOOtEBVEqmeyref1DAg07Tq0FL31stko59yL17Xm8xA4Iaeu2gSxop989tL7Jb8NI/0uyl2y/q601Bjc4qSaPnky6apaeBrfQyCdnMOzyXyrLoA1qlf8dn0Dhoj5NIzvJrZfx+Cv5FP2Esc6QMtrsRjKkslqsvkx+MnixJ1LW/5v7LWNJy1DUy7ldwu4UwLVoODJdhxOMEkmRUmnZ3Mt8otB7FHTDuzydOVwNs0NIiePBNQKalfdJ5xmqLKyKDs2B59MmyucvFpjk9xBEeScbjEE+NpvuAq0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLlkerezhXVnu7URcUV/Pwpz7ZLot/3yHJb6bD2N8UI=;
 b=ZLSP4RROJCaPL23qAkFl236GFJtYn226gzYOxdSH9LX3JUaINltj3nGz3eIgbLZCFKFfjSlVDKDSKVmWtQJuRFgccXcKxz4s/cHUvKg2tOX/rdIg39DJ/vK8LIp49qobGQT/+Eed/e09JCUX1Yw7HMH/afklM4XjFSOInTV/bFU=
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com (2603:10a6:20b:37::25)
 by AM6PR06MB4692.eurprd06.prod.outlook.com (2603:10a6:20b:58::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Sun, 20 Dec
 2020 15:07:58 +0000
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6]) by AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6%6]) with mapi id 15.20.3676.033; Sun, 20 Dec 2020
 15:07:57 +0000
From: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
List-Id: <soc.lore.kernel.org>
To: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, 
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "leoyang.li@nxp.com"
 <leoyang.li@nxp.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "Anson.Huang@nxp.com"
 <Anson.Huang@nxp.com>, "michael@walle.cc" <michael@walle.cc>,
 "krzk@kernel.org" <krzk@kernel.org>, "olof@lixom.net" <olof@lixom.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 "soc@kernel.org" <soc@kernel.org>
Subject: RE: [PATCH 0/2] drop unused POWER_AVS option for ARM/ARM64 config
Thread-Topic: [PATCH 0/2] drop unused POWER_AVS option for ARM/ARM64 config
Thread-Index: AQHWxwvPy9duOhNVsEeWqGLmfybe2qoAMVNA
Date: Sun, 20 Dec 2020 15:07:57 +0000
Message-ID: <AM6PR06MB469153A8A3A1FCB576E9E215A6C10@AM6PR06MB4691.eurprd06.prod.outlook.com>
References: <20201130112731.30599-1-andrey.zhizhikin@leica-geosystems.com>
In-Reply-To: <20201130112731.30599-1-andrey.zhizhikin@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none
 header.from=leica-geosystems.com;
x-originating-ip: [146.185.2.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10e9a89d-0365-47d7-349c-08d8a4f908df
x-ms-traffictypediagnostic: AM6PR06MB4692:
x-microsoft-antispam-prvs: <AM6PR06MB469220E987CB21DEF93CA422A6C10@AM6PR06MB4692.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZyPdi2hgjSrGqtzrWd2nKKX8RG55ASRDB8zBzrmk9MdxyVn7Lem8n3es+mKlcEkSz4mExNwmsnwX+k09xFTNERJ174+smZfFt8yqSzxkjZnPZ8ggZbAZGJFhvbUOUFSLc1SwLAgyoJ069amWp4oqsly8CqpzL6SUH2g8dPwGEBiY0oXLF10qP9JClvzv/bShcjxy4VwSvBOKPfCQBhHgVohDQLBm247jNMIfYnONZbxq3v8HaqQVwl7Tz9J9oBz0BI/05qMZCSCbEkpUNPbyzLbXtvosxYjYA6u2FbYiNEwXrJwawsmwHrZ2qGRwLjcKyv0bxTL/1LOTDLDTNNCKto+Elm/avVt7JAe3xcwkC1qZXnUbkn/wim5Dnsni28u7wJDuGj/Iw6oRO/sj5AEw54XbrHramCmlKvgW+uIJmmlkxJc386NUMBFpmOteZ4I4ovmOgN3MC2qauRk3y4NSTv72YQb9eknBd3CeICGBJ826HklzmW6XRZDFoUxC2bDFlFm48ldjIs8vDA7fefqtSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR06MB4691.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(83380400001)(921005)(8676002)(9686003)(76116006)(110136005)(316002)(478600001)(966005)(26005)(66556008)(66476007)(186003)(53546011)(2906002)(55016002)(64756008)(52536014)(6506007)(66946007)(33656002)(7416002)(86362001)(71200400001)(5660300002)(66446008)(8936002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZExjdWs0dThocTFML1B1bFo3NnQ3MjQxYkVYdEEwemttenVYNnp1eTBrdklQ?=
 =?utf-8?B?UTBMM2VrNTVGK0FJZW0xSThLejNXdHZPeENiNDBZMTZ0Z1JQbUxFWHlhSUpq?=
 =?utf-8?B?VWsyMWNLL01md3RuanNPd3NwdnVaTVhjUHBrQWRNaFhIWm93SGJReVhqRFpp?=
 =?utf-8?B?RGwrdlllSjlCaHV4U1JENmh5RFNoY1BjZ1BtRW5UOTNXZ01wc1BEeTRwTkt2?=
 =?utf-8?B?VzVneHBJTEZjcDNBTDc3UkZta1hVR1g1VGowMkNJSWlyaWNvcjVXQTBOUDJN?=
 =?utf-8?B?aVFzWWFxRi9FSklPMHRaaUMrZEd3T2VzUzI0MWYrK1J2anAvaE5VdERLWWZk?=
 =?utf-8?B?SjR5WHRaeDI4T0pnTVpQbURSbE5sY2phMGVrbHRkV2d3UzlOcEMvaVgvM2F2?=
 =?utf-8?B?cjczbXowbDF3YnNBbmF3K1FyRTFZY2pjb3U0bHg3cDBBSjQ4MTJlRUg0WFdl?=
 =?utf-8?B?UjVFeUV1V3hIdGM0MFFGTnhoU3FOTDB1bGR0WmZZcVVGS01IQWgyalNUZmwz?=
 =?utf-8?B?Vnd5bjRZOGR0OCt6NlZNOTRHRTQ1TmtOZFpLWTZoZmkySzk5WjlZYUtKaWc0?=
 =?utf-8?B?clRNdTBzVGRSVDB1NEtYVXZlYnBEdEpxYWc1Wm9sTlFmbGM3STJ2eXJGWGx0?=
 =?utf-8?B?cngyMEljbVFhSVNaKzVIeTRoclkvSnl5WGYxUFpCUUNpNU14enR3RjRxWUg0?=
 =?utf-8?B?bDhOYkJldyt0OFovdVc0ZmNVL3dYTFJpVk1Wbm5yNEhqTml1WGNYMG9naTVW?=
 =?utf-8?B?SUlmenVKMXhJNElaaVVvUkdtZStlYjNyU1FpNXlWMmM0aG1QMTIrTk50cWpV?=
 =?utf-8?B?ZG5VUzg0K3JQc0hJMlVTTWRLWVpuMWFVSklMTHZnS0p3ZnJ3RE9uelVvazFO?=
 =?utf-8?B?WDl1N0tSZmVTWWV5cEdPTTI5eTRDQktKYWZ2T2ZHNmFtOENBalVsUUdTWnVq?=
 =?utf-8?B?MFBWUnBDTkR5U2dSbFdNb1Z0RTBia051alE2YjlvSzdtb1ZTRjFYMTFIaE03?=
 =?utf-8?B?MUIwM2FCbTNTazBDQ09XUDFhNGJtaEJIUHZHZGZLZUR1MXByMW5hcVFaenZa?=
 =?utf-8?B?OTFjNjA2ZmV3TEtITkE1NmZON3hpSnhEMjRmZVdCNFA0NThVcU4yOU9qMHZC?=
 =?utf-8?B?ZSttc3BwaysrUm9rS3lHeXFNRHJEREgxeGE5TWRtbTUvQ1RvMG5FS2Z5amRO?=
 =?utf-8?B?VEZtVEpyWDBqdXM4QmFtNWplNDN0bUQyc2NFOFhySkZXZnYzR2hnWmt6VVRv?=
 =?utf-8?B?UEVhbmc3MnJnK0JMVENvZ3JmVjEzc1ZZZW9qZVFzL0lwTmt3UDA0dXZsdTQw?=
 =?utf-8?Q?q0cnRj7XRqLxM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB4691.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e9a89d-0365-47d7-349c-08d8a4f908df
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2020 15:07:57.4033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pf/UUpKOuZgCpm3j0DDL8rl+glpLPjJmz2IM3XoVsDAcR0l0U8HEVrBJ727C3SbcMMuATm7WigGhDlhnP9+KJoRhPt29Z9YGyzGXwods+xA2tXmCLgsnl/ODOY0Chi4o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_100805_517274_EA6D92C7 
X-CRM114-Status: GOOD (  17.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201220150757.EoPdCEcyxTivqZVIAqRFcPw0wXSHszUaOVJAnuzSU48@z>

Hello Arnd,

A while ago, I've submitted this series to clean-up the unused POWER_AVS config option, and
It looks like it did not land in anyone's tree until now.

Similar patch to clean-up the same option in omap2plus_defconfig has been already picked up
by Tony Lindgren and is already present in the linux-next tree, commit 0437141b4e22 ("ARM:
configs: drop unused BACKLIGHT_GENERIC option").

Series has been already reviewed by Krzysztof and Nishanth, but nobody seems to pick it up further.

Since at the time of sending this series, I was not aware that ARM SOC list should also be included
(same thing as for BACKLIGHT_GENERIC series [1]), I wanted to ask you if you can take care of this
series further as it does touch the multi config for arm32 and aarch64.

Or should I re-send the series with collected tags and include ARM SOC list (same as I did for 
BACKLIGHT_GENERIC [1])?

> -----Original Message-----
> From: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
> Sent: Monday, November 30, 2020 12:27 PM
> To: catalin.marinas@arm.com; will@kernel.org; bjorn.andersson@linaro.org;
> shawnguo@kernel.org; leoyang.li@nxp.com; vkoul@kernel.org;
> geert+renesas@glider.be; Anson.Huang@nxp.com; michael@walle.cc;
> krzk@kernel.org; olof@lixom.net; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
> Subject: [PATCH 0/2] drop unused POWER_AVS option for ARM/ARM64 config
> 
> This series cleans up kernel config files, removing the unused POWER_AVS
> option.
> 
> It has been removed in commit 785b5bb41b0a ("PM: AVS: Drop the avs
> directory and the corresponding Kconfig"), from the tree and
> therefore should be removed frorm default config files delivered for ARM
> and ARM64 builds.
> 
> Andrey Zhizhikin (2):
>   arm64: defconfig: drop unused POWER_AVS option
>   ARM: multi_v7_defconfig: drop unused POWER_AVS option
> 
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  arch/arm64/configs/defconfig        | 1 -
>  2 files changed, 2 deletions(-)
> 
> --
> 2.17.1

Link: [1]: https://lore.kernel.org/linux-arm-kernel/20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com/

-- Andrey

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
