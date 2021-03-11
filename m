Return-Path: <SRS0=tCWR=IJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E44BC433E6
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 15:27:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C216564FF7; Thu, 11 Mar 2021 15:27:56 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BD264FAB
	for <soc@kernel.org>; Thu, 11 Mar 2021 15:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BD264FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ej1-f71.google.com ([209.85.218.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lKNE9-0005o8-Um
	for soc@kernel.org; Thu, 11 Mar 2021 15:27:55 +0000
Received: by mail-ej1-f71.google.com with SMTP id jo6so8818629ejb.13
        for <soc@kernel.org>; Thu, 11 Mar 2021 07:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RBN1O3Wcnz1uvA/bXXgFQO/02vpYiyGG/6WCSqIa6KY=;
        b=aAssOjCqAHnQmrBLdOSPb6KReZDtXwqL6VFOZRe25WvNCZbTZnWxPzCuW6S9uQsDVU
         T5L9iVKHrQ8ukJ39cLxHcL9P+GFwDbQOSPvwMIV+tiFxf/aXseWI5FtKtcfKJpfjgS6K
         gK+IcMBv0H74tnMFVoJ7GY75ceL+QTUPep6u0XMPw7uzBZGh3jXF5+DYk5MqEo+JJevd
         aoCald3hnvPQdzxRPW5hauZfzmwFCcayYriaeIyl2htbwgQT2L3r8ijsCHd3p88Eg+J0
         5y/h/zUStFyG9QMLrT+tij+QsdmUpHP9gFx84MFLOAfv//ImqREg3v5D8WxWyyyqfDVF
         h+mw==
X-Gm-Message-State: AOAM533EdCnhqLBNQd6sDHdxB6jKkXwvWy2mYiktR1SQfZuoM3CNbbb2
	So0l7wXuXvZVqbbtm/ko2JhEVwRsY1M+PBMrtY9dImVGK0bcWS/P+vM+kVIZAFeuIWPz9USsMoJ
	/rUypURvBYTAl5wIXnxF4Ais=
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr9145618edd.103.1615476463285;
        Thu, 11 Mar 2021 07:27:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzftQgQhm6JCnX7NkcREdfHxQ79cH5j2A8F4fhogge3Hb8YjiFCimex/EvBlWPVnkSsMSMXPQ==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr9145573edd.103.1615476463167;
        Thu, 11 Mar 2021 07:27:43 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id k9sm1567062edn.68.2021.03.11.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:27:42 -0800 (PST)
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
Subject: [PATCH v3 14/15] reset: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
Date: Thu, 11 Mar 2021 16:27:41 +0100
Message-Id: <20210311152741.1318599-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
32-bit ARM drivers to rely on new symbol.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index b1e8efa16166..7043c7f6dcf0 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -205,8 +205,8 @@ config RESET_STM32MP157
 	  This enables the RCC reset controller driver for STM32 MPUs.
 
 config RESET_SOCFPGA
-	bool "SoCFPGA Reset Driver" if COMPILE_TEST && !ARCH_SOCFPGA
-	default ARCH_SOCFPGA
+	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
+	default ARM && ARCH_INTEL_SOCFPGA
 	select RESET_SIMPLE
 	help
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
-- 
2.25.1

