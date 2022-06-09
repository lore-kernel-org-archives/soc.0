Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C15ACCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 150DCC36AFF; Thu,  9 Jun 2022 11:40:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79922C385A2
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79922C385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id me5so46370750ejb.2
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=mNZv/vOTlgWw33oah/CqDorwmXalyTLA9BKQ25HQG6NfYltICakt5zZVVDjeF9AdIB
         lg9XtD34rEryysprD956jx1BJEB2y+b7QCbjgr/8W7zZ2bhq0YoFP5IKAOQRSyH/xW8q
         LBk8PH1/qkRnLxCU1Wm9sX4MoV2kxQFNYRgzjhaXSSHoI3q7JdZC+sXukltg5WmyM8Hc
         ydHE4Ro7TDaiavP+mZCZRdyS/TtWj1t3hs/5vssvk9Ii9ibpl0GYgI3YkMWAQeM0rlmf
         510h5UMxnN/ap47vWnT78ToH/45kN5npPdfVkwgxJIEWqGJGIEC1NQa9aL08XwH56BYt
         tJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=h7iAVI7uX2oz4EpS+yNeVOBU4n12UnpjE7BHu+D2PFySWCMBP/kCXBi2VFjREp+Mt7
         zz4FP1SStkFyjSbO/c6qeeHKPKjuuAoIs7ctwzI2UuzX/YOdd+U3DGD47DKt3m1r5917
         xfrbwoAyjz7pbUwR6hlS2KUne7k+VGWotJmVFaI5AA0UW/n/VIx4X5snblpKuFnLRNgh
         epDM+b+pDWPGB5wxPS3ZDTLBsLOVvExbIRpFXpdKUl5C5TGVKPq1eNvouIA6u7WauKSn
         uCMStZOgJVWsh6s6qQLRJcPKCgTjAMGtLEYrZFYTn9eYV+2j0regMtqBZOFxq+Mk3MOp
         046g==
X-Gm-Message-State: AOAM532F0KA1TxZxpEW3EX4USn9ecinC26WxvgzpwJnYa9XnpGE/nJUK
	ft4pB07diobkK9g37/CkV+XGAA==
X-Google-Smtp-Source: ABdhPJxmAk2Y+XroE7iF0LDQjobmFkH/yU0gGNvbSEj5slHvWwdNDLIfiKGfqCCpS+4l9xnWfXsPTA==
X-Received: by 2002:a17:907:5010:b0:711:f093:3a93 with SMTP id fw16-20020a170907501000b00711f0933a93mr9061053ejc.620.1654774812751;
        Thu, 09 Jun 2022 04:40:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 23/48] arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:39:56 +0200
Message-Id: <20220609114002.380563-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index c28da9323a9c..1a86857c9027 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -40,7 +40,6 @@ cpu@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		poll-interval = <100>;
 
 		key-factory {
 			label = "factory";
-- 
2.34.1

