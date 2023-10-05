Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF07DE92717
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60F80C433C9; Thu,  5 Oct 2023 15:57:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1328C07615
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1328C07615
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3247cefa13aso1121979f8f.1
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521444; x=1697126244; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqGxynjd2WPI1dcd+xfmUDs2mxNl3KtmyJFW0p/wctU=;
        b=hPwF5SWjyNK/3G8woUd4e0OTTCtB2vQ9UelPTXImswx0vJ9FB4v0RYpPnTv65Pj6/w
         R0KIGIvjKWBB3FTJgj824yeiliUfDGtt+iVLP3g/h5KKwvbS8RWqatzHLpAJrRQZrdf5
         TagInhWI5NEDS/WQ5wi9YkcsjK0lNAi+EBS2j+XQzGsp4kvH8ID2VGyyxCrz7Jeq21z0
         br7fadcxBvWQ7VptSCI/RRwgHwOFWC6gJYJCIZI2cRtEzAF15jjm5IpsJeJHGPQSHsUs
         jArf/zPiKGI/9OYIkl8Ihze7/aFBahdieLf4ZxETTW+1C9M3IJ1wKAAdYbG/35EOS7qu
         EiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521444; x=1697126244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqGxynjd2WPI1dcd+xfmUDs2mxNl3KtmyJFW0p/wctU=;
        b=r7IcBn0ISjh+cELal2faGHu4RV98Q68XMVRjvie0KflanBJHzsfOoe3QVdFHseyz0x
         GLtaXdDVdmVHjWe08+/jDuZPsyq0O7dItSjlZ33QH8Jy3+vjSkcoj8JtKPdvfNBYYSLp
         h/FWB58qKAn9YuvJ8C3ZmI++WHYV2ckITrR8nVSoCYFe2EUdiNuwE58qbavQKlzf2RUK
         igw23zpMwMvVl2iht+cglSIAXMYEDxtIb48ObMdh4UdkGQYt3KJJZUWTBEE9qFC6qiea
         y4Kln0HqwcCRGQP2XVoTuMysHJVucuphv5faKti1mj+MaSgJkKjQYDzURWpzK0MKSnKw
         59hg==
X-Gm-Message-State: AOJu0YwsVePoF98QuEb5784K7p/MH/CCubAvIWh8sNe9AdaN4BXrf1WR
	EujoscLmzoW/3q3NSKB7iktHEg==
X-Google-Smtp-Source: AGHT+IFVvYSS2Teb+3C+yTzocwyuLqySOLh37A4RBSXTHwdRSE57cXIgg0jBOZT62IFM/d6hCX7Abw==
X-Received: by 2002:adf:e8cc:0:b0:322:da1f:60d9 with SMTP id k12-20020adfe8cc000000b00322da1f60d9mr5392415wrn.47.1696521443734;
        Thu, 05 Oct 2023 08:57:23 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:23 -0700 (PDT)
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
Subject: [PATCH 03/21] dt-bindings: clock: Add Google gs101 clock management unit bindings
Date: Thu,  5 Oct 2023 16:56:00 +0100
Message-ID: <20231005155618.700312-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide dt-schema documentation for Google gs101 SoC clock controller.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
new file mode 100644
index 000000000000..a28d05d88afe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 SoC clock controller
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  Google GS101 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that clock tree
+  is OSCCLK (24.576 MHz). That external clock must be defined as a fixed-rate
+  clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/gs101.h' header.
+
+properties:
+  compatible:
+    enum:
+      - google,gs101-cmu-top
+      - google,gs101-cmu-apm
+      - google,gs101-cmu-misc
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-misc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: Misc bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_misc_bus
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_TOP
+  - |
+    #include <dt-bindings/interrupt-controller/gs101.h>
+    soc {
+    #address-cells = <2>;
+    #size-cells = <1>;
+
+    cmu_top: clock-controller@1e080000 {
+        compatible = "google,gs101-cmu-top";
+        reg = <0x0 0x1e080000 0x8000>;
+        #clock-cells = <1>;
+        clocks = <&ext_24_5m>;
+        clock-names = "oscclk";
+        };
+    };
+
+...
-- 
2.42.0.582.g8ccd20d70d-goog

