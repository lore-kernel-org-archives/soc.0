Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F6C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A1F8C433B7; Fri,  1 Dec 2023 16:11:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A8C9C4339A
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A8C9C4339A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so21922295e9.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447063; x=1702051863; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvFQqh83XDxX334cnnEsbE/4STBhqnMnZDTYflOVgq4=;
        b=W/sNKnR2WpNnUl9+WCV1gooyjNmG5IxGjvNWXVeXMwpLNEPC88vWz0T5Qf/0gyJiUA
         XFWADpbNu0vUE9qNvJBAnMiGcnUHdypwgrmelxAbUJxj/lMOVBgfsjNmAKvZ1BZeOT22
         AErLOmnMBTcuZDisBhEM5d8pU+RgQeuKOaYoHky+0A3o0t21yRB+nrPQSqCfXZ8oiPP1
         TTP136WLnz+032ANq9gQe5JHGLzVF2hMYvKxpT3ewPfgpjPR2c9fSO0krpYc6dc2EG+v
         wP270K4JxP8NzQdBUOasrZ9BtfUPMUqnjADmOE44nsSrvr8d6GWfkWWez6x5PtZ8xTWl
         eO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447063; x=1702051863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvFQqh83XDxX334cnnEsbE/4STBhqnMnZDTYflOVgq4=;
        b=OaeezyvafO0G4UlT37Lo5EHBL/wnf2i8ImDloGG5GLg8RoZ9QMpN6gHCEhEGflREFq
         aZGTgJEoZ0c3b011XUJJvPGz1RehM6FGdC/vtNKwtgYM/mVYhjlHs7UyrMOSWOuLJXrA
         zFbfl1ZYRtcEAf7/lORzwzZC7oBPtM8Viu9qkKOjMf8aAphbNhGk99MO9CU+R1Vtjvl7
         MLGZgRLJnxZRC/DYNO2+HdWjDIXRU9GyN5Tq6Dr/MJG8Vu/07yBjc1XXBRjeYlpnnTOa
         PMsQjNoQEjZCWdTax4wV5Id+Qt55j1ibwMyJ6s0pUeoVk3cuT74RyqjTQV3g29pJUOfp
         +9Mg==
X-Gm-Message-State: AOJu0YwmmVIE40LXOKtjS26PxWCYcoAqf904UPTAXddRKIk0R0wap5zP
	1zbN0DTg72XAvimzP6lcjEaT2A==
X-Google-Smtp-Source: AGHT+IGYzvD8BiSPCDF/ykP8FROhBDF7hWyIECBH3X3/miehAsBGVDoFGSiPYaol+fTU7lwN6mAFTg==
X-Received: by 2002:a05:600c:20d:b0:40b:5e59:da89 with SMTP id 13-20020a05600c020d00b0040b5e59da89mr512152wmi.156.1701447063565;
        Fri, 01 Dec 2023 08:11:03 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:02 -0800 (PST)
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
Subject: [PATCH v5 10/20] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
Date: Fri,  1 Dec 2023 16:09:15 +0000
Message-ID: <20231201160925.3136868-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Add google,gs101-usi dedicated compatible for representing USI of Google
GS101 SoC.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 61be1f2ddbe7..a10a438d89f0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -28,6 +28,9 @@ properties:
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
+      - items:
+          - const: google,gs101-usi
+          - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
 
-- 
2.43.0.rc2.451.g8631bc7472-goog

