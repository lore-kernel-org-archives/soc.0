Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CD4C10F05
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A0E3C433B6; Sat,  9 Dec 2023 23:31:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6D1EC43391
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6D1EC43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so14483985e9.0
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164683; x=1702769483; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLTmFy+aGpsyLwOEhYkWRbjPeTt0aEpPpmb55d4OE4E=;
        b=vvl3o0xJhKz1NRJpDoJVcOeEVO0vJqYbtLalT7bndgLwQzHAbNozVtv5rUBrlbX96+
         C1lnUtoGRCoVbMaVHXe4FUcR0lYtKUmeK+u8ScqDAIJg83A/oW8JOMFa8a/TJwfrzid8
         VJZDgcpTb5DlGKus81ngvCo6RR9F7BxcadDQ8T8zVT+/cwOppoB/C2dkkzwOgcZZ9ZmG
         wuhhsbKnZdh48H4wzmMM74uz9ipen/QSWyz3O9moi4yRojcdjdg/Comf1DCKU2ZNe2hg
         x3Kz4W8BX1RiSLflmH02Ls7x/PHCp/tr4J4PIQVQair6WhWdtRYMU/VhMCZuuqhSv2kD
         F3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164683; x=1702769483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLTmFy+aGpsyLwOEhYkWRbjPeTt0aEpPpmb55d4OE4E=;
        b=a7PzqbQKDN1WpY8aoFRQ/nTw+h/syl4SLJBk3c5P1ZLgB27aaAiX6OHwQp3qBJoJCB
         KCXkSXFWEjOsLG9BEEVF/XTw843RRwFZSI/Q+QLr9CIEuWasBStXM3eXKHmwZGFRZSrx
         fOk0RCuN/FvHvzoCKvcQwA4r01KiSyytBt4SNTD1oAlLk4lBshNHwBwWoPr8vhN4FQ5e
         Hvo0EM9jqv3OsjD3aPZ7NxFOlmlKUEN2LpE72cu1p3RkSWVxqh2CzNIT7MIt2nkHVutb
         YjVwcUt0T+T/mfj2Mhtp1FXrakO3Cvhnx7QFBoioxj5lW37OYFuVm/XdnGWT5UPRu8Sk
         cQ9g==
X-Gm-Message-State: AOJu0YzBS7WSykF9A4GRc9ZqN2GWUNsgJcEwxzaewd1sCZWTMBb05goO
	Uss2Xz7LI+FePeYXjJhc9ojOVw==
X-Google-Smtp-Source: AGHT+IHZzuf9nj8AkteP8DCv0mhXpSmMS1+a+kuhBxEPUJQvoaaHh9qKEIYtsLnxuemYPnpFsZAh+Q==
X-Received: by 2002:a05:600c:1913:b0:40b:5e21:ec16 with SMTP id j19-20020a05600c191300b0040b5e21ec16mr1031961wmq.72.1702164682864;
        Sat, 09 Dec 2023 15:31:22 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:22 -0800 (PST)
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
Subject: [PATCH v6 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Sat,  9 Dec 2023 23:30:52 +0000
Message-ID: <20231209233106.147416-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 9f04a0c76403..118549c25976 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
-- 
2.43.0.472.g3155946c3a-goog

