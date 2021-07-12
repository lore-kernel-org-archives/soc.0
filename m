Return-Path: <SRS0=GWmK=ME=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1CAC07E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 08:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD72600D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD72600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TsOSg4k3Aj5KtfzQlxbMrLlzIpwG3loGuq2cy/SsCGo=; b=lAuBRI2vEJxtyS
	jEPK92gYlSz153uYxHwOcv5q5t65H2hI59UX23WXmCsWfAu6VI+fju+QwY7FwcQOsQev/LFDbwMEW
	h6R9QoKYYOckWvrMfZpzjuTrKgdmOj+d6qf6Un7jRnZAshm4iXYxxwSjSxP57iw5NWoOYBVBAk2Pp
	7yjW0c3jKBH5RINORDRSPfH7QG2AJCGIynxf/d+kZaBZYJ7u3l0vydRKZTy9dZFrN/rKsMgkeHyJb
	hEx6i0XMalS4VPilg3RmXfwpQ03RFymwX48wTsuZ6ltQs4So9gBKAod4MyDvsdddkHVUyV8twmPYv
	yIXdbJuLUxOt8jg8VsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2rks-006fp1-2K; Mon, 12 Jul 2021 08:57:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2rkn-006foE-ST
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Jul 2021 08:57:31 +0000
Received: by mail-lj1-x22b.google.com with SMTP id u25so22967151ljj.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Jul 2021 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5d6Z92bis1FTsbZYPUBaQbOfE4flsBCQtpV5+LatB00=;
 b=F5++UXDA11Wfgb719W7skABi9wqJd5dKd6NGsbKXukxIwJt3HCwUHBLkKpZbrnRFpz
 aI5NOo1afGJpKUq4YqUw1GVRNH3/WfVnUOglu6ZjyGNyx35q3duyNCoOXrCidh2xm4/a
 tamfZJ0yjlnGXTPc1402jLQ9h3RdG6Fam53w7+sdTpHfeCGlzBXcvdIKW1l+nNMzzaJg
 DOWeoEgDf5eTd+S/7en3nV5gy0dsRY+xfXHLceOmY0qbCNwVRPClkj8pJkXQzERgEIPJ
 rcjO+p+HyNEp9kf9l588CCjogcPJYwvHp/ASdxyT/J5oawl9oGgVEKpvhdYFi47e21Rz
 u4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5d6Z92bis1FTsbZYPUBaQbOfE4flsBCQtpV5+LatB00=;
 b=rRgxaU/3qK+Za6mpdkXFlrnmd76dvRuBKn6XbjvCAjnysOmCJ4hwUudwK6z1fbodhc
 yB36frZ+Y/PcZaI/3Yw+mA19ZmkZzcrNDixXfIdK743kHQ96rtBuXOAvjDvSmyL5GOdx
 fRVkkbm/42U3TIV1bO4ZqthJVRAmKYovsougiOSstLt6TtqjkSa4+QU3ShAYDspU8ejb
 j0EHwPJDpXK2D9Wlrc7WYVomK3Ql7/eO36Hr83vU0OlmFmnkeEp/9X6bpNtSx7IwcxsR
 mvL3bi5tq5v86Z9fgqVMmEBlCAXcfWk7d/+iMQEhCUzxfprFMNmxfgG6F1X2oom3tk5S
 QEyA==
X-Gm-Message-State: AOAM533YnGgBCxJXjPT8/AYTEqncCnE84Iq6pVeKXNp7RM0aSAZVaxBO
 San7yqlWicTbA/rIFgLSBSSIRQ==
X-Google-Smtp-Source: ABdhPJxMQj3C87xonZdq4c5RPX0otxjo9WVQPCpypadAZeTCOpCRcvDW3cHhNiw8pRLDSPwQqatDYg==
X-Received: by 2002:a2e:968a:: with SMTP id q10mr37860599lji.407.1626080247484; 
 Mon, 12 Jul 2021 01:57:27 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id e28sm683401lfb.58.2021.07.12.01.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 01:57:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, phone-devel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, newbyte@disroot.org
Subject: [PATCH] ARM: configs: Update u8500_defconfig
Date: Mon, 12 Jul 2021 10:55:22 +0200
Message-ID: <20210712085522.672482-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_015729_990886_52687970 
X-CRM114-Status: GOOD (  12.16  )
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
Message-ID: <20210712085522.tr9SzyNsvXz8QH3ixS2w-QygH5S5oKA8VA1tCvbpHxQ@z>

The platform lost the framebuffer due to a commit solving a
circular dependency in v5.14-rc1, so add it back in by explicitly
selecting the framebuffer.

The U8500 has also gained a few systems using touchscreens from
Cypress, Melfas and Zinitix so add these at the same time as
we're updating the defconfig anyway.

Cc: phone-devel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: newbyte@disroot.org
Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC folks, please apply this for configs for v5.14 current.
---
 arch/arm/configs/u8500_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index dbb1ef601762..3b30913d7d8d 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -61,6 +61,10 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
 CONFIG_TOUCHSCREEN_BU21013=y
 CONFIG_TOUCHSCREEN_CY8CTMA140=y
+CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
+CONFIG_TOUCHSCREEN_CYTTSP_SPI=y
+CONFIG_TOUCHSCREEN_MMS114=y
+CONFIG_TOUCHSCREEN_ZINITIX=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_AB8500_PONKEY=y
 CONFIG_INPUT_GPIO_VIBRA=y
@@ -100,6 +104,7 @@ CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
 CONFIG_DRM_PANEL_SONY_ACX424AKP=y
 CONFIG_DRM_LIMA=y
 CONFIG_DRM_MCDE=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_KTD253=y
 CONFIG_BACKLIGHT_GPIO=y
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
