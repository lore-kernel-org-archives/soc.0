Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEDCC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC96264FAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC96264FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LFGD8G/eTlA0MekldccTzM5HYtbSlLN4QBIoYazBke4=; b=pT4BARbf7TG/59SAJsHFjozpL
	vyd79/T91iu5JhEtkFF/23Lte3BpNHQqZXHrB16yrt/9pXJKVWK5qfa11yizkWK5pPjJBNZtdscLS
	n1Cu28sQAMWRHJwrkRFLTKTSL4K8egLI0KhuUP509UDeOKPrg/BfqbWhM58q183+4cKuAL1wzmyL+
	3D6346VYLBKNZetl+LMChbK+jlqFCvyVugPGz0s5kPUF17y7wBU/XUw6d36yXYWdfwBLLLpR+Raxd
	iUicsqtrPh+WyliIufwqedFqUToGp/WHzDM6U1tol3n6UKrd6z6XOQ8Walb4u+6V3NiOCYg4NsN9z
	REd3xa52g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNCm-009QLC-KD; Thu, 11 Mar 2021 15:26:28 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNCG-009QFZ-Bf
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:58 +0000
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCG-0004oq-0a
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:56 +0000
Received: by mail-ed1-f69.google.com with SMTP id p6so9995183edq.21
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seRfZbNnrbt83A3lqfbME46rdPLUXBuaJIJzFEroJqM=;
 b=LThNIwxwTJt64/8ylys6Srtm7XAL+buM9jeJHVfnf5J5tCX5nzSWLQq8NHxVay+sbF
 ey849M3znI9VvgbkUDKu1etcma/cv3TGMd3gMpAN8fO6CkZnC9A7PHtbKyJLmeoIa0aM
 oRvwiBj+IXOa3exEpj9uJ1HMnPLpRQl3OhxrqO79sMpBAecxhX8Ud+rca9WffRBL5OBF
 LEc4Xt2k/IOnctZ1gsBSksvZUJoyvpfz9Z9Y0BpSfmsy9KhOuFuao+nIr2OEHhWZXOyq
 W5TKpsGnKlBhEWOrfz5zcQw1oOfwGB9/qzM2c79wVrXDUOIsxkbjmder0DmKnqd83Xqe
 e/vA==
X-Gm-Message-State: AOAM532ia+G7iTeWgpLtTpJTzvX6Otp1wtd5+AMdIX/cKMuV5MgnoEdS
 jeaxzcbEqixjzBDVl7OxdN1RXT/B2S5lx7LlqteCdywU5Lm1vw0KaHtFMFBNXTxLCZswaXO9s4V
 vXIUHZ7YENDk+TmvPvquyTqg2cfVpx2PDdEDbaG5rCUbaoAy7VUc9
X-Received: by 2002:a17:906:2c44:: with SMTP id
 f4mr3504707ejh.508.1615476355780; 
 Thu, 11 Mar 2021 07:25:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyTATyAQcbeENIUwKOgFEFyZfkouzkosm1a5SyTcN6wlVTiKi+ARuyDQUI5aUuLLjUtpz6tg==
X-Received: by 2002:a17:906:2c44:: with SMTP id
 f4mr3504683ejh.508.1615476355579; 
 Thu, 11 Mar 2021 07:25:55 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:55 -0800 (PST)
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
Subject: [PATCH v3 04/15] net: stmmac: merge ARCH_SOCFPGA and ARCH_STRATIX10
Date: Thu, 11 Mar 2021 16:25:34 +0100
Message-ID: <20210311152545.1317581-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152556_462127_5533CF03 
X-CRM114-Status: GOOD (  16.43  )
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
Message-ID: <20210311152534.ltd5p915AkxE7N7QcFPMq-6OGlap3Omd0nPUJ8s-8x0@z>

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e675ba12fde2..7737e4d0bb9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -140,8 +140,8 @@ config DWMAC_ROCKCHIP
 
 config DWMAC_SOCFPGA
 	tristate "SOCFPGA dwmac support"
-	default (ARCH_SOCFPGA || ARCH_STRATIX10)
-	depends on OF && (ARCH_SOCFPGA || ARCH_STRATIX10 || COMPILE_TEST)
+	default ARCH_INTEL_SOCFPGA
+	depends on OF && (ARCH_INTEL_SOCFPGA || COMPILE_TEST)
 	select MFD_SYSCON
 	help
 	  Support for ethernet controller on Altera SOCFPGA
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
