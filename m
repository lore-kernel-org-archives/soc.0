Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC7FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:31:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6728560233
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6728560233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gSbdbfptTCXAEUbFrRjCDoD6mDBk6D9soLJXHmEPESw=; b=crTFjHKJpIr2b/URspmn3Fpmg
	6hYUIwmAaHBPeADiUcrJhDOSkHyul51OSx+h5pC1zedQ9uOdHU0ZZ1TF/7LHbC9/5zumlgKMs3gJj
	rooYq04UGR+x/62COZ5AH8KgNMIT7yazjC05qGub8AC4/5+KgM5a/F+GLaK4yiPX+XQ+p106F0sPh
	FmbLaAvmO9wepM0W80wYyGl7KObdDxGnydtTrzA1zCMmPp/A622RZicoYfA2ULVCzWYAjFPtgTLT9
	3m8EXTvzjolyCb6G+FShJ24lAlOOUtDhnRmrgvSg877amuGE8QQjgI+RT0qNJlQkeUUOj8EfDJMSJ
	VW5jXqI5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNFf-009RbG-G2; Thu, 11 Mar 2021 15:29:27 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNE4-009Qqw-Fn
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:51 +0000
Received: from mail-lj1-f197.google.com ([209.85.208.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNE4-0005k9-0i
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:48 +0000
Received: by mail-lj1-f197.google.com with SMTP id l8so8724094ljc.14
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xL1edBPIXb5EtPx7dtqi4BTArR+ixt/89Ez9ALjb7AY=;
 b=ky/VLqx5vbiSINf0lnfJ3uQktWvDPg9+ECCE2dPNjknsuf1i7Tr02w9AkGpZh3/r/E
 OZzbJOZq8F6SQKqiQqkztWZ4C4uY0azaFcQsPT3FaGGhsCqpFRP3RVYZXZJpw4MEELAf
 RqkxptccxGNE9bViCcG7xslHIMPVtjZp562jiINgzhWWGc0pr8jerQvrWQg+oPt9NgCQ
 qsoV0863fD+JFR/vQeXsEUfVp6Ksy9/MaVjjC9wyZ3aH6wQgakkZw9jdyeibET2F3V59
 wdaONszOcsyYKRVeWQeApD09KGEKk8u4LW1bJqhfTHqKACTS3oDJrFIAYYIZc/Cm7yz7
 bcQw==
X-Gm-Message-State: AOAM531wkrqw+uSm0tf70sBwEU1gmt1KJ9fPHbLu9QHegjjr3fidFvth
 T9Y492FwU1qL/63JSZk/B2CxMw5FfImo1hclU2HUdwhsOhVBJDm5qovmQ2G2Awl3SkX533EO4RA
 CQ1fmvoIJw8wOPkG9iAek2rXRoihIJ7ntIjlPjusmpFCPX5XdfQXb
X-Received: by 2002:a05:6402:10c8:: with SMTP id
 p8mr8958396edu.144.1615476457314; 
 Thu, 11 Mar 2021 07:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwym688lccoWS0vQKon5fsVW74N9HWG5xLsZvi1pg+uqrC83DObGrD7/MK6ibsjBN6gGqRDFQ==
X-Received: by 2002:a05:6402:10c8:: with SMTP id
 p8mr8958352edu.144.1615476457175; 
 Thu, 11 Mar 2021 07:27:37 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id eo22sm1528960ejc.0.2021.03.11.07.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:27:36 -0800 (PST)
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
Subject: [PATCH v3 12/15] fpga: altera: use ARCH_INTEL_SOCFPGA also for 32-bit
 ARM SoCs
Date: Thu, 11 Mar 2021 16:27:35 +0100
Message-ID: <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152750_045604_FFDB2727 
X-CRM114-Status: GOOD (  16.03  )
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
Message-ID: <20210311152735.qQ5vLaryamAIyrNwSKTMUWc_nrrcCw7m3ZtpMQZCai8@z>

ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
32-bit ARM drivers to rely on new symbol.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/fpga/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index fd325e9c5ce6..b1026c6fb119 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -14,13 +14,13 @@ if FPGA
 
 config FPGA_MGR_SOCFPGA
 	tristate "Altera SOCFPGA FPGA Manager"
-	depends on ARCH_SOCFPGA || COMPILE_TEST
+	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
 	help
 	  FPGA manager driver support for Altera SOCFPGA.
 
 config FPGA_MGR_SOCFPGA_A10
 	tristate "Altera SoCFPGA Arria10"
-	depends on ARCH_SOCFPGA || COMPILE_TEST
+	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  FPGA manager driver support for Altera Arria10 SoCFPGA.
@@ -99,7 +99,7 @@ config FPGA_BRIDGE
 
 config SOCFPGA_FPGA_BRIDGE
 	tristate "Altera SoCFPGA FPGA Bridges"
-	depends on ARCH_SOCFPGA && FPGA_BRIDGE
+	depends on ARCH_INTEL_SOCFPGA && FPGA_BRIDGE
 	help
 	  Say Y to enable drivers for FPGA bridges for Altera SOCFPGA
 	  devices.
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
