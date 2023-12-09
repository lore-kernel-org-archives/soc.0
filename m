Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE1EC4167B
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83013C433C7; Sat,  9 Dec 2023 23:31:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72A36C433C9
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72A36C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so35380645e9.2
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164689; x=1702769489; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u+KNC2QWJAni+OUMFkynao6EoRKHV0N4H89jPXatR0=;
        b=qKjvfJqy8AltcQ+dLbONaNltI66BPvTbf11VnIrYPqvJBttTtaLV1zzGxGuw6YpWY9
         E2qvwRfkDBGs2dFIUS9azc+8HoeK5GhKU1J66shBW/2gmNWVM5AOFtG/hiBBhpMcz1Dg
         W8sn0Q+xAJ6AZRvtqBgxy5pz8/D12SCdjyT30fPtlavAA50RS9qFJDJLBNA2tIKrBoTd
         eDAAA8LsiuHpO9avCcmgVJy/84/oP9/cya25uTE07F81Rnzs2N+CczieoPMoArNXXJPv
         ZX/357cnqTcYoSX7JZit87yN8je0vaujkN2nSnv/ndN37N2cFTxOM4uKGVtd8LM8F6zq
         RfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164689; x=1702769489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8u+KNC2QWJAni+OUMFkynao6EoRKHV0N4H89jPXatR0=;
        b=b0eo6vCs+RiUGGEIa0f2P7YojRKX8kBaK58f+VaRUHBRKjn9ulmVjVJO5FqWdnMT80
         eBsEg2zEFDWirwR5ty5vfu6MkVssqbQZh+dW99D2WuipPYcNCVv/HCupwx+78c4/UTFo
         vxWTf4gFCxOjElCh75qhVxvzo74JCtVuwGvjIqwAqwOyStQK2exPV9xD3JnyMh4a1rfD
         q/aUEzQWPBypZTZQTQw3t5x5ArHzoC5jogmReH4jwh3NZyYJObSNPTbTcE/VQ0A32fI9
         wQNea/uGCzaoXE+tIddFizcR15CInpF/nus8JC39NTCB2i2xgCseKEE8rM1atnQbm7Ti
         qszg==
X-Gm-Message-State: AOJu0YwkEXs4K2mtU9wkHEEXoUUoQP8p//2VVexB1Qtn1Zb6raa+IOM2
	Vq6/+jBZxkWQvMyV4EJ3nPIZDA==
X-Google-Smtp-Source: AGHT+IFmkK/l3otAQWLZWdNOPyi0qyQR3FBPQnZvyIYfPqpwLPwcPYijtpqVYqcbP5kWNiX+fFjhdQ==
X-Received: by 2002:a05:600c:3784:b0:40b:5e1b:54a8 with SMTP id o4-20020a05600c378400b0040b5e1b54a8mr1211640wmr.52.1702164688813;
        Sat, 09 Dec 2023 15:31:28 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 10/20] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
Date: Sat,  9 Dec 2023 23:30:56 +0000
Message-ID: <20231209233106.147416-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Add google,gs101-usi dedicated compatible for representing USI of Google
GS101 SoC.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 61be1f2ddbe7..8b478d6cdc30 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0.472.g3155946c3a-goog

