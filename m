Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B036E92718
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB13BC433D9; Thu,  5 Oct 2023 15:57:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4929C433C7
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4929C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3248ac76acbso1054059f8f.1
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521451; x=1697126251; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylH3r2N4huNUb7il+GAvao+h0OGeqDeAdkjyqYnsGYw=;
        b=luBI/gYf+OIpKisLDaNE+nD3IdN5b3FAca2egTJiEJno/QgHeKrgg8/nzYWen7xXj9
         7w1PUWthh8uxnX31fdLsZvtuYWasLXnotrt/FLjZFvJRfNarYe99colJb/6dOeZzpNc5
         k12NoZr2fpHpTnwR20MEsDKmA1kFLMUGsLO0i3esoVezPRkzH8/1inTmwOACmjflQLSy
         mwKz553lFM2RaZiUHj8IYhtj5x60cow82KZWlg5H+au6wUK3E2bGBb/yiu1T/0v1SMf9
         UaUcRfbh08D+KzMWezGAk19hWNjqszsFS8ziHxYAjo3qwVCEniWNNfjorJaHlMmPFleF
         SO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521451; x=1697126251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylH3r2N4huNUb7il+GAvao+h0OGeqDeAdkjyqYnsGYw=;
        b=bbpG3zAi7p/O94jSJ1jeHB1V75TDR12vfmI4MjL4ZR0Ydfeb68vi+YeHLLAxCkgRMK
         xWiHq7pWen8B37VWULTmsbRctSNEpSlnDghR5+ru3UoGoYL3O89fZ0PfZcBnCN6G/Nin
         9fByHVVogwY3hknTIBUQ3y1Wa8PdIvQq6RfOB4kbGrRsiWvvBKGenupZc8fiQcakScLs
         w6PO/57TOp3IvDOkVSTMip+yuHTEkNx6Ct9/jZA38wWOISBasnsuq1XAX1nBKl83JeNL
         4SOoh98U+4AxbLRkiFM3NZ+rTB/cH1eeHM5fK25zD1kCt8bHXDhPqsDJA9eo/ifSugzs
         ypNQ==
X-Gm-Message-State: AOJu0YyQ2txOWwjpkcWuQiDfWZmVEJuy+xA60sMBn+7cirOj0/MXB5aq
	kPgkOzzg+Gb8nfkPI7mmjqtZDg==
X-Google-Smtp-Source: AGHT+IEPYyyM2IMYe/RJ0phQWyT/Pm8leTRtBdwsfcRau9xe1hKp1zxU0tWr3ekNb0EMRyzrKcPhlA==
X-Received: by 2002:a5d:4d12:0:b0:323:16c0:9531 with SMTP id z18-20020a5d4d12000000b0032316c09531mr5128395wrt.13.1696521451269;
        Thu, 05 Oct 2023 08:57:31 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:30 -0700 (PDT)
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
Subject: [PATCH 08/21] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Thu,  5 Oct 2023 16:56:05 +0100
Message-ID: <20231005155618.700312-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
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
index 1de91a51234d..668fd903d06f 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -37,6 +37,7 @@ properties:
       - samsung,exynos7-wakeup-eint
       - samsung,exynos850-wakeup-eint
       - samsung,exynosautov9-wakeup-eint
+      - google,gs101-wakeup-eint
 
   interrupts:
     description:
@@ -99,6 +100,7 @@ allOf:
             enum:
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
+              - google,gs101-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.42.0.582.g8ccd20d70d-goog

