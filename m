Return-Path: <SRS0=f/o2=FP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7CDC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 02:06:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A953623E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 02:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A953623E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=diLVa9C9JP8E/j+3l6QreqSOx/7ZKW72jxlZ2tw7UH0=; b=XcvKcgFub80+8IMKoBZY+mXdpD
	BnI2RE+uryz3LRgY9PX/rAqn1q+6o8A/gE8LG2R6zTThssbvKUe2vJOWch3Pr+vsaNMsXgbYBLdzN
	DB2GsVXMCMV4/9Biu1AQPE56n9I3da2aDtjxAH69e7VnJ86G/o4iXgPaQ8POERry61w5sZwbEHcnD
	QOtvA+/sHcmv9GyqHERw/CCn9RbfluXq1pGYv0NtTR1jhUOH1TY3wCbmMAFcvtR5Gs9hJVwkSzsL5
	qUiBQFJoNjCPk1irPvMXu3kzcPApYaNuSIr66jxkrMkzdOsLCS1TanpVRwbvfxbmxYsj63IMdgfQx
	yhptthuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXoJ-0005ai-VE; Fri, 11 Dec 2020 02:05:31 +0000
Received: from mail-bn8nam08on2081.outbound.protection.outlook.com
 ([40.107.100.81] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXoH-0005aK-Pq
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Dec 2020 02:05:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehdQVRfx+9JunF3owYosvU8b2+lmiF1kE4HR7+/uyyrcXGN5oI71OSr1WgBg9dIaAZO8Kvq8HiF9lbQTvJiaHlro/oIFlgXaFPdwzb/Cy2QCxk3+vnLuFVQLg5JpjbOHrew8HkDY0/cG6CfS9OYds8taQjyoxO76kxo0eKxLzNAE6M6YLim14WOYdESw7zQ2gqHeLsiloEoffx6Z8IrDPrpDCtEIKvBA166a3fk29+0SE84K3nzl1OycwaAXvM2dwjWZmOl7pJ/K3bYqO9CaDy4+1y/udldqGfGydD9qZDNGv/Fqzsgqy4T+GlIijLEs/Uk81o7RwPLBmBjklQLpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSlTYWw1qZGCyupsIcrqJFy9FQY/S5VNbTgbi+04Umk=;
 b=JYV2yNXTNBIhwojzBP7h6mSA7WlK7cWLt5X0VG74q+QdYaGGXYaY8TTXdwsEyTqqLT6Ulqm8jGFsyuuLd3OK7U98NdKPfLS5z6DUVgKOXdYcsHMUb7Qcc02hPnGmKOXt2IqEKkzpdlJGP9CIrJ0bPQh6VmQGSN0jrJXDRDSIcm9ZCACGm8i5sZXkqUBBxhMPhwDlw4ZMrG7ysHXeVzo9rpQ/+9hdtXa79m1W76VCRjkFHzb6yXKuMWyW/6xrBMu1H1lClYbbAXw+Enz/FpaLZbR8TsiA2sD+zqJ4qRQv1beOjGEoPqWJKlcbSCWfEyDQgUNJ50kKBrZwZCsu3/WSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSlTYWw1qZGCyupsIcrqJFy9FQY/S5VNbTgbi+04Umk=;
 b=JtG+CcrWB01/INc3lTqqtMEh0Y6Q4rG/6+Uh93UEm4cntvsdgkA7BpXSACIZYmGrNxv+9JcEtyroaNsKHAfCGBaolFbx6H/0A/t3Q549Qe7FSDayFt6Y7RtQpbTj+9DgiVdSKjmYp0rAwSsBxdFS4OgGqcGFr2ZBv9xO7yLMBOU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synaptics.com;
Received: from SN2PR03MB2383.namprd03.prod.outlook.com (2603:10b6:804:d::23)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 02:05:28 +0000
Received: from SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::412b:8366:f594:a39]) by SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::412b:8366:f594:a39%9]) with mapi id 15.20.3654.012; Fri, 11 Dec 2020
 02:05:28 +0000
Date: Fri, 11 Dec 2020 10:05:21 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] berlin dts32 changes for 5.11
Message-ID: <20201211100521.2e6f4faa@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR13CA0052.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::27) To SN2PR03MB2383.namprd03.prod.outlook.com
 (2603:10b6:804:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR13CA0052.namprd13.prod.outlook.com (2603:10b6:a03:2c2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 11 Dec 2020 02:05:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b896e3b-d6ef-44b2-488e-08d89d793b50
X-MS-TrafficTypeDiagnostic: SA0PR03MB5561:
X-Microsoft-Antispam-PRVS: <SA0PR03MB5561C4DF3C4742542CACE3ACEDCA0@SA0PR03MB5561.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UcfIcg9GCK7ZAJkbF7hUF01/vHRtG4hEie3AhWzHNgCQ63Rp0GCOsIMlx80mRO5VtRu7rvpt0xahJX8im5MvUvvv+zsrbegoE659X1HsxofAGy9LiGNRLNf3/q/8u34Nk0d6UBMYXHraxKUntetdnBgBnTC8/VvwK6wGRYwN6D4zjgmaHH83q7jUn9f5B5Hn7kqn4/edmAHieA4Tehc3qTJWJ/r87RRiZ8HMokBKsPNBcQG2x545AFJy7X9JXzz8CGJ+FH8X4g70YG/IeeFE9CsuuUZaPbpJ/5P8Ib4v/2V97Rua11mcigxKXDYb364JV/fMVqQsb+4tDwPAwVhhQnprK6cqPx5GwBOzUIYdyfRfWUppKRKTYjlPV3J7SDkl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN2PR03MB2383.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(956004)(16526019)(86362001)(7696005)(186003)(6506007)(4001150100001)(5660300002)(52116002)(66556008)(508600001)(26005)(83380400001)(8936002)(34490700003)(66476007)(9686003)(4326008)(1076003)(55016002)(2906002)(66946007)(8676002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rsHrsSDstOh26vm8eeFXNEi8MtT/XxGJOQjDRq9N6R5zxAW9nKYyEZQwmT23?=
 =?us-ascii?Q?gyU9LYN8tcwvq5bL2n/ECWjKnFY9ukHGC+19VrJXXpKk6zITJLb1TB8Q5chn?=
 =?us-ascii?Q?k1m13EmA7kgar7U22v3NsCWnJZioX9s/ojEWpu1Dn9Yqe0gpRXu2mJmfB5Gy?=
 =?us-ascii?Q?0Yh5tJbwNXnPHRL1zSBDe0IxAoYUTwU5jpbN9ZNrhkn5xas7tjI2ETFKbxgE?=
 =?us-ascii?Q?O0VxvWLzsOe5Q+NImj7+zAunQ1Zwwom0xx6lnIN7tWkR7EXDeXqKtmDWHJEH?=
 =?us-ascii?Q?I8ZcTFgiD4T4w9oi/81XH4qhf/EzwO/H1Z9oIwk7COKpRVVseSBGB5PL8fIZ?=
 =?us-ascii?Q?H88IjCgbiOc+8uSxNhUUW6vcUK3ijyI86o9pV+IcJul+cWP5ID5Qz/mAoIvG?=
 =?us-ascii?Q?ODR6HFgHdnsUY1MLgMmXX4wDLkRk6NAoBCbY5cJXpjtVQTzYHTm8bfpjZG5n?=
 =?us-ascii?Q?q4V7XAb2qjMYVlXBrsrG7aafYiGsuglHyeIhqfXI9Dl6MmbDTguAzTSCoO9f?=
 =?us-ascii?Q?ptYZCsnPZLDk9s02N7XtAyElLHNjYLQIH46X9IW3Z4I2sIX9fstjjNVt7zPv?=
 =?us-ascii?Q?nvQErQD8HJTNMFNBnfib+oVwzR1eseXH75dOV3BqKJvSHArO0LqNiwzFLO4T?=
 =?us-ascii?Q?IqrBhGYgByHqSGVZIemMqYGpJBvZsRFJEQN53zoF5WFJrLLDZgwPOt7bQgMp?=
 =?us-ascii?Q?ofiSwt6Rr1uk0SGGgyHNWA3X4l0uoNqwINLDhDwR7mHUzH/Xqs+yKlz8cnvU?=
 =?us-ascii?Q?UV9JC+RQV/LoTxA7/L7+0pxU7x+sEKCwpp6ynTdw8r7wyxE3GpvZdHpr1A/X?=
 =?us-ascii?Q?mTPJOhFJNLGvM5vYi9pAvoyAwtIoBpRSaKqHbnp+k/UYgVrNDEDLIeR1CIB3?=
 =?us-ascii?Q?W87ced6fGgw85QDV6vOGBg+QghaIRmHGGMjzLNkjxH0zHRbpRvWwB0kO0pUW?=
 =?us-ascii?Q?1oQ5R1cBo9BaMOMQLFfEhhIrrd9mHCpqjUC+DKmEUElxDHxEeLheYC1vAmKa?=
 =?us-ascii?Q?nhTV?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-AuthSource: SN2PR03MB2383.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 02:05:28.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b896e3b-d6ef-44b2-488e-08d89d793b50
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhG0qaB21xqUYtRdueHSb4JsR+pK00F59I404slLZeuDYLrJOVwIPdFZ9ujHYC5Lne6b4zuQ1MP80+BSLtBKJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_210529_865434_A9D93257 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201211020521.CtT-yMomf1hI2jamCQK6N4NkyqxL1-CvOIG6XPVwqUs@z>

Hi Arnd, Kevin, Olof,

Here is the dts32 changes for berlin for v5.11. Please kindly pull.

thanks

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux-berlin.git tags/v5.11-berlin-dts

for you to fetch changes up to 7706e376f5311487099f5243875bf608347c915f:

  ARM: dts: berlin: Use generic "ngpios" rather than "snps,nr-gpios" (2020-12-10 17:50:11 +0800)

----------------------------------------------------------------
v5.11-berlin-dts

----------------------------------------------------------------
Alexander Dahl (1):
      ARM: dts: berlin: Fix schema warnings for pwm-leds

Jisheng Zhang (1):
      ARM: dts: berlin: Use generic "ngpios" rather than "snps,nr-gpios"

 arch/arm/boot/dts/berlin2.dtsi                    | 12 ++++++------
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts |  6 +++---
 arch/arm/boot/dts/berlin2cd.dtsi                  | 12 ++++++------
 arch/arm/boot/dts/berlin2q.dtsi                   | 12 ++++++------
 4 files changed, 21 insertions(+), 21 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
