Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D795CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 08:40:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482B164FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 08:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482B164FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L1sRHmy57AyxTXaDn36zl3l8NdQccnxTrHws6GuKwA8=; b=QTKKecEcHS/LhuNEXe/T/Ckao
	H+CDSrF3JQi2HocNBiDDFMmrsMSZH7gqw17HeeDAqFv0xvLmx+I/ViMWKvXXhtSFQp8MI89C9AnwJ
	0XTK1mIn6IwY5eQ3IzcAYWuLIhWx4fKKLT3fxVe9azqBaGWS7d661RX5OcO0E18bKrYYiSElS3S/4
	OzmpC9xA0lmp+CPEImoIUyoo31dNRbhsVvHMap+pbmTtZu2d025wvE7KMV1QZfcNZTxBSJGDZUh4r
	XdsjIeEqnov0I1RIX/ytUP3A/YDoVrXtLNtcDb93t2goiV6umzUeZoQZZ7RNQiO96x0qTf2iabU1J
	MRwxYMQXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJuN1-006JgV-QO; Wed, 10 Mar 2021 08:39:07 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJuMo-006Jec-Ad
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 08:38:56 +0000
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lJuMn-0003kr-Uv
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 08:38:54 +0000
Received: by mail-lj1-f200.google.com with SMTP id f28so6829358ljo.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 00:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWUlJm1h/cD+o2JnnbxCTfx8shPW082WTgFnXFEhHuE=;
 b=SOcG5oPbttmBxIQSYQNX+j8RszfEmw+JY81riLPHdT23+3SGV/E9ii8U9XIKJnWHto
 nXz7/EGnMMPsb0v4mLY76QjF3Nwrm4n2b9PkY09RnTb/TwcekgTk6DxEWGtjEVlh6HS7
 8fLxNnXVaUdbuX7sl+sEmYxpcrBQ8Rec3U+9BmB4362Eeg3zayeey1IR2nrI9N2ybjxA
 5S93hhMeJpn2DkXasD6vKWz5zmR0Xh4hs30wj99bOEsYmNCrbCvMJZ7oLMa4EaAtRO7O
 bQj4vfNm3y2G0ruaeGT252eUBLwLEIBsyFTOT7FmZ2v4Gawcx2vlTIFhFlJYJlrc0UDe
 6o3A==
X-Gm-Message-State: AOAM532JlQMz77BEBKwyhyKOC6frCGhzonPu9Dnhor4Gfxk+aG5Hhqxu
 OY3QJrkGv9Gov3cQ/caW60arsv05Z97P8aKB07mTCD6yPWvnOYuANWl1fPzqAHrdpEzL7vHwBxU
 vARC/NuglOCqP7Z2+/g4cHj8VcRUPFSnFSHUvj0Ld2CIHkTImXbZb
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr2331484wrx.154.1615365532718; 
 Wed, 10 Mar 2021 00:38:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyownReKaTZMWbHVmMbUowjv9w6MYTu6DR7rPD+40lY/aAL94Jldh5Hc3FANVrWuTp5YYmT+A==
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr2331462wrx.154.1615365532595; 
 Wed, 10 Mar 2021 00:38:52 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id u20sm32781061wru.6.2021.03.10.00.38.51
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
Subject: [RFC v2 5/5] clk: socfpga: allow compile testing of Stratix 10 /
 Agilex clocks
Date: Wed, 10 Mar 2021 09:38:39 +0100
Message-ID: <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_083854_430057_E502CB9A 
X-CRM114-Status: GOOD (  15.91  )
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
Message-ID: <20210310083839.sdjYgeEYZfZFXtX5Rv60tZdqbLG9z6-3_pv8eOlUqek@z>

The Stratix 10 / Agilex / N5X clocks do not use anything other than OF
or COMMON_CLK so they should be compile testable on most of the
platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Makefile        |  5 +----
 drivers/clk/socfpga/Kconfig | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e34457539edf..9b582b3fca34 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -104,10 +104,7 @@ obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
-obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
-obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
-obj-$(CONFIG_ARCH_N5X)			+= socfpga/
-obj-$(CONFIG_ARCH_SOCFPGA64)		+= socfpga/
+obj-y					+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index 834797c68cb2..fb93b7cede27 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -1,6 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
+config COMMON_CLK_SOCFPGA
+	bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_SOCFPGA && !ARCH_SOCFPGA64
+	depends on ARCH_SOCFPGA || ARCH_SOCFPGA64 || COMPILE_TEST
+	default y if ARCH_SOCFPGA || ARCH_SOCFPGA64
+	help
+	  Support for the clock controllers present on Intel SoCFPGA and eASIC
+	  devices like Stratix 10, Agilex and N5X eASIC.
+
+if COMMON_CLK_SOCFPGA
+
 config COMMON_CLK_SOCFPGA64
-	bool
-	# Intel Stratix / Agilex / N5X clock controller support
+	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && !ARCH_SOCFPGA64
 	default y if ARCH_SOCFPGA64
-	depends on ARCH_SOCFPGA64
+	depends on ARCH_SOCFPGA64 || COMPILE_TEST
+
+endif # COMMON_CLK_SOCFPGA
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
