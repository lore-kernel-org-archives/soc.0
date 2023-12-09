Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68FCC4167B
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDFECC4339A; Sat,  9 Dec 2023 23:31:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2149C433C9
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2149C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c3f68b649so8226225e9.0
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164681; x=1702769481; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufy0nGRtp/1JIZ9psxq6/E5zOi0BD5o7YxdicbrUE94=;
        b=Td0mkPKKwC+qFop+aafqQsSi3XY/E2W8tylcNtKLB+vwjjTkJv+qaGqFTso4PLtCWC
         DJaBS71H675VsH19HRzfYsurpacIgUoQxuFYQd1Il1TKAy2PucS4N2ERR+EMNwOJm28M
         jmkCQoGjsOWWddHiFSg9Vh+e2ncmAfR5Vyd4Bm0174t3IRp7JwXo48lgzHJpjcM/iVII
         iFii3dm/Eycwbpj+ppcPLFwOA36/3YjfE2+N3WxAxXP6n5U4nKPtHqps0CZp+YusfpN0
         EsShz82QeOwDYVXZJQpABPSabQcve1b9C1tKPUEkOU8VasbEzXZOB+5K0XvEb19cWrGd
         WP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164681; x=1702769481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufy0nGRtp/1JIZ9psxq6/E5zOi0BD5o7YxdicbrUE94=;
        b=Sx6wNHYsphOmfZRKsPbC9JSgMe/NTmceIzbtnSvg7w+sef0RV7989CmM6Ae/VuD2i4
         fuyqzNmlpuU23umgt/sGRE8XqPdWqhh4f/1or/x2U9U1dfkFLOmdJF6r/ayl41Wvx5Z8
         yVVnOJgOzhjGR792eheBDzr7x5EQ5nBgteZ+ETcsRX8oOA/hyHTENS78IP1Ygzbm6ih/
         KU0zU5TbO8uqd/ncw+fv8Aw3UqEh+63QpXHHpSq2P6rtMrW7ld0InK2/XGoHFpOTIXhB
         1wMEAalFzkwSzC1YLdF6aiKi9uLUcqNzC98cqU4/Dq1u17YcJ7UYxeemUcD6A0a7Kov6
         Tt4A==
X-Gm-Message-State: AOJu0YyK2S2j417i90fcgIA8AgCzi36wPmgKcg26Bmz+JsVDJOgphHuW
	sKYVwLgXqkvh/X9a5mw8sNxoSg==
X-Google-Smtp-Source: AGHT+IGjfXfdEi+FC95F5SnCn1zV/uuKcGFsWqZfxOQ5CQVz10lrVJ/v+al0iR+cDIdCSxfU0CP1Rg==
X-Received: by 2002:a7b:cd89:0:b0:40b:5e1e:fb94 with SMTP id y9-20020a7bcd89000000b0040b5e1efb94mr741927wmj.73.1702164681233;
        Sat, 09 Dec 2023 15:31:21 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:20 -0800 (PST)
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
Subject: [PATCH v6 05/20] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date: Sat,  9 Dec 2023 23:30:51 +0000
Message-ID: <20231209233106.147416-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..e20b5c9b16bc
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
+  Google have a few different names for the SoC:
+  - Marketing name ("Tensor")
+  - Codename ("Whitechapel")
+  - SoC ID ("gs101")
+  - Die ID ("S5P9845")
+
+  Likewise there are a couple of names for the actual device
+  - Marketing name ("Pixel 6")
+  - Codename ("Oriole")
+
+  Devicetrees should use the lowercased SoC ID and lowercased board codename,
+  e.g. gs101 and gs101-oriole.
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
2.43.0.472.g3155946c3a-goog

