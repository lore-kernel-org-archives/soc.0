Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0A9C5AE5C
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADB13C433AD; Mon, 20 Nov 2023 21:21:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 501A2C433C9
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 501A2C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b26d6f7dbso2679065e9.2
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515276; x=1701120076; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK3+J+uq1zdoJ4AWa77B+gNqjCRYeG1aCZZpF63aTJ0=;
        b=LvHy9WAaMrcWvqJZ7BAk0iox+WLl6UYyT/7gB+uSDTnlHjMGCV8WR6W3HkPSw/O0bD
         QqB3FmrDJfvnN78q/vgA3KV+qA/ST1KvapHvW5yjpvn9t8/JvN5SDFl2mq039TM7U6+o
         Mo4gKPT78RbGq3P+4fff1r89gNrrBVrZXSGwQv92Bw5ang2+XbqNjeodyQIQbhsV71nE
         jyELMF4jztEookBmCwqjje1lZj13K7ehhTaxBPlgxGpcZ7csOBy+sv+rnwDZOCVH5HMv
         iivBGFYSkCgMHvEf32XyLhV3zkAuw+hAQpYHxAYnzFPBwQVpm4xLPewau5wdWG/+9Eux
         lrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515276; x=1701120076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK3+J+uq1zdoJ4AWa77B+gNqjCRYeG1aCZZpF63aTJ0=;
        b=HvQ0DKvoGp/f4s5CLz9Vw0ndj0zfiZ4s7iVGrBGtS3Ppes7LDgQaqOLD0Qj+9/4sOV
         gXwHLlORDoo9tzM/41xoOJiT/2n0CyL4mH5KtdyGRv5JZVtZwYAUzXm4OT1pvVif0sfx
         O40wRXqEN00qYUVYst9yl2I+Q4GPuNAKTwqSVL94A40GRFI3zV3ti2yokJUNE98xI/iQ
         dcGeBvC/073ZNBKsshw2AVBgMGRiDAyXPyhjDoFhHVwda/NwZvQB7R3Jf055bW//JwtA
         Bl16sK9y4MdKC3CB9tMdixPXLAn9OR/lLJ7hOtma2V/V6XW3fhV7341zgjp/dFpfUfOE
         dNpw==
X-Gm-Message-State: AOJu0YxOmyFiBeSkTmRWhrKXu80tgJ2sLksVft0o48czia6QYa96QSl2
	bo0QKRpiMtZmzrLve9nZCt3frQ==
X-Google-Smtp-Source: AGHT+IHRXdtnlZRBClLJAt3XTWnDX/mD73i3sd95M4tx/4bmM+eSRXliXrhZDPcmIFMdPyRbkhup5A==
X-Received: by 2002:a05:600c:4f84:b0:404:4b6f:d705 with SMTP id n4-20020a05600c4f8400b004044b6fd705mr7792272wmq.17.1700515276465;
        Mon, 20 Nov 2023 13:21:16 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:15 -0800 (PST)
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
Subject: [PATCH v4 07/19] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Mon, 20 Nov 2023 21:20:25 +0000
Message-ID: <20231120212037.911774-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
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
index 1b75abebb953..41f3a2f2992e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -30,6 +30,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - google,gs101-wakeup-eint
           - samsung,s3c2410-wakeup-eint
           - samsung,s3c2412-wakeup-eint
           - samsung,s3c64xx-wakeup-eint
@@ -104,6 +105,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wakeup-eint
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
-- 
2.43.0.rc1.413.gea7ed67945-goog

