Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D0EE9270D
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BF0EC116A7; Thu,  5 Oct 2023 15:57:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5536CC433CD
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5536CC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3247cefa13aso1121936f8f.1
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521442; x=1697126242; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG/bg5G9/fDNb2RLAmV1TJrt5LfCg6WF+hEcmIIxqnc=;
        b=ZpNqdgw6P4+Cg2uX4tkTSOvJM79e8f4R2S0lO20YhcTQX5PwC/N2Rcdi3T9Vob2MWV
         +0I8GuSoGGJWvW7JTFxL0EN2w6e5WdCzBQoSQp2YKL9Zp5QnYaQyRTBLM5Uc9eHXpf9I
         lpCrId9zSch8ZMEv/I76ycpq05XAj+VYAlg4cQtLIh+V2h/Y6fk5mzDctnAMiOWffo0A
         KywgqgQxK214dRQzlOP7llkXqhcogqRXksliIaS7P59Z+lVcfU7pWW4yCjy0zJAz9djs
         U+SmjqKiz9MNdsd0gE4okVrmEtyK/EJgaMV9oAY/ZO3rCtssOTFzkgfaSc9L4bBYiKXl
         wDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521442; x=1697126242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG/bg5G9/fDNb2RLAmV1TJrt5LfCg6WF+hEcmIIxqnc=;
        b=FfH65R4vlJOSFFemsQSYiQlFXwcEiCAlaURDxl/33UTjz/CZR/Ecr++b0eof1oA8h0
         QX+PakDJ8eJfXXR/N4kp6SI6DvUnqTaGrf8st952oLoG5aiXRnC76XEsEzlys22Id/TB
         RxyBL5nlEAfg9mWuT76YucwC90vjDErLP2kp4voZtbXCx2r0hKKFyykqg24QcbD0xn31
         fkAZgC8OJkfptx63QDpgJXPmwS2r8VyE9vsR8cn5S8BlI9dzoYmjxrb0AhwoW7UrNVeT
         Ziwcq4okbnQA1MPSiJyWGdBm1s1N9R6J0RS9QcRHtxoyBbco3NY55+0Z0oy9cSIsjbhi
         Gt1g==
X-Gm-Message-State: AOJu0Yy+pJSjCqIyGu9q3fACY0IfDObVJjwNDSKTwsnLG8/+Q4vEREd1
	lL3OC0IwrchyR7kvQYqpF0AVmg==
X-Google-Smtp-Source: AGHT+IHDCU4B/onZx0tGuUNfz7neahjevgz/cbddvl2YQ0egs2QVaDB52giQXOGLKKgxCDABFc/Ptw==
X-Received: by 2002:adf:f182:0:b0:321:589b:bcb5 with SMTP id h2-20020adff182000000b00321589bbcb5mr5475234wro.57.1696521442234;
        Thu, 05 Oct 2023 08:57:22 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:20 -0700 (PDT)
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
Subject: [PATCH 02/21] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Thu,  5 Oct 2023 16:55:59 +0100
Message-ID: <20231005155618.700312-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gs101-pmu compatible to the bindings documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index e1d716df5dfa..e6abf7b55909 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -27,6 +27,7 @@ select:
           - samsung,exynos7-pmu
           - samsung,exynos850-pmu
           - samsung-s5pv210-pmu
+          - google,gs101-pmu
   required:
     - compatible
 
@@ -47,6 +48,7 @@ properties:
               - samsung,exynos7-pmu
               - samsung,exynos850-pmu
               - samsung-s5pv210-pmu
+              - google,gs101-pmu
           - const: syscon
       - items:
           - enum:
-- 
2.42.0.582.g8ccd20d70d-goog

