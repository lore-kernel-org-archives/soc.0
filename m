Return-Path: <SRS0=K2iS=BT=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5428BC7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 07:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13E13C433A4; Tue, 30 May 2023 07:44:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 423DAC433B0;
	Tue, 30 May 2023 07:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 423DAC433B0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso4830479b3a.0;
        Tue, 30 May 2023 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685432551; x=1688024551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLSNqhfsX/8DU8Piq0V69+g0dOlfyAZ+TAo+HAf1L+o=;
        b=lijqtv7Mop5TTcWa4R/iD9tRFiOq8y4NMK1SddQs+X3+HmNRLmyuJ0wJSIqjaoKTyz
         1TwAO0lqaH5ICYThG1rKBtTNMFxdZVveu59qNqK5CjPvpbmZO0iSxNVizx8POQnLP/8s
         5qZFs00tRCWnmfXkU1HaxkGQGFzYg9vxasrcH6h7oNQu9L8pOCpQ9mkgC6/3p8yW65pO
         NgfewxMr1fK+lVZAVyx0nyf7ktpnJwDCGnqYfWiZuSlBDprUXcqXZgPbXx9t/DKtkFcq
         j3+o8tAjSVGWl7t3wp79XxRfR5xD/BvLXDT2jfYoPZE1OOd/Ltw7kTfEE2GMnKqThIUt
         OjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432551; x=1688024551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLSNqhfsX/8DU8Piq0V69+g0dOlfyAZ+TAo+HAf1L+o=;
        b=QVYdJbOV2LHfv/G2zbu8edG2ExTUwCOzv59MFO2b3+qZ8se5/HmfxA9tmZOJNSoG7m
         aSBCCggugQjpVBh5Hk1ynHJqeis4w2yMOl5gdAPo48YGDUXtjZlFwpssxXxlfH5vk8p+
         +tsy0jbbL7Ggy1PTz6/DDU/pGHwTRKniIbbyBi64wNl4I9FGlMxQsU9OPQYktsKESHNd
         NhJ7C5LwmLv9i0Q9F+vyhSOMKpRS2xWe2FvME+zlURe8MH31fsF98I3oGpCWwo7pfgjT
         auwXlFLn6PmcA14jC/tEwSaSaN7n47eiVj6cNQFsMaTAItRcAWqDjWS2zMfOjgrYTy50
         xVaA==
X-Gm-Message-State: AC+VfDxVGl3XXkBBTKXBKQKYxMHYrvXypxJ2+QBp1dp3yj9SngbR5iap
	BVxayNpPixJkpwKcN00NUOLCOL1lM1E=
X-Google-Smtp-Source: ACHHUZ4D/2Sc2wjOqEtSG4Iev+CqOrzade3iyE3OK96zJcF7WhMVTvvdYiLvf2EdiDD5+truUcSIUQ==
X-Received: by 2002:a05:6a20:a21a:b0:f8:b39b:b24e with SMTP id u26-20020a056a20a21a00b000f8b39bb24emr1205868pzk.11.1685432551420;
        Tue, 30 May 2023 00:42:31 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id a14-20020a170902ecce00b001afb96f4b90sm5930793plh.274.2023.05.30.00.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:42:31 -0700 (PDT)
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
Subject: [PATCH v12 01/10] arm64: Kconfig.platforms: Add config for Nuvoton MA35 platform
Date: Tue, 30 May 2023 07:42:12 +0000
Message-Id: <20230530074221.1031011-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530074221.1031011-1-ychuang570808@gmail.com>
References: <20230530074221.1031011-1-ychuang570808@gmail.com>
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

