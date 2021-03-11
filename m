Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D62CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:29:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E5DF60233
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E5DF60233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0HdhRJdVZqisFYnccSkviQoMUBwYFhpy3AUfPULtRtI=; b=dH+M6W+WkvusMqyOOwixfdfGj
	nf9YclJ66NFY04YhxK110TpAy/f+n+VnZq3SAL0bbd5t4ETCmD7m/Aq45A0jbW46CQxil3NRgnrup
	nEs7l8nBU/91xSToeGaq+6ruR25AMkvpJR7tTxuqOPkXXH/XCnshH5FsaiWRcOOCK8d4h/8yxgOwb
	VjsZRMQHLglPeYHEXICXaue9XWrRHOQLc+PjLWBEC8rci5UJHXOcvRfZw3QCHDDGIC86zp9xLNytx
	/DSaNFj/Ius05gIB5F8nGVY1fjhm2btQ3641De5vTjxshlFpId8TAnvWpb/ozUmLu0KcMF4nsOkZq
	BmzOCbbxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNDv-009Qmn-4l; Thu, 11 Mar 2021 15:27:39 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNDW-009Qa9-Cl
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:18 +0000
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNDV-0005Qc-VI
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:14 +0000
Received: by mail-ej1-f70.google.com with SMTP id gn30so8762425ejc.3
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIj5BtBwg8JC7nZHxIeVIntDKYdsgLPXWA5tG6HI5Ss=;
 b=Fk7vTxL1wVwwnb2xFFhgpia0IjgS/sAJphrHCee0KQ7wYGeacHJz7g27DCT8/DOJY9
 sQKP+tlsaewcCieSp3nkkE8X9xZ2g7Y31SwZFng3eu+iq2PYAWpwkZ8UezBhZqIh3x0y
 sG/oo9e+cfjDGsviSisBz3IUwTFf7mJMIxJ9aSu6RrA12NNVC5J+j47qgUx24cp2KZIm
 AgYd3xDomnedanakrqW6b+1FTqXMIzPNiw4welMFBTbKIvud1ZY9OHkTRSIRpf8RWiZj
 SQt8Fl/YpC35Lj5LjyHKFIfE6Z8cxqcbo6sb/uOiLx99jN0VzmU19cBz2XdrsM26Mq5o
 tidg==
X-Gm-Message-State: AOAM532GhInwlmM/KqoonIqatvnEUOWIRw3lONyJuqcNgY++z0hMBy4V
 FojABa8UPZLtmcUKjJe9kP+Miw3dl1ieiXBFoJXl4qpjEjuf14YN3HBmZO2q43y0WRFMbwLfkGG
 pKSpY4FW2vNCH7vsVp/3ZSOEPDDn8xqDxfeNa1cHt8i2Ej99Y3/na
X-Received: by 2002:a17:906:4150:: with SMTP id
 l16mr3692154ejk.90.1615476432202; 
 Thu, 11 Mar 2021 07:27:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ7WD9YIospDnRGiimdfWoLZHOrOz423wxHgF5hcMLCaCtoxrFxNCxImfeln4ju9bNe30G5A==
X-Received: by 2002:a17:906:4150:: with SMTP id
 l16mr3692120ejk.90.1615476431970; 
 Thu, 11 Mar 2021 07:27:11 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id y12sm1473148ejb.104.2021.03.11.07.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:27:11 -0800 (PST)
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
Subject: [PATCH v3 09/15] clk: socfpga: allow compile testing of Stratix 10 /
 Agilex clocks
Date: Thu, 11 Mar 2021 16:27:07 +0100
Message-ID: <20210311152707.1317791-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152716_031202_1C3D3E00 
X-CRM114-Status: GOOD (  16.38  )
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
Message-ID: <20210311152707.cO-eBOBPC5eyZbMT_VA5ZELqw6FwTc4udFu2XoVDjEs@z>

The Stratix 10 / Agilex / N5X clocks do not use anything other than OF
or COMMON_CLK so they should be compile testable on most of the
platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Makefile        |  2 +-
 drivers/clk/socfpga/Kconfig | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 96802294d35a..9b582b3fca34 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -104,7 +104,7 @@ obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
-obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
+obj-y					+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index b6c5b9737174..b62ede8cad01 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -1,6 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
+config CLK_INTEL_SOCFPGA
+	bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_INTEL_SOCFPGA
+	default ARCH_INTEL_SOCFPGA
+	help
+	  Support for the clock controllers present on Intel SoCFPGA and eASIC
+	  devices like Stratix 10, Agilex and N5X eASIC.
+
+if CLK_INTEL_SOCFPGA
+
 config CLK_INTEL_SOCFPGA64
-	bool
-	# Intel Stratix / Agilex / N5X clock controller support
+	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
 	default ARM64 && ARCH_INTEL_SOCFPGA
-	depends on ARM64 && ARCH_INTEL_SOCFPGA
+
+endif # CLK_INTEL_SOCFPGA
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
