Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63C0CCA479
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEA69C341C8; Thu, 16 Jun 2022 00:54:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B99EC3411F
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B99EC3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 123so12908328pgb.5
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4nap20TqgB0A/v+P7vQ2P8UpGK04XbIqt1wfub5uXnA=;
        b=i/Hj9mgu7iQ0dmF8TKr4SZrvHUysltcYCDmQhRenzfoqKnCKCK5gPhBkdN5qNDTNMU
         zKkPD+Yi94/oA1W2FjMEYBOE9aFtGmnKHaJ7cMJm/8ZSzX5cMgmKc+Gb+BSgTeY6OKxq
         IOcDxM7jFIHaECYn+GsUqhLUzN6ePzgTOqmJr3rf7wEMnyhOUIhMIzKJiSZGTKWaDPbE
         qIKy1WxioqejZCTU0WU3f+T5RD78E2oWfLWKy5HalFp9lsVx4+uArrmeeql//uwhzD8X
         le+sBQ6RN/gf/S1Sz5cpsx/+mpgQraXSDAglTZyNXuN1BwJohyOJdHjVEcllNQd9XF2b
         tV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4nap20TqgB0A/v+P7vQ2P8UpGK04XbIqt1wfub5uXnA=;
        b=yRIjwiz1dqUxK0ZbjERrjON36C4w/nZX8jUqgI32kJv4JBUcYR4pQvJlJ7w8F6hMBI
         e23lvmYsUqgM8ZDfErdsQ9vRkr7Na0a4s1luFRZW8wDsErNbyhmt60P18F+HQGc7KZ9f
         YLmIOkBVdJ6E+LA7z6afKIpZFOBqJBrarp+k96RkMWEor5yNZro/Tpb8+g3mWi0ehLo4
         qnwWAEGHagM8wHmpX50GLkvdxpOFddF4KCYDAq9JOZ+r+zxoUmojmWNvWGdpn2Ao0gxl
         Btj259MHdZcwuk+VASBcQk+wj8ADIMePIoIhk0bqRmv4myoO5W8dk6Us83oSG815/1o1
         CQVQ==
X-Gm-Message-State: AJIora/+E+7vJ2OlwWhhWK13suB+V9f5utVH+7a0DMuONGpK6tuEQRiX
	YRQ4gFYFqIsm2FOH6+eCMFi6gA==
X-Google-Smtp-Source: AGRyM1up6OxTQao90fn2iMzGI62yKiM2RJnpZI50FISs1ZyKORF/8rAad3+f2m1qofy/2GP+3z44Ig==
X-Received: by 2002:a63:135b:0:b0:3fd:876c:975a with SMTP id 27-20020a63135b000000b003fd876c975amr2180615pgt.538.1655340850765;
        Wed, 15 Jun 2022 17:54:10 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 12/40] arm64: dts: marvell: armada-3720: align lednode names with dtschema
Date: Wed, 15 Jun 2022 17:53:05 -0700
Message-Id: <20220616005333.18491-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
with 'led'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index 6721b9b4cf5c..de8d0cfa4cb4 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -35,7 +35,7 @@ memory@0 {
 
 	leds {
 		compatible = "gpio-leds";
-		red {
+		led {
 			label = "mox:red:activity";
 			gpios = <&gpiosb 21 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-on";
-- 
2.34.1

