Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE9CD98CE
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30D4FC433D9; Tue, 10 Oct 2023 22:50:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32727C433AB
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32727C433AB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32483535e51so6015812f8f.0
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978197; x=1697582997; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N6uqi00UvIi9OwQaXTzg3QTlqfUdmw6j0gCgPzNTCQ=;
        b=cmhGovduwdA2onpaqangbrKsY5htJ4hcEx0FEwNeq7xbXe4axzU0U7yZikq+AGjNLH
         vCiZlSEiEUPuWigoCfnNxM/pOIGalfKeI5PCnOeV8+xHeUfRuDbPVesAwgl1c2XeMtGL
         OVpUKjMax9qu/lSg7Fx/41tFDFYpih3u1vfb0XiydgrQG9x5NrXiXvMFQv8YVmHPPSOo
         4W9T86MO3c22rfZ1hiy6mL8f+yBKtFaZ/y7wt4GdE9YZcshoHmQAPUQ2xj6AbOdm2i/+
         RxnhUfskvuCsTKgXSZyCvpVw/kT4clzDhIEQmQ8Ei3hKvPIfJJrP0ul21TJPS/NGkTjS
         tUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978197; x=1697582997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N6uqi00UvIi9OwQaXTzg3QTlqfUdmw6j0gCgPzNTCQ=;
        b=TcNkI/j3pwRjZ5Cd04o/erPeLhDWftP6SPeHiTrZRKviiGYpb+9yw1hXKmftPi3rqC
         ieU8DZ8nDl/on9w9utDIObP0k9VO8Pvh38lduYvvKw2Ckc5gCNcGMcPSnhpiLNGS3Fvk
         d3KXEwBFvCiUsDfFLdl0GkyJJw37t1hlqsxx7WEAZJ9/FA9hXDSg9caoRU77GKbTuhWL
         uebYKsevvQe0LnTTkybgesNm5YzoeFue0wfaQpjMujVbV14TuWxUUPGUxctFk6+nBO03
         S1swMB/jPpz8klzaTDXA/ot/ixHnHIWHmG2vW6lWR7icPhciywVGD18Atfme99CBM1SP
         3Cfg==
X-Gm-Message-State: AOJu0YxufWGN3yUiX1FMXhyla1VLUnn2vLVKx1RzcLEW2oYtGHo0ZanE
	aQ0XPLpcyyQDRv8iBLxQw6XY/A==
X-Google-Smtp-Source: AGHT+IE7hch8Cm0CH6klFQ3QwAy2VSjuJtf78sVmRF1c85lzowQfudVhpSBVhmAyAGdnZWZlPmCBQg==
X-Received: by 2002:adf:f74c:0:b0:31f:651f:f84f with SMTP id z12-20020adff74c000000b0031f651ff84fmr17109139wrp.27.1696978197446;
        Tue, 10 Oct 2023 15:49:57 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:56 -0700 (PDT)
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
Subject: [PATCH v2 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Tue, 10 Oct 2023 23:49:16 +0100
Message-ID: <20231010224928.2296997-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 8bd88d5cbb11..72471ebe5734 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -19,11 +19,13 @@ properties:
   compatible:
     oneOf:
       - items:
+          - const: google,gs101-uart
           - const: samsung,exynosautov9-uart
           - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c2410-uart
           - samsung,s3c2412-uart
           - samsung,s3c2440-uart
-- 
2.42.0.609.gbb76f46606-goog

