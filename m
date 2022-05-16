Return-Path: <SRS0=1Wdk=VY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A702EC433FE
	for <soc@archiver.kernel.org>; Mon, 16 May 2022 14:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 900F9C385AA; Mon, 16 May 2022 14:29:08 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E98DDC34115
	for <soc@kernel.org>; Mon, 16 May 2022 14:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E98DDC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id y32so26127632lfa.6
        for <soc@kernel.org>; Mon, 16 May 2022 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZIGxwKJ/Xe8wH7s0ybpa7g9C2aeLAWID2un0fZf5uMo=;
        b=SDbPSx3syBpzwF9+L/1WEF8YIxnp4OzOvBVWlXFxK95ea2PlvIz8H5RFn9P0ERCt0j
         P+9wGHxCTT90Jc+i1pBB0IHMQ9/C1B/p2K37quvoFXR1B8+SOJxaRCxUZzc/1zAch+fe
         6zaj5FAKQpz12vujbEllJp4FEIRPcjQgXTlHGfLpHjeNhfzhTRJ8Ro8J7Ka4ZBW8zWkJ
         Yv3X+DxO2OmCVzLEYRRWdA/q/6arrU1p0dmrFHgeKYqupA/LxiY9yne+INK9b4a5KRC+
         PSyFkg0c7yhM6DFd4pcOpvF+G3Vu9PrQHkgaoppUzB+s/m0g3OeXiQu+rjryrvhzEiBm
         NrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIGxwKJ/Xe8wH7s0ybpa7g9C2aeLAWID2un0fZf5uMo=;
        b=DP7KGEE9j8/UZWzBdpyzqLADwiCgHP4UAWlaEQGoQE/N21Ka9XyDvIN7x57K29jmFX
         IhEHGTulBPwObq5HXg/Yfdg4DUFB/qKdW4Tsauku5pDZ0PwgGhvYhxD+R8lPY53Wn5Vk
         hHAOREfJgTWRvKTLw2H5s4/eHOpOxrVg53WfEgtDXVSWKgM7MHNSbRbl/XRNB4zdND7E
         wpALjgAuimCixD4+kScQXF/OVehJmETqfXSI7n2BwTzD0ISDwYGuAYABItok+VOA5JQu
         z48C2UBXE7YGBuKsX/b7K5RrI1gBQleaATFgfF/JOdGOl1gbHSUPi3gea7xpulCPo+f/
         igFw==
X-Gm-Message-State: AOAM5314tpU2tPCIoHXAcUpYfPzhgBAcG4i4YqS9oYV+aD5g10MURk98
	tx5KKvRJ5zzDME6yG63fWa/9DQ==
X-Google-Smtp-Source: ABdhPJzOdUZRsnk6iiZuj6hGSe8K67uqT6AkolkeIXIe7n4TzOxQO+JujDhVdRBaDH3yjIFrG74+xQ==
X-Received: by 2002:a05:6512:22c3:b0:473:9f83:82d0 with SMTP id g3-20020a05651222c300b004739f8382d0mr12894879lfu.588.1652711346064;
        Mon, 16 May 2022 07:29:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w21-20020ac254b5000000b0047255d2112asm1321513lfk.89.2022.05.16.07.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:29:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ARM: dts: da850: use new 'dma-channels' property
Date: Mon, 16 May 2022 16:28:56 +0200
Message-Id: <20220516142857.6419-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
References: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The '#dma-channels' property was deprecated in favor of one defined by
generic dma-common DT bindings.  Add new property while keeping old one
for backwards compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/da850.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index c3942b4e82ad..0386376fa486 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -679,7 +679,9 @@ cppi41dma: dma-controller@201000 {
 					    "scheduler", "queuemgr";
 				interrupts = <58>;
 				#dma-cells = <2>;
+				/* For backwards compatibility: */
 				#dma-channels = <4>;
+				dma-channels = <4>;
 				power-domains = <&psc1 1>;
 				status = "okay";
 			};
-- 
2.32.0

