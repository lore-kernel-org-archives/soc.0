Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25A1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F5164FAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F5164FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tkTZbRPCAz6JqPmhDu90pIVzHEOTwysL5PS7rxpHpVM=; b=mwdSNxRvmK4IYU4XHyv6wFfBk
	2aOvUu0Xp7IdJKguEFWmkXLKejIPRX2YttqYe9aRGcZ80tFVcMAFwOHl9yOkbcRATcUvCz4xjSwXD
	qwJNU8YNaqVXvpjfLgReyCrHc93XKnn+Jp6OyXcYNh6+V0qbh+5xQgT3CDby6c3pEANk4TyV+n16W
	5DXe0/9tdgrz3bBOVwaJwcHKMXUlgMV9QeSSRnws+SmBvzDOB2YVjbEtr36+lZ/Et5h2L9fpfr2WQ
	t0nb6/a1ChGuwwCeik8+IFdKoz488OyL0F7JIG+QmBmpemg0/GAf0dTMHu3ZR2OQ+kLsPOtVoBCfX
	xqWyrg0EQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNCe-009QJw-Si; Thu, 11 Mar 2021 15:26:21 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNCE-009QFF-RA
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:57 +0000
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCD-0004mG-S9
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:54 +0000
Received: by mail-ed1-f70.google.com with SMTP id h2so10008333edw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WNNBQoeYbiaXwIioLMfeHDmEpvN4s0z+f2iELsIEM3g=;
 b=oXCfS3TP5sKXbr87tSj+sV47Ano9Rderro5Pk4VCt9VQAdIf40WLL4KqGR7XBo4Zuj
 iDZ7snSqW22rZNoqFBnXuZaw6okAqNUA5R8SqNW8BHfTGjUBRJvz7ezTyQCbp0hRmQDC
 icVc62T6f2/1hXptOP8bQ/poihMSrtsgZ17mLuLbkCTEW/X44T8TyWLBifFd+IP50QIq
 /3b716vxtZLZ1JuTY8Ph9RVEC7l/nHf7dBvB/HyUhrAY1MOvi298+Cmy+wn1/ExWBq+2
 33HTJ5c6gAww+E/IUizv6qDh5yk2XuIn1bjO6+H4kgDUJHsmwZFrcDsiyArKRWZCztKD
 cCEg==
X-Gm-Message-State: AOAM530o/TnbYhfXl3cW/o3vr4JZa10wXge1VwojAae5h499VsreFKs0
 ehOKpG1RU0qA6sdlgRVD0GmphxRLPLLTOqIVxNReACCNrx5ym3sr3gmzuE3BSgcl5R7NmhLRGWP
 7FbK46OhacQJOW379U2b6NIMogvqNzarsBx807BiY69w+xZdOH/5r
X-Received: by 2002:a05:6402:2215:: with SMTP id
 cq21mr9274791edb.281.1615476353415; 
 Thu, 11 Mar 2021 07:25:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz84GEivsrxMtPNo4w3XJQXVZ55xsq/2JYDwU24XYid3WZpGznITM5djSJ6+HC1Qzj5FYXbTw==
X-Received: by 2002:a05:6402:2215:: with SMTP id
 cq21mr9274760edb.281.1615476353246; 
 Thu, 11 Mar 2021 07:25:53 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:52 -0800 (PST)
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
Subject: [PATCH v3 02/15] ARM: socfpga: introduce common ARCH_INTEL_SOCFPGA
Date: Thu, 11 Mar 2021 16:25:32 +0100
Message-ID: <20210311152545.1317581-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152554_943247_E4FFD2F4 
X-CRM114-Status: GOOD (  17.89  )
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
Message-ID: <20210311152532.0D0sDpYUTawGEYZXlFRkeHUymp8e8_oOxgS_zYcrdUk@z>

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Kconfig.debug              | 6 +++---
 arch/arm/Makefile                   | 2 +-
 arch/arm/boot/dts/Makefile          | 2 +-
 arch/arm/mach-socfpga/Kconfig       | 4 ++++
 arch/arm64/Kconfig.platforms        | 4 ++++
 arch/arm64/boot/dts/altera/Makefile | 2 +-
 7 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 853aab5ab327..37f94cf0cfdb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1320,7 +1320,7 @@ config ARM_PSCI
 # selected platforms.
 config ARCH_NR_GPIO
 	int
-	default 2048 if ARCH_SOCFPGA
+	default 2048 if ARCH_INTEL_SOCFPGA
 	default 1024 if ARCH_BRCMSTB || ARCH_RENESAS || ARCH_TEGRA || \
 		ARCH_ZYNQ || ARCH_ASPEED
 	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 9e0b5e7f12af..36016497b1b3 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1087,7 +1087,7 @@ choice
 		  on SD5203 UART.
 
 	config DEBUG_SOCFPGA_UART0
-		depends on ARCH_SOCFPGA
+		depends on ARCH_INTEL_SOCFPGA
 		bool "Use SOCFPGA UART0 for low-level debug"
 		select DEBUG_UART_8250
 		help
@@ -1095,7 +1095,7 @@ choice
 		  on SOCFPGA(Cyclone 5 and Arria 5) based platforms.
 
 	config DEBUG_SOCFPGA_ARRIA10_UART1
-		depends on ARCH_SOCFPGA
+		depends on ARCH_INTEL_SOCFPGA
 		bool "Use SOCFPGA Arria10 UART1 for low-level debug"
 		select DEBUG_UART_8250
 		help
@@ -1103,7 +1103,7 @@ choice
 		  on SOCFPGA(Arria 10) based platforms.
 
 	config DEBUG_SOCFPGA_CYCLONE5_UART1
-		depends on ARCH_SOCFPGA
+		depends on ARCH_INTEL_SOCFPGA
 		bool "Use SOCFPGA Cyclone 5 UART1 for low-level debug"
 		select DEBUG_UART_8250
 		help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index dad5502ecc28..415c3514573a 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -209,7 +209,7 @@ machine-$(CONFIG_PLAT_SAMSUNG)		+= s3c
 machine-$(CONFIG_ARCH_S5PV210)		+= s5pv210
 machine-$(CONFIG_ARCH_SA1100)		+= sa1100
 machine-$(CONFIG_ARCH_RENESAS)	 	+= shmobile
-machine-$(CONFIG_ARCH_SOCFPGA)		+= socfpga
+machine-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga
 machine-$(CONFIG_ARCH_STI)		+= sti
 machine-$(CONFIG_ARCH_STM32)		+= stm32
 machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 53b6e06bf19a..fe8f7c349f1d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1033,7 +1033,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
 	s5pv210-smdkc110.dtb \
 	s5pv210-smdkv210.dtb \
 	s5pv210-torbreck.dtb
-dtb-$(CONFIG_ARCH_SOCFPGA) += \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index c3bb68d57cea..e43ed0ca6860 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -2,6 +2,7 @@
 menuconfig ARCH_SOCFPGA
 	bool "Altera SOCFPGA family"
 	depends on ARCH_MULTI_V7
+	select ARCH_INTEL_SOCFPGA
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
@@ -20,6 +21,9 @@ menuconfig ARCH_SOCFPGA
 	select PL310_ERRATA_769419
 
 if ARCH_SOCFPGA
+config ARCH_INTEL_SOCFPGA
+	bool
+
 config SOCFPGA_SUSPEND
 	bool "Suspend to RAM on SOCFPGA"
 	help
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cdfd5fed457f..ecab67a1afb8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -256,9 +256,13 @@ config ARCH_SEATTLE
 
 config ARCH_STRATIX10
 	bool "Altera's Stratix 10 SoCFPGA Family"
+	select ARCH_INTEL_SOCFPGA
 	help
 	  This enables support for Altera's Stratix 10 SoCFPGA Family.
 
+config ARCH_INTEL_SOCFPGA
+	bool
+
 config ARCH_SYNQUACER
 	bool "Socionext SynQuacer SoC Family"
 
diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 10119c7ab437..4db83fbeb115 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_STRATIX10) += socfpga_stratix10_socdk.dtb \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
 				socfpga_stratix10_socdk_nand.dtb
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
