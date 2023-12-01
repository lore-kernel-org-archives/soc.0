Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED11C07E97
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAABBC433A9; Fri,  1 Dec 2023 16:11:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D1AFC433CD
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D1AFC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33334480eb4so361154f8f.0
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447062; x=1702051862; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7gV2bTYZ/8fGxngk+WgJOxqZzJsxGLjpBfcpof/uy0=;
        b=N0IXKBKhF5LgDLoPO07P98lpcqDISuMW6KV7hV6JXqkMlpuFWgBN6A6m45dqFLO+9m
         PN1Z3MvT/BcVv5U48oREH6ccn/ttDlZ7f1P46VWY8JE85npR5+lF7LdAClqXfd6lf0Rp
         S4anu08jPx5W5yWe4pFxuEd3poax+gvFqFFxrMu4v6CUhAKIw/gu3IVfVy9ja6P+5bzy
         idJpLwwLHLQfbnpHHmKkWNDAW6lSulme2jguE2/H3EjaG6wBbi07laeMuLzMci0OVo95
         5rtbp5tH2B0WyJKJJGkF6jhzREFRuF10EpXgA8xxxCFiJhBp0ej3MAOjycqjVvWZC4TI
         UKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447062; x=1702051862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7gV2bTYZ/8fGxngk+WgJOxqZzJsxGLjpBfcpof/uy0=;
        b=V11PWMGLXsB3/C57a9B87dhYQD2A9zpcpoY8j2NR/9BJF/rpNvrpSRb16zo+ah5P0/
         1VHHPXynGRcEFzyhasdhkN+cNuNhf6dS7s7Ik7DsxjP5HCK3s1WJK06zfjvKIfHrJjnz
         bygu2zrNU3zT1EmUGML3FRYOX85jXfeUpxIdqkL+5x4mDSH+yxddtt6sXT9ys75jmuzz
         d+4rtFOnhSH118JDWat6i5LfBETUvRBWjy8+G0LwjAjLIA9F6u4ZM9kJpSyml3g7MDNI
         DIxHyCogs4ef1tQQafB+5pH4ezztUGNv9Sdaj/CWSBwiEanE4GMEZZDGmkz5fBMPpCuU
         QtpQ==
X-Gm-Message-State: AOJu0Yyt2wyO1QDGujVhKSoYZ0wEBABePwAAgWRdwKsM8MbD8VqQ4c8y
	qyK/uPXPYnnMq5IyG6kJ4WMi4Q==
X-Google-Smtp-Source: AGHT+IHifnPnjwfFbRUDi0Dq/CXTdTB+43Bv53XwrhOqE0a/iXWMk5yDdxyInhmCzVvC0YTegqDPjQ==
X-Received: by 2002:a5d:63cb:0:b0:332:eaa7:56b0 with SMTP id c11-20020a5d63cb000000b00332eaa756b0mr1048507wrw.14.1701447062005;
        Fri, 01 Dec 2023 08:11:02 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:01 -0800 (PST)
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
Subject: [PATCH v5 09/20] dt-bindings: serial: samsung: Make samsung,uart-fifosize required property
Date: Fri,  1 Dec 2023 16:09:14 +0000
Message-ID: <20231201160925.3136868-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
required property. For these platforms fifosize now *only* comes from DT.

It is hoped other Exynos platforms will also switch over time.

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
2.43.0.rc2.451.g8631bc7472-goog

