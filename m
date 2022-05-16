Return-Path: <SRS0=1Wdk=VY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074C0C433F5
	for <soc@archiver.kernel.org>; Mon, 16 May 2022 14:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D17AAC34116; Mon, 16 May 2022 14:29:07 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04065C34115
	for <soc@kernel.org>; Mon, 16 May 2022 14:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04065C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id t25so26119465lfg.7
        for <soc@kernel.org>; Mon, 16 May 2022 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Om7E3tZCgwxeaQekqleJAaOkpjdc9uO+KkphkJXZIw=;
        b=X7QRv8WJPQ2XdsyAGYpASNvJ5aQOMLMXRjknMPT8Ogy5d5pG1J1Phm/u4QfexgtgKv
         jm0tA3IXQ3iwZ6Bgavu83eZhZro8fQtfG/9e19NPFPDwH9GzhJphnDogB3OvRhXCvUHr
         FZnnEj+0WqLJmDx6x34BeGO4RTWEST0doQZ5tEhyhozW0RpXKiOLWSjkAimD2gUfrQsc
         TjiJcUwVHpilGI3USKVxrTx+xBwhLms0OL+aCxP9xKKLdW2e2Wsolsmj/acR0BBK7UWJ
         14U7VgENU1hjtQAHdVgSlalGlyaYTBICEjWlixyksaNIXbPxpdhWJ80+HespXAb25dBE
         CyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Om7E3tZCgwxeaQekqleJAaOkpjdc9uO+KkphkJXZIw=;
        b=ePW6rmrFDk0c72/Vu/A1pz7kfpkIw77zHX5zL1YWkPkKygTyDOoNQt12wL4EroP2Qg
         ycgom4qsFVLMgdhtGHlb4f0LDnQi0uDhTiX6fC6KWmsBIvR8q/pi1JHK4HdpUFvfBRv6
         jpDKUIuTanimfA9wajcNrDsRUr1lGzQNPGBZ19xqKDrX1/Bv3yEatvJ2iMkYwqlZZaWy
         +2tL01UlD7MKoMOvT90I9ea4j00tTc+5QwIHhnJAurvk+ldIQD8t10QGCVNq2NvXGRPW
         kQaaYGSxNzUDsZBqmsfLWRubIKyIXAs8p+KtLc3Mk5bVy1uVkwdGAGE3rTW3FR+QSyT2
         TxUA==
X-Gm-Message-State: AOAM531aG6mp0p/IkDGHC2bOBvFzZIOMR32sMAO5jjVC9AEttUJTXZhh
	WZM+MOLahLA4FMYYeerhgvZW0hl/B0GrhGhi
X-Google-Smtp-Source: ABdhPJwqmhkPgcyTOFtr/cWuJ1aftme9kAEKkOKDOMUEsLWtli+WERVx8d8DMs427jT+XuIXKSMypA==
X-Received: by 2002:a05:6512:613:b0:472:4169:1907 with SMTP id b19-20020a056512061300b0047241691907mr13185246lfe.189.1652711345040;
        Mon, 16 May 2022 07:29:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w21-20020ac254b5000000b0047255d2112asm1321513lfk.89.2022.05.16.07.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:29:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] ARM: dts: pxa: use new 'dma-channels/requests' properties
Date: Mon, 16 May 2022 16:28:55 +0200
Message-Id: <20220516142857.6419-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
References: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The '#dma-channels' and '#dma-requests' properties were deprecated in
favor of these defined by generic dma-common DT bindings.  Add new
properties while keeping old ones for backwards compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/mmp2.dtsi   | 2 ++
 arch/arm/boot/dts/pxa25x.dtsi | 5 ++++-
 arch/arm/boot/dts/pxa27x.dtsi | 5 ++++-
 arch/arm/boot/dts/pxa3xx.dtsi | 5 ++++-
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 46984d4c5224..987d792f67ea 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -275,7 +275,9 @@ dma-controller@d4000000 {
 				compatible = "marvell,pdma-1.0";
 				reg = <0xd4000000 0x10000>;
 				interrupts = <48>;
+				/* For backwards compatibility: */
 				#dma-channels = <16>;
+				dma-channels = <16>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/pxa25x.dtsi b/arch/arm/boot/dts/pxa25x.dtsi
index a248bf038033..5f8300e356ad 100644
--- a/arch/arm/boot/dts/pxa25x.dtsi
+++ b/arch/arm/boot/dts/pxa25x.dtsi
@@ -38,9 +38,12 @@ pdma: dma-controller@40000000 {
 			compatible = "marvell,pdma-1.0";
 			reg = <0x40000000 0x10000>;
 			interrupts = <25>;
-			#dma-channels = <16>;
 			#dma-cells = <2>;
+			/* For backwards compatibility: */
+			#dma-channels = <16>;
+			dma-channels = <16>;
 			#dma-requests = <40>;
+			dma-requests = <40>;
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index ccbecad9c5c7..a2cbfb3be609 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -12,9 +12,12 @@ pdma: dma-controller@40000000 {
 			compatible = "marvell,pdma-1.0";
 			reg = <0x40000000 0x10000>;
 			interrupts = <25>;
-			#dma-channels = <32>;
 			#dma-cells = <2>;
+			/* For backwards compatibility: */
+			#dma-channels = <32>;
+			dma-channels = <32>;
 			#dma-requests = <75>;
+			dma-requests = <75>;
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index d19674812cd2..f9c216f91865 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -122,9 +122,12 @@ pdma: dma-controller@40000000 {
 			compatible = "marvell,pdma-1.0";
 			reg = <0x40000000 0x10000>;
 			interrupts = <25>;
-			#dma-channels = <32>;
 			#dma-cells = <2>;
+			/* For backwards compatibility: */
+			#dma-channels = <32>;
+			dma-channels = <32>;
 			#dma-requests = <100>;
+			dma-requests = <100>;
 			status = "okay";
 		};
 
-- 
2.32.0

