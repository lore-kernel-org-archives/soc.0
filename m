Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B30C10F05
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32031C433C7; Sat,  9 Dec 2023 23:31:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F0CDC433CC
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F0CDC433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so9276575e9.1
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164678; x=1702769478; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlntL3e7CU21B53Om8w1Bn176sZIdCQXro73e+5XJx4=;
        b=LhxBumlQyH7zDEYaaHTSOUy/4pfI9suQeB+lxWNiBgxFdD4aHp2G2PX5bhDdOlLvpq
         d/UUS6OkCskdpoU8FWTGdxz30jEZaXZWFdTrSHvns9iunAW6qTmXhY6QJOoZG73P27p9
         +GeKeglyF5s+BFcxs+CjyKuEU1PkcljyTb5G/cmMRlIAF9OR9fWaFniXXzTo/GzRzRYB
         iWm0Qp5sUd9FGSOEczLTA4/G6isLpsf2i1an4wsiiGifYYY49VHpsFGQW7BwKTOHB/7V
         C2h0ST/xpua5atxBgFHnN5E5BT/qCcPMDtlBrK60G3trhJksDh6l/xcOlo74JaD5ipjq
         lcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164678; x=1702769478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlntL3e7CU21B53Om8w1Bn176sZIdCQXro73e+5XJx4=;
        b=Xdt2elm1zgLt4K+AcDtUDNoEslT1fhxQRuxtltYOMZouq7xp0RNOu/iCLNBBqg/JVl
         IRmxDggZFsRWMW8Svd9KAGXzeX9Tcvve+xcle4GaEUK/P9Mb6WfSJy8vRoO0o3xdmhdO
         8pWiU+ieSazKfND/mgVtuWhqSwhyHdXBsRtkVGjgsGOxXFoODS7kRHOk9Ur1I/1ZM3wC
         Enc5QRLRtdi4tQC80x3bRHTTMsK6OMUMZ6dYzsor9P+RLGyJJa7tmq6mRBFSoNgrYINH
         X/GBbvxPhCHzaXEYQ32A4FhrqrTZoCeZ0FjU9lCDf08afxnOlGtwF5zhnRa7vwcZD2q2
         UGsg==
X-Gm-Message-State: AOJu0YyWqq26Z15sYr1+CKP+QH/Z2aYbSdQxSCuqew4heSWernGqxFtW
	KlKNSqcaz7FO2vgtUqI/hOD1eQ==
X-Google-Smtp-Source: AGHT+IG7dyYZn24iRWJwzOFDMLdk9RqcmFN/SLEXWuhcY+EiXb6lMZj13Q3ubjvMSQZL/cKAexoxcw==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id f2-20020a7bc8c2000000b0040c279d31a3mr1088695wml.176.1702164678218;
        Sat, 09 Dec 2023 15:31:18 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:17 -0800 (PST)
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
Subject: [PATCH v6 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Sat,  9 Dec 2023 23:30:49 +0000
Message-ID: <20231209233106.147416-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 2de4301a467d..127f4ffde76a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -22,6 +22,12 @@ properties:
               - tesla,fsd-fsys1-sysreg
               - tesla,fsd-peric-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-apm-sysreg
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-cam0-sysreg
-- 
2.43.0.472.g3155946c3a-goog

