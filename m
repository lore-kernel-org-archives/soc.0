Return-Path: <SRS0=6Lw4=WO=suse.com=clin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E5C433EF
	for <soc@archiver.kernel.org>; Tue,  7 Jun 2022 13:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 788F4C385A5; Tue,  7 Jun 2022 13:56:23 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 554C6C34114
	for <soc@kernel.org>; Tue,  7 Jun 2022 13:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 554C6C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654610179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LvNA/6DgjdCC2nlkldSmyGNHSvB3r3DzNaR1z99GzfE=;
	b=TBpT3MrW6x9eHh+1Cit6bpPw6hIGg/CJS20crHnH1M1qvVBAIiCqG2ntAtDE5hv2uNnLx2
	iUpJyZynFHMKi7V3drFgHauC4gH7TZOsT/SKA5iPhngldJOMwHt2kSXWO/eFuExYePe3m2
	RbZFjjDxaJKaGHr5/+zklxU7YtrOVMM=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-DOP8HtYAMjCr1sH6bwE1nA-1; Tue, 07 Jun 2022 15:56:18 +0200
X-MC-Unique: DOP8HtYAMjCr1sH6bwE1nA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGOpVJDqxuSDczRfRxdkOqev7RsDcZhEnWI+CQMaZuucd0HMW6c1P35v25KJRXjXtnEXoq9Sh1MaKFsBd1sSzPjO6usLUlP0uRdKxqLO4ryPMR/uH812CT0i6LA75xwrODiD6lujLgFPgtFtktpzhXEjY+22tqOuS692W5626kw9LfBc9P1nWMo5Zlfu4Ub77uQ2c/Mwjb6s+HM4lfswuP17SdsJKMVkvvVv2OinqtqutCURsbP/xG4Yu3T016dxotaWdIJ1nNBWKsLgv+6WA+yh+dAeBWrNHCJSWgWLbNuOfPsGVIL5IBY0SLGvu1s/ow2nWqNr9w1r2CA1xsQ8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvNA/6DgjdCC2nlkldSmyGNHSvB3r3DzNaR1z99GzfE=;
 b=R8Ug52TjqONmE6TXOID+wBQS50IGb5pyFxFh7aNSSOFdgoD78yQ1tNBI3D2dZ7oUVYMGOYMLyf2yZ/oWoeE3ivcAlTqlsylW4g1kkTxrPIOt6/m7u+c7TK39b+i7uuKxKo1fnxMFoTlcCpH9Z8KB4LjsCqiNj6g9AgLeoEDEfqyujihQWcHp2qHGO91EKjAcOP4OKuSlcAEyihf9uBzRTE5SfvgdcR/dTsQUj5v+umh3PtJHsPMATIGOuEG1UHifFL2D7cfw21NG24dNKpdBlKVd/FAhGV/mffG1sQwXkLDzeGtgrJZQ+mHTrwZ56CzefKQ1RM1FiFV16/c1U4qOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvNA/6DgjdCC2nlkldSmyGNHSvB3r3DzNaR1z99GzfE=;
 b=GXyMCWaECDKaiGbci6UyOXAC/IlomfzdaUQbP28E3RexoS3OOJK7StqL52EwkXbZ2QTDsBFNxqHPnvtAxu2WZQmsxB91/K7gTFuTDk74lcjmiZGCFk+l7Bsu/R0ZlZALnegAB98DlssxSmRgUwf7buzAkOFmPSGlwKu3KbcGz6uGo1RZ2anb0csWuej+JeHJcugytxqpu9i44Dc7LyoK8fxOeHDTYPpwRP5IV31tNL2DedP4rGLebRNirF2Yc33VhRFiMjxdPiSjvvullzTTvpLCjlaBCskkpPGGPF3hUmLZrlaobWD+U1m59ZZbz2tDVpvRL2cxP1ErHAox3QSoIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3439.eurprd04.prod.outlook.com (2603:10a6:803:4::13)
 by VI1PR0402MB2798.eurprd04.prod.outlook.com (2603:10a6:800:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 13:56:16 +0000
Received: from VI1PR0402MB3439.eurprd04.prod.outlook.com
 ([fe80::f518:3115:e069:2669]) by VI1PR0402MB3439.eurprd04.prod.outlook.com
 ([fe80::f518:3115:e069:2669%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 13:56:15 +0000
Date: Tue, 7 Jun 2022 21:55:46 +0800
From: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Matthias Brugger <mbrugger@suse.com>, s32@nxp.com
Subject: [GIT PULL] arm64: s32g fixes for v5.19
Message-ID: <Yp9Y4nGrQ2kVKV6S@linux-8mug>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To VI1PR0402MB3439.eurprd04.prod.outlook.com (2603:10a6:803:4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c8680b7-536b-4841-a2d8-08da488d7d57
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2798:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2798E1F95B455023409D75C2ADA59@VI1PR0402MB2798.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rPbZyS4DL/Of0fTt6J6sYoqwiJXt/v/xACHmiDGKaS0qS7caDVtg/+FbXFCVQZH+3+tGQASvuamykh4aEmHa3ZFTioLBkNp//zl+V7CMsAQ3obmCl9cb+UMnuXkPGIW215FLicub67TtmS+6vk/ECgzuiVjSeajdAjM9Sj32ny7JLiaIk9n4PBLkXdRfrOIpGGqzR1KLu8ZXxy/Lsnn7TYmIk4A6BVyiUrlfJQpj0j6wEJ6XqYV3o4ixxei1khq/oUQZkMnfOCl+rNcsZQLOutjXDbqxD25PogDjWVj0EDxJ27jPGY20FBp2L5um0eZnS4EV4GEozAZAKxGdEh4lTOPkG8nfTpHvuBWXAw8MxEmpHnMlAHl6Ow910N7PvFx1jsrbhCGd7lMKegtmSVm84IE2bK6C6nAzLVe4SPHH0qkm7kjapg6p9EWm16c0nNGHsx/cORFQTxkccTm4tp9f7ro2oEbPcnnp9xkwsTRgR2fUF9e/Hgf+OUhZj/cRk5joMLGvZFtEccbU+dlca40NkZRj8T/mWBiSUnN1uGoKLqNeI3x6SlbtHLw7rNrbt2fp4yxqifaLHhPLouwpXSxd2J39LVpz6U3z4fHgF2PyTuY3Ompxa3X7MgaHFzX/BIN+mUx9ymQHpmAQTbhBc8sJaloU/EgqrIvdaP52OlVMfOtQLLRkvKjmMYnQWTzkm/nM61jAMbpttxggj1QndMrs6eWAeIaiJzeQ1loZ6hH+VU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3439.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(54906003)(6486002)(186003)(66946007)(966005)(66556008)(5660300002)(508600001)(8676002)(110136005)(4326008)(66476007)(33716001)(6506007)(26005)(8936002)(6666004)(2906002)(4744005)(38100700002)(316002)(83380400001)(86362001)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u4nUZZgwX+tjY7uoldndtQLwITVkRuG3A8tK2MY2Xr14lx0cAk27ErqUxlUI?=
 =?us-ascii?Q?ViPX3RjD8mH07tv3ld4bvvEGfLlcqSz0SOrt/Rab9Zv6VrwvWHyEDWSq2BHD?=
 =?us-ascii?Q?mKs72XukitnMOLQIoP/7XVztTw+0h92eCv240p0nBc7l+vphOI3QGZ3J4Q4R?=
 =?us-ascii?Q?5mctj/Aw3PyRfB0TOzuwXKxYPY3iwzXd2xZ7zCjKm10zIBRuUDWdyFa8ZHz8?=
 =?us-ascii?Q?eZPwb0ZwgfZ19zKwzrrK6fZ6SZX0sHFO9LbDAcoJsU4/89ypdpz9R0Y9SkQY?=
 =?us-ascii?Q?31Qy28BtGKogwWHvm6wrdTPpgw+JzoUawa5vC7AmeO3ZJGSR+8bZ1RlH16Wr?=
 =?us-ascii?Q?WoCQg2PAp6E9yt8l4WuAVK/Y9zZzqvoS7cnmuyO7LWT3hQdFyWapCkByIGoL?=
 =?us-ascii?Q?U7uHKQjvVAfaL33yQHi6x/5qYYOuM59T8zFEIPUjHmHrxmfqX62qTv13bzfW?=
 =?us-ascii?Q?V0cNUaJlmP/kIbm2TS7+oT2YLUT461Lj+GAULZR3yWI2fk0kmXCXMYWMnMOE?=
 =?us-ascii?Q?vf1C8CX18GH3HJT8PeIvMesr6c8lwq8y/lCX5airSLQ1DduqtEQEYYyzzpg9?=
 =?us-ascii?Q?wiVOB5WalcP/cxqu11+0XqDQUzqgPXpLiGpLqsYZxPjK4W/x6gjqz138OfQU?=
 =?us-ascii?Q?eIHDImJDSgvvDak2VB8sKbFwTmAyFG4Es6MHrONAFEr9XGZ7cNCNkeXPeUGx?=
 =?us-ascii?Q?ARwvGxBXflsoRd6GahbQf1tFsdaaydwQf4Mz7hfpNoFfYX/XIVswe46SzI28?=
 =?us-ascii?Q?2dYWPsTABz/dKfpRQGiY+3XzUA2lVozLuj6RqiRmTa+XUEx7q1qaavTC1iXs?=
 =?us-ascii?Q?PQPf1jA3l513qvBWStXofW1BIs+UtdKHruteZNOwVKNJE10gOg5l1+xDVg1C?=
 =?us-ascii?Q?8ZavQVeBMkVzkEUmGUx0JLftiv+PffBV+UGrbmeSrYJOKZwjXNn4x5S1kGaJ?=
 =?us-ascii?Q?eKso437Mn222d/qbbz8BS+z/5CEMnTusLCNgY1gS1RtO6UZTgI+nJUsb9lJL?=
 =?us-ascii?Q?ORAxWHpjqercKb/jAFHttXEI1c8RLO0vTrJWVDv1FBaM7ObLZBttlP2nh1ug?=
 =?us-ascii?Q?Ww/ya+m8CvvxhiCK9+i19S1TtbVl7Sl9SFRR9SsRSzL8Nh6d3kfixx54UzXF?=
 =?us-ascii?Q?bBCHKj7DizT16pqVrzQiUPJaq+b36qNG6+H176y95KUBbXCQAN1Zym1cQgtr?=
 =?us-ascii?Q?RrnKlflqoBaWWENldl8whtfATOIREVOR9KDlWGJq8lvtYP1GxVxqfsSiZqtX?=
 =?us-ascii?Q?v/yvpTdl0tqocOhDI05TxB0giFqazq9ZGQnQAsBkRjjI8GBDzRzqCvohYYPf?=
 =?us-ascii?Q?cjy/jqqOZBKuX0k9myjcqtSxly8lvc54we9phAcDuCbnq2btit7/yWAScM+W?=
 =?us-ascii?Q?QlEqON25Z5MqqWGH0joKTtG234esCtDC73IBPDa3FqQjDGlfMyUtO6d2+3CO?=
 =?us-ascii?Q?3tSGV/wVtUb0Bm1rrZaKXOoHXJE930SsqnDZIuahk71wB3MBDM5AmdW+xGjJ?=
 =?us-ascii?Q?XKxN6cQQHG6ZAqjU+/eaSzQtHgjdDT4dX4nVbvxIu0CgYZjYzRUrVSZ6brid?=
 =?us-ascii?Q?+WZQd+WW5uhZuAa73Za+qUuzZJj6VHsD6m9kxk14zJVpX5uSuqYdDg82Dggm?=
 =?us-ascii?Q?KJBcg9c2RmjBP0i5ov0RHIuYyy09S2+jKBsKwr04oMntXTDKFV+I8YS0t251?=
 =?us-ascii?Q?HcjgDHB0efYc/NtHMSH4arZRjCPtrZzCpmhpS2KVudACqToT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8680b7-536b-4841-a2d8-08da488d7d57
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3439.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 13:56:15.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOUzcIaC2vJw3+5q8Uo/vPOHS2Y1KTcPObzXTQ96n/0PcIC8Oox/6ffmX0xu+O7C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2798

Hi Arnd, Olof, and ARM SoC maintainers,

Please pull the following two changes for s32g. Thanks.

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/chesterlintw/linux-s32g.git tags/s32g2-fixes-5.19

for you to fetch changes up to 680c0aee97690c3f595e074a5f677599aac5d26b:

  MAINTAINERS: add a new reviewer for S32G (2022-06-07 10:26:05 +0800)

----------------------------------------------------------------
S32G2 fixes for 5.19

- MAINTAINERS: Add s32@nxp.com as a review group.
- dts: Pass unit name to soc node to fix a W=1 build warning.

----------------------------------------------------------------
Chester Lin (1):
      MAINTAINERS: add a new reviewer for S32G

Fabio Estevam (1):
      arm64: s32g2: Pass unit name to soc node

 MAINTAINERS                              | 1 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

