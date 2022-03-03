Return-Path: <SRS0=Z0d3=TO=xilinx.com=michals@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA06C433F5
	for <soc@archiver.kernel.org>; Thu,  3 Mar 2022 15:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15C58C340F0; Thu,  3 Mar 2022 15:24:58 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06950C004E1;
	Thu,  3 Mar 2022 15:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06950C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=xilinx.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=xilinx.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8jmf83s9IRBE8hs0xRFeFDC33SOJda/snDsAM6IxaTHnULyf3x65YhhD62W0V1d2c+s5+QNb5qn/v7gkH8IklG+HDigkjXLBplpf1WyCtw4lE6TglaL7CdWJbtHYGzm9XTuqbPjU2wX+neu345+bb6UqabJex8vJDYzYNJmcsNKw0i4Iw8U/cl0gdSPns7tlqpDbTzvceShHMyMYR20EVyq6IY/zNaI58bswPwVhk6+PGj+r0isS+1Q/AP4ueFgKPSW2CqvzMFmFihO6NSiNb8D7OIbS1FQPFO9ui1CYRk30SuBq/8+8XmeFfdTjpOcYSuaVLq3DrK6sHUFizNEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCT6kzZct7AxeW2ftfktnie+iYgCQfxW+ZhUXk1DnvM=;
 b=eyPcF8JXiQ0lxvC2zxPQ5GssrQg0TyyLh8WlzVg0smRS099ooxy6MKhaX2kDOKjjEmTWgoVziTb+Wj2Hq7/Y1W4ggF74CIw53/b8wonMk1b8ZY6YPxwB4cebNYlUnCPnknxZF406yVjcnORrc0P0X2NlbzJ7NikCfBLrWV2n28xcss64bhMnFyPJDJMfgHuIC+lbqNNJS2J05kE8Y0HqTkos6rpEODaR5JgXn9u7Z2hf45Z7eDF5ii08BkQh83jpD+9u5jkUJOpE7qtzZ1LbvvaRJyl58fwlrE/VW+rnPv96mraiazaLZahn8Bn69M/7vSznPgntOR2vEqddVtuoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCT6kzZct7AxeW2ftfktnie+iYgCQfxW+ZhUXk1DnvM=;
 b=l6ifFCWHVmvk9JqObMN2qepfrNbAHztDm/XOvcxcgZ4K/AW5YUL4SVIxUvSaWrQg7c0LUYKqiNuj66Nor1dtC7qO3yueDIebepji4WF5/JtKDS0Xjlz8p8DMmEDlqrNeOiNVljNz7rsSKZu3+npdtUar/jvi770Y8isDXkDYUg4=
Received: from SA0PR11CA0116.namprd11.prod.outlook.com (2603:10b6:806:d1::31)
 by PH0PR02MB8715.namprd02.prod.outlook.com (2603:10b6:510:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 3 Mar
 2022 15:24:53 +0000
Received: from SN1NAM02FT0022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::ff) by SA0PR11CA0116.outlook.office365.com
 (2603:10b6:806:d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16 via Frontend
 Transport; Thu, 3 Mar 2022 15:24:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0022.mail.protection.outlook.com (10.97.5.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:24:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 3 Mar 2022 07:24:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 3 Mar 2022 07:24:52 -0800
Envelope-to: soc@kernel.org,
 arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.254.241.50] (port=46886)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1nPnK0-00018C-2x; Thu, 03 Mar 2022 07:24:52 -0800
Message-ID: <19464dc6-eca9-f9a7-8aba-43af094d7c37@xilinx.com>
Date: Thu, 3 Mar 2022 16:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
CC: arm-soc <arm@kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL] arm64: zynqmp: Xilinx DT changes for v5.18
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a930b8-2ef4-4fb6-fcbd-08d9fd29f6f3
X-MS-TrafficTypeDiagnostic: PH0PR02MB8715:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB8715B94FB2967FF9B3CAF5E0C6049@PH0PR02MB8715.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6dwce2DrJSmv9espgLMK0Jqm9DG4dlqKRxOU6CRtNWdvd1jsoIa7ZT0G+EXcDDaHI4f9H50W2dmKQQkVeDIjDnZRFeLB91TlWUlmOOOP9Ua4GBIC03NKerKepfaOiF+ogBELcbmXqnnvXrQbR9+LbOOc6cbZBCictewxvm6kZmKfeGMsKx5Xsi2LLqtACiNpKcNtRjp1hQvci+mPb8BPPYL/Arfha+kDcJpsC3T0+UVuePzULhck0AU34/xT+WIkQAc/syrhFb6zMwgIa8FfL6z5MyclYrOLumN/gPl6vKyCnFEwF5T9WbVC5huToiug3pn2sIaoWDWi7hGw5ljfIzdaWP2FgG3LK3EbQH8sJ7WC+HixOb48WAuElRYQdpSXFUd4WiQVsB3d9p+UumCbRQzlkGb6Itjoz6lMorjle7E9NhgZr/hKCZkM9s6OWdm0QeQxl52hOIVwOpU0qUg3TNWsCkga/fNEieOG26uCP0kdak7rylkeQO6AMsfz2tTh3dfs0MbZMcQJHG+IZnD0r8CCisG0XG8zoDK7dNu7x3w3dDp2EU2R2BkVrBZnjSaIdw1LypUX9e1nDXiKRWaR48xusKPnPN0OIUITZSzTGTpFWCAKhrxXxTHvytErjasROoQs8jVnf414VSslzXT6WXK6r/w9meCiWqqBLGyxOvBk3eChKoeJaTTZ8cwCvIyHZCeQZWusfw2aLmPLSZv1MFbK6o6JtDbd7e5MCOD7T83xnZkgwGt7fcqKAba/Ut9AMd9vO+u5z/wOHR/16GnEXAENvsLrMzsw4jAp+aZ03VfH4Q63lgtl1x+96vM8FsHc1irDf//AID4fOvgoLjuFISWn3Hc6zCBc/3Z5Fs8Ud7c=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(966005)(44832011)(47076005)(26005)(186003)(54906003)(6916009)(5660300002)(83380400001)(336012)(426003)(82310400004)(70206006)(9786002)(4326008)(8936002)(8676002)(70586007)(31696002)(356005)(2616005)(7636003)(2906002)(31686004)(316002)(36756003)(508600001)(40460700003)(36860700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:24:52.7526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a930b8-2ef4-4fb6-fcbd-08d9fd29f6f3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8715

Hi,

please pull these 3 patches to your tree. The only thing to be aware of is that 
there is a conflict with one patch which goes via Greg's USB tree.
Stephen reported this issue some time ago also with simple resolution which is 
visible here.
https://lore.kernel.org/all/20220210141550.56359523@canb.auug.org.au/

Thanks,
Michal


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.18

for you to fetch changes up to 3a14f0e614082821ef65de7e1fb39e74c2ee4ee3:

   arm64: zynqmp: Rename dma to dma-controller (2022-01-24 13:15:41 +0100)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.18

- Dropping #stream-id-cells
- Add missing dma-cells and change dma node names

----------------------------------------------------------------
David Heidelberg (1):
       arm64: xilinx: dts: drop legacy property #stream-id-cells

Michael Tretter (2):
       arm64: zynqmp: Add missing #dma-cells property
       arm64: zynqmp: Rename dma to dma-controller

  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 76 +++++++++-----------
  1 file changed, 32 insertions(+), 44 deletions(-)
