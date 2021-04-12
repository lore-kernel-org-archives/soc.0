Return-Path: <SRS0=rT6I=JJ=xilinx.com=michals@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63D9C433B4
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 08:24:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92ABA61220; Mon, 12 Apr 2021 08:24:49 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1E160FDB;
	Mon, 12 Apr 2021 08:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A1E160FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=michals@xilinx.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+gCb4Ujp1uRVWul9S5dBCOh5P/ezEX0wfE6DHCzojLumN+dGdn/cvFN4jZODmMi20O3LOzBaYXyUanz3OXsXzkJt0ge70qc23BG2j+ZXbAruDG615LKFy7bcy1iyRQjkvoYHyulXLo1dhku18qiWzddJSj0WOCEnV5EjgLyiFJL8EyR8hUlzZFIcpp5XViPDcljf6+xxPA1EybG6jAqynQbl59nEJY6aASTDNv7FrimiOUIyZIS1eaSxOPx+C1oZMfsGsxYkGDKp7942tMwk6pd5jXFYfc/9bwr7+ny6SLncLc9XMwFh7tOH3BSQtaboRBO+mCv4qj1QGPMLcGHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylNTy9Rxvf2oc+PDVn0FN6mA4Hh56cUaBnfEVYFctXM=;
 b=FEW+NaTTKo8yzaFrMsZIb0BrsTYxYIt4WKNlBFZeUnsaOuft9ny5WCWhWELGZYUf70q1b2s4g/RxelsGbdtMsxU7TJ73uaIU5WLGvw94MxQUuKFuqyAwSMq5kZkA5RQ4Xo/gFWzzLWrqogYy3O6C6N8MSi+kDcH8J4VR6CCnpPy0yeWlxq/3W24v4RU7DNRB7Kybq54hKpmzaAatKWnqGu9ypXlPeC7mz6DFIkTUyXEmVZE8pdCGlrVkXs9a2ki4SgR0HZFPiwjbOYx6jjce1HDMXdmm8jYml4R9rEAl1HnHr8+WYT0QwnRqcu2pfkabmrLfsgj5rF51lQsOZboqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylNTy9Rxvf2oc+PDVn0FN6mA4Hh56cUaBnfEVYFctXM=;
 b=JqKigpZkNjkEBjGvm7XwOhINe7S2k1n9q3lW0pnMaVljAb8XVru2O07r5kIuq3BoTGBUz1ahgVLqnPXacjLISBenCnNJqM7+EFLHGH53l56TtLIGHnRMa89bN/1ptySwE1gh/Q/LQm3Cf+j9fGRDxq2OTXy1Ogymi1RNYcaJam8=
Received: from DM5PR2201CA0014.namprd22.prod.outlook.com (2603:10b6:4:14::24)
 by BN6PR02MB3283.namprd02.prod.outlook.com (2603:10b6:405:64::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 08:24:44 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:14:cafe::a3) by DM5PR2201CA0014.outlook.office365.com
 (2603:10b6:4:14::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 08:24:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 08:24:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 12 Apr 2021 01:24:43 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 12 Apr 2021 01:24:43 -0700
Envelope-to: linux-arm-kernel@lists.infradead.org,
 soc@kernel.org,
 arm@kernel.org
Received: from [172.30.17.109] (port=52228)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1lVrsB-0004hp-Cr; Mon, 12 Apr 2021 01:24:43 -0700
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
CC: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL] arm64: dts: Zynqmp DT changes for v5.13
Message-ID: <e422fa9c-3e58-28b4-f6f0-65aa44254131@xilinx.com>
Date: Mon, 12 Apr 2021 10:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad2eb0e9-df5f-41db-15e5-08d8fd8c6d17
X-MS-TrafficTypeDiagnostic: BN6PR02MB3283:
X-Microsoft-Antispam-PRVS:
	<BN6PR02MB3283D67AF9A1664226132DF2C6709@BN6PR02MB3283.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TV6DhBzdkx0lsSzR5Sz7ejiGV2DpyvoUCukRkTJYXNoltIQOwlZ5wggreNd4dSWczjoR0KKiaTZHBX02tKCyildfNxqu9m2qmef0W7wW76hheCGiubdlxyJTqaH8Uq2b0Nyxa8+fd5BgKA5lbFB0c/CR49KDV3/uosNfSQu59/eO2Eo+V4QQd/RpIJC3KCI6RY/1mVWGz6YVaH7PiK67ulVX/1vaoL/Ix3JkXZcm/eqi1TJQ8HaOPrD8ctPezIO8u38IRymFaYa4vbnTH2+y+t8QNl0LkYRs0yVBlWZu56+u7w0pt9XMLs1UJkPxEYeg2/a3r8p5m+LWFJ+FrHlbxshvhBVFGJMB9/yp65MHXt+P2rMpSf/0nXjLTvl1ZeqyK8FyXwPE4IyCA9wzyLyez8LkoqrGCs0oaO1w0AbeulNSdnL9RADpVPI2sQE++g57KJq9+1MPfGemYbji+GuI/Aa+5zVwt9FjYet4rG8Hp9K0mgLMcorn/eFGOjtcnKscBypRFtlndtRFpS2smYPX0bSyIhbnoWeWS1sxIqOQ05D+WFfZV+bquUxsKpOnPv8ICjaEsq3FgoBXG9sfjnqzYT7TMm1nfly/n6S9OpkPke3aYtfpj+w452JDQQPXd19YJ07+2+dGDgkzHRIKEDv1HWiVBIw1ba5NFKMJ3rbNg1Kb5j+iW99Mk3bVRvxLN3Jmm9iEGLBru2+Xiz0JwlpSN8exd5GvNUNY7jBbu/Z/vQXEZXMUcM+YYluOz/6eRKl3tL69Pbwj+aHIi84efmd5Qd+nhV3XP8/sBMK4tmkJp0U=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(46966006)(36840700001)(31686004)(110136005)(7636003)(26005)(186003)(356005)(70586007)(5660300002)(36860700001)(966005)(8936002)(36756003)(70206006)(31696002)(478600001)(47076005)(9786002)(44832011)(426003)(4326008)(36906005)(83380400001)(82310400003)(82740400003)(2616005)(316002)(2906002)(8676002)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 08:24:43.9783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2eb0e9-df5f-41db-15e5-08d8fd8c6d17
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3283

Hi guys,

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.13

for you to fetch changes up to 73d677e9f379934807741dd068ca31872ed4d387:

  arm64: dts: zynqmp: Remove si5328 device nodes (2021-03-08 17:27:08 +0100)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.13

- Add power-domains for DP
- Remove si5328 node without compatible string

----------------------------------------------------------------
Laurent Pinchart (1):
      arm64: dts: zynqmp: Add power domain for the DisplayPort DMA
controller

Quanyang Wang (1):
      arm64: dts: zynqmp: Remove si5328 device nodes

 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts | 20 +-------------------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts | 20 +-------------------
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi            |  1 +
 3 files changed, 3 insertions(+), 38 deletions(-)
