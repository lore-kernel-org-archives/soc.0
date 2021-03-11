Return-Path: <SRS0=tCWR=IJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77F0C433DB
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 15:25:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74DBD64FD6; Thu, 11 Mar 2021 15:25:57 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A59B64FEC
	for <soc@kernel.org>; Thu, 11 Mar 2021 15:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A59B64FEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f71.google.com ([209.85.208.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lKNCF-0004nc-0S
	for soc@kernel.org; Thu, 11 Mar 2021 15:25:55 +0000
Received: by mail-ed1-f71.google.com with SMTP id f9so5732560edd.13
        for <soc@kernel.org>; Thu, 11 Mar 2021 07:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JtLWGKzddsZdneeyVDqkoKKRKkrCkmXH8NCFoh7fPmQ=;
        b=NIl12Rz24NW/dlPBNAlfJrjF/TH7rw7IqXSgEtXtx+5weV8aIYthvnJEFf5MjPcwWH
         vFOMLn6VCQ/fiAHADpzqwB2sr0wljxnOGAL2G/NeZjigQzgBWMYhsFtl+x22ebzbOiDB
         prrrTw1qQoCaRLojmZjfiOYisEHqtd5uzVO4ahR8oI/GIzSBFSypteroS0BPfNd8wnj2
         xHIAqtjxdTUUcZWtig76rd8heVCbtUzdEplrvrQbAlMNr8RvK2ep0ZadFcNkVQuI5eon
         A8/4GIHK45ZQFNPXOCo/JGC9r8TDYKs3ysxQ0xmD4aWddasFx8mdtMfDGFunJv9lbLCA
         NUCQ==
X-Gm-Message-State: AOAM530l6wjoksexF7mZeqLO2XkIQWOBppGisJF/aEs+T9CRXSnUX3lI
	3MZKDWuUR7dciiCg25JBBsMFpgCdDNg2t5Jn1svSz6SDoX36ZwThN6IvgW3z5u+J4Mh+XO8iXVw
	xcKXRiMKhgKoNbPRtQIhyzK4=
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr3657257ejb.510.1615476354695;
        Thu, 11 Mar 2021 07:25:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGGDs0d4jf9iY6zfDpEMPiHECUlKXPHLkk7gQWMVmAU9DMsqo4KBX6VOy9u5EuqygNiPRNmA==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr3657235ejb.510.1615476354507;
        Thu, 11 Mar 2021 07:25:54 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:25:54 -0800 (PST)
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
Subject: [PATCH v3 03/15] mfd: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
Date: Thu, 11 Mar 2021 16:25:33 +0100
Message-Id: <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

The side effect is that the MFD_ALTERA_A10SR will now be available for
both 32-bit and 64-bit Intel SoCFPGA, even though it is used only for
32-bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a03de3f7a8ed..8af8c3196f1d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -21,7 +21,7 @@ config MFD_CS5535
 
 config MFD_ALTERA_A10SR
 	bool "Altera Arria10 DevKit System Resource chip"
-	depends on ARCH_SOCFPGA && SPI_MASTER=y && OF
+	depends on ARCH_INTEL_SOCFPGA && SPI_MASTER=y && OF
 	select REGMAP_SPI
 	select MFD_CORE
 	help
@@ -32,7 +32,7 @@ config MFD_ALTERA_A10SR
 
 config MFD_ALTERA_SYSMGR
 	bool "Altera SOCFPGA System Manager"
-	depends on (ARCH_SOCFPGA || ARCH_STRATIX10) && OF
+	depends on ARCH_INTEL_SOCFPGA && OF
 	select MFD_SYSCON
 	help
 	  Select this to get System Manager support for all Altera branded
-- 
2.25.1

