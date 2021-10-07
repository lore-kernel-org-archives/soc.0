Return-Path: <SRS0=0+zB=O3=xilinx.com=michals@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F812C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 07:21:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 77DD861215; Thu,  7 Oct 2021 07:21:09 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C1A6120D;
	Thu,  7 Oct 2021 07:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33C1A6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xilinx.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3Pt/ETx2GV+Fh5/CVONdu9CyahDcmsnoZFzg4MW4IGBLNcc+Nepxt2HgQMCwS51tzoNLC3C+bgT+mh+y74GsfZpYNQxie7A+qhbLnKJRB3C+MmlaB7I767Vpny/JpcYg1knWwWMQbeABEzyPzviBr0QQryH75e4X7QmIy1xcjeEHH9NskOSJ+rBeh4w+Kp51nB27ggytYAh36edUTMBAAFqdsrJTfZKCVOuxtACwSa559EzuEpEixdj0PGl1yzd5I4QiLITUnE2+s3Y9aETM1ZOw4Pcn6IOXglQOx0Uos6DMXsqecsRjSdEry1wv8qDG0NcCN96183WG2JGMQe6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WkiW0ZjVAJ8YZJQgbb5KhUm4J9ADI6k8mqqV1Rxf5M=;
 b=mPze7xbVFKoRwSIlBgA2jYSvAIOJB57Q5SZAgR2COU7TbFsxXCumX1GtZ5lj4wvAfJNzu7gknfrNtK7LYF3aUVL2OPlmU/KsAubz6s8gbB1j5cf1mtWRfZtQOAkeZdnUM4JYlYs5PEiaqhP0+yx6+OhilBWAbJJaHMJf/3ZXH13GX4fg5Ob/ZokCOYK8E0DItQtBASkudDlq85Z9X/k/5J1sl3mrq1hnoRcq9ijsBML1pqdVqOJNvdhcMYWXj6bw9vjRA+hHXvv0xzsffOUqzWo5W8y0Xd1cdPi8Fa7knIWPV0Qq9TUv95MII1WFHEXwICz3JfzTWLRsDLKm1eRFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WkiW0ZjVAJ8YZJQgbb5KhUm4J9ADI6k8mqqV1Rxf5M=;
 b=SUIcwwVMmAvoxE1zMArUdDW4tK3YC8kMTZ425N14o4hdEOxV9icwQNJ9miDdf/3PPh4bxzm9JbktrsW62w2TeXM4ted5l48UqXZar/cIpjJs5BKbFmummKz1OjyEbM9ExQf4UIHhjVBxAl/lvZQy4r/X3JZhNbgCynT5H24MLvI=
Received: from DM6PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:333::19)
 by SJ0PR02MB7263.namprd02.prod.outlook.com (2603:10b6:a03:2a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Thu, 7 Oct
 2021 07:21:07 +0000
Received: from DM3NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::6c) by DM6PR03CA0086.outlook.office365.com
 (2603:10b6:5:333::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 07:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT033.mail.protection.outlook.com (10.13.4.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 07:21:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 7 Oct 2021 00:21:05 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 7 Oct 2021 00:21:05 -0700
Envelope-to: linux-arm-kernel@lists.infradead.org,
 arm@kernel.org,
 soc@kernel.org
Received: from [10.254.241.49] (port=45974)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1mYNiD-0006f2-AI; Thu, 07 Oct 2021 00:21:05 -0700
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
CC: arm-soc <arm@kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.16-v2
Message-ID: <9815867c-ffbb-fc9d-64b9-badee5e2862b@xilinx.com>
Date: Thu, 7 Oct 2021 09:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb00e05-24e6-4c86-4af5-08d989630763
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7263:
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB72630BB4EE5932A27F4D049DC6B19@SJ0PR02MB7263.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iM5s5qeF3DMaitUOv4Mym/TU31LdVh4kfTKtScwT4jiTGVTGxn7CPL0WZkgbnbwBfNSrvppQSuLDXbqfByJI1EQZElvb+cxtrtaTZpPz10XWcykflJbbhzjDF8mdhK9zlagzhke2CUxfgh8OswDIijSbi36xD88oWxkgXkvLaF+6HYE9i9+p9axuMT3o0AbdCrBOSJDTdjzsoO0b15rYmqZN3KTowQn7tD3Mf31pj7Dc7C1ifgJgRCCDX9JNYqjahZAJbYmvNTehvmoxskLScJEYnACZilfztyfblimSVes203aEUU2clHHNMHgKg+OMDHIgji3HWfffyYX5wGu0nyFOb6mcfiujjlRsAT3w931lQiFeplqPy/cQysOoMmfBUM9qs2n86bkSUGrTUE+rply90dGpWEPMRf8MdQ1TAOAbpb6X8cHvEXDPqeg/u1qSrrtI0jmh8nnug3OBCA3jIG5zDXj/Wnf4+NZCP5p3dU5kK+NG215QLAmzcVw6WoSyKTrZZSFjC/mufqrbtjmZ+fj9MoM6fHXl1ygXV1sbZWAJAQgfUOOEw6/GLj/9ITGSD+OiJfZL7C4203df6Qhjb4dTak7TGDMNsyGOK4dofbVON6tQjCbNduG/+sDdX6OTSTsbLxmn6Lrn95MvSbJw1UQuLYD2A2lhI4YiWIS8Wb1DsfxYM2gxk4ivnWcqmaKa4z+eLT75H+A/OnIdWTcfpXbFF0aoZrmgeU2MCfXOITJLgAN90lfo2+in8y9bliCsUzeLAUj/9r7GtqjuDWHdVd9oARaAdTErauJpqnbSIeDYVxeRBplJHuGWZddyotypYi8B0HDnHW6qEvDZP4uEwxuVnMjZUokXvNu+OR50A7g=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(83380400001)(966005)(70586007)(70206006)(508600001)(36756003)(5660300002)(44832011)(2906002)(356005)(7636003)(9786002)(54906003)(6916009)(26005)(36906005)(8676002)(316002)(47076005)(2616005)(31696002)(186003)(8936002)(31686004)(426003)(336012)(4326008)(82310400003)(36860700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:21:06.7431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb00e05-24e6-4c86-4af5-08d989630763
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7263

Hi,

please pull this one patch to your tree. It was acked by Rob already
and it is based on zynq/dt branch you have in soc.git tree.

Thanks,
Michal


The following changes since commit 35a7430dad4dd83fe295917b8232595f437bb208:

  arm64: zynqmp: Wire psgtr for zc1751-xm013 (2021-09-13 08:55:56 +0200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.16-v2

for you to fetch changes up to 7a4c31ee877a40053e39b80fe1d61c42b49f1078:

  arm64: zynqmp: Add support for Xilinx Kria SOM board (2021-09-29
13:48:21 +0200)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.16-v2

- Add support for Kria SOM board

----------------------------------------------------------------
Michal Simek (1):
      arm64: zynqmp: Add support for Xilinx Kria SOM board

 Documentation/devicetree/bindings/arm/xilinx.yaml   |  16 ++++
 arch/arm64/boot/dts/xilinx/Makefile                 |  13 +++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dts | 315
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dts | 298
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts   | 289
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts  |  21 +++++
 6 files changed, 952 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts
