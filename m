Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7F2C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F91F64FA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F91F64FA6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4W8E6DDJbygvI2/TzOSFnej9aLcytORdV1CMDOlhQsY=; b=PhI/odJMcTYQBZcknV3VL2jxt
	BQFxTV3QXUjBvQ0GLlxRelbAjNd9qJ7UTw9uh86ualpHBIt8/+sd6EmvLkl4vvoylJbeCoZZdvpp7
	oGhOislB/FCjFELDQ4e598MRKJYNzJXB4IOkf9zk5dvhqY8hwwoEGy6nQD6Ki0EN8Ux2UlO/iYJ3p
	1l9YijfwytRLJtlObjyXhpeTx2KwT0S8xhf4wkg03wc+qMrcumkpv62vPeRiVRwPJLgACV9XT8hDB
	kKFBFfmMKJ3th7LnL5h7IH2lf8tglGVWFy3zs7z12ML4fmAinZwBXXoUbulVnIY4/IHzuTVaP7kCk
	/a66PbtSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNCw-009QNM-Gm; Thu, 11 Mar 2021 15:26:38 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNCH-009QGK-J2
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:59 +0000
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCG-0004pr-W2
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:57 +0000
Received: by mail-ej1-f72.google.com with SMTP id t21so880641ejf.14
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqBtdrPZUrIr273DOWXhTiFtzvKiycYDoohgxVay2ig=;
 b=jnxJVF7TQLEqTEm/+erfLSfYdVjd3g7y/hCTFK86Pim49bl0DkJvy3qS0N51nqqGmO
 oi58iNx8Bn3IhBwu+jqinndsReio81RfCI4B3WTuJcwrITY3135IQh0hfOa19HSDuh/Z
 A6vjK1Rt0kWpTU3ZWD2feNehKcqLjHL2FIhwY78iMvi5wVtBqnGF7HZldvOlt7wFDu6e
 VnMg3Ss1t7IGHrtPae+dIhOSyV8yvaeMbkmU3P0PyZ6m9CCWEh0btwFpwJnxBxBp305q
 45upSB3VcKGaB4xdb2FKpjlffR9PQ97oZrgPSh5D3f0KL/JY786OzbcU2pUU1O8awb45
 7Ebw==
X-Gm-Message-State: AOAM533UIVSgo19c/GTEqyJc/kQiTd2V3DzwxFp/+LlrJ6qgkfrovfpx
 JPeu6c2oQt9tI9F/ayVOYn1QpOsQr3Ftc6K9esfTepuANcwXfVWirRX723tKzWU6Nryr5E5xQ5h
 d39wFb1LxqxDLPaPDSD9LIcgyL2RElCYhEPNPEPlHFlCV/o+DeF10
X-Received: by 2002:a17:906:3e92:: with SMTP id
 a18mr3481195ejj.95.1615476356733; 
 Thu, 11 Mar 2021 07:25:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBK+qKCuhZ0F3r9CfvieGjxQ0hczqfyfgEN1oKXCTHk7Irl87ZJGZ5ydURk3A6P7WXhh1OmQ==
X-Received: by 2002:a17:906:3e92:: with SMTP id
 a18mr3481161ejj.95.1615476356529; 
 Thu, 11 Mar 2021 07:25:56 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:56 -0800 (PST)
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
Subject: [PATCH v3 05/15] clk: socfpga: build together Stratix 10,
 Agilex and N5X clock drivers
Date: Thu, 11 Mar 2021 16:25:35 +0100
Message-ID: <20210311152545.1317581-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152557_851992_DDF4096B 
X-CRM114-Status: GOOD (  15.58  )
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
Message-ID: <20210311152535.Bdi3t9bdFI2VRhmhTxKiWf5V0xlaXnw2s0yov48nPlI@z>

On a multiplatform kernel there is little benefit in splitting each
clock driver per platform because space savings are minimal.  Such split
also complicates the code, especially after adding compile testing.

Build all arm64 Intel SoCFPGA clocks together with one entry in
Makefile.  This also removed duplicated line in the Makefile (selecting
common part of clocks per platform).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/socfpga/Kconfig  | 6 +++---
 drivers/clk/socfpga/Makefile | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index 3c30617169bf..bc102e0f0be0 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config CLK_INTEL_SOCFPGA64
 	bool
-	# Intel Agilex / N5X clock controller support
-	default (ARCH_AGILEX || ARCH_N5X)
-	depends on ARCH_AGILEX || ARCH_N5X
+	# Intel Stratix / Agilex / N5X clock controller support
+	default (ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10)
+	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index c6db8dd4ab35..ebd3538d12de 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
 obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
-obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
-obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
-obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-agilex.o
-obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
+obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
+				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
+				     clk-agilex.o
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
