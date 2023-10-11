Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436ECCDB483
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2213C433C7; Wed, 11 Oct 2023 18:49:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D70B2C43391
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D70B2C43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3231dff4343so83284f8f.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050156; x=1697654956; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S362tpJExSD9AFXVozhsg8w79jdxlBQhALXvNfI38Lo=;
        b=ySyH5Z8MbWPQ4CB1JErndsC/Q4qUXnAUN6wzFxueqtijsTzhKtk86pcmh68h9/XXV6
         eiTd9r9+r/OdRZ1msHCJ1XOfhsVr8mUbh1fZPJxFNK1zqXeKbx1tIiK49S18+lR0Ljby
         HofmraZcT8JA59+lZB4ZCKytNJU8Z/IWHs79EuTw31gZxXir7vx/SSqlZ8sK6yQKTxiS
         xmIXy+PkriQLOqvCHP3HAl943gZCNMcyfXwKxXPRdCjOcQdGnDzVPSnV79cE6VUb0m2x
         /noK+Kv7QYMP9E6Mk2URvEK3QTp/SHBasC/1iiINhXB6xsJ5HpQlins0MBOhUSz/8mgj
         XaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050156; x=1697654956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S362tpJExSD9AFXVozhsg8w79jdxlBQhALXvNfI38Lo=;
        b=c7oZQsf7VoHWatfzbjSFRQSrE1z7h1g9K7/4Z/HQL2A+DlXAq0I2/e6qtIjN2rbZvy
         IloDSLJEQtsbyq4RG48WE7TJacDLiYNJw1nDB/ktMi4LrGaiqAYrYJYwwstXKgXJ2O/A
         wImst1ACXXC30zzbs7jEcppk+vIyMqjLH39VOFkJ7BctM77EHcLrRWLfO8XKQSaG2ydB
         f65f9ZEzFHaDq+XY+cuDjps5pFE0EGm/dfzbUHDDxF1rkkduU+A2nYZs3QVTXHyHDxzD
         8jCOiJAUY7asuEIrDDf20J1wp0lxEgvMtxZFCSAFXGOFeJtFXQMzPIjWYiWZ6n9GRRS+
         Diqw==
X-Gm-Message-State: AOJu0YzPjKWOn7Bz0bWxcIBEhMUKA84ifNciGivqRh6eAW+J1uP+dmy8
	VDRGflLCA6TV7L9uXDdRBdZrRw==
X-Google-Smtp-Source: AGHT+IGWXJgG8jQ2wZzHbOpholobKcSzj72Q/s7q+IO71JO3r66rxoX1o5QEGkQf6t3ixfI+6Nr3Zw==
X-Received: by 2002:a05:6000:71e:b0:329:2649:ced5 with SMTP id bs30-20020a056000071e00b003292649ced5mr20464742wrb.32.1697050155898;
        Wed, 11 Oct 2023 11:49:15 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:15 -0700 (PDT)
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
Subject: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Wed, 11 Oct 2023 19:48:06 +0100
Message-ID: <20231011184823.443959-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..dbd12a97faad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,12 @@ properties:
               - samsung,exynos5433-fsys-sysreg
           - const: samsung,exynos5433-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-sysreg
-- 
2.42.0.655.g421f12c284-goog

