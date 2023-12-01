Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FFAC4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9D07C4167E; Fri,  1 Dec 2023 16:11:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51EC0C4167D
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51EC0C4167D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bbfad8758so3176220e87.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447059; x=1702051859; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBRJfAevU+LCcxJ2mAbE/NfYBIkHJdmy5yUy9RNkIsA=;
        b=lSqg02MX3J5zDkbL8NSEiwyyPKXU36QQReobuuDFkWrftojJ5lc2tOhS/L7bfWNNlT
         DpC9EwxWTKc9uOfdnzpbPnzVmOk62f1z40DO8kj8EO+TFTelLjuX6JJv2UUk14XwNGaZ
         1Jo6nXhBRKyAzhwyRPXUrLLJEVRxZQeNtkVh3qZmsa4lhTWLTicBDl1yC2fLDdyI+3Hn
         MiYK7iXpnlKQ+u03aSGDi/arNHoW/co0O95W9LB7f14/WSgv74aL3Zlc+nGL51ybMfYy
         q6pXnVNyzN6g1iLVunzclP017WMhjw+gF3ANzEvyNWr4csY1D8dfn2ydZRHCOvI/uc/L
         eWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447059; x=1702051859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBRJfAevU+LCcxJ2mAbE/NfYBIkHJdmy5yUy9RNkIsA=;
        b=vEYN19T08acfuGSTi+cKWTMNhEkPGYXaFkHriSVBChVjRfRCONpsaVRy91GSEEG0Q8
         Zfvh78/qGaWMacHNQgrjFH+JyzoOWQERFzZfFlC0c7uIPHOA7QiQERl8DtLSIohHbvB2
         SKs6PBVkGwRhviwA8mGcMiFTq1tXlhgZDHPYH9Y9IML/j/PwEdx/k+gSv1ozMBXFOsXo
         8KBJmrKLTr5C9tZ70ElU78szJHXzV4p8NZxiGCPubRGVT+SwWBSCJtgQHyCTya3ogae3
         BpwPeUbqxfQdCKiSUptsBOBC4wrkfiHRvabsqF4m66QNnR0nNMcaB7F7H02ucGpJFbL8
         BGnw==
X-Gm-Message-State: AOJu0YxOMqlhrAAsYUslFgU06U5Z6D4s/iW16+0OGxlq4kZ9yAQpVWKn
	z3zSenIbOL4VuXz6seUlPDhmpg==
X-Google-Smtp-Source: AGHT+IG/WFRvP9MxpMHrpVaQSz7ZF+XEsCatpRGxusYrMlLEz1tqbPvkKxUnz1D00VC4ZUyx/hKrEw==
X-Received: by 2002:a05:6512:3487:b0:50b:d944:bfd5 with SMTP id v7-20020a056512348700b0050bd944bfd5mr410395lfr.151.1701447058930;
        Fri, 01 Dec 2023 08:10:58 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:58 -0800 (PST)
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
	linux-serial@vger.kernel.org
Subject: [PATCH v5 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Fri,  1 Dec 2023 16:09:12 +0000
Message-ID: <20231201160925.3136868-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 2bafa867aea2..de2209f8ba00 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -44,6 +44,7 @@ properties:
           - const: samsung,exynos7-wakeup-eint
       - items:
           - enum:
+              - google,gs101-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
           - const: samsung,exynos850-wakeup-eint
@@ -111,6 +112,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wakeup-eint
               - samsung,exynos850-wakeup-eint
     then:
       properties:
-- 
2.43.0.rc2.451.g8631bc7472-goog

