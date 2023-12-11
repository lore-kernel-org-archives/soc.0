Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA0BC10F05
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50E3BC433C9; Mon, 11 Dec 2023 16:24:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 171DCC433C8
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 171DCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so26115875e9.1
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311858; x=1702916658; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Ba+CfdK/O6qsHsCj9KtgOVuumyDTsi+C+LO0Zu6Pc=;
        b=kDKx2IdhGsZzFKNMpiDBu5z5J3xzpJfCmQAAJzrj0pxZd23CoAUNt3M4ikLjtKDFj9
         C5IAPM9k3moFXzpNqF2A5zmONwQ/Yw0NwGckME9C2x6Tg9/AXKxPd4uH61tnysfeiByi
         CTzyZrHjBWN7eTE6PEWDkQNQElzVHmjoRWDUAtQKDBdsE1fl+3nFLkr5nZQxs7Xxq5xZ
         t1Zofa0aV+026+jLvgmpT8xVwDRUmAskg9R1YUDZ8EwLn5Xo0fcvMIzCSaci0UPTqIJv
         FJIwrHjCAkE3Mn4STu9MRKDD7O4omrrkFYL2ckl5HKBH1e/3vRtIgstqbGUOsbIOIZPp
         Nskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311858; x=1702916658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Ba+CfdK/O6qsHsCj9KtgOVuumyDTsi+C+LO0Zu6Pc=;
        b=Sxee9Qr6ENS/wBIKsd5tiToEH9YgA9Uh4LYdpRoRi7Y/PPSAIvySpRO3KtsFzQiHnh
         uplI5h0XkOL2d2olR3NRsDPQMUBNLl4C5q6HoDXI8yK31eOdEeR/gS5OrIL9nL0ba3yv
         1F0k75Z8zQUmnaSZOrI/fdvb8C8Eh8P1fCEaW8D8YSA3EYE2hITxzzpVZkTWY3oOBhzT
         EKEukMT42+ccFKnMmcnridByxhnng7yz5SvbIVA/+Hg9y/NaEF1brdjaKqvRI0+eklOK
         O2wZp6Gvzf+59seleOrn6A8ekNC0QbMFghWlfL1nXfIjqNbFpo47HHJ0rU6GDWacIUMK
         bOUg==
X-Gm-Message-State: AOJu0Yw2jCuK1sXNmz/rS1LkIoeBcv8Z9g2yEH41a/zRaZ8awGxBrNDL
	Edp1yHFYTcoaxbEm7/nlP1HjwQ==
X-Google-Smtp-Source: AGHT+IFA9ibezV64yOOnxkvwHV6C3JhUYuTNt/0u9b+6Yu169nc2KrgYHgh0Z/j80bJE7hzbG6qbNA==
X-Received: by 2002:a05:600c:41d2:b0:40c:2f84:59c0 with SMTP id t18-20020a05600c41d200b0040c2f8459c0mr2258700wmh.133.1702311857648;
        Mon, 11 Dec 2023 08:24:17 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:17 -0800 (PST)
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
Subject: [PATCH v7 03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Mon, 11 Dec 2023 16:23:18 +0000
Message-ID: <20231211162331.435900-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 4b6fc82c2edf..6af274d2f185 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.472.g3155946c3a-goog

