Return-Path: <SRS0=QqGV=HN=xilinx.com=michals@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E143C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 11:33:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E5B9364E2F; Thu, 11 Feb 2021 11:33:06 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C059601FF;
	Thu, 11 Feb 2021 11:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C059601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=michals@xilinx.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpD/9v1sovvXp13Wk0smr5g3OzqeCURQl5Yaem3P6G1t1XDFXwJgwATmYImvze9jbIX2I9Jfbf8W0k8bf+kClDbkSCqGRdUfpsaxPNIfgnjbrKddbEtjveL/ajnFgoHgPMFf1Y7DF5JmBwDVAQs7upcZx+FVpgKgzrEQUSetXgRPgLYoT0bGa5tYfPuojnn6b3XNRx+B4K/A0pzwGAk1gQ3TC3nO1gzGY3dqStKD6gkjiVO26jkhscCrS3Kw1dqCtSbgrlajQmyvdVJlGmz4SxrwtuJoWRT5s4hMPX+I+PlNeFPEL0mJM4hDL6wepM9pWMy9jXqv6cY+iFZL9DMqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo9i2+ETKViOv+8lri8o7zm8xKN3n0U9Rp3MzgMiAPg=;
 b=BsX6C5k0ifxTtsEamYJXVH31jpLBYFGBvnbcjPT6/KRUjY635w/AFfVwsFvv7RivzBWrJQy0mgQ/K+SBHTirFh8eS+biaJ50y6ZlbIOFJiL7gMiEAHRTcXm7e2ZTnJQzv3RAuMjT6e+1X6gYJ/UFgx9s/hByIfu1TWYajd68b55a5fEKVkC+BFidMgDro6iSg5cGltXkELw6m/wyPG0mT3SQh4OCWfU9Rj8Aakr2qjoNpCql/FOoSwnL6d9OFHRb+GefLNn//s5sYSLjJBl2zQFmw/PUlo+gBxdUna6EplG88OKBtnvs9h/F9j6f/3Nq8Z5p1NVXntyEAY0Lc8bb/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo9i2+ETKViOv+8lri8o7zm8xKN3n0U9Rp3MzgMiAPg=;
 b=X/AESsthTvFKoBvV+iD4F64NU3Ktyv6H8rqSaSqwgn7pwWkXGhQAhgYfaFsarHD9I58dTDPK1YEE6fdnNReU27sbpR0ixf+5yNY05tHWgcBsg7G0CNvU8zwrialwtG5Jsk2YAbEGZmJShETCpWgn67wrDmy1qKijqzTWWtQ4ho8=
Received: from DM5PR15CA0048.namprd15.prod.outlook.com (2603:10b6:4:4b::34) by
 SJ0PR02MB7359.namprd02.prod.outlook.com (2603:10b6:a03:298::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 11:33:04 +0000
Received: from CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::62) by DM5PR15CA0048.outlook.office365.com
 (2603:10b6:4:4b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 11:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT024.mail.protection.outlook.com (10.152.74.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 11:33:04 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 03:33:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 03:33:03 -0800
Envelope-to: linux-arm-kernel@lists.infradead.org,
 arm@kernel.org,
 soc@kernel.org
Received: from [172.30.17.109] (port=42588)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1lAADX-0007rb-LX; Thu, 11 Feb 2021 03:33:03 -0800
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
CC: arm-soc <arm@kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
Message-ID: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
Date: Thu, 11 Feb 2021 12:33:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b87d6d28-801d-4947-4483-08d8ce80cbe4
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7359:
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB7359EF12DDFCBA397976FC6BC68C9@SJ0PR02MB7359.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EHpgsGBVEpYVSXVmUBhJCkVtREK9Hf6vEDbCYm6sefeGwFR2d7Mf9hvM5RLl1LKqJonz6CUEU3Kr2i77feaKs7oQXzFVHuBZiowNJxs2FxjkIgH86BNR0y83Aomq/YmSobAICs7K/2MffwVGkaCaopCl2M4VG1NmY1SRuGiXMpwd20BMhPFSS7jSMt48Fz9gMeTX3hojfqj2PclHE1dN1Qh+dSbTr4oPKK4wdMmh6+6NbJzxEZkmWTe9Kd92UONztJQQC0U5aTePGRT3Lnai69TdF3oiOvxGbl6DiNqRjyC7DbwP9cnqUps/IutUrwlalJWIsuHa8BhrzO1ExpPqtgR1fVUcIN/cAWDGik+UAiItOI25cns1s/Birg3h5E7omg1MjWJGwndX1/C2GJvwtqdIbMk9k4N6HW57FekmBNaKY4F/Dv7aBNaqeIL6ARksBOKx4FFkeh5frfWy777heL4gPWRuOqShqMdAAAXtIh0xVQFOquyvw8de6Fii2Q2bJV3MAKSBZ45Mp2uLqJFlUL/CNUvUVZsZUblq17JYB9fBHfZCrNPyuwRvTz7/hTyF88WhBWcTAiDxuH7ZeheJ9ztPf7Ctmp6PI6c+i2abA9EP5hKnMN487/g4FOWXw0rPb9OXO8QGBrgT6/osuYmnG90qXzxTrg322nkIxEZl57MZzDu3oOCvuIUGsW7QnzATgOgcsnE2Rz/NiXK9HTA0gYWlsBV3jTo0vEtSYxlvUU0IEVN+HVLqzubrnLjma3Nng6IcOs9ZRHh3buHFmxen3DvDkLEzelP2CcgDcE8ttyk=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(478600001)(7636003)(26005)(5660300002)(336012)(2616005)(36860700001)(4001150100001)(966005)(186003)(426003)(36756003)(31696002)(8936002)(316002)(6916009)(36906005)(70586007)(82310400003)(31686004)(4326008)(8676002)(47076005)(2906002)(82740400003)(9786002)(44832011)(70206006)(356005)(54906003)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 11:33:04.4175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87d6d28-801d-4947-4483-08d8ce80cbe4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7359

Hi,

please pull the following DT changes to your tree. The major part is
adding one new board and qspi dt binding conversion.
I have dropped one patch based on communication with Arnd.

Thanks,
Michal

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.12-v2

for you to fetch changes up to 19e1f484a6bb452d28d79cf41f280cdfde3176a9:

  dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml (2021-02-11
12:30:37 +0100)

----------------------------------------------------------------
ARM: dts: Zynq DT changes for v5.12-v2

- Add Ebang board support
- Add missing zturn boards in dt binding
- And convert Zynq QSPI binding

----------------------------------------------------------------
Michael Walle (4):
      dt-bindings: add ebang vendor prefix
      dt-bindings: arm: add Ebang EBAZ4205 board
      ARM: dts: add Ebang EBAZ4205 device tree
      ARM: dts: ebaz4205: add pinctrl entries for switches

Michal Simek (2):
      dt-bindings: arm: xilinx: Add missing Zturn boards
      dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml

 Documentation/devicetree/bindings/arm/xilinx.yaml         |   3 +++
 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt   |  25
-------------------------
 Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml |  59
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml    |   2 ++
 MAINTAINERS                                               |   1 +
 arch/arm/boot/dts/Makefile                                |   1 +
 arch/arm/boot/dts/zynq-ebaz4205.dts                       | 132
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 198 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644
Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts
