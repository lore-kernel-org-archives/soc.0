Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C741BC433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:21:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9BB0B236FB; Fri,  8 Jan 2021 10:21:39 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Fri, 08 Jan 2021 10:21:38 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE63A23716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE63A23716;
	Fri,  8 Jan 2021 10:21:38 +0000 (UTC)
IronPort-SDR: WMi5P1biufm1bkdh/YEAsALgKvHvgQRPJ6vy+xNi9e35Z0fCfXQ2rS/hUyWL5Lsn+QmpIxbVKi
 50dKrvcbaJAeS5oPTYjuxNw5LwNp96vKn07+iWRWYnUJkT/Qz9Uu/V5cyapUCFL/uxDhMXtnbv
 kM/ZSgpmLUZcpeSZFFnMBbx/4Wch7pssWnK2ZyfeUP6dmrDkN8Sx+GqQg2Yp4e56BmQmCFbQv8
 05AA8H7sElSUqrFF8Hc0r3sPMPw1mHRg6NaMCuU1YYR3kGtyeFpPKDRWZBF6+hgcqvnC6VE1/z
 saw=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14106180"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="14106180"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BEB8DF09E;
	Fri,  8 Jan 2021 19:20:30 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B0C9F44C080;
	Fri,  8 Jan 2021 19:20:29 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id A623546E556;
	Fri,  8 Jan 2021 19:20:28 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:26 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject:
Date: Fri, 8 Jan 2021 19:32:17 +0900
Message-ID: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

Subject: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver

Hello,

This series adds Fujitsu A64FX SoC entry in drivers/soc and hardware
barrier driver for it.

[Driver Description]
 A64FX CPU has several functions for HPC workload and hardware barrier
 is one of them. It is a mechanism to realize fast synchronization by
 PEs belonging to the same L3 cache domain by using implementation
 defined hardware registers.
 For more details, see A64FX HPC extension specification in
 https://github.com/fujitsu/A64FX
 
 The driver mainly offers a set of ioctls to manipulate related registers.
 Patch 1-9 implements driver code and patch 10 finally adds kconfig,
 Makefile and MAINTAINER entry for the driver.  

 Also, C library and test program for this driver is available on: 
 https://github.com/fujitsu/hardware_barrier

 The driver is based on v5.11-rc2 and tested on FX700 environment.

[RFC]
 This is the first time we upstream drivers for our chip and I want to
 confirm driver location and patch submission process.

 Based on my observation it seems drivers/soc folder is right place to put
 this driver, so I added Kconfig entry for arm64 platform config, created
 soc/fujitsu folder and updated MAINTAINER entry accordingly (last patch).
 Is it right?

 Also for final submission I think I need to 1) create some public git
 tree to push driver code (github or something), 2) make pull request to
 SOC team (soc@kernel.org). Is it a correct procedure?

 I will appreciate any help/comments.

sidenote: We plan to post other drivers for A64FX HPC extension
(prefetch control and cache control) too anytime soon.

Misono Tomohiro (10):
  soc: fujitsu: hwb: Add hardware barrier driver init/exit code
  soc: fujtisu: hwb: Add open operation
  soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
  soc: fujitsu: hwb: Add IOC_BW_ASSIGN ioctl
  soc: fujitsu: hwb: Add IOC_BW_UNASSIGN ioctl
  soc: fujitsu: hwb: Add IOC_BB_FREE ioctl
  soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
  soc: fujitsu: hwb: Add release operation
  soc: fujitsu: hwb: Add sysfs entry
  soc: fujitsu: hwb: Add Kconfig/Makefile to build fujitsu_hwb driver

 MAINTAINERS                            |    7 +
 arch/arm64/Kconfig.platforms           |    5 +
 drivers/soc/Kconfig                    |    1 +
 drivers/soc/Makefile                   |    1 +
 drivers/soc/fujitsu/Kconfig            |   24 +
 drivers/soc/fujitsu/Makefile           |    2 +
 drivers/soc/fujitsu/fujitsu_hwb.c      | 1253 ++++++++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |   41 +
 8 files changed, 1334 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/fujitsu_hwb.c
 create mode 100644 include/uapi/linux/fujitsu_hpc_ioctl.h

-- 
2.26.2

