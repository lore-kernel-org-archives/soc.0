Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD899C433E6
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:40:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 774C12389B; Fri,  8 Jan 2021 10:40:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8392423899;
	Fri,  8 Jan 2021 10:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8392423899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: yDEBBFsB/sFJyHH7vEbC1A6MfRNnsCFLfM8dkvbj570vjSpWQTYwMERPulv+7ZUWf2fzr1Yf0k
 2HVIdZ6qW5Kexko79SHEG10p1cMezh3QPIiLFpfeKm87SKQFmM/CColikbgp6kWIaciOCUbnVc
 EZNTgDNwQrXu+eTMtKUzRoaqqQQlhaDKR+HY81gpdszLbuQVY7nUXHBjl8MGJ4lDGXTPc6PFet
 WbvL8w1Zs1WO5nhJHIywYDAyF1Oe7Hwdt21/+OD92tT7SYZErg8P2xU7QYQz/XbGhikBD7TYyI
 hYE=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14108083"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="14108083"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3833E1F50C2;
	Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92BEC5ADBF7;
	Fri,  8 Jan 2021 19:40:33 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id 9D944692403;
	Fri,  8 Jan 2021 19:40:32 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:30 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
Date: Fri, 8 Jan 2021 19:52:31 +0900
Message-ID: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

(Resend as cover letter title was missing in the first time. Sorry for noise)

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

