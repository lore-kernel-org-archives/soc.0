Return-Path: <SRS0=Gxsf=LU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0B4C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jun 2021 00:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEF861962
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jun 2021 00:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEF861962
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IxkmXiTf/DaYuqBngs7QN8qejjbbJ+CI6dTf8E1tbg8=; b=YpFE+w3ke8CvmB
	pVJN/A0FY3FskPq0cA/P1FDDXCPlHJhhTGtM261LavIwYW87KekdvBDO9wpYrAEH5gSnTQvp2QmOm
	5JdaC0N6AVdN9boyVhbms7TRQ0FuO8lcjA4H1YkGcIVGQNun73ZXfXP/CsGZTCl0KPByGMCWuLEA1
	0YFiGw83fKgQIGjf4Qo2fslMqvk1Ef+2WB7GRx0xKFkgJ1NLmZogVgBn2f/97QWP7+RpIk2VERr/4
	E26UqmhGE4ZVx3hfotdLywSz8//Dsv3wvxW/B28AI83jNnQMZpXMg6dHCVdyv5Jd+ta4OpgRDuooh
	yqYT/d6J/wwGhQ8fHMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwvkj-0035t9-0N; Sat, 26 Jun 2021 00:00:53 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwvkd-0035sQ-1W
 for linux-arm-kernel@lists.infradead.org; Sat, 26 Jun 2021 00:00:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id i13so19140320lfc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuUO8AcQNdpRRUCohveWKo6jfr4batAeHXA30dP9DUc=;
 b=lzKidZeYIiMgIl+o8Iqxmr+9DBhhuSz6Jk3eVjgha2ZNtSnfyWiuI8BpTN3hZXgksT
 1vd3pl8oaLfaPpVY5eSQk7Awl4LFDBBO1mvyMzVNXpySuSqrl+29AAWO/AHNtQY4YLBY
 ZbG1WAtQC+Pnlrwh2JuYiLZf4UXCg33NAmwn4KVlLiSmE7STZEtpUTxFAliowP5Z1DlI
 SuQ4UO//56gqYMLwN+bnVwuTa4X20To1k/Q1bd01ioNzD84xwLKNhasKGW/+WxFPKX96
 fXXrRmoAizUWOABD0gOtwvbnbm+ssykccjUNSfF5wk+UZMABKJ0WMDOU+F2Fl/Kl5Aju
 2gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuUO8AcQNdpRRUCohveWKo6jfr4batAeHXA30dP9DUc=;
 b=EBoMDjYMXZy+aKf55+VUbSktFQjU08cxiVSwX73tZj22ls4mU5/mR3QtTTAj/trqY+
 kz7StZqxjiRM2U1rG7puyw/0QOgRdGTPPQCvdYSHLKfKIkEqKzYtUp6IIUtTcfFPjRa5
 wnq5E2GF7aKF21nMCHtow+kgDt3U3VmLzvnsAPR1jB+K4LLjNtNEVETbf1buiw8AmPtx
 tacigvofB055rN+CJqXfJ7Hvo3q19Kkwa4Gy/NnfUqPugP1+N7UcGxg6GlYd5c4gI5Yg
 P4IHBl6tfDORplPA5hyq4WuQJT+FpFnD+7uV6MkQ4n/lahLTYqIzVxjiDowaE+r4pulQ
 XWwA==
X-Gm-Message-State: AOAM532wGbbJ8ZWRobIiE7FrkqeRt88dcNd6fxQs75d9u60aJZ3BvriP
 ALGXWSfhJKBoyCtCRijDyKgg5bWf/g7Zxw==
X-Google-Smtp-Source: ABdhPJzxAbMGN2YgSmyxsJMo9kizX1YkXzNG311jNhAjyF7Og0FDWgNCxh3qjf9ZKGnYTKDQSiCjmA==
X-Received: by 2002:a19:c152:: with SMTP id r79mr9921951lff.388.1624665645021; 
 Fri, 25 Jun 2021 17:00:45 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id h25sm514428lfe.284.2021.06.25.17.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 17:00:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: versatile: Fix up interrupt controller node names
Date: Sat, 26 Jun 2021 01:58:34 +0200
Message-ID: <20210625235834.830035-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_170047_132686_B1CF6D8C 
X-CRM114-Status: GOOD (  10.60  )
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
Message-ID: <20210625235834.7BP5mdy8zgn3iXGLsuiBIShNyx8thaig8Cb1DeqaFEo@z>

From: Sudeep Holla <sudeep.holla@arm.com>

Once the new schema interrupt-controller/arm,vic.yaml is added, we get
the below warnings:

        arch/arm/boot/dts/versatile-ab.dt.yaml:
        intc@10140000: $nodename:0: 'intc@10140000' does not match
        '^interrupt-controller(@[0-9a-f,]+)*$'

	arch/arm/boot/dts/versatile-ab.dt.yaml:
	intc@10140000: 'clear-mask' does not match any of the regexes

Fix the node names for the interrupt controller to conform
to the standard node name interrupt-controller@.. Also drop invalid
clear-mask property.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20210617210825.3064367-1-sudeep.holla@arm.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC people, please apply this directly to DTS fixes, I have
no other Versatile DTS changes coming right now.
---
 arch/arm/boot/dts/versatile-ab.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 37bd41ff8dff..151c0220047d 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -195,16 +195,15 @@ amba {
 		#size-cells = <1>;
 		ranges;
 
-		vic: intc@10140000 {
+		vic: interrupt-controller@10140000 {
 			compatible = "arm,versatile-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			reg = <0x10140000 0x1000>;
-			clear-mask = <0xffffffff>;
 			valid-mask = <0xffffffff>;
 		};
 
-		sic: intc@10003000 {
+		sic: interrupt-controller@10003000 {
 			compatible = "arm,versatile-sic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
