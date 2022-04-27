Return-Path: <SRS0=PHoy=VF=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FD0C433F5
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 16:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8E7DC385A9; Wed, 27 Apr 2022 16:23:32 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD19EC385A7;
	Wed, 27 Apr 2022 16:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD19EC385A7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s0tSZBlfyGxMTtB3lAr2Q1sYcP0+uGwRUvp3hPCyHzU=; b=TFPJs0il2zNVxAi8U1shUAyTRM
	20CDsMFiQPGr+uatPGDKZUUZ3j3igMoeq66QfETt/VEkjxS0yY1n2bJfI9Y0P98JRfRj6MRyWwVip
	v0AtDGfXEVDSfdqkWDDcXYww1VJdGROcpOy/vwS3qM1sBcg+H2nBwP6uk6ntqibxUY0IFXKv7QjQz
	JBqDiVBo+fKrNMtTiLvq1AZJirhw71UD1C/CgunTu0MigRPqLvuQxIet1uxFDMcUpWitbuSIY2bSk
	lxhduu8fc43lpM4W0nRpn5jnjv2Vr91PX3fT/KfzpxHHyDicHhJkYxHvUukCb4+5yrvQqGX+OijWG
	la7YIE/A==;
Received: from 82-71-190-90.dyn.estpak.ee ([90.190.71.82]:62336 helo=localhost)
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1njkRY-00047C-N0; Wed, 27 Apr 2022 19:23:10 +0300
Received: by localhost (sSMTP sendmail emulation); Wed, 27 Apr 2022 19:23:07 +0300
From: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrew@lunn.ch,
	sebastian.hesselbarth@gmail.com,
	Mauri Sandberg <maukka@ext.kapsi.fi>
Date: Wed, 27 Apr 2022 19:21:22 +0300
Message-Id: <20220427162123.110458-1-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.190.71.82
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)

Hello all,

I am making an attempt to create a device tree for D-Link DNS-323 devices
but I am falling short on a few specific details. I am requesting a
general review of the device tree files. I have access to DNS-323 rev A1
only and the B1 and C1 need to be tested separately, so I am reaching out
to people who might have them. The questions that I have at the moment are
below.

- some of resulting IRQs are different from what was requested in device tree
- logs say NR_IRQS is different from mach file one
- sata_mv fails to initialise with -22 (-EINVAL)
- there is no concensus on how to get ascii formatted MAC address from mtd
  partitions so eth is not fully functional without setting the MAC from
  userspace
- revs B1 and C1 need testing
- how to configure RTC to wake system from sleep?

What currently works in rev A1
 - leds
 - keys
 - fan
 - temperature sensor
 - shutdown
 - reboot
 - mtd partitions
 - ethernet (mac address must be set manually)

I have included relevant parts from boot log to better illustrate what seems
to be off target

-------------------------------- DT log ---------------------------------------
...
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
...
sata_mv 0000:00:01.0: Gen-IIE 32 slots 4 ports SCSI mode IRQ via INTx
sata_mv: probe of 0000:00:01.0 failed with error -22
...
mv64xxx_i2c mv64xxx_i2c.0: can't get pinctrl, bus recovery not supported
...
-------------------------------------------------------------------------------

Best regards,
Mauri

Mauri Sandberg (1):
  ARM: orion5x: convert D-Link DNS-323 to the Device Tree

 arch/arm/boot/dts/Makefile                   |   3 +
 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi  | 217 ++++++
 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts |  59 ++
 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts |  38 +
 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts |  80 ++
 arch/arm/mach-orion5x/Kconfig                |   6 +-
 arch/arm/mach-orion5x/Makefile               |   2 +-
 arch/arm/mach-orion5x/board-dns323.c         | 118 +++
 arch/arm/mach-orion5x/board-dt.c             |   3 +
 arch/arm/mach-orion5x/common.h               |   6 +
 arch/arm/mach-orion5x/dns323-setup.c         | 724 -------------------
 11 files changed, 528 insertions(+), 728 deletions(-)
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
 create mode 100644 arch/arm/mach-orion5x/board-dns323.c
 delete mode 100644 arch/arm/mach-orion5x/dns323-setup.c


base-commit: 46cf2c613f4b10eb12f749207b0fd2c1bfae3088
--
2.25.1
