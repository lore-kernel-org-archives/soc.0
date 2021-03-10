Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9E8C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 08:37:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C39364FC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 08:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C39364FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gVjGRuBrG+cHI2Xr38f48AsR/yVN1IIQStpFgdx4gnI=; b=My3pHuQh3hwTHUivHpq1NN6mu
	8CzLdVI1g4b7+lSghFGW/MTBMHhRtBuM1DqZ4/riQpY44Fk021k0VTQxfYvmAOlq6tBi8Us3tes/P
	8RbpmsySdnIGq3c7ryLeqGfDmNn2ppWOUCuT+bG5zaOXEdZHLS0kxIO27AqzQKll1Iwd2jLW71l9T
	Riukkmt6WGxx/aL0T15fAujSCNVawfXRnT26PD1b+JwDZhAdSFH4/kS25DVZiXzB9Z9ExPoOi1FvA
	IUGpxpzXCeZ3NcRJjx3+nZFMmF0BaSKYpSS9/pBb4M3dr7wXAnsyF9MKre+4ELoLMDjNlNcOBgkUY
	6RcYsPKxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJuKO-006JEi-Dw; Wed, 10 Mar 2021 08:36:24 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJuK9-006JDG-LU
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 08:36:13 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lJuK9-0003SL-B7
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 08:36:09 +0000
Received: by mail-wm1-f72.google.com with SMTP id n2so2355614wmi.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 00:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/6qc/RQ930gzKXWVvSB83Vp2NSZq1QHYNGd1Chw3/w=;
 b=OiHp35NC85NoN7sbf2u6F3Sdb2mh/kj4W4qlQp6FgUfb5Lw+1ds0xqAHmS/Sg1NQ1D
 7/+p6In5eSzsNqbPYJJdmMpoEIy7XLEAe/qJGRdEB0anfRXYBsiEduUkgXHv7a4XAPnH
 SF2KkrT6axuk2u5n3b9RLa92VCJ+TVe4GTI4AFFGAh3U07xkd1gjoWb4FZM02R6HZ4Xp
 /6l56eBcskpmG6p3X5PvuQ80UUxO5RIiLUIiq/ktyk186yDZe+A5Kfv0mqCnGNCGHIj4
 i8OVi8gbev6Q+L/P59lS/nxMtYeJr7P/JLvu8qAOt0KQW/xh2Ibwd0r3yAUOvSrhEIOh
 5F0g==
X-Gm-Message-State: AOAM5335xgRt8flI6OEDwofLe4LjIG1ntlmUByxYEQBwMD9wjm1Sx6u1
 t/HthhAAsTY+Fmy9+SajZi1VwtWTUzPbeMFlNtQaN5xSUgtVdP9yAINDJhtsDrYydVaP9kw9GZi
 5Ui+zmLNXDzBo/Ul6PPdc98LKyjr9WxLjpHp4dDFOCZZsmz3bSVHf
X-Received: by 2002:adf:e94a:: with SMTP id m10mr2234009wrn.55.1615365368471; 
 Wed, 10 Mar 2021 00:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEUpvv8HqbunwmpgW9dLuMjI8TkFCOSyoEzksFOj0CUbMMkau9T5AdEKH6IN5MAnbjxKn6TA==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr2233978wrn.55.1615365368280; 
 Wed, 10 Mar 2021 00:36:08 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id m17sm28675495wrx.92.2021.03.10.00.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 00:36:08 -0800 (PST)
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
Subject: [RFC v2 2/5] clk: socfpga: build together Stratix 10,
 Agilex and N5X clock drivers
Date: Wed, 10 Mar 2021 09:33:24 +0100
Message-ID: <20210310083327.480837-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_083612_239317_A1E5AF69 
X-CRM114-Status: GOOD (  15.02  )
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
Message-ID: <20210310083324.VBQjKRA8ll13i6aYIwz1LIkggSpXEmBBEhTa8pq6RKg@z>

On a multiplatform kernel there is little benefit in splitting each
clock driver per platform because space savings are minimal.  Such split
also complicates the code, especially after adding compile testing.

Build all arm64 Intel SoCFPGA clocks together with one entry in
Makefile.  This also removed duplicated line in the Makefile (selecting
common part of clocks per platform).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/socfpga/Kconfig  | 8 ++++----
 drivers/clk/socfpga/Makefile | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index cae6fd9fac64..7d4772faf93d 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-config COMMON_CLK_AGILEX
+config COMMON_CLK_SOCFPGA64
 	bool
-	# Intel Agilex / N5X clock controller support
-	default y if ARCH_AGILEX || ARCH_N5X
-	depends on ARCH_AGILEX || ARCH_N5X
+	# Intel Stratix / Agilex / N5X clock controller support
+	default y if ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
+	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index e3614f758184..0446240162cf 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
 obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
-obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
-obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
-obj-$(CONFIG_COMMON_CLK_AGILEX) += clk-agilex.o
-obj-$(CONFIG_COMMON_CLK_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
+obj-$(CONFIG_COMMON_CLK_SOCFPGA64) += clk-s10.o \
+				      clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
+				      clk-agilex.o
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
