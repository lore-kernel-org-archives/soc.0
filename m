Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC41C10F05
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99A90C433C9; Fri,  1 Dec 2023 16:11:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CBE9C4166B
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CBE9C4166B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33318b866a0so2006399f8f.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447060; x=1702051860; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h3wW3EqCfUl3aAlcYhLSxtfIdkOS0xIgf/1shl23vk=;
        b=pYxo733/H4om53+3UIUnIZ1JIHfryqzVbe6lSe6MtsUTOZgVH6Y+kBWPsctF4LZQkL
         YFV3yRWTg9eRTEthjPrz5Iu5Mn+nlPp2Er7Al2mZNtUK8GWLKLm98G1RT3YVT9nBxiwF
         VdGiH57VQ09KfCpD0W/xyw75K9QmDPWmXJGPPPHpYi4KhFxUc3vY84DrLBMZy+l4aVeb
         DcavuGklhzSky1zKO5699vgNTQBs9Zfqjs6vH9ufOVFYMVYdhTPoNKcrAXebMHT31kvc
         7G5PWBBKRUnAGDRETjQHkcbpACNco779tlh0pqpQU4GcHAZ0kZNK5RoBABNlPBOukIpw
         J63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447060; x=1702051860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h3wW3EqCfUl3aAlcYhLSxtfIdkOS0xIgf/1shl23vk=;
        b=ArnD18SPtqtLakYqWHXwKMu1kM01a6biuuU7mddX+DhgmuisOFVWQK5GYSSHWuCwa9
         WvBzLcJaBtWEJMWsY+Z1uv1Va6Lu3GEyImfI+C20gpBFa25jgiwMPEKjA9KqxsRmJONG
         W8su6pYlRk41+uYsghRXSsiHs6YzBGmd4b5DZV7vTJ5nmwvD5UA/XGkaugxY0xdjkwF8
         eY7MmxK3nHKy41V6Ku4xZjCwNLSsjvJ2HdR4VPiMjFhcx6wHNXJ1xjM6IdoPgV93HqLL
         Vb/JuPxiU7WxV8AMuc7m0LUS3PMcsk0D25aqzemzjg1dxw9kSFOLAPLZL380rQLp2r15
         9BCQ==
X-Gm-Message-State: AOJu0YzMv8gHhAgMloOzPVUxXCVNkK7Q5pMF2VWpruSFVXe1K8oD+Lbv
	qFTrR180F+wA4uIyTL3YU2c39A==
X-Google-Smtp-Source: AGHT+IHXt7Ufyov+rsHLlszoNSf7f3sNJD+B0NBwhA3cKdYZFov1Hno0tqVBpT59cwEnzsqksoAleg==
X-Received: by 2002:a5d:58e1:0:b0:333:fd3:1a7f with SMTP id f1-20020a5d58e1000000b003330fd31a7fmr1221988wrd.52.1701447060579;
        Fri, 01 Dec 2023 08:11:00 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:59 -0800 (PST)
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
Subject: [PATCH v5 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Fri,  1 Dec 2023 16:09:13 +0000
Message-ID: <20231201160925.3136868-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
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
index e32c1b462836..ccc3626779d9 100644
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
2.43.0.rc2.451.g8631bc7472-goog

