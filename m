Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EE7C48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 10:20:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDFDB61261
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 10:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDFDB61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB8E8OsNznZCAYGQF5TRl5j6cAnezx/JVutxy7indmQ=; b=vOfWZL8oiLNQRI
	DJ1bA257xc1QSDHPm/YXAoHooiB0RT9TMYYMxbDGb4xJsjKfdrfJGErIP4wuo7BVE41h6Fp1hD6B2
	a2SM2vb9N/lifWgwzr1hSgx6wUwTFKEOoPU+uVOX49piDY3Ui7mgTwrE/ag1hbfFdpc1p2UOOcHKp
	WNP0NlegKKRwFr2J8jraOvtYcwFW1EApn5xwi16AlTt90qYSzPjo46/2x4Uv2XdSX5lZ/92mEJrnj
	43lN4vB2umAcvr8+DSQlGt4lpCc3DrJCeZ2XHkcb+XhCh7FE/EQekyEjQfn3B0XW4SxMvcaDyXSz6
	U54X3NIIg0RJ3JKfUBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsNCQ-00AC6Z-Fs; Sun, 13 Jun 2021 10:18:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsNCL-00AC4r-O6
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 10:18:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id a11so11007689wrt.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Jun 2021 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
 b=n3+XLPkg+KhWbd+RoKG12JNHlGBEkSKis+yiNnsXLa75ONbsZC4RmEa9GVGL6z27Oz
 PwQvsvdp+Be0MxVAlCmKyiAFZcsJXFoVJXhykN1+PFFcwooDNsCn/mao0zxQkKcGjy8+
 4F+XX9BsdT8jGZtwOQxbLKFUZBzdPHij9KwCfdjk3i1Cfq+vfBPdQMTpR2rR0oALM1c5
 XyPk8BQBALaDRvrgiUNlQIA2/7TT74Cfsiw6cHcrHKBQ0PKtWP+93eYfgKysmH4kmg9f
 y80nkJlR8XrzsLfQ4rlK/I4w7o+a/AiiqDfMxLNXUVoQJd1bJYaC5TwNk/tQywtviNVe
 HM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
 b=LbgANg5dPxXa1tsNin+Vd4Jwz7QdLNQ7QrpFrxWCwssIOzQye2O0yZa0XpLj5mxY2r
 BXPkJg4cI/JKtikvuPoYK7/+BlVOUNC/0uv1pOREKPgttqwXo9zveLCmlOYi+BNYdJXg
 E7M9rraM8LhiVsjaRqib9atYXk+ebXFJUiboraVEX0WDzF4srPO8dy1E+7SYcgbZlvdL
 lY1pC/J65x1/qaiek6a/VkRvN0Q31HspYBDaoP/LPmgwCEUsbkTTiM6QmuikMx5NpB73
 2SLXZ5cNa1lDyG5Hry0fvuZnXyrtSq0zaPk190S60XqhfWqptzjF3OnuAuqDIrf25Be9
 dD1g==
X-Gm-Message-State: AOAM533pD747dee/W1gMBsp10V9fphyooHov9lnF8tM+uVN/6G4KHmxE
 8fw/Y7fn+iYwznF0Zkt3/dTA1VwLXzQ=
X-Google-Smtp-Source: ABdhPJz85dTGbSbzKImxg9MRP4VAM0osivUkyy5dKD+XDrJQFIu8xwXCu3eBbwz6xVLOzo1XcqoatA==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr13123620wru.341.1623579512058; 
 Sun, 13 Jun 2021 03:18:32 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id f12sm15723042wru.81.2021.06.13.03.18.31
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 13 Jun 2021 03:18:31 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Sun, 13 Jun 2021 11:16:48 +0100
Message-ID: <20210613101658.3242777-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210613101658.3242777-1-mnhagan88@gmail.com>
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_031833_814896_B1FB72BD 
X-CRM114-Status: GOOD (  11.54  )
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
Message-ID: <20210613101648.t4a__u-9_yLh0nIleaJ3zYKMYDCG_tly-JDB5l1Ndtc@z>

Add bindings for the Meraki MX64/MX65 series. Note this patch should be
applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 78dfa315f3d0..7d184ba7d180 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -62,6 +62,12 @@ properties:
           - enum:
               - brcm,bcm958625hr
               - brcm,bcm958625k
+              - meraki,mx64
+              - meraki,mx64-a0
+              - meraki,mx64w
+              - meraki,mx64w-a0
+              - meraki,mx65
+              - meraki,mx65w
           - const: brcm,bcm58625
           - const: brcm,nsp
 
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
