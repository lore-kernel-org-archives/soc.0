Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1043C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB78EC341C5; Thu,  9 Jun 2022 11:39:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 584CAC385A2
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 584CAC385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id g25so402587ejh.9
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4nap20TqgB0A/v+P7vQ2P8UpGK04XbIqt1wfub5uXnA=;
        b=Ueg1vJJtA8mzpsxH0nEFiaIWtuWV7p1LHMzOZutphyHV3yLNgABv3dLC3ekrynBmwn
         A/r+kMTyQaEVwCSXfT8V7XJ7862EeGQ/QmFFFCuYQY/z7H9oSYIIAYN2VD1mfiHEJahL
         I9d9ol2tBYkYfdlqvyOl8A3FYWHVy9LkBc8s8/A2936OS0dlpyGAC4pX0RkletzxOvfy
         cBJe9jXO2rjn34k591hPOiNOuATn92Q7pk81D/u+v+tbYmzGuHCrsHuayEZrMmZYjuj6
         D3obDZLP6s59w9spooYZTHq3H5UCsViIrUCXGqbofhtSH7UBNMSsJRX7Vps4kEGQuZkU
         h1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4nap20TqgB0A/v+P7vQ2P8UpGK04XbIqt1wfub5uXnA=;
        b=B2Wg+ZqBQ2wPaeFrFJPrSmpeCeztWSyMVmtlT2rADTLR7UtlSGciipqnp4ZbgOswwL
         gYIVSIOa5xbMDtsleoEC6O3bM/muHt0HAPHG6fetFIa0QpVUEMeXn1w+v7t2G06y3mDy
         tCkX6Z7wyR5kMSVXalyMzlLOPffyfsBBXbRyLTECRSOXRkyEPi34xO/nGDcFUg3CNur2
         fZnh6eJfO1ybicpJLWtGJdKWm4DjuLZgByxX563NrsfNkkPE1wxe54RaUm8GNXwcj2+d
         n91Rc7RV6F+L32iTQP4iXwQjJ/CE0ePYEkHAg01BzV0DrmaTbQlt3NNm846wXnCwAEsU
         jZzw==
X-Gm-Message-State: AOAM533Dq/XLxCwNld/5NmOiWklZAUbp1CNIFGl83NQNTNMxpor0qhnK
	qdOTUH2pBM92DwTJVJWMuhYizA==
X-Google-Smtp-Source: ABdhPJwT53YScCHkgOGSRt+XjDo4cxp8wW6m7k79ds1Jt/noDk4zfP87CzIo6MdnULITXiZ97ROXQA==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr35617094ejn.598.1654774794528;
        Thu, 09 Jun 2022 04:39:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 18/48] arm64: dts: marvell: armada-3720: align lednode names with dtschema
Date: Thu,  9 Jun 2022 13:39:37 +0200
Message-Id: <20220609113938.380466-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
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

