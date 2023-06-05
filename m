Return-Path: <SRS0=QcdD=BZ=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232E8C7EE2A
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 04:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7029C433A7; Mon,  5 Jun 2023 04:08:00 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1A47C433D2;
	Mon,  5 Jun 2023 04:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1A47C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b0201d9a9eso31406625ad.0;
        Sun, 04 Jun 2023 21:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685938079; x=1688530079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLSNqhfsX/8DU8Piq0V69+g0dOlfyAZ+TAo+HAf1L+o=;
        b=aInT1qLmEdOG4TwibQm4UbGiLMf4l9bHtKcRAKPg0qT8V5JgFunc9jK99j7BNATnba
         uXNwjpLpkSD5yJn5O2cb4n+CS/dLZTvZNjc6GQn1A9m5qh7W80QLy4WIc2VR2gEqXwnJ
         szSaY+utqORloiowWWrbWlJW8LmwWBW+afmgjrvfqYyheuRdcZJDbGFmRknXKc8oROTJ
         kWPAs0w4o3RF1ZPOUwnlNetGJPvBOtoMIvefmShG5gqEK1BwY/AeDxOv9Fn1oB7mmCPD
         8nQRBVN4dauadBn2TsnwOBeIE/tFUNUdDks5+ZM+ZgVF7fp22Gr+hyz2APT2OWMT7+7T
         fPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685938079; x=1688530079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLSNqhfsX/8DU8Piq0V69+g0dOlfyAZ+TAo+HAf1L+o=;
        b=W8+Mxn8EdQMfCnuT4HUbs041hx2onyzOleOzdJNxKTLBhWElLnpyehsN/QsU+/gEcd
         Dls/8II93d1zRw99VgAGNvEuAayuWKyFEpuJIIiix+cp09a5chU4KsgVyjzrXiQkT48d
         AP250L9yjjfzdKvxIk3U7V5MvS99GrM0xTL+vY5Kn4ZN7+gQJVX1o7mzUvuv7WZUomyx
         jMdc2pcgJ3UXUTUNSUbq+4zyuF4Qtbw86v2iwExlvYgxTHeLwS8fNJBcfZCESEM2MzT/
         gAZXXi89Yi/64hsVYt3YN7Ic1D+XNiKOPtXehPsoIfSJRUQLqMTVxderGmUcHkmz9t6N
         37dw==
X-Gm-Message-State: AC+VfDwDsOUcSQQMa1RB2w2m1VC8ihKFJ9i5ftTliBR30ABaRAgh6oYX
	RVwEQjzMEl2AyJXmHbrt3Z6CfvzoavM=
X-Google-Smtp-Source: ACHHUZ6cBynh9TtGAFDwB0YjQpBqXh8X1ayfefOTFbSMVBHyprMCWphWSqRQIemqAlgMwJQJRae9mQ==
X-Received: by 2002:a17:902:e547:b0:1b1:d52f:321d with SMTP id n7-20020a170902e54700b001b1d52f321dmr8140763plf.17.1685938078969;
        Sun, 04 Jun 2023 21:07:58 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a170903228400b001b21bcea439sm206164plh.170.2023.06.04.21.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 21:07:58 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	tmaimon77@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	arnd@arndb.de,
	soc@kernel.org,
	schung@nuvoton.com,
	mjchen@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v13 01/10] arm64: Kconfig.platforms: Add config for Nuvoton MA35 platform
Date: Mon,  5 Jun 2023 04:07:40 +0000
Message-Id: <20230605040749.67964-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230605040749.67964-1-ychuang570808@gmail.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add ARCH_NUVOTON configuration option for Nuvoton MA35 family SoCs.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 89a0b13b058d..e28dbc477a99 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -225,6 +225,14 @@ config ARCH_S32
 
 endif
 
+config ARCH_MA35
+	bool "Nuvoton MA35 Architecture"
+	select GPIOLIB
+	select PINCTRL
+	select RESET_CONTROLLER
+	help
+	  This enables support for the ARMv8 based Nuvoton MA35 series SoCs.
+
 config ARCH_NPCM
 	bool "Nuvoton NPCM Architecture"
 	select PINCTRL
-- 
2.34.1

