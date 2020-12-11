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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335F0C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 02:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCECD223E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 02:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCECD223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KynzVp8KOCrwJ2mVsF3kCFsPo+bQTvxThGjqmtlt0G4=; b=kYxRnAghFoSsItGG8yCiVN3wOe
	qANwROdcDlvwkA75boekTwh/lWI2660575Kpj8TxqA8ovrwK7QtDRxGwky3YeY60uP1eOHM9dzJKi
	Whnm8r4b6UZ6B82CJxdslKIFhf0q2tVp1mi+R+AMeRpPTsrGH1zgpeSsxY2u6x0DNHRAT7a7vw5+u
	gW3Ye3Y1ur9/UhpCaQ0D0k0uN4On9k5T5G6qwQQPjz4JuPMrAV/gocMJoAej4+aHzWgc4UwlH+YDv
	GGFeKl0ClLBllNf/Plq3Rws4B7ENbhE4rfi4URBuzL+YYJ4cyVtaGkLslOuIjfg1K1hwcutsokHis
	ataW7Ftw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXli-0005MV-Qz; Fri, 11 Dec 2020 02:02:50 +0000
Received: from mail-bn8nam08on2081.outbound.protection.outlook.com
 ([40.107.100.81] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXlg-0005Lu-1p
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Dec 2020 02:02:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1ACetG1TsLRSdEn6JDJGSalJKFse9CJjZXjSaW+//E03jbR+fbtYk2msAnIbM4TxaUuewNejQV71/4iEvavWnBb7CcyOxXlaVOolUHEZiTf+qy48evMJvT0IRTgSfP4NGq726hWFbhbRtYKxICUmI6TNK9AhT2ZRMY8vfpdI95NWtemgvOUV6K2N0ytoel/bmpnGh9uAcjmCp+m3Be0NfsyYlKcLQAtkOlID4AeKeGCH3tq/J+59sPY0udrubqmd17vFC38zaJaheEF6HjMXq2DTTMUhXw7HMCnCAjiFMFYPGbLv+p+Bzq+7KAK5yFqllR8im8VO1/ygkS+F3u4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8zqdgu2sop971AiElDMyfvLclyt3Y7lrGoaOY9HVAM=;
 b=SWpzLhkK1qb7X6eomPtdMwGGjgkEKXRcUuJDJf0Sp4ky9IDaJwZFn5z15IEudd3IbzskKZNLSdjd5YGm9s/qfZ30BFkaxtPKymwJosEuRL0wIBqJpAOsTy0rRyd1YbwgjhL3Qxs435u2FVBTdjemNf94FGIkwKJukmgzmLAugnemLdBtDx2pyJv/mlrMxfZFp4ripLeSg9wLtyWR7EVFWP/uWtjm5H6j6ZkNJuCeh1emM64WnuthzE0PNFRkSGLzNC4NYlNp8/riIWey23WAdqlPW4kVFwHB7vWzj1W8HOl/ZYNWRawS/3t73WxS3Ems2odcV7wakx68Rx7kv/Y95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8zqdgu2sop971AiElDMyfvLclyt3Y7lrGoaOY9HVAM=;
 b=LxngTZsMbAhKNpXNKVpzx5pUUKkYE9iyOI7wB1o65EY0elg7Q34nipod8a8RWp1SlMZOwrC1fdfWAOZ0Gys4GO/pXrlgVHDZpA/mLHzIlOOWPjHmEeUT9zpbwmZhZW5BWNsF56vaEJXG93FXElw+BqNXQcaeBE7z/vHGL9XOJLc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synaptics.com;
Received: from SN2PR03MB2383.namprd03.prod.outlook.com (2603:10b6:804:d::23)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 02:02:46 +0000
Received: from SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::412b:8366:f594:a39]) by SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::412b:8366:f594:a39%9]) with mapi id 15.20.3654.012; Fri, 11 Dec 2020
 02:02:46 +0000
Date: Fri, 11 Dec 2020 10:02:35 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] berlin dts64 changes for 5.11
Message-ID: <20201211100235.2b0b795b@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: PH0PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:5::6) To SN2PR03MB2383.namprd03.prod.outlook.com
 (2603:10b6:804:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 PH0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:510:5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 02:02:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41783ef8-2769-48e4-41ea-08d89d78dacf
X-MS-TrafficTypeDiagnostic: SA0PR03MB5561:
X-Microsoft-Antispam-PRVS: <SA0PR03MB5561C9C1F23F731B5C11570DEDCA0@SA0PR03MB5561.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0mgVDeoSNxwpaSGaNS+gv2CRhBCV2rJpqWNrJeAlpZQ9PGAoXJ5DCulouSga6mOYyCIE3d8GBTNh3n00h9m9/GJMqhUmqnc9QA3lHRQOeOvsA846DChNaIFt/S8Ng4FIN4gX2wM4hUHvmA4QZ9Z9mbuNjoiV1Lc1LwZkDXnqZv3oxM3VwL4Eau/T29k9TamZA/Zs92JdMQ+zyxPAWd7iNb1lkDdrBhF40eAP+hq4HjQZdz4we1qHWHD/rPl+r2oafwvUicv6baC8dY6AwTL9KUmpaEEw5oslEHbY4HkCUjNzm4curs4hUScAbbMlTxmPXo4G5otN9FZ0x4EKGYEt7pZ58Z9nnJLFDe05A+0A8u7IGEttTT5FBy32JVdboL8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN2PR03MB2383.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(956004)(16526019)(86362001)(7696005)(186003)(6506007)(4001150100001)(5660300002)(52116002)(4744005)(66556008)(508600001)(26005)(83380400001)(8936002)(34490700003)(66476007)(9686003)(4326008)(1076003)(55016002)(2906002)(66946007)(8676002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SZC1RGXAw+LjVWdXZIqEtmVKoLDqi6sYEwfg8yvrROLfiZ8XfzJX5s8BQbjf?=
 =?us-ascii?Q?TEfsLN05JsL1OPkyGyOkaQrE46DaYzbJ970LYWhDHkCrHGevZ4glmu0VRzia?=
 =?us-ascii?Q?udKLk3Bo7t/HHMTnBjIQdbZxXwLa1Yq55zGKnuU4cRvfR5hOrv9U7Z5VsCho?=
 =?us-ascii?Q?s3fg1T+PBA4viRNZG7pHpbI2V2ZJFaVSsnQLrAcRmsVyL7Jn3ttTgflfMCNk?=
 =?us-ascii?Q?lgUTOKd0D9mlS2kftcA8Lz4mhSw++gkRpBM/3P5h2CVh+KzUTMP8mU9xLdv2?=
 =?us-ascii?Q?O+OVCqZ3DCtfm9VLe0TozkJNoxZiqA7LH3KpEwqzOg6M4nLVavmxIxV86Wbd?=
 =?us-ascii?Q?yN59NyS4erJRIPNgPRBK6Toxa0uCAXa5KSkXIQBgqH6O1fN31AUKYvTKPK7c?=
 =?us-ascii?Q?hyfsUtophLy6QqBs4NX1ZqabxZSW9lwb0nf8JTIecQW/2iWNrmdpw3p5sWVW?=
 =?us-ascii?Q?ESkEITnMBehp79mrM1Qzw2C5zkW4UMExV5D74imJm4oBYYHYMSpfKicriWSM?=
 =?us-ascii?Q?/psNQ9XkQqwSK3LBF3xZ/psh59ri6keuiYuqoVv267sm4CkkkU91QqqiP3PG?=
 =?us-ascii?Q?0Un7i9Q5qlhQQ2vjUkhi1/Z7HPr7wuYPFmuwxkTqjUV0tE8a+o7wx4eTQpkb?=
 =?us-ascii?Q?yDUxEG89TYco/hInd7ConZNwhnNDGxrMzWh6IsWwGrDFiAFd4cxdnB7wK4j4?=
 =?us-ascii?Q?imzD7Nga7QZX86j20ezhxj+WlBQgSNrTFHcRUEeihut61/IugATokxWuOAQd?=
 =?us-ascii?Q?462lPgk5nsm6jrQxy0mPtST1YshVFlfDbJiAcawMxb28T3MMOSFnpDh8GhWC?=
 =?us-ascii?Q?wqSD0Sxam4O+qpVrQXp1xWK9fQij9dTdY2Omz3n89U4iG0dL1C4hqfg6SwOC?=
 =?us-ascii?Q?ZO25N84mCUoxfjcaMq9Y0vAFuVcvCPnH4tnMj6YWaZqWiaYs7wPjpqsF5QhJ?=
 =?us-ascii?Q?1pxv7Rwmx/6JCkNaBFuMaBsN+xi2GFRvRkMx/QZn1LvyYwirW4jV6xkU3lpR?=
 =?us-ascii?Q?oB5Z?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-AuthSource: SN2PR03MB2383.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 02:02:46.4667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-Network-Message-Id: 41783ef8-2769-48e4-41ea-08d89d78dacf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0paY+4Ako2YlVncd2IZZ12q/lSUOyo9XIpb4prBVbDPnm9dqv4bgp4UEPvxegk6xHbHu+HfEEuetjHsw5cDiCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_210248_245906_9128A3E4 
X-CRM114-Status: UNSURE (   7.73  )
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
Message-ID: <20201211020235.TqeU_0N-GmHErGkq3uDfPieOotBcQq8kir6ZYiYgqrY@z>

Hi Arnd, Kevin, Olof,

pull pull the following patches to your tree.

Thanks.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux-berlin.git tags/v5.11-berlin-dts64

for you to fetch changes up to ec13e5027261c7a09e70b309050a858076bae5a0:

  arm64: dts: synaptics: Use generic "ngpios" rather than "snps,nr-gpios" (2020-12-10 17:51:57 +0800)

----------------------------------------------------------------
v5.11-berlin-dts64

----------------------------------------------------------------
Jisheng Zhang (1):
      arm64: dts: synaptics: Use generic "ngpios" rather than "snps,nr-gpios"

 arch/arm64/boot/dts/synaptics/as370.dtsi     |  4 ++--
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
