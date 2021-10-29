Return-Path: <SRS0=sP7F=PR=xilinx.com=michals@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853FBC433F5
	for <soc@archiver.kernel.org>; Fri, 29 Oct 2021 06:24:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 68CAF61167; Fri, 29 Oct 2021 06:24:43 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2062.outbound.protection.outlook.com [40.107.95.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091DF61166;
	Fri, 29 Oct 2021 06:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 091DF61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xilinx.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cny6Y2XPi1Gml7GXJTbWhVUaWPHAA+Uf46EsWZjym+SRSCsy14fZohgkB+pMF51XRYjGDR1A5Am4LF+5bIzMbKHX1be7CEcCUq3JNe/3La7rfyRQSAzqFohDrZH7Fdv63FZB8M9vx1oBy9dC3SWLfMPavBNjmHQzXpaPr4X4OZyg24lnDdzn+2i+wCR2xPaYkPhwlwGf2OsnzASFJU2gac8wEgf4XUmXlkTY7Md6D3VZUnFncNtSDeaAILH5De2rdR7+RJwDRqipn57a2v85YmbXuIukf3R4SJOhu/4PhIX/HaWvFs1M5L1IxRtgvI+6Fp9O6ndnThOdUvsVIkkNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB1pOJ/YPFFuSI3AG671HZ0IfW1x/QGGB3LmI3tbzsc=;
 b=ilaZ4qCII/FXhTLbPi8Neullr4+AbQc6eXcWrFI5//pmMn1XRGmqbVJcYJFRs6Q6EqIskmomI72fvVjLErhf/+Gt3cEHoyyy5Jslmq/ruUfcfZhWg8nk7h0Xabf0DjKu6jUNUQu4p7DuoTtPXGgoB+E5beWkq62eJP9TFOCNMB5tt6Sq94yizd7fOgaLIF5B+078siVqed7RxDJTXjBaD993FtvkBAGW9pV/i5TN2PA0mipAMU3DvfibJIL+5G0wDqokNrWfyretxNc02AhAgvDDuto+BgBV7Q85u0s3CyaMA1oi/LUXZ26t1bl3IOlex4GyA0uwsth/uYsmS18ZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB1pOJ/YPFFuSI3AG671HZ0IfW1x/QGGB3LmI3tbzsc=;
 b=JEpJUVRb/KbjWa9mlqojklRGQdF4T+UHHIfGxZf8v/9pMwW4IhDCU3jRZ8Ia6I9wMJ5O1KPHeJkPv2QnXEMqkh9AQXDx74I3mQ5Um2Y5Ub6ypWli+tdqGtJX5lzVkh15meYJpQCLQUfoyLAIhqhv3BA47nPrvg9X0ZUTlWWGv20=
Received: from BN6PR22CA0051.namprd22.prod.outlook.com (2603:10b6:404:ca::13)
 by BYAPR02MB4325.namprd02.prod.outlook.com (2603:10b6:a03:5c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 06:24:41 +0000
Received: from BN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::3) by BN6PR22CA0051.outlook.office365.com
 (2603:10b6:404:ca::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Fri, 29 Oct 2021 06:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT060.mail.protection.outlook.com (10.13.3.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 06:24:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 28 Oct 2021 23:24:36 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 28 Oct 2021 23:24:36 -0700
Envelope-to: soc@kernel.org,
 arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.254.241.49] (port=50414)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1mgLJc-000ERq-O8; Thu, 28 Oct 2021 23:24:36 -0700
Message-ID: <0ea5d885-c770-af56-7de0-bcf6adc61bcd@xilinx.com>
Date: Fri, 29 Oct 2021 08:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
CC: arm-soc <arm@kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL] arm64: zynqmp: Xilinx SoC changes for v5.16
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b385d8-fbcb-4c48-0c6c-08d99aa4ca31
X-MS-TrafficTypeDiagnostic: BYAPR02MB4325:
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB4325BDA0EE01BA89ABD96C71C6879@BYAPR02MB4325.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J+hauwquETQudQ2YANjtJkElZ72VOAxpmyeh0cIFZQd550meFKUsnEzIy60RIqwvhYAkB23R+KdjK6jlGShPqR6OCh3Ws+2s14TDYXqwWZOyQ2TVFGTgVVhAkyspkc05+v/Nw2mDbf8n6adlf6eqb+yNclB4CbYcLXyfdBRel3bHu32JQJ8yFOCmji0z9rqp2NNWChrbOBtR5yM1IJ5U7DO31N11PmNRUDRABYB3ZHctPPUGz7GTIyaaGy/YIdJzENlZ/lWcWpXoyhuqq2sn/Gqe2XvNGN7J6Wg+qSVlLr3hw+20UAm8dtML1VuEd+2qxD0e8ZiYMzgH68dNNQtiZdl75F3v9kh75aS513ffR+4MsukPPBawo1axOjiNeI5kRIPII7eePGD6ARjY74o2UmUC+491qNyWfdPMMvml/yFVOGvbNOVp8PnMxg+9XK0ujalWEbASVdpq/LmkJVBJqFoPf4KUZUNt79gUDRodRaoECLuwjFDStGTqBl/kSOLPQdjS1SSbVsL2j4Cr/NlNVNF8g+2I4MEksoRcDxbW5iOkG14XKXJ2xqCX6aCuC6K0peEN1rK2ghRGUjc7/5B6mPJy8AxCnKtMHTL40qhlq+2QGqsa1VrfUPHA/PmAp70jY1+b/MwLYQ7I+8tJ5sLu46Msrnh9E7Nj8gIShKmjVcmWhsNVVI9kN9EW9pSU9it3+g5DV5H8DVQKCiguiXUpI/HosWdn80hwEuNzstCmWSOs2hH3ocREOjt54UsDE4qX9y3wJ61OgWr9hkxpQF60pf9dXYsuuL2+gnkNoLg+eZ5odrbZu0JQnbaawleIH5dnOwQkFOQse7rUNzuPc8oQLKI+xC8S9ocwLnJjEHnMA3Q=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36756003)(31696002)(70206006)(186003)(9786002)(26005)(36860700001)(70586007)(336012)(83380400001)(44832011)(7636003)(508600001)(426003)(966005)(2616005)(356005)(4326008)(47076005)(8676002)(316002)(6916009)(36906005)(8936002)(4001150100001)(31686004)(2906002)(82310400003)(54906003)(5660300002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 06:24:40.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b385d8-fbcb-4c48-0c6c-08d99aa4ca31
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4325

Hi,

please pull these patches to your tree. They are doing small cleanup and 
fix handling in power domain driver with also checking firmware api call.

Thanks,
Michal

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.16

for you to fetch changes up to 4e2dfd51f7ff81ebd2538243ee8c20bcba898864:

   firmware: xilinx: check return value of zynqmp_pm_get_api_version() 
(2021-10-18 15:13:02 +0200)

----------------------------------------------------------------
arm64: dts: ZynqMP SoC changes for v5.16

- cleanup and fix PM_INIT_FINALIZE
- check return value of zynqmp_pm_get_api_version()

----------------------------------------------------------------
Michael Tretter (4):
       soc: xilinx: move PM_INIT_FINALIZE to zynqmp_pm_domains driver
       soc: xilinx: cleanup debug and error messages
       soc: xilinx: use a properly named field instead of flags
       soc: xilinx: add a to_zynqmp_pm_domain macro

Rajan Vaja (1):
       firmware: xilinx: check return value of zynqmp_pm_get_api_version()

  drivers/firmware/xilinx/zynqmp.c       |  5 ++++-
  drivers/soc/xilinx/zynqmp_pm_domains.c | 91 
+++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------
  drivers/soc/xilinx/zynqmp_power.c      |  1 -
  3 files changed, 55 insertions(+), 42 deletions(-)
