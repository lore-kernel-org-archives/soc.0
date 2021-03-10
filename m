Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B7AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 08:40:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5B164FC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5B164FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MtY+nBWWUpi1heChh/Ve7K3/mgjq3jPeT+7nPrsd1Bs=; b=oFziqCAUhqhIL3cwzuPkllUij
	zOvdJAAIpczyAThxoMUg+0wrJjn+aqrw4Lfhjh948nNxyDIRf5XEbMKWwQHLcazEczvewDzDS/+t4
	dIb0lMG6/r4xjeIFoQewV3h7IvJfinScR1YEzXX0IYN3uvFg17wCjLqK+Z2DbubjRxIxuYOqB3xn0
	PvFNtD0t31cbDLZ2mziRurojxtfgzS8wmUNqf8ecND+zB0MG1fxiwf945PHP/WlED2ayb22FAcdB7
	59knp7unlCW74q2JQ3zFvmigix9QSLh0VjMb8wfGVwdygjfwmMZfwYaqS21jELlmMTzObw4nDpqnA
	INVm+rnTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJuMu-006Jfe-QX; Wed, 10 Mar 2021 08:39:01 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJuMn-006JeF-0R
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 08:38:56 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lJuMl-0003iz-WF
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 08:38:52 +0000
Received: by mail-wm1-f72.google.com with SMTP id c9so859325wme.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXnbdve+zJOcbawv0EbHEJ5Jfc5lGWVMModTUJmANNk=;
 b=ZLzNUOZDUZuKaMtSf7idfmxj3I5l5eTj0x92TpKcWmHIPTQXjKeMRWkBpw7D0WWDkE
 dq+F3WzExrW93kNsydj6KQiubTEGRV8OLPurvQtjy0z6Vf4VPdpzbQblwecNEmHEY200
 038/OUndA+AVLnJQ7QtL0cKOsZTDTO/pTIer+GzV/y+guNN6SSp/qSEJDTlvSiqje4Ba
 s1VrzBc2HfIeRq43/BfQ+2Txo/Qf+pgsq9xzJE31b7e866KYSnbZY525EW811AVYFBAZ
 g13/HXK8kYI4o37TwOwwCgsSso5l5el9BJt/9QK2YazHDvyPUbyUCij7j25fyGRnqKS9
 SqKw==
X-Gm-Message-State: AOAM531/WH5MOQfgmjA0Vo4pUp86u/oUB8/tvj0FtMV/ZC4Z0D+uaaJo
 ktrKGfF+ps1orbJERQ4OafXqBb5+jBu8CigYvkigBC5p2W68YoxkZoYsSdZHlobU/hjiRcV8rny
 hKDjfOjN4+SByTxK4b6pCnO9eeF1C5bHa1fGX3NuspISUrSgjAexB
X-Received: by 2002:adf:e34f:: with SMTP id n15mr2291933wrj.224.1615365531628; 
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSnw2dWyhCg8S1XsnqpMXZq1fKjQTwwKkJAQ63GButlbWJPKDpMI8YiY40X10GBbtFiL7M/A==
X-Received: by 2002:adf:e34f:: with SMTP id n15mr2291911wrj.224.1615365531457; 
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id u20sm32781061wru.6.2021.03.10.00.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFC v2 4/5] arm64: intel: merge Agilex and N5X into ARCH_SOCFPGA64
Date: Wed, 10 Mar 2021 09:38:38 +0100
Message-ID: <20210310083840.481615-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_083853_253013_879C4B9D 
X-CRM114-Status: GOOD (  20.55  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210310083838.R0HvcP0CLXD5foaIhPtv97oS91C-hi9y_aBVj0joZ9U@z>

Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
the Linux kernel point of view these are flavors of the same
architecture so there is no need for three top-level arm64
architectures.  Simplify this by merging all three architectures into
ARCH_SOCFPGA64.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/Kconfig.platforms       | 10 ----------
 arch/arm64/boot/dts/intel/Makefile |  6 +++---
 arch/arm64/configs/defconfig       |  1 -
 drivers/clk/socfpga/Kconfig        |  4 ++--
 drivers/firmware/Kconfig           |  2 +-
 drivers/reset/Kconfig              |  2 +-
 6 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 78bba3633eab..754738029cc6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -8,16 +8,6 @@ config ARCH_ACTIONS
 	help
 	  This enables support for the Actions Semiconductor S900 SoC family.
 
-config ARCH_AGILEX
-	bool "Intel's Agilex SoCFPGA Family"
-	help
-	  This enables support for Intel's Agilex SoCFPGA Family.
-
-config ARCH_N5X
-	bool "Intel's eASIC N5X SoCFPGA Family"
-	help
-	  This enables support for Intel's eASIC N5X SoCFPGA Family.
-
 config ARCH_SUNXI
 	bool "Allwinner sunxi 64-bit SoC Family"
 	select ARCH_HAS_RESET_CONTROLLER
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 3a052540605b..bb340584785c 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_AGILEX) += socfpga_agilex_socdk.dtb \
-			     socfpga_agilex_socdk_nand.dtb
+dtb-$(CONFIG_ARCH_SOCFPGA64) += socfpga_agilex_socdk.dtb \
+				socfpga_agilex_socdk_nand.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
-dtb-$(CONFIG_ARCH_N5X) += socfpga_n5x_socdk.dtb
+dtb-$(CONFIG_ARCH_SOCFPGA64) += socfpga_n5x_socdk.dtb
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ee742900a150..4968d4b3d89d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -28,7 +28,6 @@ CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_ACTIONS=y
-CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_BCM2835=y
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index 8cf3dfdba255..834797c68cb2 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -2,5 +2,5 @@
 config COMMON_CLK_SOCFPGA64
 	bool
 	# Intel Stratix / Agilex / N5X clock controller support
-	default y if ARCH_AGILEX || ARCH_N5X || ARCH_SOCFPGA64
-	depends on ARCH_AGILEX || ARCH_N5X || ARCH_SOCFPGA64
+	default y if ARCH_SOCFPGA64
+	depends on ARCH_SOCFPGA64
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 59660798f05f..f290fad41731 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -206,7 +206,7 @@ config FW_CFG_SYSFS_CMDLINE
 
 config INTEL_STRATIX10_SERVICE
 	tristate "Intel Stratix10 Service Layer"
-	depends on (ARCH_SOCFPGA64 || ARCH_AGILEX) && HAVE_ARM_SMCCC
+	depends on ARCH_SOCFPGA64 && HAVE_ARM_SMCCC
 	default n
 	help
 	  Intel Stratix10 service layer runs at privileged exception level,
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index fa7f1394697b..796c9e3e5e81 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -183,7 +183,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_SOCFPGA64 || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_SOCFPGA64 || ARCH_SUNXI || ARC
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
