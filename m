Return-Path: <SRS0=1Wdk=VY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ACCC433EF
	for <soc@archiver.kernel.org>; Mon, 16 May 2022 14:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4883BC34116; Mon, 16 May 2022 14:29:11 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BA16C385AA
	for <soc@kernel.org>; Mon, 16 May 2022 14:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BA16C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id bx33so18324234ljb.12
        for <soc@kernel.org>; Mon, 16 May 2022 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WfuUhuIX0wSfW4I9PJN/M1swMdFH0r01nOVZ5xpD7V0=;
        b=E7ZIQG8dL/Y8au7Hf8g6j3u8P4MKoTsy3jIim4EXc4JJOSNr74nILL0eJ+1ul+7gsT
         UeV4u3zAsAVDWSfvmFVszXDs26kKMrzagj8sGpIKMFoTk2+u9gclH3FtuVr2ztn9XC4s
         KmMaGwj36fOeX3N6mv/LYMBNQ9G8jQQPtGG0rXA4TTXNf6avl6kx+G/rPdlDlHiueiU6
         9EFTqtyOJbYI6D/bTA3+u5yFXR/LZzcLDdgyTxkx29l5YOB0BjcWAk761zmrOYEkg81b
         I5glDzhCAwpRICWoQhM/J6WsrhExdPAZuqX5q98r2gThGgO+SjRJFb6m2hBb/Yz7BL2p
         o8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WfuUhuIX0wSfW4I9PJN/M1swMdFH0r01nOVZ5xpD7V0=;
        b=EmnrDsvnRDPF9Lbnu7xppmhteQyApWFx8BfmntNX8uSW2cg4OSpRwU6JmfleqoZqV7
         HOotPKKV9ZigBbFVe4lOKNEgbpTPJGzRDiQ/87D6o7SBaXseVfuhfmFYIUFNKaJ8bda9
         65J9Uh8XRrRqHSB5Z6Y+rTjf6Sf9MHOIy9GUMR+YPwQk8G6s0YX4gXJMCGN1E05xqQ3O
         e0it6AitJ1LDS6Jt+CmubbxAp0/8dkPaUMWnAxykxgdNwCiBn3nmmKQS+bDIFZv6W2sy
         ake6wLFSCA3g5uu4WGQNy+CWpOKaoFHG0guSsxqvGLLn6buw7CYVW/CEs9vSY4JHcoB2
         u3Uw==
X-Gm-Message-State: AOAM533WvTAZRh3eOEdoqyqwZvlu857TBzYSFXGDA6+h5XzZ4Or1z9PM
	DEeWwjal9bbLKEYJyCDHNA7y2Q==
X-Google-Smtp-Source: ABdhPJz9P+OzE0LWrf503aiPteSiW/dX8lfcunGlCZAT9lrzlLFqtTDtxyoTe4kOYgzoWPBcRbJUog==
X-Received: by 2002:a2e:9ed7:0:b0:24b:369:538b with SMTP id h23-20020a2e9ed7000000b0024b0369538bmr11690744ljk.206.1652711347000;
        Mon, 16 May 2022 07:29:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w21-20020ac254b5000000b0047255d2112asm1321513lfk.89.2022.05.16.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:29:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: sprd: use new 'dma-channels' property
Date: Mon, 16 May 2022 16:28:57 +0200
Message-Id: <20220516142857.6419-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
References: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The '#dma-channels' property was deprecated in favor of one defined by
generic dma-common DT bindings.  Add new property while keeping old one
for backwards compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 79b9591c37aa..89d91abbd5d1 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -126,7 +126,9 @@ ap_dma: dma-controller@20100000 {
 				reg = <0 0x20100000 0 0x4000>;
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 				#dma-cells = <1>;
+				/* For backwards compatibility: */
 				#dma-channels = <32>;
+				dma-channels = <32>;
 				clock-names = "enable";
 				clocks = <&apahb_gate CLK_DMA_EB>;
 			};
@@ -272,7 +274,9 @@ agcp_dma: dma-controller@41580000 {
 				compatible = "sprd,sc9860-dma";
 				reg = <0 0x41580000 0 0x4000>;
 				#dma-cells = <1>;
+				/* For backwards compatibility: */
 				#dma-channels = <32>;
+				dma-channels = <32>;
 				clock-names = "enable", "ashb_eb";
 				clocks = <&agcp_gate CLK_AGCP_DMAAP_EB>,
 				       <&agcp_gate CLK_AGCP_AP_ASHB_EB>;
-- 
2.32.0

