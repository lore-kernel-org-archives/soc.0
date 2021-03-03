Return-Path: <SRS0=RWG8=IB=jp.fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867D9C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 09:39:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3246064EE8; Wed,  3 Mar 2021 09:39:58 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Wed, 03 Mar 2021 09:39:57 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0995764EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=tan.shaopeng@jp.fujitsu.com
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0995764EBD;
	Wed,  3 Mar 2021 09:39:56 +0000 (UTC)
IronPort-SDR: 0rz8UhzEBq0be3RT+UBSlHncD7vh52pxzGr43oTd19jCgOFt5VrJFyRpsiM2X/RnTArmY5//I7
 LKE/0x1ppJ3wUetafZzwsMrY3nglZT6vAm0UYQZ1+dna9CdCkPROOwHU4zCZOdcnX430YswWft
 ifCfBFs74nO30btnHEvinbwbiSiXARPxJgROqyzFSOk03OK+haPMP0MzJssaafKHyrun0TPv6N
 BT0wzUlaqj4fmQxH27V5QYOSJsWJx1LFMM1+6DT2KuOF4MsRh7bwzHw2M11yI8kvIWB3rsC8Ub
 5UE=
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="21486526"
X-IronPort-AV: E=Sophos;i="5.81,219,1610377200"; 
   d="scan'208";a="21486526"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 03 Mar 2021 18:38:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 08D5BE60A7;
	Wed,  3 Mar 2021 18:38:50 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 475AD2170CE;
	Wed,  3 Mar 2021 18:38:49 +0900 (JST)
Received: from cn-r05-09.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 0C3DB4006817C;
	Wed,  3 Mar 2021 18:38:49 +0900 (JST)
From: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	arnd@arndb.de,
	olof@lixom.net,
	misono.tomohiro@jp.fujitsu.com,
	tan.shaopeng@jp.fujitsu.com
Subject: [PATCH RFC] Upstream A64FX cache driver
Date: Wed,  3 Mar 2021 18:38:22 +0900
Message-Id: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00

From: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>

Hello, 

This driver enables Fujitsu A64FX's cache function. 

[Driver Description] 
A64FX CPU has several functions for HPC workload and this driver is  
for cache functions. 

Loading this cache driver, control registers will be set to enable  
these functions, and advanced settings registers will be set by default 
values. After loading this driver, you can use the default values of the 
advanced settings registers or set custom values to the advanced 
settings registers from EL0. Unloading this driver, control registers 
will be clear to disable these functions. 

These functions include sector cache function and hardware prefetch  
assistance function. 
- Sector cache function:  
 Cache partitioning function which can control virtual cache capacity for 
 each characteristics of data such as temporal locality. 
- Hardware prefetch assistance function:  
 Software can provide the hint for hardware prefetch mechanism to reduce  
 the penalty of the memory access. By providing the access pattern  
 through that function in advance, hardware prefetch mechanism can access 
 the complex pattern. 

These functions can be executed according to the default values of the 
registers which are set by the driver. Or they can be executed  
according to a tag which is the upper 8 bits of the load/store address 
of application to customize hardware prefetch and sector cache. 

For more details of these functions,  
see A64FX HPC extension specification in 
https://github.com/fujitsu/A64FX  

The driver is based on v5.11-rc2 and tested on FX1000 environment. 

[RFC]  
This function only performs register initialization for A64FX. At first, 
I wanted to insert it to kernel initialization code, but there is no  
initialization code except errata, so I made this driver. 
I'd like to know if this approach is OK? Would you give me some advice? 

Best regards, 
Tan Shaopeng 

tan.shaopeng (1):
  soc: fujitsu: Add cache driver code

 MAINTAINERS                         |   6 ++
 arch/arm64/Kconfig.platforms        |   5 +
 drivers/soc/Kconfig                 |   1 +
 drivers/soc/Makefile                |   1 +
 drivers/soc/fujitsu/Kconfig         |  26 +++++
 drivers/soc/fujitsu/fujitsu_cache.c | 183 ++++++++++++++++++++++++++++++++++++
 6 files changed, 222 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/fujitsu_cache.c

-- 
1.8.3.1

