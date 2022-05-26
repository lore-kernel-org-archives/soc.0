Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1D8C433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93363C385A9; Thu, 26 May 2022 20:46:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 083B8C385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 083B8C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id h11so3157256eda.8
        for <soc@kernel.org>; Thu, 26 May 2022 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KQPHjD3c8QXyN7jVG+t3oRTkD3S6BZATZ+byBZXQpIc=;
        b=ykyjo9fiDDRysWdg8Ubk1v8ubnriDbcCKYYaZ5teRE5SYlk0m0juZYfS8CoVEYoeeA
         Lmq7nhoN0LkR5OynCoiMDl2rI+cT4+/YqDcZp9mfTQjOrulbGjBRN2xerJRBBe+b2qvP
         EfvVdivEheVDOZrLOYU+ImL9bRDXzAGblk7t/74uBd5RGYJ3IbpDZf3tE9x77kN5lsyN
         Qey8HqivbUNv6M60jnT24rSojwxzzSXhSzJGKn5EV8ZTha1jQjlx+N1/mmwvelss3dXw
         U+ajeDUvh5+LTiEUPI7ggPdNQUOnaDTKGKynVL92JpOT4+U9e4yxYjllUrOHdwZZbmCj
         T3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQPHjD3c8QXyN7jVG+t3oRTkD3S6BZATZ+byBZXQpIc=;
        b=vlRvUOgFqL8nVM+xvYVo5aRKNZu12kMi8r+KXzneHMMQ8y7CfQXOGn2B9F7fexXk4c
         VzBIYVtC1Bu+KIkaTrVXcjYXn/z6TuX2HIGWQ0O2kVyiWNNh/+d36eLW11nraOHgUTMZ
         PiiLSQtdOJWla1R55sZzA0ygSLDvwxUMcXs6kchQU7+bWfscUkANB5P3d7McBQCay6zC
         L3T8gr6QFPMwMD91KKBpV4zLjSJU8Mm/4jIYifV4TefhccpgovqoSlVi9+mRV9e+t6E8
         cfBBXZRkJ/OWyuwsmxQ5KmDW/KmW2B5ZDwjszUYxM9Xxd0uOTAAoO9MkA4365G+1aBbC
         2j/Q==
X-Gm-Message-State: AOAM53161ku9uAKnqlYuca4igR9hN6KxJW55xV43y39uYcWRMHUfDWnY
	dvEy1ELI598pIiyPw2XU+N/a2RBw0eA1KFj5
X-Google-Smtp-Source: ABdhPJxnobfUufGwlnrmVi/R9ZAFVVpvRRBrBrdDup3R2hU57m9At3PhU7hsw2wv0Qjs3Ee8TFbnvA==
X-Received: by 2002:a05:6402:1610:b0:42c:6bf6:3d4b with SMTP id f16-20020a056402161000b0042c6bf63d4bmr60230edv.54.1653597973326;
        Thu, 26 May 2022 13:46:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gc21-20020a1709072b1500b006ff16f48e2asm813254ejc.76.2022.05.26.13.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:46:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] arm64: dts: apm: adjust whitespace around '='
Date: Thu, 26 May 2022 22:46:04 +0200
Message-Id: <20220526204606.833054-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index a83c82c50e29..251f2ca0a649 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -601,7 +601,7 @@ serial0: serial@10600000 {
 		usb0: dwusb@19000000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
-			reg =  <0x0 0x19000000 0x0 0x100000>;
+			reg = <0x0 0x19000000 0x0 0x100000>;
 			interrupts = <0x0 0x5d 0x4>;
 			dma-coherent;
 			dr_mode = "host";
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 0f37e77f5459..d49ea382154d 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -927,7 +927,7 @@ sata3: sata@1a800000 {
 		usb0: dwusb@19000000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
-			reg =  <0x0 0x19000000 0x0 0x100000>;
+			reg = <0x0 0x19000000 0x0 0x100000>;
 			interrupts = <0x0 0x89 0x4>;
 			dma-coherent;
 			dr_mode = "host";
@@ -936,7 +936,7 @@ usb0: dwusb@19000000 {
 		usb1: dwusb@19800000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
-			reg =  <0x0 0x19800000 0x0 0x100000>;
+			reg = <0x0 0x19800000 0x0 0x100000>;
 			interrupts = <0x0 0x8a 0x4>;
 			dma-coherent;
 			dr_mode = "host";
-- 
2.34.1

