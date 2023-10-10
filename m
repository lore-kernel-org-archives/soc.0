Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90691CD98CC
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4479FC433A9; Tue, 10 Oct 2023 22:49:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 880FDC433CD
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 880FDC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-406650da82bso57633125e9.3
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978187; x=1697582987; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfXAqV1pyqFtMV/UH+Un6VZ7ftSnQ6lOtRR1W2sjfGg=;
        b=Fzl9At5JfYZo1wHABx6TRd72wYTtVmkM/+KTIIJn6LScLCC6pCc2vsA6ORPrK7cARR
         OG+gIJwM0sGx4ZXH/TcpHL8A8SWI/ikRO/d2+6aiJOLglYIXESA2pFpkVxlItN5SYW9D
         6a+7++4TAfPEaTBmPXwFNkoAAdPS94qsxxmOkfKiW1AdDWdlMj8xvIYzGKPz2RlzJUVU
         MUJh1WJIlQHUhKhhY85pE7IWDcuvLzzgVC8QMq8eSoqoExR9mDeecEzp7hOsdbo3uKU6
         gnO2Jmp/HUQxbcuCQbsxKF7M1gvrv0Xkb0Y/5v9Ul8QAf24c64H70VgET517tYnyPf0s
         4DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978187; x=1697582987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfXAqV1pyqFtMV/UH+Un6VZ7ftSnQ6lOtRR1W2sjfGg=;
        b=phM+G+MqB1LMlGWZROl4DsJPUaoIh5hUWeHw2hxn4SyrIQ2UutpktomQfjnDlnn8um
         s1mkdQuJX48ojZmPM/pMEqmEMvX3bVcIrTnnNRZMeWwhlDbew3zLUdjAMkhDrCGwdh50
         GTwRVQEerio8AgtHBdxC7hlYSnWxALNNbj9a/wyrQfVum7HNvumDaC6EOQuOhaiEphG3
         /w7g1Qf8h93KtkKlb8Lvm7OCIR84b4ShH5/W8YJxu80yvoJLegbRLYhaEsqAZTBA5rT1
         EcedIYQC51N7gJ+4FJgQ8gGRF5huXaA5maxK155A4YsFfoX52viK2VbG2DLVVfbhq7dI
         vr9w==
X-Gm-Message-State: AOJu0YyzKxF9iqZ67jRNbXAM5BaPUkufGpK8hrTnMX44FJPeujvTFmzc
	htoJDfa91kEES8LsHAaIluva3A==
X-Google-Smtp-Source: AGHT+IEP2zxTpzOtUkFiPwRcOFsFqoBVvQ/ZCYKp0kk0nhdPzn6bCsAwihOCSclOVBe2WDi/PfNAUQ==
X-Received: by 2002:a7b:cbd4:0:b0:401:b76d:3b8b with SMTP id n20-20020a7bcbd4000000b00401b76d3b8bmr17968520wmi.16.1696978187754;
        Tue, 10 Oct 2023 15:49:47 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:47 -0700 (PDT)
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
Subject: [PATCH v2 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Tue, 10 Oct 2023 23:49:09 +0100
Message-ID: <20231010224928.2296997-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gs101-pmu compatible to the bindings documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index e1d716df5dfa..9e497c310532 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -35,6 +36,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
-- 
2.42.0.609.gbb76f46606-goog

