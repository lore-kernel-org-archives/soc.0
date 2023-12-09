Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6DC10DC3
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7E4FC433C9; Sat,  9 Dec 2023 23:31:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10246C433C7
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10246C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b5155e154so40171345e9.3
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164687; x=1702769487; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCEASn12FKDQVcaKLklq1cpwGIzIXESUDgNj0x2vEcU=;
        b=QD1xPfeTQ591xugkU4lcvVuPpG2Lg8KzMVC/hW2k6/oFs3px2svd/H/QTIr/HrfS6O
         YBuhf4b79Z3GVQnWrtQjwbV40N62t67DTJGrAW7IIiffl/mifVztcYuXzxr/2tvNhgLu
         fMkTVVyC9DR16Ug10SEz4/JvXaJOvvxLuKic51cN6P9UnK9W4ZRjyeTjV3sJZw2zgjBz
         QsvjU9/HzET9bEjLWa9ixst+ZYI3GN4LDfeBeFQx3lRIcljobedqe0kMwGGwhT0bcz4/
         dk8RQfSPI3YKT1rbSyYH/1Egdh/HkjN3XBlKM8rqaPeZXjIYfbRdZycOiJRzzSHcazZ4
         1dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164687; x=1702769487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCEASn12FKDQVcaKLklq1cpwGIzIXESUDgNj0x2vEcU=;
        b=dfMvHuDWYUXS7vvjEDBVRmXhN/Qb6IlXrATUgp1Adl53/n7EnhRiJ6Azkheg3W6o0v
         K6CRrXxnOma0CPbkUmmP/Vk2iQVTHSoBFoxf4qCy00Wt2SECh7Udcu3PT5zBZspev4Wz
         4iAoscrlDcbTOE15I5jmDaZuM9gUQIVlUYSsS3n8ckDtAbrwgEZSuh22LdUt6EUZGFHR
         Wvw9n1cuChF3ovg8jGxNo/d8rqH8wtQRNomEMBJicY3TgjjX9G/p1nfw5yJS3rvg3K/B
         uv10KFZ0/VEeY4Ot9hHiwPKIPTEnlFemOb1niX6ToC9tsadUyvD5/ZvitsYwZ3UGP3NW
         O5Kg==
X-Gm-Message-State: AOJu0YwaU3gtkHgqKKoKJUf3/4PlVJouKabucDM0/eZbBiBPk5Hz95up
	Uryny9Xs8X/Bmm68D9rV/Zm/hg==
X-Google-Smtp-Source: AGHT+IG9NFKYIPe5rKKomdvC+9wrGq3Vso9mHxrAoxj4nIc2vgbE3n1FjmhUM1gg4j+WKaynUva5/w==
X-Received: by 2002:a7b:ce88:0:b0:408:434c:dae7 with SMTP id q8-20020a7bce88000000b00408434cdae7mr1035594wmj.2.1702164687340;
        Sat, 09 Dec 2023 15:31:27 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:26 -0800 (PST)
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
Subject: [PATCH v6 09/20] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
Date: Sat,  9 Dec 2023 23:30:55 +0000
Message-ID: <20231209233106.147416-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart make samsung,uart-fifosize a required property.
For this platform fifosize now *only* comes from DT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ccc3626779d9..65d5d361e8f4 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -133,6 +133,16 @@ allOf:
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

