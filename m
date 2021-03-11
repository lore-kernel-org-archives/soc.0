Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF24C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:29:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9F364E59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9F364E59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BzTUm5GSnDOj+UU0g709S/BuMAzZCC9xAuC2W24kj4E=; b=RBVrbRoZDktEyVNStpnY8PNd8
	mnHXE7eITEI+l+40zjFsjSy7EtEPIog8hUz/N58owCG6Ws/JHDAxyswdV61iMkypJH6V2fcx32sm7
	b43OGCkGa1aEXbMnPSKdXoHH9oQjF7T+/2zP1iRl0+D73prDBEVAiKOVQMzIepQ1f3CDWSmoha7lx
	OXpUdHxXveSibEfKoQGJMbdq0P1CxhIKh+F0PsdREWN7Hj1q66/+L1frw24wpNXrRZ8lqMtUkoQQd
	kLBzLjvAR2pnNJA6l64Nemm7jhCSM4iCUiGFLCgyE/vGWQyu8l/ZzsBc7S+5CS4oQ7+B+rxwOqNex
	DJJ8SIc0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNDc-009Qcz-3m; Thu, 11 Mar 2021 15:27:22 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNCX-009QIz-ET
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:26:15 +0000
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCV-00056b-Px
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:26:12 +0000
Received: by mail-ed1-f69.google.com with SMTP id q2so10009077edt.16
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64x8YpaZ8HtZHSdGhulwSXZBkEtDNxGWQlJcY2WZReQ=;
 b=flyYBDNfVnn69ijrbwcPD/uoniygZenLYzN5lbkmoVdjNEYtAael1FKjJqL6zZDwOc
 0yEGPqJzq7yqz9B5t1hI43wEgnoXK96ilU5UvbbP5dHuFn5G0XtQo3QfIxqlh8TJDbuS
 H5SuiM5ZNajVgvShfqnP1nb+rxl6FZwIhvc9rk1OfODTWA9x1YAz7y4Ncb3q0pTtzmkj
 65BGVecV2n8e8ksco+uilCPZlM4EmVyuzRdtnkd8i0pIuD+fXI76GscPGmMoQbQqB6Wk
 sFXgYWiY0NvOJ0d9u3db4W9e3i25aMDrMv/YL0tHx0ITi6qAYWdisEKUGSRpDyozumqB
 FyzA==
X-Gm-Message-State: AOAM530fXArjvynxo46tw8IUlQv2qzAB5nECLtBYoTCUzHIMdwGUYkWs
 Q4WFM+5foROUn1JV7ErbicSXMnWEjNhMR951wKGYSGZMhwkk2Nn5Cft0fUIAzc+H2e+dSkj6+cs
 hEVY+d4TnuAafOUSIsk6bRaAN4bMuHpfVGcwZMru8PTYDHZgEwOml
X-Received: by 2002:a05:6402:1393:: with SMTP id
 b19mr9029437edv.333.1615476360053; 
 Thu, 11 Mar 2021 07:26:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK46E5y/32Jy/9Voo0TUZtd7fHKBU61YwAFS87oJZxm94dz2uI8Cz0UtNhcGCnNvg52FFB5Q==
X-Received: by 2002:a05:6402:1393:: with SMTP id
 b19mr9029395edv.333.1615476359877; 
 Thu, 11 Mar 2021 07:25:59 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 08/15] arm64: socfpga: merge Agilex and N5X into
 ARCH_INTEL_SOCFPGA
Date: Thu, 11 Mar 2021 16:25:38 +0100
Message-ID: <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152613_613882_3B6F9799 
X-CRM114-Status: GOOD (  23.93  )
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
Message-ID: <20210311152538.c78TRPAtc-b0z7i_7kYCWdPziBYYERAdqWKXa-2mB6o@z>

Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
the Linux kernel point of view these are flavors of the same
architecture so there is no need for three top-level arm64
architectures.  Simplify this by merging all three architectures into
ARCH_INTEL_SOCFPGA and dropping the other ARCH* arm64 Kconfig entries.

The side effect is that the INTEL_STRATIX10_SERVICE will now be
available for both 32-bit and 64-bit Intel SoCFPGA, even though it is
used only for 64-bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/Kconfig.platforms       | 21 ++++-----------------
 arch/arm64/boot/dts/intel/Makefile |  6 +++---
 arch/arm64/configs/defconfig       |  3 +--
 drivers/clk/Makefile               |  2 --
 drivers/clk/socfpga/Kconfig        |  4 ++--
 drivers/firmware/Kconfig           |  2 +-
 drivers/fpga/Kconfig               |  2 +-
 drivers/reset/Kconfig              |  2 +-
 8 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index ecab67a1afb8..ce50dd129eec 100644
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
@@ -254,14 +244,11 @@ config ARCH_SEATTLE
 	help
 	  This enables support for AMD Seattle SOC Family
 
-config ARCH_STRATIX10
-	bool "Altera's Stratix 10 SoCFPGA Family"
-	select ARCH_INTEL_SOCFPGA
-	help
-	  This enables support for Altera's Stratix 10 SoCFPGA Family.
-
 config ARCH_INTEL_SOCFPGA
-	bool
+	bool "Intel's SoCFPGA ARMv8 Families"
+	help
+	  This enables support for Intel's SoCFPGA ARMv8 families:
+	  Stratix 10 (ex. Altera), Agilex and eASIC N5X.
 
 config ARCH_SYNQUACER
 	bool "Socionext SynQuacer SoC Family"
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 3a052540605b..0b5477442263 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_AGILEX) += socfpga_agilex_socdk.dtb \
-			     socfpga_agilex_socdk_nand.dtb
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_socdk.dtb \
+				socfpga_agilex_socdk_nand.dtb \
+				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
-dtb-$(CONFIG_ARCH_N5X) += socfpga_n5x_socdk.dtb
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f633b771..cf8a3009b858 100644
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
@@ -50,7 +49,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_S32=y
 CONFIG_ARCH_SEATTLE=y
-CONFIG_ARCH_STRATIX10=y
+CONFIG_ARCH_INTEL_SOCFPGA=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_SPRD=y
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 1e29e5ad107a..96802294d35a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -105,8 +105,6 @@ obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
 obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
-obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
-obj-$(CONFIG_ARCH_N5X)			+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index bc102e0f0be0..b6c5b9737174 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -2,5 +2,5 @@
 config CLK_INTEL_SOCFPGA64
 	bool
 	# Intel Stratix / Agilex / N5X clock controller support
-	default (ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10)
-	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
+	default ARM64 && ARCH_INTEL_SOCFPGA
+	depends on ARM64 && ARCH_INTEL_SOCFPGA
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 3f14dffb9669..6a4e882e448d 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -206,7 +206,7 @@ config FW_CFG_SYSFS_CMDLINE
 
 config INTEL_STRATIX10_SERVICE
 	tristate "Intel Stratix10 Service Layer"
-	depends on (ARCH_STRATIX10 || ARCH_AGILEX) && HAVE_ARM_SMCCC
+	depends on ARCH_INTEL_SOCFPGA && HAVE_ARM_SMCCC
 	default n
 	help
 	  Intel Stratix10 service layer runs at privileged exception level,
diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 5ff9438b7b46..fd325e9c5ce6 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -60,7 +60,7 @@ config FPGA_MGR_ZYNQ_FPGA
 
 config FPGA_MGR_STRATIX10_SOC
 	tristate "Intel Stratix10 SoC FPGA Manager"
-	depends on (ARCH_STRATIX10 && INTEL_STRATIX10_SERVICE)
+	depends on (ARCH_INTEL_SOCFPGA && INTEL_STRATIX10_SERVICE)
 	help
 	  FPGA manager driver support for the Intel Stratix10 SoC.
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 4171c6f76385..b1e8efa16166 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -183,7 +183,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
