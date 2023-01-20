Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D8C54E94
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 13:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09B10C4339B; Fri, 20 Jan 2023 13:35:19 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A494FC4339E;
	Fri, 20 Jan 2023 13:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A494FC4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221717; x=1705757717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UK9in/6pk+cr3TnMOT93DY7cqB9Lku8ZTtDleVDrgtc=;
  b=mRUIHRVgk8dTG2UPohgjAUbgK/VDPzBTHfntfLUG3bUyJrsKt8UVeyK2
   EezrUg9ZiISbE2Dh3E+DpRJp9gNlrHxUgOMSW34XFcaS+N4MJk95seLDk
   dDdYD5SABc22fwZEcyxzIOgT8bipRiTYW67UJ+/pxNAFB27eBxu4BSk2m
   Cfq9+/vqpA5qG8Pqa8D9OXKWE+2P5RWETSJQHEWPbWXE9E6rCJi36R2zc
   hkM7phEc17vZn/hdyQ01dSPuG9MmvWXS3S3QEpLrwFJS/oFt9N58FBOUj
   5vodG+XxbhVtnpprI5sGBw4fZhaHI2bwdpx310lu9Q0GnFY/ZPcEl9ms6
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561593"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:06 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221706; x=1705757706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UK9in/6pk+cr3TnMOT93DY7cqB9Lku8ZTtDleVDrgtc=;
  b=BTcLKl2xHZAJI46pdlQpnyUoeXJGB5vvghfy6DvSWczPmnhpvTq3KHhf
   FS+VA0cCgRPyMOKe22E4juIsD9DEcNnplumKpyZfzoEOAGLeF0qhROIWz
   FEPSaTzqsoOgPn2Nd8j474AhEQQlbmMiMTNUFFYTrWq23WNAhqKKfHv0d
   vb2GcNmFrRphU3wxvR8Om5G/paWw6dqAkxdPWQG2WHokE1VgrSSqSax4o
   kodh/XAZ3vM4XdWAz9ng195o1k50K9OdhiKBCLVcBSqwB4siuy8ivGg0O
   uehXPJbRCKcMeiCg+4JqN/c/bgQ9x2nIQXw4o11CXD6RIinkZrxJFEkWn
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561592"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 425DC28007F;
	Fri, 20 Jan 2023 14:35:06 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 10/10] ARM: add multi_v7_lpae_defconfig
Date: Fri, 20 Jan 2023 14:34:55 +0100
Message-Id: <20230120133455.3962413-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

The only missing configuration option preventing us from using
multi_v7_defconfig with the Raspberry Pi 4 is ARM_LPAE. It's needed as
the PCIe controller found on the SoC depends on 64bit addressing, yet
can't be included as not all v7 boards support LPAE.

Introduce multi_v7_lpae_defconfig, built off multi_v7_defconfig, which will
avoid us having to duplicate and maintain multiple similar configurations.

Needless to say the Raspberry Pi 4 is not the only platform that can
benefit from this new configuration.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Directly applied from https://lore.kernel.org/linux-arm-kernel/20200203184820.4433-2-nsaenzjulienne@suse.de/T/#m96968dd45c0aaa88e0a7387024b5ac13b002363d
Although I had to apply manually

 arch/arm/Makefile            | 4 ++++
 arch/arm/configs/lpae.config | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 arch/arm/configs/lpae.config

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 506dbc72323bc..80d9eaf3dc06a 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -314,6 +314,10 @@ endif
 # My testing targets (bypasses dependencies)
 bp:;	$(Q)$(MAKE) $(build)=$(boot) $(boot)/bootpImage
 
+include $(srctree)/scripts/Makefile.defconf
+PHONY += multi_v7_lpae_defconfig
+multi_v7_lpae_defconfig:
+	$(call merge_into_defconfig,multi_v7_defconfig,lpae)
 
 define archhelp
   echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
new file mode 100644
index 0000000000000..19bab134e014b
--- /dev/null
+++ b/arch/arm/configs/lpae.config
@@ -0,0 +1 @@
+CONFIG_ARM_LPAE=y
-- 
2.34.1

