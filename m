Return-Path: <SRS0=bhtp=HF=xilinx.com=michals@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19908C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 13:31:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C50E464FA1; Wed,  3 Feb 2021 13:31:12 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D38364F55;
	Wed,  3 Feb 2021 13:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D38364F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=michals@xilinx.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBaqmvoW1FZ46g3MXSek8M3EKVNotFqBWeH6p/236DTF9ccUXuum+RysEbKbVyxIXE4HLDNlECwBqjNbGemLPcMpvh0o9jhiVULFw4A2ar9mpVolvR1bvSFsH+k4eRjjhMVu/EhcK9cKWbXNluua0+pksiteuSLbWT1Jv6sWYurtsP/hQSwd44cV6G2fc726AwsVkpu3pj4z/OPvPWxMZkNYEv6q/kIs5nkantpNpqABpKNrlzr0TZnVb1xoobXlTMVyNmswBiIYbI0V8+fF9cgi20Wdmlef3YnaqkYfg0Uv0GJ4faPfW4l6ui3uaQC9yhm3mU6m22jRSlmfM+HM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwGNBD55jmQNwt5Q8pCrZMHLJE/W+aNeGAO+E4Jpwjk=;
 b=b6xHtEGWytqxv4nHvwZIrS63oLJR5kgBGGceZrlGAqP1L7yV3DqNJ95nYqrIXMMGzfK5AwfQT5GTTGoYz4EM87DQS4sWlG/dTvlmXaLbHjzLb52IRJckHmIPbQPYXVgHUu024Dpc2vLdSwk5cXTt+ip0/W0h/CPQwdz7esfFrhqwJG6OYjLCnQopivA87LkgB+liXOs39FJZ4b/eyRGCLl23eDikh6WJPnfdJryNyxS6t+TWu3Vxb5A2kHGwZnXsqSRxs1UTfOb+fzPC2Zk+8TVmQgKUKqozg7fpeVrAklj9wRTQ13SLVrf71Igc0kE23ry1ufLx5rZ6G1kEasA7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwGNBD55jmQNwt5Q8pCrZMHLJE/W+aNeGAO+E4Jpwjk=;
 b=JCwQtKf0ug8FRaDK2afNwy15I2XTxm7Ek7Pt44UXSyxEHq7MkXCbOEABQ3d4OUYJLnw6ds/UozVmf9L1+fpW1AxYTRrnTyVRGqoFJOQ/NkygJUHJhidbZ3BHaA6Yo8S6arE8bd5XUcoczpfK3Cb5XcRcqOZ4rMys9++3mGzSLW4=
Received: from BL1PR13CA0153.namprd13.prod.outlook.com (2603:10b6:208:2bd::8)
 by BYAPR02MB5973.namprd02.prod.outlook.com (2603:10b6:a03:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 13:31:10 +0000
Received: from BL2NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bd:cafe::6) by BL1PR13CA0153.outlook.office365.com
 (2603:10b6:208:2bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Wed, 3 Feb 2021 13:31:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT011.mail.protection.outlook.com (10.152.77.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Wed, 3 Feb 2021 13:31:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 3 Feb 2021 05:31:06 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 3 Feb 2021 05:31:06 -0800
Envelope-to: linux-arm-kernel@lists.infradead.org,
 arm@kernel.org,
 soc@kernel.org
Received: from [172.30.17.109] (port=60516)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1l7IFN-0006f0-Qb; Wed, 03 Feb 2021 05:31:06 -0800
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
CC: arm-soc <arm@kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.12
Message-ID: <b1a6f89e-f6b4-757b-daf0-d2f1844b833d@xilinx.com>
Date: Wed, 3 Feb 2021 14:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa923e8-ddd3-4b72-67c7-08d8c847f82c
X-MS-TrafficTypeDiagnostic: BYAPR02MB5973:
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB59738E7656EDC780A16F436AC6B49@BYAPR02MB5973.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GO++Lhhx8j4xLdlsSdlYloFG26jQXa7aP5yX0Azs/IqrsPRP+AnZeaVAjEBrS1VRiJBYaqD6a5qIE/LKNYJgYWieUH7Idu9/jZnafOqfkwjcPcVqGw41NruGylYwwPCyTQwXTGQ1QevvVfI0DZh0Li89dO3MeHTFn2bdg4Q69iRD0VMoKSuHhUL1m+z9Mb2q9DHw3Psz7bdUy94GQdBYJgc6K997oZITtPU4qF5HtVlvBDV18J4G6j3VDMskd1tRItBdHik1qnYoHt9dNX4/33yXBONwCEqJYqJPulNNnlHfRUqXkz6GKJlptf/yRd4DJK3ozyLRgE3A0806BgA0NvvzpipEoDo1m2BY9hdWoufn7dSw4k76usfXCOOBvKIfroCPLTbptGjCS/95QgiDSdMi4yZE0nC68Yhvs+gFPt/Pq+kVJeeDnJYFu13Q32tJBU5olEK1E8Z5TNri/CUEhJMXpHIQZWX8UZsmhF/7mAfT58j+klMJ63U/MmNyV8MGKv1f5UaSvuWwsWWi1ts16hGFxfAow58O9oT9KiINA1aG0CdElQjsJZEMF4Ukkx1qywTZjkpVpYY73DEa6NCvevtGOlQaA/t3JWEfcD3zVm+n1mkKllyQB2mSDmXFNwAWQhk48jMoCfS6xusSJ3zjzuW3oQzfOuEdl7NaPlAUXFIqH+0tORmQ9z4fiJWhAEJiK/CBTivl+CP3nu8oSgwA/lJ21WFsdTcuSjNnMSYaHEMeHl9soX04VQVQGoEgga+dD+LkqfvVSl9aWnpXgGE7K07AGN7+NEKTm0eQM004EmQ=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(46966006)(9786002)(54906003)(8676002)(966005)(4001150100001)(2616005)(44832011)(31686004)(478600001)(36906005)(316002)(7636003)(5660300002)(356005)(82740400003)(426003)(31696002)(6916009)(70586007)(2906002)(186003)(26005)(336012)(83380400001)(47076005)(4326008)(8936002)(70206006)(82310400003)(36756003)(36860700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 13:31:10.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa923e8-ddd3-4b72-67c7-08d8c847f82c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5973

Hi,

please pull the following changes to your tree.

Thanks,
Michal

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.12

for you to fetch changes up to 55563399bb16906b3e179dbeb66c0bf44c21b12a:

  arm64: dts: zynqmp: Wire up the DisplayPort subsystem (2021-02-01
10:40:37 +0100)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.12

- Wire clock chips present on boards
- Enable reset, qspi, nand, watchdog and DP IPs
- Enable phy driver for sata and DP
- Add iommu description
- Add support for zcu104 revC+ boards

- Various small changes
  - Add missing labels
  - Fix typos in documentation
  - Add missing boards

----------------------------------------------------------------
Laurent Pinchart (2):
      arm64: dts: zynqmp: Add DPDMA node
      arm64: dts: zynqmp: Wire up the DisplayPort subsystem

Michal Simek (15):
      arm64: dts: zynqmp: Add address-cells property to interrupt
controllers
      arm64: dts: zynqmp: Fix u48 si5382 chip on zcu111
      arm64: dts: zynqmp: Add DT description for si5328 for zcu102/zcu106
      arm64: dts: zynqmp: Enable si5341 driver for zcu102/106/111
      arm64: dts: zynqmp: Enable reset controller driver
      arm64: dts: zynqmp: Enable phy driver for Sata on zcu102/zcu104/zcu106
      arm64: dts: zynqmp: Add label for zynqmp_ipi
      arm64: dts: zynqmp: Add missing mio-bank properties to sdhcis
      arm64: dts: zynqmp: Wire arasan nand controller
      arm64: dts: zynqmp: Wire zynqmp qspi controller
      arm64: dts: zynqmp: Add missing lpd watchdog node
      arm64: dts: zynqmp: Add missing iommu IDs
      arm64: dts: zynqmp: Add description for zcu104 revC
      dt-bindings: arm: Fix typo in zcu111 board
      arm64: dts: zynqmp: Add DisplayPort subsystem

 Documentation/devicetree/bindings/arm/xilinx.yaml |   3 +-
 arch/arm64/boot/dts/xilinx/Makefile               |   1 +
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi    |  22 ++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts |  33 ++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts |  94
++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts |  40
+++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts | 293
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts |  89
+++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts |  70
+++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi            | 128
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 10 files changed, 768 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
