Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AB4E9271A
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99B25C43395; Thu,  5 Oct 2023 15:57:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD393C433CB
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD393C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-406619b53caso10079585e9.1
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521448; x=1697126248; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMWnJU8MsW38YqwezPXC42C6b/YrhBHi3/ZxSDJgFAQ=;
        b=CIoRZUMqLZKw/vGUH9kHUGoP/eAAwtY3IAoUkWKZKzHb4pc63GSzCHoT7QuECOLLPZ
         MdG0M7zMO1nLKfbv7cdRgXnguU+pe9jBHO9+IlE5afi19luIpdeAekeNlRI+RgQufbw2
         c64M6pq6ogfzS7cpa+fgAaHw0LWtmZvddN1SvdQFoJbjhXBrSeT8HbXmkyUi2/so4I9H
         PAWnqVqXnzOjRieg2+ICudZe84bw2fA8J6LKR0VmfuglE6V4OYXp+uA4AWAgY/ljLWfQ
         MTpnJGz+4cTLO3HKa613msb2xkut/wNqWzgay2xecsTSMFaeLYutm+pm7HdsBd3XMSr5
         E5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521448; x=1697126248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMWnJU8MsW38YqwezPXC42C6b/YrhBHi3/ZxSDJgFAQ=;
        b=UBrgtFKDbhILY2DvEl+TTkvSZ/KIbRiiwLgwXLhIPMawF1F1HUO0iCYjwP8yRNxCvc
         CuoPKoJ3UkaADXIiH4vYMdU9fa4sjFZwGhUq6xx80p1F+TjgP9LlwaYm9hxQbdGhqrg5
         JDQe3YdqvTtnlFxKkPAadN4kxvwxiP5OetLGQUs+8YfKdlQ0LIr2hzQeJVRq5DMNGn1y
         COd1Ilzbpy8ANSeIH353VCDrk30Y6WA/VAnaAVVRXnu2Mjmb9Fb2SuIEwu9fzGst8O02
         6+02pQ8sAMxw9ZuwuWTulD1OWN/aBmclM9qDI1E9DHnaFlBecU/btrYxuib7U0zkig6u
         UKmA==
X-Gm-Message-State: AOJu0Yzn6PdCYYnjQAblw2A63mbPw5218FhLrU8oulbZdOcCaRhfLzUJ
	zJOsWGQoDvZbX09f2jYEJmKz4w==
X-Google-Smtp-Source: AGHT+IElw6k3YNkDW9u8nFOA5PsXxz5xE+xMGpuB2fgKZPK0gtuloOqBwjzaNH/QHLmyKFBNlfOM0g==
X-Received: by 2002:a5d:4286:0:b0:321:651b:4651 with SMTP id k6-20020a5d4286000000b00321651b4651mr5358186wrq.29.1696521448129;
        Thu, 05 Oct 2023 08:57:28 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:27 -0700 (PDT)
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
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 06/21] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date: Thu,  5 Oct 2023 16:56:03 +0100
Message-ID: <20231005155618.700312-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..3759d423d9cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,46 @@
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
+  ARM platforms using SoCs designed by Google branded "Tensor"
+  used in Pixel devices.
+
+  Currently upstream this is devices using "gs101" SoC which
+  is found in Pixel 6, Pixel 6 Pro and Pixel 6a.
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
+  Devicetrees should use the lowercased SoC ID and lowercased
+  board codename. e.g. gs101 and gs101-oriole
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Google Pixel 6 / Oriole
+        items:
+          - enum:
+              - google,gs101-oriole
+          - const: google,gs101
+
+additionalProperties: true
+
+...
-- 
2.42.0.582.g8ccd20d70d-goog

