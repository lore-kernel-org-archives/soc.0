Return-Path: <SRS0=1nCR=FP=synaptics.com=Jisheng.Zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A23C433FE
	for <soc@archiver.kernel.org>; Fri, 11 Dec 2020 02:02:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8B7A623E1B; Fri, 11 Dec 2020 02:02:48 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D7923DE8;
	Fri, 11 Dec 2020 02:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D7923DE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Jisheng.Zhang@synaptics.com
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
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] berlin dts64 changes for 5.11
Message-ID: <20201211100235.2b0b795b@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: PH0PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:5::6) To SN2PR03MB2383.namprd03.prod.outlook.com
 (2603:10b6:804:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by PH0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:510:5::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 02:02:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41783ef8-2769-48e4-41ea-08d89d78dacf
X-MS-TrafficTypeDiagnostic: SA0PR03MB5561:
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB5561C9C1F23F731B5C11570DEDCA0@SA0PR03MB5561.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v0mgVDeoSNxwpaSGaNS+gv2CRhBCV2rJpqWNrJeAlpZQ9PGAoXJ5DCulouSga6mOYyCIE3d8GBTNh3n00h9m9/GJMqhUmqnc9QA3lHRQOeOvsA846DChNaIFt/S8Ng4FIN4gX2wM4hUHvmA4QZ9Z9mbuNjoiV1Lc1LwZkDXnqZv3oxM3VwL4Eau/T29k9TamZA/Zs92JdMQ+zyxPAWd7iNb1lkDdrBhF40eAP+hq4HjQZdz4we1qHWHD/rPl+r2oafwvUicv6baC8dY6AwTL9KUmpaEEw5oslEHbY4HkCUjNzm4curs4hUScAbbMlTxmPXo4G5otN9FZ0x4EKGYEt7pZ58Z9nnJLFDe05A+0A8u7IGEttTT5FBy32JVdboL8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN2PR03MB2383.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(956004)(16526019)(86362001)(7696005)(186003)(6506007)(4001150100001)(5660300002)(52116002)(4744005)(66556008)(508600001)(26005)(83380400001)(8936002)(34490700003)(66476007)(9686003)(4326008)(1076003)(55016002)(2906002)(66946007)(8676002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?SZC1RGXAw+LjVWdXZIqEtmVKoLDqi6sYEwfg8yvrROLfiZ8XfzJX5s8BQbjf?=
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
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 02:02:46.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-Network-Message-Id: 41783ef8-2769-48e4-41ea-08d89d78dacf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0paY+4Ako2YlVncd2IZZ12q/lSUOyo9XIpb4prBVbDPnm9dqv4bgp4UEPvxegk6xHbHu+HfEEuetjHsw5cDiCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561

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
