Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33685C07E97
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AB7DC433B8; Fri,  1 Dec 2023 16:11:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECF86C43395
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECF86C43395
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b4d9e81deso22092885e9.0
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447056; x=1702051856; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqUq8HgRrGxmt9Sh9WkyxYYOgIWePrhLH04C32o9WIM=;
        b=HfNFJ7z78AnvnzTNUAOhMROsp33OqaMNAe8goe3tH5zPhOxcs0thBId7YxFaCCHPCk
         hF/o46GcZVGyxTtKgJO/N3EoGeN+kUbtGXOCtBWiweQIJ7vl43FP9PkN//CvYtYiz7Og
         9URwqjkcObbXawgQOa9e8KoUSKI4ODRVSHg3Lp0F9pDFX8Bl30ToVjSS3htbzAgN76V7
         nfzxIVYHzD6OzJF99z8ARone9MD8oVdzyjoj7c/6pgkpLO7gPHFwgasIsSLRCIZdmllp
         e6LuBhR7Rk7jqOjkBVeWEAK6WVDpQwX6+2Wh+u25vQjJsXG6HpWL8Lo9qOxauxLxmcxB
         PtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447056; x=1702051856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqUq8HgRrGxmt9Sh9WkyxYYOgIWePrhLH04C32o9WIM=;
        b=OkONfm66jklxU9v2MriyWbgRwgtxgWIKQdCzngSc4ahBHKbVTkcjH5brXlJCKNRrNi
         h+LrvyGQs/N4sOKWxxCu4Sg25mRJU3FrRBKNqtBZyY7mJIwvEdQZQdsJjwK5+EuGyBWM
         +S75XOXFBoLnyf6A9yhoZ1mShLzUzMmunvNWZUmPbh0EJOFqOq2SScGvuy8r5Li5BU3F
         G5CvzXyFXUtD6uNjd9y1icQcG8EMS8wBuHKD2gqusr/9YMEHsyEHEKYb5GbvcgC/XrGU
         YRCShdOyQihRDsUV29i6fhrU0sb39Goz3CFRQV17ElMvlGaAw28FuHpsYhoE2dqKHEyy
         K0mA==
X-Gm-Message-State: AOJu0YxhMTPpTDP2Ez7GIusT1zQ/bK4pjWExKe7bHqXhxYzoeHywo68l
	I/2AHKdYKcK6Cgrf2TLnVJO40A==
X-Google-Smtp-Source: AGHT+IGxH3HZRD9B1F0nvSoZso66FA8TLrJx4cs/LpqBZQYZyLd3azB4kfjBGCl5Q90eurcfEWOWWg==
X-Received: by 2002:adf:ef83:0:b0:333:2fd2:51fa with SMTP id d3-20020adfef83000000b003332fd251famr1015597wro.115.1701447055983;
        Fri, 01 Dec 2023 08:10:55 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:55 -0800 (PST)
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
	linux-serial@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 05/20] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date: Fri,  1 Dec 2023 16:09:10 +0000
Message-ID: <20231201160925.3136868-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..be191e70192d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/google.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor platforms
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
+  devices.
+
+  Currently upstream this is devices using "gs101" SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a.
+
+  Google have a few different names for the SoC.
+  - Marketing name ("Tensor")
+  - Codename ("Whitechapel")
+  - SoC ID ("gs101")
+  - Die ID ("S5P9845");
+
+  Likewise there are a couple of names for the actual device
+  - Marketing name ("Pixel 6")
+  - Codename ("Oriole")
+
+  Devicetrees should use the lowercased SoC ID and lowercased board codename.
+  e.g. gs101 and gs101-oriole
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Google Pixel 6 / Oriole
+        items:
+          - enum:
+              - google,gs101-oriole
+          - const: google,gs101
+
+  # Bootloader requires empty ect node to be present
+  ect:
+    type: object
+    additionalProperties: false
+
+required:
+  - ect
+
+additionalProperties: true
+
+...
-- 
2.43.0.rc2.451.g8631bc7472-goog

