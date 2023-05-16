Return-Path: <SRS0=KA1m=BF=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733D4C7EE2C
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 07:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 591D5C4339C; Tue, 16 May 2023 07:52:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F0C4C433EF;
	Tue, 16 May 2023 07:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F0C4C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ae3fe67980so1453865ad.3;
        Tue, 16 May 2023 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684223547; x=1686815547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLSNqhfsX/8DU8Piq0V69+g0dOlfyAZ+TAo+HAf1L+o=;
        b=dAbNaJyT7pMNupMmkMfqoR5ouQYIVR98losthCV5npFlKyeJf5GZ0wZhQPLJ7pdYzF
         smGLNPkKlCXo4XQU9nSzS9WptgIN128/Ud+fRadprroxmhxmQ8mIsE+UsyE1+Y1cIHQS
         bsc2HCfduUHyAAoc9EqflW/9v9wwTpWKY8sq89WlXhc2Oev9LdNXNIE6WFIKAjaop9Qf
         MEbR23SFiEORYdftppLBGIX5hAjljIp+z1KD5IcckLbBy/UTaBfiYh+oyEXjbbiirblC
         WGtDR2ku2hLX/njJPYb85DVy84qDpkKxIXqoZHGlKgIQ6US51ZAUbm/NWtIJ90D7AaEu
         uJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684223547; x=1686815547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLSNqhfsX/8DU8Piq0V69+g0dOlfyAZ+TAo+HAf1L+o=;
        b=anNhBjEta3rqw2UvFhkzkoPybfbB9pStKeeExQncZ07orLVlxSQheBV/3C+ocv3uUF
         KzMZciFvzu4TXIMp2Cj964mpN509T/lgXfGFLINoNggEbpk3kODShpOzHJNY1HrT1wpl
         ODgV7T+oZXQ84SlY91i205VG8eyGDXWYp3yLUQy35zuCDnb1eS7cqW8tO5tz2dULnsgh
         zxvJ4aXSPBHA6KBwRfPpRfqk5sG9dU1oYPdvxqviLR2hpldx6/GHbgqWARbrjFgd01UE
         T61pIrtF1v2rQsXxBqjhqookCLOjYtKoyogsygPLzSEqHQvqqjyWztUcbTax5qN8aUPT
         PVEg==
X-Gm-Message-State: AC+VfDxxXz0sqV8lnu9ADRTPkyszuprfDx5RPnio9AYOAzk+QGqR2KgN
	00Pny57L9Cmbn5g0kCXtQaEgb9iznPasQA==
X-Google-Smtp-Source: ACHHUZ5uTqwifjat9zlCoRctDNTMQca+z1Yw2tSwplEfB4BBUCOc6/3ENeAY50ytDGfzhCyfdge8bg==
X-Received: by 2002:a17:902:7402:b0:1a9:7a7c:2086 with SMTP id g2-20020a170902740200b001a97a7c2086mr37998596pll.27.1684223547565;
        Tue, 16 May 2023 00:52:27 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001ab061e352bsm4793043plh.195.2023.05.16.00.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:52:27 -0700 (PDT)
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
Subject: [PATCH v11 01/10] arm64: Kconfig.platforms: Add config for Nuvoton MA35 platform
Date: Tue, 16 May 2023 07:52:08 +0000
Message-Id: <20230516075217.205401-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516075217.205401-1-ychuang570808@gmail.com>
References: <20230516075217.205401-1-ychuang570808@gmail.com>
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

