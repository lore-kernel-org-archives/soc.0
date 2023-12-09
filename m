Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5CEC4167B
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 611C1C433C9; Sat,  9 Dec 2023 23:31:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 722E3C43391
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 722E3C43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c2c65e6aaso32309535e9.2
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164685; x=1702769485; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt3DlYOqBPGr+XD4+wWN4xoyocT73U+x7ydkizkAcB4=;
        b=fSna02oGUaG8fRiunt3nEkpSfGYRRmZ7ONiuACiK5kwrCnEo9J67f2PlUlQxbEPpTR
         ocJcIkTtAuK9Pk96BnJw4Kge3KSyxuXMEBenWKKAxhTWNw5P5qMGIGHAyxHjobBRh42l
         OWxh8Tpr5Nwiznr9Aazh152V1SDH69TyCbwQrj0FWpGWKaevYVUlAypfWrqnbHR1RUCM
         vIUo5hAp1ldoDWKSMzKGJEiEpbE8THBbcJfebyYib7sfPlwFTC69AussQKMXHbgANSgN
         cI5G3we8ZUCw7MCUZXq4Q+eEqpgBeXg8Z/Jpk7jpnJcFxjv2bN0IYDSyq2on4SdpkYkP
         w6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164686; x=1702769486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt3DlYOqBPGr+XD4+wWN4xoyocT73U+x7ydkizkAcB4=;
        b=gjsHepCMnfLu2GDQcJDvNnzsRR40Kv1dechGUNYw8db1PqKKPnrJ99QpVh+YCyS+9m
         VjAtqeR5QH45aCX9ue6lzRN654Q1Q8hHjLWj0GxsRIlMO88OXneIvZZ8lQ8kCr/hDLLI
         PGAewWrtZNqgcpx8Dkm3WCr5xfi19fJwCWORKkQXL7YMVqVDNwf1JigxjciGHIRGRyZ1
         +fqPKSmil4Jpz4U7bHpE2kjBpX4X/po6vgq+rtN9ARCTf8mLuFDaId0HwrXgRVK7caxw
         oHUEmiKtK4t/QqLIGq9RDO6XPBOLcsGczydZIRk8Jj3lQFNq7w6ebVSkWhosL7ZQ8TWT
         Xa0A==
X-Gm-Message-State: AOJu0YymLDRxYlvwfMmvar/hZBAgpT4HCvZvXnsnultvluk4xrPpf+Er
	aO/SVoMix3DXcOPMxBRGep4J+Q==
X-Google-Smtp-Source: AGHT+IGkgpwIOfGM4IWpdQ1In82Ab7ZPQ56XNX8tTri5eYcb+c64uzqd1e7frG0PG/Xau38IP7+5sA==
X-Received: by 2002:a7b:ce10:0:b0:40c:2c5a:da with SMTP id m16-20020a7bce10000000b0040c2c5a00damr962602wmc.191.1702164685792;
        Sat, 09 Dec 2023 15:31:25 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:25 -0800 (PST)
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
Subject: [PATCH v6 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Sat,  9 Dec 2023 23:30:54 +0000
Message-ID: <20231209233106.147416-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..ccc3626779d9 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.472.g3155946c3a-goog

