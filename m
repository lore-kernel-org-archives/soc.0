Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C258C10DC1
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7143C433AB; Fri,  1 Dec 2023 16:10:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB8CDC433D9
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB8CDC433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3332efd75c9so978705f8f.2
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447050; x=1702051850; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ywdUZXMyLf6C9Ys3Kgiwpz0dOO3A0ZXqyMleZjsaYg=;
        b=OCORQl/E+uItL+WUAvofK/JaMBdMbML4IABvLCVSxfK2sBQy0t9PGNMBG8TPK6DnI8
         c4Fsr25aSmyXW3oLqoVA0MhtXpW+mWSAvQ7kqkFKRgH6xzlGzIVV9fdFPC9BcZt+Axy0
         dS09Ua22PaOH7kNLh7fkQlOEOQ6PHOz1x+dPvcT5b3PLcWa6VyFoiywLSoXSAQFl3KGN
         47Dc3pbOSoC6nnvuRbPiijPcepAdNFAjsBv3/aiIB7+B/NN6iLnr9T9lu9zoPP1mfmWM
         Br14/pQAMdrkxejSvRI9cHtLbL57uW6egwTNZvHKhrgEqhpQcF/xAEnMt189ndG9xYMl
         G+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447050; x=1702051850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ywdUZXMyLf6C9Ys3Kgiwpz0dOO3A0ZXqyMleZjsaYg=;
        b=bKPS+kooC4vnrGH566LkEN5ZsvzWGZIiG9G1Ja+wKbNWGnPDgPABDFRO31Eu/5uAU1
         ir14A+wkbQh1orbavr9FOtpqB/11uYXg9KpdWoeUagnihSOPx/dLXHtc3eXqjI+Q4wsm
         yUPWlGf9kLsx5TlGQPfvTdQN4IUnuwAQ+WCyA5tG6Amv0CaQrGADKpGE6BlA+R96ouCH
         GhP592jDXfIH6j/GG/36czEa1fSqcG7iTrDXTCgPTYJtKZy7lGmQmLHKpiMI0kHDPDqG
         dsd+9ezaoNFppObSQ0HCr6cQQFAwaD2YWSDC0SwYKtzbaexaY3TPEWHcK2TOKx3icQe4
         xm0g==
X-Gm-Message-State: AOJu0YyHqfVkLbINh6KcdqqYo9i+7fLH4kziPDICuDlrqCvB7ZvVkhMW
	lkVxLT1OkXAEf34r4gcFJvXQCg==
X-Google-Smtp-Source: AGHT+IG7OOrnhouiLBwZm+VnT6C5HGH4CpJmfnG5KQGGluemLDGUdIgkXzi8CNGO3fHX+180nLdF9Q==
X-Received: by 2002:a5d:4402:0:b0:333:2e28:46f5 with SMTP id z2-20020a5d4402000000b003332e2846f5mr450720wrq.1.1701447049944;
        Fri, 01 Dec 2023 08:10:49 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:49 -0800 (PST)
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
Subject: [PATCH v5 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Fri,  1 Dec 2023 16:09:06 +0000
Message-ID: <20231201160925.3136868-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gs101-pmu compatible to the bindings documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 28e2cb50d85e..ce1bba980961 100644
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
2.43.0.rc2.451.g8631bc7472-goog

