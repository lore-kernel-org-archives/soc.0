Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07E9C71156
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:32:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EC820671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lecX4C8W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="YD7AkX/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57EC820671
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=leica-geosystems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Legyl/qyZ12qIYECPMv5M1bCqTSsCbMwokmdkcuVwXg=; b=lecX4C8WLzfVPehTrRNpu5If2B
	ciyN1RZARqnNAWmJLTB1FYZuWVTwhecxfr8FUg4Knh+WDtn4/xuCsdGhtu7p7yQ2L3VpbBuA6OGbB
	P4PeThF5sgegUdqSiCcIuPgcDxnV1pfxXJzE4obRCbESDyzNySLfPEcCCDBFhdLfK21mGfCxUKmbk
	E5vJUYDUuKbdffEC5MN7fep9mTFW94JwadNepjQMdTtGbuTW4tfpe3mmXCLHOxNvsB90+o9I5xYkN
	QlQgG8PiJgXk3pqw2kflhsBoxi95hI/FkDLaU85xpUSpSAC/mTMgaO/wEdpV/mJ9zHYhSJbqdIMIk
	Mu4PvZ/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkEAi-0005nW-Eb; Tue, 01 Dec 2020 22:30:56 +0000
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkEAf-0005mo-6u
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 22:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIOz3WMHUvjdLhmxE2uEBzzbdx4V55BoI6Ygfp6RazOKIWimvNee3aO8vc4S0/DFlRbO4MpDk2DgrSzZhqLBHoujssG1unmwZRkuK3PN+Y7Pqk8+QgMm8YI5AqNdCzn/LBHttEWkHqexomHysTkRvbeMmhaSCMOUME8nssRQ83mNzuKiGfmSERLnO/XOfLj1C906gHHJx+2zE5iU6YAonp7jKy02PS5A9GH+pdRqeED+D+QOuhsO2yhgh3kIn74xkkrJ9HjNhvj7Ajfx+wzxDe+ErjgOf7vXytsfvr0NfCU6A/8N0wD/VhEsIXJNEJXTQ1xjb26tWrqSpHniDxX4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wJjQAZHI5NHAdE2q6LEx8sK4q6pN8M0elUMSYPsAqg=;
 b=HCptyY6r28ExFIx1N9Xrcchn8YiDLgCbe+UqDKupMfYuKsm+M+d2YDPIV5HUw18oAAKFrHVkO3/v4aWrJTMUGinNyAkq7KJ1iiGpHbABmq4tFicoG7Y08z376ZQQVxgpLOEo9iS2ZjiHChwvPRYfbT0UzVSwAeAeFqzZoGzV811fEcL2XNBpmc1POnJQ5jhsYtx5LFsSJpcfxiBAEiudcwfLz+FqBUktIh6VNjI+SKPb2PDsyAwuiR56SFbaoZoxJ7VGwgSZSRfJMU9pp+Nu22TRExKFu47LFFyUAVlXm3n5GZ8WgmiiBdvhZiYTXoaKRu+kyv+AarS7n47fXCeHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wJjQAZHI5NHAdE2q6LEx8sK4q6pN8M0elUMSYPsAqg=;
 b=YD7AkX/g+iGwK60sH5ekUZqua9ZiQ18JmtHmO8ub07iY9GCTHqiGujaUBCzUH052f+HHg9BWK9BkymdRJeNef9dSGXASW7CprGmfEmV2YTG2bylbKkAEOsXjzDveE3CPaphtkfnao/Ddh9/eJDQPxwpwRWMP7UFz5SJGPOdliF0=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB8PR06MB6236.eurprd06.prod.outlook.com (2603:10a6:10:10a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 22:30:50 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 22:30:50 +0000
From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
List-Id: <soc.lore.kernel.org>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 tony@atomide.com, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@siol.net, thierry.reding@gmail.com, jonathanh@nvidia.com,
 catalin.marinas@arm.com, will@kernel.org, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, lee.jones@linaro.org,
 sam@ravnborg.org, emil.l.velikov@gmail.com, daniel.thompson@linaro.org,
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, soc@kernel.org
Subject: [PATCH v2 2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
Date: Tue,  1 Dec 2020 22:29:19 +0000
Message-ID: <20201201222922.3183-3-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
X-Originating-IP: [193.8.40.112]
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To DB6PR0602MB2886.eurprd06.prod.outlook.com
 (2603:10a6:4:9b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.112) by
 ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 22:30:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 031b3484-b95f-4d4d-1198-08d89648c1c7
X-MS-TrafficTypeDiagnostic: DB8PR06MB6236:
X-Microsoft-Antispam-PRVS: <DB8PR06MB623656568E000446D98C9392A6F40@DB8PR06MB6236.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 28UMAZ9JvRCAXWzGWSSmUqPul0y1yOLmgkzkqJIRnmPPecJ7eZFOqzEjnRkTDjbIYd1zRR4iGcI/7SHR16M2l2eCTcpvsQiN4qXZPp9fvnBnzI7xrF4Q6jYG0o+waj/U0YGxphYMu8wi3Zv+brhsGucAVNZBavQ+9OmJy/nkcZCrTZdX2eY8tZ03kQEvGwcJgUJJymecYhvqyOCHLSN6VQS+8op7bncOT5HT8d2chlTQpdTksGE4hJrhCD8cHTMdQfmeP8C/4BgZy4CQWCypvk9LZY/Gg/t5rKICYszMsGv/anBINyCg0hA+7/4/fn9dumMBo5AcaSz5mB3Bn/rtFCmaKgYzFCfla3h0HBMIRctr5PiOf5+bjeB/IOQf72gMwVsGPPjkkxexg2l2kxR3cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(6666004)(66556008)(86362001)(66946007)(26005)(1076003)(186003)(36756003)(8676002)(16526019)(83380400001)(2906002)(6512007)(478600001)(8936002)(7406005)(316002)(7416002)(2616005)(52116002)(921005)(956004)(44832011)(5660300002)(6486002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/CgIwPcpPaZ9PNI8HHVOFGlFtyykQWC7uLaFAg5pgBrX9x320VOnvOtN6txR?=
 =?us-ascii?Q?AgQbO5Ij1PKHeHWFftxPX6XnCEOcx3DRz4I7n1HE98Hel9lQUkgq7nWKp4EZ?=
 =?us-ascii?Q?wmdvoX2nepVK0SCT+svDbxf3RRpSV7UfCi+SRh0Wa0p+qbTijloHi6anCYuZ?=
 =?us-ascii?Q?iIPULIAMYWl1zRks64W0exIWf4J4MENoRtMvA8U7so/+0MtZPKax//pJi1W1?=
 =?us-ascii?Q?eF9x8heH3DOGc99by4n+PaZlB+necHk1jXzJbaH7iLdAd+J/2JkH7iAI/t2D?=
 =?us-ascii?Q?440t7PtYUYBnI3frJXdQ4Yx42jEh4DlW2EK7uHeEqZ/E441dYfoD9t5RXtFg?=
 =?us-ascii?Q?fzauNQBU1U0sx9UbuoCaAVsaL2xN51xUAnyGvAs/TDwfcmEitDQNkFQbYWz8?=
 =?us-ascii?Q?sZpQeLtLljCenuNvL/r/Dp2kvwihr760VkxlnprFOig/En3YWX5NwFpePSg4?=
 =?us-ascii?Q?aCLO8pDHtwHxI+INn2HBih/312A0n/MaKHRTiR0tiuudSSkYU9x2KeNuHnik?=
 =?us-ascii?Q?yJQcWpuH2RzK1nRGWTPPgscKRzFdxWsAxxEuT2+mIxkakhnVWhhhavma2vBg?=
 =?us-ascii?Q?2XnyqSEECqJi6ZX2WMGNzo/wA84ZxHFz2EKbYXz7rfZ1/SFZ5FmoCL1GbDwO?=
 =?us-ascii?Q?o1vfuRGvUCvD9f7au4I1G4t7eZos1HTzY5yCjJMebiE2IRJjEPqyo1LPEez6?=
 =?us-ascii?Q?9yfYwLsB6qz9/xKX6tN7eywDCeYdsUhVPh7fX4MDrGFhxEYdH1TS58xZz7yB?=
 =?us-ascii?Q?ingdwS57fJIfi+EsvBFCpWA/y42ojOBT1PNtU8eh3TaoksHT9OUVihrhDlGf?=
 =?us-ascii?Q?CIToiY/WFjGjc0krGtQyz+kJSAroxofyB9VBZ772uRy7vqQunXg2C9iD3E5L?=
 =?us-ascii?Q?3KgKvxehCy2TF/aqdtLxZeEnA4maouWgaNCykN//G6+SzmTB0fhiQLG7sZz+?=
 =?us-ascii?Q?jNIGQY+TW/LRhCEJXP5npL0UxZSurF1SQbnRZJa2C74vXNyt5GzyVtHkfM0T?=
 =?us-ascii?Q?i4Qn?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031b3484-b95f-4d4d-1198-08d89648c1c7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 22:30:50.7704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AcqWtNvkWv0dzQtolZvMGWqvDiRGT3Cg10crUO2d/T0JwEFNRE6mwP2unNYdb1QelATQ+02tHGGDNmSimGkFXYzqQeyoajedXI31nBNZ/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_173053_920168_41EA1C28 
X-CRM114-Status: GOOD (  11.12  )
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
Message-ID: <20201201222919.U_PS0EvjdWjKErTjCw7Sz-TzkM2hEIq67VGO28MNFEE@z>

Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
unused") removed geenric_bl driver from the tree, together with
corresponding config option.

Remove BACKLIGHT_GENERIC config item from arm64 configuration.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8e3f7ae71de5..280ed7404a1d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -681,7 +681,6 @@ CONFIG_DRM_PANFROST=m
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_EFI=y
-CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
