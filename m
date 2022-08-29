Return-Path: <SRS0=ug29=ZB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381FEECAAA1
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 17:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D116C4347C; Mon, 29 Aug 2022 17:38:44 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C35DC433D7;
	Mon, 29 Aug 2022 17:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C35DC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id w4so6603984qvs.4;
        Mon, 29 Aug 2022 10:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=I/SAEi6d7MQzK2zmN3C2Xz2o5qThFKoSXxNju+OsJpA=;
        b=ExueIjbnC8ELzM7W1vKR2FOynY1q8Fh3VZ5Wj1BktKSDzf7cIL8U2DbErh6JjFm6MI
         +O+XGdOHlHUUoIQt8Ed8ALIq247yV826r/JIw6oQejjlRixuULEUd7wNvH/Ij6L62JDF
         aOxGjuIyzSmlBO++pezTZa8cD0dvXrEZidJmxLXYXjvWRcdHdwSswjCBBi2nRcyGyLmf
         VUUwbqgShkABLrpa8GQGbu6scME+aVXr2pBRp/NNYMPsxOaIwJwg/1QWOUXPtRjCXnCH
         7kng41a0spVw6XAnlk7u1C39rsOZgQjbR6QflkHnAS7uxpPA5ePu606KFmGo1/89+u2r
         uHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=I/SAEi6d7MQzK2zmN3C2Xz2o5qThFKoSXxNju+OsJpA=;
        b=GLxKycMo1eBGLEYN9o0yRU6GZFeWxBa/pLTE2KXHhAg6h2jxLvhCZWEnsUjKqRVGEq
         0x9vd4+h6VE2vpE+AugKfBW+ezTSdja9rtBCX9z+0V46KO5oh3F+edoJ59histcdMl1P
         Nk408Fx8vDAZvxvB0DH999O9kzqnOhZH+9xb1agg9LxwbkUnyG5hl44dcB/RPv2mED6Z
         Fr915qmAHhvqXtOwY/Rk/Rv10LNnnh8A4rDY/FpkT9StAlaJh+/WAaVuaXMqbjV3TSxP
         rXjT+uNHHVkksjz2Wf3et7Z5r4B+Bh3X2dkYzEWz6wwgmhUrxN6C57k9JeuPZ/OnHmsb
         A49A==
X-Gm-Message-State: ACgBeo1ytZKsWvbmSaabfjl9d1ky/E3vToEQQS5V28RasLO3thJGBxju
	xKBZFFVX9O/ngn6TB6z3SdX4VeZk9Ko=
X-Google-Smtp-Source: AA6agR7prCnqNNbI5hjcg/QnEFm4SxS15Vz1qgfQQyokaHeubUPKXPU9sds/jGpWQGwpQoMilmTTvQ==
X-Received: by 2002:a0c:8e8d:0:b0:496:b53d:c775 with SMTP id x13-20020a0c8e8d000000b00496b53dc775mr11474870qvb.36.1661794721961;
        Mon, 29 Aug 2022 10:38:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006bb7ccf6855sm6543583qkp.76.2022.08.29.10.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:38:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	krzysztof.kozlowski@linaro.org,
	arnd@arndb.de,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com
Subject: [PATCH v2 2/2] arm64: Kconfig.platforms: Group NXP platforms together
Date: Mon, 29 Aug 2022 10:38:29 -0700
Message-Id: <20220829173830.3567047-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829173830.3567047-1-f.fainelli@gmail.com>
References: <20220829173830.3567047-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Group the three NXP platforms under an ARCH_NXP menuconfig symbol to
make make selection of similar vendor SoCs visually nicer.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/Kconfig.platforms | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 748f9ac4d775..61d946e092d3 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -143,12 +143,6 @@ config ARCH_K3
 	  This enables support for Texas Instruments' K3 multicore SoC
 	  architecture.
 
-config ARCH_LAYERSCAPE
-	bool "ARMv8 based Freescale Layerscape SoC family"
-	select EDAC_SUPPORT
-	help
-	  This enables support for the Freescale Layerscape SoC family.
-
 config ARCH_LG1K
 	bool "LG Electronics LG1K SoC Family"
 	help
@@ -207,6 +201,17 @@ config ARCH_MVEBU
 	   - Armada 8K SoC Family
 	   - 98DX2530 SoC Family
 
+menuconfig ARCH_NXP
+	bool "NXP SoC support"
+
+if ARCH_NXP
+
+config ARCH_LAYERSCAPE
+	bool "ARMv8 based Freescale Layerscape SoC family"
+	select EDAC_SUPPORT
+	help
+	  This enables support for the Freescale Layerscape SoC family.
+
 config ARCH_MXC
 	bool "ARMv8 based NXP i.MX SoC family"
 	select ARM64_ERRATUM_843419
@@ -221,6 +226,13 @@ config ARCH_MXC
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
 
+config ARCH_S32
+	bool "NXP S32 SoC Family"
+	help
+	  This enables support for the NXP S32 family of processors.
+
+endif
+
 config ARCH_NPCM
 	bool "Nuvoton NPCM Architecture"
 	select PINCTRL
@@ -264,11 +276,6 @@ config ARCH_ROCKCHIP
 	  This enables support for the ARMv8 based Rockchip chipsets,
 	  like the RK3368.
 
-config ARCH_S32
-	bool "NXP S32 SoC Family"
-	help
-	  This enables support for the NXP S32 family of processors.
-
 config ARCH_SEATTLE
 	bool "AMD Seattle SoC Family"
 	help
-- 
2.25.1

