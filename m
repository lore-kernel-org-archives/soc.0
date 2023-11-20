Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC4C54E76
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82AA2C433D9; Mon, 20 Nov 2023 21:21:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C64C3C433BC
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C64C3C433BC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40806e4106dso13895465e9.1
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515275; x=1701120075; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NsnumtnbKszDWmEuPJ5XUAgIpj0ZFdzasox3xFNKr0=;
        b=aOeg8VG+DJxpCEVqxK9X0IkZnVIzIPXKDjrl+EI578F6KNH7O936JleMp66ODPjuUe
         fRfSjmhibFEip4DhZH+rtCZZ18x9+8cMboroYy48E3WxW7+7QtdD/pSEdOTK0O0nowiH
         Gc0GjoYNpfX132b2ihp3D52De5qAG118CbVQ4iWhaoKZWG9/oLGAhTgJJGAKrFiLQrl4
         e7GC9aL/RhuTrFoOLF+5LSTjk6jMmov3enFhowztMjRMUJNK4cPHTn/nEB3xAd1Kao76
         3msVgTb9mZHgRRtTxlEikDKGN3mHYja9ZXCS1R1fKjKRmcJSREvDhZr/i0bFt6QdvIdy
         A6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515275; x=1701120075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NsnumtnbKszDWmEuPJ5XUAgIpj0ZFdzasox3xFNKr0=;
        b=Wvf2ivBWoDBYBFsrH/hhYuJ93+hyHvJblsXIA1d1i0O55VFf2keCm/I6M4OD8xtYAY
         t6g2yGKBGGH5afSVEOQi1dA6CHW177R4+pxa/reNCjKHf7FCp32PmnRaDqd+mJfTDNS9
         32R4SHcsYYprfs8+udcogisHAzV0n8PdAS8fM4sZmvxps1kWKAWd2AwRTrr7FDzDQUb1
         vJBF9kuBGNheoHyfNFzkB7ceCscX9z1lp0t4bGTmwcrzKhwAnPTwjrv2AODOYNMYrQbK
         FUzvGdfnYlR/bDg1EKTP2vPHHJ0DuK3IKzwfe9TuVVVry4RppKJMocrkWSan89j9ZEnR
         eyVQ==
X-Gm-Message-State: AOJu0YyeSL+8WCBk05g8nQZdqtW9EccUtRWvO463mGOnLt9KnqaZhBcP
	PpafqXTJ/cy4cxLlb1F7t/B8pA==
X-Google-Smtp-Source: AGHT+IG5ZwJvWcYcJc/wTZ1l5RXXLGRwNPXG44HsXn19tlQN9POBjwgDY072AatSXGa6s25Knq1luA==
X-Received: by 2002:a1c:7902:0:b0:405:3ab3:e640 with SMTP id l2-20020a1c7902000000b004053ab3e640mr518638wme.20.1700515274997;
        Mon, 20 Nov 2023 13:21:14 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:14 -0800 (PST)
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
Subject: [PATCH v4 06/19] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Mon, 20 Nov 2023 21:20:24 +0000
Message-ID: <20231120212037.911774-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
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
2.43.0.rc1.413.gea7ed67945-goog

