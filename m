Return-Path: <SRS0=tCWR=IJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E623C433E6
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 15:27:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D219364FAB; Thu, 11 Mar 2021 15:27:31 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E77E64E59
	for <soc@kernel.org>; Thu, 11 Mar 2021 15:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E77E64E59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-lj1-f199.google.com ([209.85.208.199])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lKNDm-0005YZ-6A
	for soc@kernel.org; Thu, 11 Mar 2021 15:27:30 +0000
Received: by mail-lj1-f199.google.com with SMTP id h20so8646005lji.21
        for <soc@kernel.org>; Thu, 11 Mar 2021 07:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3UhGLxhWacdcsSpVsIOhi7iq++tfBdPJwQmfZFh1zw=;
        b=MId0tVEEXiUL5UpGQ8NMCuQ/7gNlsvC3qnvF0LRf0RyER1HQoHgw7P/08inkPibFzd
         rNt8l7JKg7ezux6Tq53ebWcpTravbD/aOoFk7RegBXD+B3bElWds7ZRy+gUqqjIdEyU1
         ftIfJrMR08FUBXmTS8vefkSM9vAfkItbUeeoeUcRkNl1V3qGXRmnU+vx5GmRIRxpKrEQ
         PMhDoW8y3at2nTp7BiLKYyFVpRF+c7kP9pbebkf3x++N09pA82tzIHZwtPcSB25AKobM
         ZyLKe+BEQm/FwVYDm0gWtVkKAYWf4TP1dwK9L/l0M1IdYbZmfFT2QGXJ2i3D0Oo06vYb
         LS9w==
X-Gm-Message-State: AOAM5316+08oRXS2I+mXX423kjLLooLfvj9GgjXdxUSulawp5PbGTAP3
	OZ97Hah+l06SCoUbCv0qgSNcAVk6uZvGaJrvZ9GenJazDyS8ZPj+nPsC2LnfuX1cNPJRWSPG7JT
	mJEayVleYTui3f+virS3oFZI=
X-Received: by 2002:a05:6402:1103:: with SMTP id u3mr8916754edv.205.1615476439291;
        Thu, 11 Mar 2021 07:27:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykFYMegR7g3sofzBC+1YkJVaDapoNS+bRGUtFV8/I7aVJB5VDHjlbA8PWaxRhm9KLVG244sg==
X-Received: by 2002:a05:6402:1103:: with SMTP id u3mr8916710edv.205.1615476439104;
        Thu, 11 Mar 2021 07:27:19 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id yk8sm1445697ejb.123.2021.03.11.07.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:27:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Lee Jones <lee.jones@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 10/15] clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs (and compile test)
Date: Thu, 11 Mar 2021 16:27:15 +0100
Message-Id: <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
32-bit ARM drivers to rely on new symbol.

There is little point to share clock controller drivers between 32-bit
and 64-bit platforms because there will not be a generic image for both
of them.  Therefore add a new Kconfig entry for building 32-bit clock
driverss, similar to one for 64-bit.  This allows enabling compile
testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/socfpga/Kconfig  | 6 +++++-
 drivers/clk/socfpga/Makefile | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index b62ede8cad01..0cf16b894efb 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -4,10 +4,14 @@ config CLK_INTEL_SOCFPGA
 	default ARCH_INTEL_SOCFPGA
 	help
 	  Support for the clock controllers present on Intel SoCFPGA and eASIC
-	  devices like Stratix 10, Agilex and N5X eASIC.
+	  devices like Aria, Cyclone, Stratix 10, Agilex and N5X eASIC.
 
 if CLK_INTEL_SOCFPGA
 
+config CLK_INTEL_SOCFPGA32
+	bool "Intel Aria / Cyclone clock controller support" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
+	default ARM && ARCH_INTEL_SOCFPGA
+
 config CLK_INTEL_SOCFPGA64
 	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
 	default ARM64 && ARCH_INTEL_SOCFPGA
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index ebd3538d12de..e8dfce339c91 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
-obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
+obj-$(CONFIG_CLK_INTEL_SOCFPGA32) += clk.o clk-gate.o clk-pll.o clk-periph.o \
+				     clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
 obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
 				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
 				     clk-agilex.o
-- 
2.25.1

