Return-Path: <SRS0=/q7z=T3=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06326C433FE
	for <soc@archiver.kernel.org>; Wed, 16 Mar 2022 15:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3AEDC340F6; Wed, 16 Mar 2022 15:43:33 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCBA1C340F4
	for <soc@kernel.org>; Wed, 16 Mar 2022 15:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCBA1C340F4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 59BAA3F607
	for <soc@kernel.org>; Wed, 16 Mar 2022 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647445411;
	bh=KuD9R3KXnkUrVELqP9IlFpKz6dsWSgrAEtPnUMX6HMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=l9OlJx97D5yAg/9eduy7+mqEY4UeSlTU/FfU3Jnowp8XcoIlGtbxUd5qIyAKblkw1
	 15C02sUbLuJcrMZZ5yz+ey2OHcRuhOwEP/XOEa+ceX5vyhbCPeGWuNmBkGI1U0qo5g
	 Ipt0u4Gy9d9CsyS0pUsF47k9ObfHWoI1yZGyMcatjlqK5b36+9FI36j78Ma2imHNIC
	 VMZZf96VQHNfZ73nqT0U5crGmgtCrz4H58SasNudW/BA6mTfvZOapW5FHggTsWm3Xt
	 X+W/zxOg40jBHNnh2uCi3MWTMH0lNEajDri4m2Rg/c7VFxVcRVdR/oYW69TjAgET8+
	 T9cDa9xM/huIw==
Received: by mail-wm1-f71.google.com with SMTP id k26-20020a05600c0b5a00b0038c6c41159bso1204670wmr.0
        for <soc@kernel.org>; Wed, 16 Mar 2022 08:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuD9R3KXnkUrVELqP9IlFpKz6dsWSgrAEtPnUMX6HMc=;
        b=kVru7b7KVcXT5IhRn+rs9x2I+jLVzqFB7od8dMnUQjcwm+PkTNfI6Ly0KVZKgWw8A0
         yWiJtT2NxmLj8wMQcKs811h6bDm+3TgkL6plsHNZsLYNMJnkoLTYBPGG5AhHgl1Yjkfg
         +p5gcaXKKJkcqis3PoXm3mAv/pwSE+R0zpgNm97iMGw0G2bw+2PUsMTkKTU83w81tMGO
         VISV1IZVbOaN18kWz8A1C9aAcQPe4BKsyQfvBqx/i4lVAdXD1lQ0Qy4HZXzrdb0o5dlw
         4utPyUNUvMND7rCwmL/riSd96ULa3PY8jZJNdF3YtonsNLL0cgRM1p6KictYPVc+TO0d
         np/A==
X-Gm-Message-State: AOAM532c7drGInYTGCTiiw965bnxY6QIcGZGn6z0EjBFaxJ1EV76PaXf
	xdsXwzEPezZJI4TL3OTpuvugYNvuQM4yhBbErpQdik5EnIBp1XDf7oxmmAtKycotKIcGTDE3PPA
	8Q8trHe3+K3sIWJCLXoaHzOU=
X-Received: by 2002:a5d:5342:0:b0:1ef:7f26:df46 with SMTP id t2-20020a5d5342000000b001ef7f26df46mr420116wrv.600.1647445411102;
        Wed, 16 Mar 2022 08:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2zx7j4J0qU5qJaCFHbX3UjjgtX0po/NVy6p5Fi4fH9WvFRWOxH5VS9fWk3JJ9jdsTlgnFzQ==
X-Received: by 2002:a5d:5342:0:b0:1ef:7f26:df46 with SMTP id t2-20020a5d5342000000b001ef7f26df46mr420105wrv.600.1647445410884;
        Wed, 16 Mar 2022 08:43:30 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4f07000000b00203db8f13c6sm1918907wru.75.2022.03.16.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:43:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: krzk@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] arm64: dts: fsd: Add the MCT support
Date: Wed, 16 Mar 2022 16:43:08 +0100
Message-Id: <20220316154309.436028-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
References: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alim Akhtar <alim.akhtar@samsung.com>

Add node relevant to support MCT, which is used as
one of the system timer on this SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Link: https://lore.kernel.org/r/20220223171858.11384-1-alim.akhtar@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index da4acd68b976..9a652abcbcac 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -725,6 +725,29 @@ spi_2: spi@14160000 {
 			num-cs = <1>;
 			status = "disabled";
 		};
+
+		timer@10040000 {
+			compatible = "samsung,exynos4210-mct";
+			reg = <0x0 0x10040000 0x0 0x800>;
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+		};
 	};
 };
 
-- 
2.32.0

