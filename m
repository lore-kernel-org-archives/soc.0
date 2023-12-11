Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E473C10DC3
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F585C433B6; Mon, 11 Dec 2023 16:24:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BAA5C433AD
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BAA5C433AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c31f18274so40451125e9.0
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311859; x=1702916659; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHn6La4SxICedZgCH1SVIME+UAZa7Q6nySeOkcn6arQ=;
        b=kLqelggIJLFYjG18aKOVq3kWmW+8EjxLWYhktaB8Ch/m2MZQM8n+HkXDgxXYNAnPMe
         xFobg91y0ZLke88eEnRfU1CrXlGMn2yjsmMXVq9vR6mgj553o00X+ClYe3zUZ1gHycPY
         blz5dtEKiHKPupjBV9S7k1bL589gYq8yuoNW4h9Gm5aRMrvwPSr1i31B/pVLxQ705Lff
         Uh+IbN/yN8EkVq6iUQFZWRqNv+Ov98rotNjPXgCBmuKUjslnWrrAIfTxI/vIcYOGKTfb
         48dSnKR3WL8SKfMvMjlDcqNkO7lksCTCRg99/vH8AVGcCGb7WzgL4X1CTn5lLCBCQ4tt
         qxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311859; x=1702916659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHn6La4SxICedZgCH1SVIME+UAZa7Q6nySeOkcn6arQ=;
        b=DqbtJODJhgcYuOjKwnMkIBdlqxTUcgTo4xwLBi8qvBt+WwcCgOvCSXOXa7ZsEetbYU
         uXLyuoqX+0NGYbfnXrL1zvhGuLn1As4Qiw+Dv98fTRhP54Xtj7JQ+1ai0xyqW+qU4niD
         8CvJT8dxFsg4TOZDW+VtfUKZOei9Y2oDOh7oe3DVO2F1wyMR6FLkrlnnyNr0tTg4k45W
         28xVCN39l5TmTbgEtfmXBMiVgeTIGeUzEkqdvChEDLRpoYMp7P2dWS3Qh+GGWdDP2/qG
         8bAICZmuRddifft3HN/8njZCtD8zlK6kmuukU/RbaRZFRrsvqoQYucwrSTD66oOLQqHB
         8Izg==
X-Gm-Message-State: AOJu0YyLibfGH5Ee8UwiGI4EEhW3CHKlspU88eU2sbeTFB6POw6cbIcB
	Szjl4C836IyXclhvHrRlAxN13g==
X-Google-Smtp-Source: AGHT+IEmf6M1kKz97d9swAyZHxrDmo9Qm70c5j0hECQTw3R9XBH94lhiP5Z8mVJVo/XZZ6lHXKjMTw==
X-Received: by 2002:a05:600c:1715:b0:40c:267e:314c with SMTP id c21-20020a05600c171500b0040c267e314cmr2222341wmn.103.1702311859112;
        Mon, 11 Dec 2023 08:24:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:18 -0800 (PST)
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
Subject: [PATCH v7 04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
Date: Mon, 11 Dec 2023 16:23:19 +0000
Message-ID: <20231211162331.435900-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart make samsung,uart-fifosize a required property.
For this platform fifosize now *only* comes from DT.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 6af274d2f185..133259ed3a34 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -134,6 +134,16 @@ allOf:
             - const: uart
             - const: clk_uart_baud0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-uart
+    then:
+      required:
+        - samsung,uart-fifosize
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0.472.g3155946c3a-goog

