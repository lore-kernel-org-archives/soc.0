Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC90C10DC3
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74AF6C433D9; Sat,  9 Dec 2023 23:31:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C650C433C9
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C650C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c31f18274so25833205e9.0
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164684; x=1702769484; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev7tBmAL4exKhbL7aDYuVJcQPzB8BKI+lGm5G38LuBA=;
        b=hS6kEGSY7WO/2TInuFGL8lrZqKbQm9TYSum0mUhsY4fsKU/WFaRhU/dcgYxQehxNU8
         /szeP+KiUQHlIDQz2P1VWAmIxv2G2r5n9/rugLgGRYuygzG/h4GmJoHT8+dVlZafz/N3
         4iKDtjVHpJgg+JAMNPQuoNSdBEvJVXjXrk7JqzOPRTfo58kDhSlb3aTa5KJvZYzigljd
         EC5TTmzjY4VJJbyax2gQsQ675cmSChpV3tD7EOhTgh47iPNdQ79ed2BNkvSow8F1wSpN
         woUQODOwx0rOQqDJ4gGLCruH2fWBgMpZ+0RST9RLNCTfql7pGREPGNVQUbG+0nSsiA0Z
         xIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164684; x=1702769484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev7tBmAL4exKhbL7aDYuVJcQPzB8BKI+lGm5G38LuBA=;
        b=WCtNvQQffJgyu6f9YpQatYmCp8B9Zjb2Vm2gzp21Ql70QPQLqv6Sg8Nt9swAQruk25
         6n7Cj5CUtClby7EhazzMvgZZITgUMgVN/Rzy1QaLwqHlywtVRZknSwhnRQjhwzeBIpQH
         L25fTjvl7Bhhgwj8DHXnpr+YqY7BSmA/bqz9FLl/HHbmPuV+Sbj5C2xTf8LjmzWSmJvI
         eTaEpnNnz55Ott5kY/a3vYrCkYcE1ePD/jriXVZWI0ktGSU+g+0zsOFbZ4jlwIw6cyxA
         nHtzlbJ1up81Sn/tedellbrCGnCYbomPyFeX9jfQa/osqOP//2qA5jEvXKb2twF+tnKw
         iWng==
X-Gm-Message-State: AOJu0YypakG5c/eQqg8EJq5pzCwSm1Gu2EFSzLzHTr0Xp19im+oW/e42
	0MK0lGXFgy3t6zCDVUIg/4/0Vw==
X-Google-Smtp-Source: AGHT+IHRMsrr+sTrifsHJqlSrVxQ9iiSsPWjrda4g5ASm2G4g/kv6N85c9HQuG9gSEeYRQWjo7iYvg==
X-Received: by 2002:a05:600c:4591:b0:40c:325a:545c with SMTP id r17-20020a05600c459100b0040c325a545cmr934635wmo.221.1702164684360;
        Sat, 09 Dec 2023 15:31:24 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:23 -0800 (PST)
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
Subject: [PATCH v6 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Sat,  9 Dec 2023 23:30:53 +0000
Message-ID: <20231209233106.147416-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 2bafa867aea2..4c0e25754c6b 100644
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
-- 
2.43.0.472.g3155946c3a-goog

