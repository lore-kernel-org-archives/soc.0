Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F0BC433E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:30:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9FB64E3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9FB64E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t0EkoV/cwSpJT8Fc9fDJff9xazCLRuAB9D9/vPNebO8=; b=XplAGzVO6ctw+vRXdqNq/PHCI
	skmHQBhVHn6+pkXB4kl0o2+RzMY2d/5iS3xOgksvrEC/qrmTZn3ihntzM0FYzjkhg5fld1wGRU0O9
	yaBRreNOpKmJ2NJtT1+SQX8gwIhdhs+A1meLB449uZjc9+ulW75Wx75JkNd8b/E5hRCG+fL34fz1X
	fLHPPEfWSvd3LPHavkeqrf3Rrlo892k5asRkLN089Gz70s8FkOc3chwqmPRO8cte6SOvvj0R8sn+r
	INe3OgFbSDk7TtNdoqutEXFl5iVjuoGOLRsxnhPh87wx2Q/pyEhH6Z6NsSe/JQp2L5BtnypwNGOKf
	5ngd5qocg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNEp-009RCd-Rl; Thu, 11 Mar 2021 15:28:38 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNE1-009Qpt-03
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:48 +0000
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNDz-0005gj-Q1
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:27:44 +0000
Received: by mail-ej1-f69.google.com with SMTP id v10so8812090ejh.15
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RBN1O3Wcnz1uvA/bXXgFQO/02vpYiyGG/6WCSqIa6KY=;
 b=hNvQjqGfxQb/8FkZ+tEIVnz5jK6TJn+BQ4+pmld26hcye2yKcerxjzB6ssT2BY1Y5k
 soipPSF+gZwjThUVMh4kNDC7xcnJdIPRpJKxBjY8ig2MhjIOzEMyXCvLNoVrLLGHHPFq
 C1ZGs55Khd16g+LrFuXOpNQVq9jPv9OcYxrLbQpmDIzhiyzKaLJKvCUtjrtmD4y06vhG
 eQtV79kGK4wQ+txyD9r3NBNF/iAqWKkd4iQDXEoECfUJWqd+E62NaaT6iNvF/ccIDWwc
 P3CVS1VtQ4xtTwgdna82MQ1uoDcSmfTk+MZMbgx4QCmL7JjkZSAyiCpommli0jUS1FIE
 V68w==
X-Gm-Message-State: AOAM531xjaYqxWyQOygk8inp4aPJeOylVYNT8Fd7XPMofDgkvr9vjSqY
 shYsUqJ9jqiPUyOqNK4hMBRUB3SB0UPhzw3tCOJruzegV2LwrkEH56P0Mp2qs4JQ7lxGfjGy+eh
 +mYNV3k9PNMrfroMrVLela0jjHktrfS1g93/jtPTqYW7fauqSyehQ
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr9145586edd.103.1615476463282; 
 Thu, 11 Mar 2021 07:27:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzftQgQhm6JCnX7NkcREdfHxQ79cH5j2A8F4fhogge3Hb8YjiFCimex/EvBlWPVnkSsMSMXPQ==
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr9145573edd.103.1615476463167; 
 Thu, 11 Mar 2021 07:27:43 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id k9sm1567062edn.68.2021.03.11.07.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:27:42 -0800 (PST)
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
Subject: [PATCH v3 14/15] reset: socfpga: use ARCH_INTEL_SOCFPGA also for
 32-bit ARM SoCs
Date: Thu, 11 Mar 2021 16:27:41 +0100
Message-ID: <20210311152741.1318599-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152745_320361_CFB8D70E 
X-CRM114-Status: GOOD (  16.58  )
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
Message-ID: <20210311152741.2dJsrlpWB4MBdGBbCMTKVIykoHuCAWZ2dQcp5JZekgQ@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
