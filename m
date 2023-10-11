Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1816CDB475
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C1FBC433CA; Wed, 11 Oct 2023 18:49:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0ECE0C43395
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0ECE0C43395
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3231dff4343so83247f8f.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050153; x=1697654953; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjn+HCp9G7ZHzIyDxbnLCnTHGxIfK36bGHTjBoI+aL0=;
        b=MVS0PKl0PAZcyLELp0XERWaBCYCuMa1DxFGWqQV50xWnHHmiNCcKLwQ2bOwF8rIUpv
         QPD4rYIAZA19aU41AvPFfqFGpc7Lcm8D/VmxG1bVB+1T3BFfQfyKeILgQ/nqVmUWJkw0
         aExOIafZK5MqNdExR0Nu3ZbJeQjW2d610jupTrYFM0iZQ86VgvgdxvSaAuSPjqmHFoJE
         4n2JANLrAeWg6f4bNkDdJyeuI0b+QJb4rDl7dk2YmbgAk3EqntjJvERvx88kJiuO/daD
         sHd/ATMKEBhHxuMJRoBpe3MTEHN6icgFmKAi1x+SVrfuLzRwOvdJy9bHrirwjTCThOhF
         r6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050153; x=1697654953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjn+HCp9G7ZHzIyDxbnLCnTHGxIfK36bGHTjBoI+aL0=;
        b=BELKfdE479kpyUXu82kH3ExtQyIKDAc8cvM9ZWj6L40H1EZRrsxysw96uZKucTMlG1
         a4UXwI+YzQkVzHzzh1OmQjzo5gkB7XrRVwwgaHNNc29Hdbc8TFJegYgBwN8DZhhhtRiD
         PUWjPmpUZvJZlubTkqTt3udY+R+WJrnhcFW52Q9n3i31u6JtGE3qaAo4C539A/qxUYdz
         R5Mr2dDpVELUXI2t3AraOZWNlSsLDqRAwCboiohOOjNCb5PiFAXHzhbMrA1jKVwBDVjD
         4e0lMnpM8a2r8S5uxyHpK4Y2y2fU5NVr6a6l6ejtTJv58RB4FeYXOsRNMXTru/BDP90s
         l2Ig==
X-Gm-Message-State: AOJu0YxzYetXyLkLPPLAhz6rLrkAlJ95fWjRIfhyHprJH/TiEy1Kt7xd
	j8EbcKzY/3sKhE5aWDVN+bCA8Q==
X-Google-Smtp-Source: AGHT+IFOwG6H4bUwl9oYnw/1oaFVA9Ze2qjkasIInOAk9yMIVanltuFWLRsVMEOKeF1K8mucpLtxfA==
X-Received: by 2002:adf:ab0f:0:b0:32d:8113:eda3 with SMTP id q15-20020adfab0f000000b0032d8113eda3mr3616045wrc.10.1697050153044;
        Wed, 11 Oct 2023 11:49:13 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:12 -0700 (PDT)
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
Subject: [PATCH v3 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Wed, 11 Oct 2023 19:48:04 +0100
Message-ID: <20231011184823.443959-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
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
2.42.0.655.g421f12c284-goog

