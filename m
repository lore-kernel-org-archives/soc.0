Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26521C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E41CC3411F; Thu, 16 Jun 2022 00:54:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 394FBC341C7
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 394FBC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id z14so8768005pgh.0
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/8m6MhDbOK9+V515hZszn9vJkAN/TqZqKv8XaJa+cRs=;
        b=CdFncK695RkHcbTK1Pgb3G1/LJP+K0xyx4djSr60w3isPqxCBAtlt5Bpurr+PSknUQ
         cxtMeCi62MyyybzWNvZuhmwpiyLOFlQjCsQxdvzp3u7cW2K39pAueoJKekX5l20j5/2R
         haARQupkGopxcDxbwUhDDQj1+ghfXhOzOtLX62hgt4TpwdYRjozKMqzrSZ+MFeOfCuiK
         yRlhJehTp6hJ90/y1X4gpG1dM9lOLncTbblW+WtR5DpIoSe7s16ukBTXratFvXfoXDeh
         gtWgna+LKcT1ABGMjcuHSauU5QbSFFfootcUx/R16oucPcObhIxWEZT2R+mUO6//LZRI
         PcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8m6MhDbOK9+V515hZszn9vJkAN/TqZqKv8XaJa+cRs=;
        b=odM+mFffkpd9QtKsLj0IR+uOWE2EnXQZ3El87PImTiwNO8NRngMYrDxXShwYVdYrCH
         RNGZKz9IyTp4vGrIBuucAv08qPg03My6VeV+vMbTXF1jEEHYHabehgC8qHDxKhuhRabZ
         JMpp3Ol0FBcjcedTm/6C1uyyJAtSQupkrPFvNSujj30yPjPa1wNYWSEXJ4Kmx8b10KN8
         JTfjUklSo0pMf+WDF6RxJTg4BA1C7cN1ivlM7/UHYTyDsdB2cqBRjpPyU9qLeJh43l/a
         NjWWedEktZACJSoJzkdJc32pYOm8GSPbTZR0ATPDaWZhcnt4gmR1F50cRBrueUghh5bk
         iqIQ==
X-Gm-Message-State: AJIora+2or5XwcF9a2yTPg25808pkT5l3vK5Li2N6BqC/FY5GPUxyBmb
	01/wHsq/UYw1vW0lHpwzTmf1Bw==
X-Google-Smtp-Source: AGRyM1t6yfuLylrv3e4vYfkN0h1NUNBGLQps1pD5oFMNcHJ/nnCL14mq2T5En49fwPDsRha7e3GmzQ==
X-Received: by 2002:a05:6a00:1da5:b0:522:cb12:549b with SMTP id z37-20020a056a001da500b00522cb12549bmr2135800pfw.81.1655340841637;
        Wed, 15 Jun 2022 17:54:01 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 05/40] arm64: dts: apm: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:52:58 -0700
Message-Id: <20220616005333.18491-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/apm/apm-merlin.dts  | 2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
index 217d7728b63a..049e7a5edca7 100644
--- a/arch/arm64/boot/dts/apm/apm-merlin.dts
+++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
@@ -22,7 +22,7 @@ memory {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		button@1 {
+		button {
 			label = "POWER";
 			linux,code = <116>;
 			linux,input-type = <0x1>;
diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
index e927811ade28..efac50aeca64 100644
--- a/arch/arm64/boot/dts/apm/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
@@ -22,7 +22,7 @@ memory {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		button@1 {
+		button {
 			label = "POWER";
 			linux,code = <116>;
 			linux,input-type = <0x1>;
-- 
2.34.1

