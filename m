Return-Path: <SRS0=0bQq=TP=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C0C433EF
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 06:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A00EDC340F1; Fri,  4 Mar 2022 06:45:56 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4245AC340E9;
	Fri,  4 Mar 2022 06:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4245AC340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=fujitsu.com
IronPort-SDR: 9oP8RQQSYvesNLjS5RRToHAyb9OPnid9VD2NmT9CqrnvdpNzXNSPWawwMMyhiGq9JzK+uv0scA
 Shbnun0Tn/KBX8T7TEgGq6QUs0FqRWj3sFtcKpqsGFyUZrjhhvfgQlUD9RdzOm5hJnttOmkYk+
 /p7XS9ncmtzuHS7mVPuS/69EguouWrtbucM/PzdJtNr/3BpulqbqgeVYugloDgmGeLxRWvnYS0
 g+AegqH0WwfAlgNGSmWNQRcTSavnMGv4kElILDSk1tgS+Jh7HYTyaByPv2r1LaqUozhEelWoS1
 xvZvkoWHA2swUGLEbbTSPr0Y
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="44623342"
X-IronPort-AV: E=Sophos;i="5.90,154,1643641200"; 
   d="scan'208";a="44623342"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 04 Mar 2022 15:45:44 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33DAACA241;
	Fri,  4 Mar 2022 15:45:44 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EE18125A6;
	Fri,  4 Mar 2022 15:45:43 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
	by yto-om2.fujitsu.com (Postfix) with ESMTP id 7D372403884F7;
	Fri,  4 Mar 2022 15:45:42 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	linux-serial@vger.kernel.org,
	sumit.garg@linaro.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	jason.wessel@windriver.com,
	daniel.thompson@linaro.org,
	dianders@chromium.org,
	linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	peterz@infradead.org,
	hasegawa-hitomi@fujitsu.com
Subject: [PATCH v2 0/2] soc: fujitsu: Add A64FX diagnostic interrupt driver
Date: Fri,  4 Mar 2022 15:43:22 +0900
Message-Id: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt is set using pseudo-NMI if it is available. Arm has a
diagnostic interrupt feature called "Arm Generic Diagnostic Dump and
Reset device", but the A64FX does not support this feature and instead
has its own device definition.

This patch series includes ones created by Sumit.[1]

I tested on FX700:
$ echo 1 > /proc/sys/kernel/sysrq
$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
[  124.712351] lkdtm: Performing direct entry HARDLOCKUP
[  147.232096] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
:
:

Send the "chassis power diag" command from the management server
using ipmitool, the following message is shown:
[  206.061770] sysrq: Trigger a crash
[  206.061779] Kernel panic - not syncing: sysrq triggered crash
:
:

Changes in V2:
 - Include Sumit's patch.
 - The handler calls handle_sysrq() to use the sysrq feature to cause
   a panic.
 - request_nmi() and request_irq() now use the same handler, and
   the function name of the handler has also changed.
 - Use readl()/writel() instead of readl_relaxed()/writel_relaxed().

V1:
  https://lore.kernel.org/linux-arm-kernel/20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com/

[1] https://lore.kernel.org/all/20220228135408.1452882-1-sumit.garg@linaro.org/

Sumit Garg (1):
  tty/sysrq: Make sysrq handler NMI aware

Hitomi Hasegawa (1):
  soc: fujitsu: Add A64FX diagnostic interrupt driver

 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
 drivers/tty/sysrq.c              |  45 ++++++++-
 include/linux/sysrq.h            |   1 +
 kernel/debug/debug_core.c        |   1 +
 9 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

-- 
2.27.0

