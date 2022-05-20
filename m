Return-Path: <SRS0=BhPz=V4=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7327AC433EF
	for <soc@archiver.kernel.org>; Fri, 20 May 2022 07:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42AE1C34119; Fri, 20 May 2022 07:42:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9655CC385A9;
	Fri, 20 May 2022 07:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9655CC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="73511610"
X-IronPort-AV: E=Sophos;i="5.91,238,1647270000"; 
   d="scan'208";a="73511610"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 20 May 2022 16:42:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 34AD5ED5CE;
	Fri, 20 May 2022 16:42:10 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10590D95E4;
	Fri, 20 May 2022 16:42:09 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id 0FBE8404544B6;
	Fri, 20 May 2022 16:42:07 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	sumit.garg@linaro.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.thompson@linaro.org,
	dianders@chromium.org,
	hasegawa-hitomi@fujitsu.com
Subject: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
Date: Fri, 20 May 2022 16:41:18 +0900
Message-Id: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

The interrupt is set using pseudo-NMI if it is available. Arm has a
diagnostic interrupt feature called "Arm Generic Diagnostic Dump and
Reset device", but the A64FX does not support this feature and instead
has its own device definition.

I tested on FX700:
$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
[   86.259226] lkdtm: Performing direct entry HARDLOCKUP
:
:

Send the "chassis power diag" command from the management server
using ipmitool, the following message is shown:
[  138.433544] Kernel panic - not syncing: a64fx_diag: interrupt received
:
:

Changes in V5:
 - Fixing issues raised by Jiri and Greg.

Changes in V4:
 - Call the panic function instead of sysrq. Prepare a handler
   for each NMI/IRQ and call nmi_panic()/panic() respectively (as in v1).
 - Fixing other issues raised by Greg.

Changes in V3:
 - Exclude Sumit's patch.
 - Retest in v5.17.

Changes in V2:
 - Include Sumit's patch.
 - The handler calls handle_sysrq() to use the sysrq feature to cause
   a panic.
 - request_nmi() and request_irq() now use the same handler, and
   the function name of the handler has also changed.
 - Use readl()/writel() instead of readl_relaxed()/writel_relaxed().

V4: https://lore.kernel.org/linux-arm-kernel/20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com/
V3: https://lore.kernel.org/linux-arm-kernel/20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com/
V2: https://lore.kernel.org/linux-arm-kernel/20220304064324.331217-3-hasegawa-hitomi@fujitsu.com/
V1: https://lore.kernel.org/linux-arm-kernel/20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com/


Hitomi Hasegawa (1):
  soc: fujitsu: Add A64FX diagnostic interrupt driver

 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  16 ++++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 154 +++++++++++++++++++++++++++++++
 6 files changed, 180 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

-- 
2.27.0

