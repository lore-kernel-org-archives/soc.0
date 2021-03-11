Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05567C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:30:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706FE64E3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706FE64E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/1SzDhlP4n0s8O78JIDfCA2wO1VinPYS4uHBygXwO54=; b=SogRFQDrHSw/8dxkVcruYt9oQ
	VZVUEpqjE5RLT42y3XmnpECxt2Ew8UEqSH39zwOUXJ9oH6cBFlaQ3U31ntUoEZxmWil910yVe9ts7
	sTpIvcMrix/ssLFbGXUxqgnCN6S/A/RnnWTULw3Py2C47/AMXh6hKlsJ+5s31wVg/aoJjwkTNspdx
	QbY1n/C+Ruk3zV1KGRdqJ5Cek8dwvH/7cl5mehdcWocgi3rMNnzhziD8UAC5Ber1NiGvISaoKmxnC
	IcXIjqe5/CLGbV3wYO1TuhuZTIkqIuY2ph4tiRjdoViQFxTOd54oNG/psof2JIRJ/pJCPUGDpehbL
	DpfnccvZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNEX-009R43-FT; Thu, 11 Mar 2021 15:28:17 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNDc-009Qed-LS
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:24 +0000
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNDb-0005TX-Pu
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:19 +0000
Received: by mail-ed1-f72.google.com with SMTP id w18so7257573edu.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3UhGLxhWacdcsSpVsIOhi7iq++tfBdPJwQmfZFh1zw=;
 b=rgrRtnb/i+oVOrztItwvinFf0OF/S2wsAX03Qw0/tegndcFTIqVQHc2oq4i59f/mCG
 Ymb4LZiLOXni4UfgKR7RibxpfrT3xt+bwEJg0Rce3V//dem2Ffh2O0rzbBNh2ZnPYdGa
 +nkb+I+ERlvI78JeHNEMKds41OeybLlWGdenIyqeyKeJVjiFh8E8PkNJrVtUfRUTWoeh
 4G+MOY+OMyAOj2T68kAkI2A4Py7PWRBEVVoIN8emkMyyk1d1o7mE5JMpoDvbib2yv/Qc
 B4eNFLOEE1JhQ7h97wewPffv1fSZOb5cwCmC+JKn/6zYYTr60HzgIBLJzbtWvVLQYKrP
 LwfA==
X-Gm-Message-State: AOAM532GMrDX6u7uIujC5u9vWpd2oaB6fTg2k1c8HQDRO9e0IOaWErOv
 hhM3CCzILgcRXw4Q1yRIhNn7/ptvsdg/vtW/MuYCUJB9dz50aQ5JEh/EvcoCk/soogo/mEMvCal
 Y6yLP0wPgbwsEP8JUFk6iVo2rpVsRW/r6qVOqzQdPNlEAjtWHnpOh
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr8916740edv.205.1615476439291; 
 Thu, 11 Mar 2021 07:27:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykFYMegR7g3sofzBC+1YkJVaDapoNS+bRGUtFV8/I7aVJB5VDHjlbA8PWaxRhm9KLVG244sg==
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr8916710edv.205.1615476439104; 
 Thu, 11 Mar 2021 07:27:19 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id yk8sm1445697ejb.123.2021.03.11.07.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:27:18 -0800 (PST)
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
Subject: [PATCH v3 10/15] clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit
 ARM SoCs (and compile test)
Date: Thu, 11 Mar 2021 16:27:15 +0100
Message-ID: <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152722_839912_A34D7B4B 
X-CRM114-Status: GOOD (  17.66  )
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
Message-ID: <20210311152715.hfglRCzJL_plaR72KfbbBS-1j08ZAL6g57xMRNzEjbg@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
