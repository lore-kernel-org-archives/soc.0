Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DCEC5B55F
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFF70C433A9; Mon, 20 Nov 2023 21:21:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BA7DC433C7
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8BA7DC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so60733541fa.3
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515273; x=1701120073; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPrhMgiNguGxrbIvdeLHcyqlQe/MyMdJk9mAGos3v4M=;
        b=tt80iDxVzvROCv0FSjVbrjKvkD4keziaCZ3m0etCDX4UOTDRECMJEJKlZMz8o7yRh4
         TF3M35ZOAy8ZEZ2XU9JPJUXPAF08rNAZH83ZaC/lwYR+dZ1enAZW3H7nEszt7l0LOh9C
         INL6MwixHxctstnq/OaDAJYEwaOrskrYLKIQtCGLQssGyXKYDWvibIpW4zITh5c2ALHV
         5wzh+wzrEE4zPhFImdrXYD9LxJ0IG//o/epaA0hQRbyKDpL2JgaU6h+afmk/4sbCthXb
         PMZAGPXyjjDkgslQgfBGP+uLjzZ5IowseesKBIw6IEmGh7Tphb4FYoBEy69F0DLeIqvi
         padQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515273; x=1701120073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPrhMgiNguGxrbIvdeLHcyqlQe/MyMdJk9mAGos3v4M=;
        b=lXEgnh8nVOMSdPrpjUCGNpeOMNswtFHjV5kyk40soY8YJYLmi8lRlpPIYzXLYVivft
         p21NAqyOR0wX8WTPyApyoU+fE4J5MUEkM7zSvkQQd7NVXHbs2uzcLeeu/5N+tvbqOKjb
         u2HMHWjY446Gdkb1sDlcjA+PbaJ8imiXYeLwmjJq79Ss3C+PJK7qZIhOJ6ab/8GXqRNY
         0o8FglZaQm/jPVZsOrci9hhtxY3VlFKDqUGcjj57PQS+S4cfC3VdCnXQxruhtdPVG5W5
         +uj1T+AN6Gkf2N0gVL9d2QXaxEGgOSeWFhP0TzOGjIrsIlqZ/I9D9gLg23hx1LviCoR8
         7xOQ==
X-Gm-Message-State: AOJu0Yx4wsdYywburBtpC8nlAasLl7goOYD2V+CuRod9x2qMMQSwBj8o
	PZ5RVJVNnpg3DQ/XEdKIfrRdKg==
X-Google-Smtp-Source: AGHT+IE/JKzpTwMnQTxuReZhJ11l4AHB9TdiKw1LttbX0YcLxLFVDCxuFEkk2KCs0cS0JmaV5wy8gQ==
X-Received: by 2002:a2e:81cf:0:b0:2b6:a804:4cc with SMTP id s15-20020a2e81cf000000b002b6a80404ccmr4975927ljg.53.1700515273249;
        Mon, 20 Nov 2023 13:21:13 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:12 -0800 (PST)
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
Subject: [PATCH v4 05/19] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date: Mon, 20 Nov 2023 21:20:23 +0000
Message-ID: <20231120212037.911774-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/google.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..0e987fecb2cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,45 @@
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
+additionalProperties: true
+
+...
-- 
2.43.0.rc1.413.gea7ed67945-goog

