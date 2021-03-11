Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45382C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7A964E59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D7A964E59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WOE2qHxGYuSK09v2rd/ZPW6gHGGOJv5PKuXaG4Ge7f0=; b=qQStwEKDnjHzD8ZHYx3Ozoz9d
	NzhHXsVHRh6TKUE4/GtqCK8fZ4akidzzerrHw/NoVzYXOZj/mz81R7uvRZ52O7ElM+LAQVJtcshic
	9GN8X0iYhuVZF4F2toxVEDYvF2MKNAfOFxfGX/of7q1cL72akcx7+7sJlIVx0UVE6T9qcRJGWIddy
	ccxYIP1yvS4+TgTOljWh9pukOGwWsbw5gYwmx9ZTZ581hTH/RjaWtR07CyOTr9rxUpC8jL1a+YWCo
	z9mBe8llDwlPohq//yXqdXxRe9IgzQwtI49xA39IdHK++wKJfacVTEESCvrwHC1W7j4m21Htj9Nfy
	zNPgRJ+tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKND6-009QPf-Eu; Thu, 11 Mar 2021 15:26:48 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNCJ-009QGl-As
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:26:00 +0000
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCI-0004rf-3L
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 15:25:58 +0000
Received: by mail-ed1-f71.google.com with SMTP id o24so10029167edt.15
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 07:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xs6GGjw8nQu2H0zJNhMFfPjtjv4pASlZetLF+qPJ3jI=;
 b=jrC1VimE4Pgdrek9Md97Ge0J5zhW8+Ns6nVDU2PsgTTXJ+GqxcvYpJlkIKTBabzmaG
 GNW0hYgULTEi+dRdTT5hnqy+O/A4eRPM/3MU9+0udPzMvcP/p/QaJW5kiXgNFR8pv+r2
 yZdHHvB6ZR+8/IMgM3K0qDTJz4/S7rVOU4/SDSVsLCPUzDrOwuW4CUJE6/eu9tnmROPg
 Oft+b5W0ulteBbR9gat765z5wqudW6hl8Flqagf5axWq4FKBrb9GuWqAtanJYOIgBN+s
 L2skJTVwhjfRjP/OkLXwI55KZyVzXRwNq6nB96O+hzrnGTI6FbP0vNnPp3v3Jujlyhes
 jDAg==
X-Gm-Message-State: AOAM531wmeLl43QgcEC5mi+0HHufSYiZ23ld4ROl6n/hMi1C7wQ/JhH0
 GyH3/qOLYjQ+cKA5unBtH01omclsZ+Oi3jn/ev5LYa7Ne7SHoQZFA3piIRLZy5fT+Ez+SfqFVQu
 707YX99Dn+XKpLY+f/hYwAZgBspjSUoqYvuPJLm+UL8Ety/UYdYZW
X-Received: by 2002:a05:6402:2070:: with SMTP id
 bd16mr9025979edb.133.1615476357797; 
 Thu, 11 Mar 2021 07:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEy/VWcYtVhHpWmtyv1K3JAU4Nmfhx02KoGEuoEu8P/ERdDmK4z05THjQn7v4EX/URDdO6zA==
X-Received: by 2002:a05:6402:2070:: with SMTP id
 bd16mr9025945edb.133.1615476357547; 
 Thu, 11 Mar 2021 07:25:57 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:57 -0800 (PST)
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
Subject: [PATCH v3 06/15] clk: socfpga: merge ARCH_SOCFPGA and ARCH_STRATIX10
Date: Thu, 11 Mar 2021 16:25:36 +0100
Message-ID: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152559_410156_2870F482 
X-CRM114-Status: GOOD (  14.91  )
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
Message-ID: <20210311152536.1nUOLvNOHOfSmUjOud9vil1aw_pxg4BILE7112fJX38@z>

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 12e46b12e587..1e29e5ad107a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -104,10 +104,9 @@ obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
-obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
+obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
 obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
 obj-$(CONFIG_ARCH_N5X)			+= socfpga/
-obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
