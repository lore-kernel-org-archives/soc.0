Return-Path: <SRS0=2rx6=HV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5D5C4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 14:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3814C433CC; Sun, 10 Dec 2023 14:01:54 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F8CCC433C8
	for <soc@kernel.org>; Sun, 10 Dec 2023 14:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F8CCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1d450d5c11so474499066b.3
        for <soc@kernel.org>; Sun, 10 Dec 2023 06:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216911; x=1702821711; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTZxAHIX1rL75b27TvFbnniJkwAzSdlfQSjl1vKsIKk=;
        b=uAeDMgJcrv9jF/JHPLwureusOTtqo3t6o+LsYGIiBxIT2TmiLo+j4T6Lvs8R5+RbPB
         vienQSXVztUx+0ICUUwqOcpkxFf8Zmw0CPMRY29HVSOn9WL8jul9EejZsGR+3r2jJLWh
         2KjTpYkTJZKyWhC30jQQLkS6nYEKZpk5cJVOYFo5sbC1mNH5mVh80WMIIWcn/P9zOfSb
         eQFH32hfeeJH232yBgdfH/D+OU3YSPu/u2dy+hIXzRTHZGzMWF2RHfOoIE1ISThdk8Wy
         Att7fYpjCwPe1AdURN1LFFqGZ1GiVrTcegnK99dZxW76/a2htOV4WibbvE5hE4J2JgYo
         V08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216911; x=1702821711;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTZxAHIX1rL75b27TvFbnniJkwAzSdlfQSjl1vKsIKk=;
        b=lPl/CGC6AzghHiNRyxEDCcqGvdycQY2l/MpwvZINIm1dol6M34kp2vTbRrDhiwCLaQ
         0qU24CeFUGYq1dqfaFCpzsdYB9CxS5X5f0rVKyj4Fy9pXvDZkEaVDPYNiolSqoulCeoG
         zyNELlF2+8tTNq0n0yBSVAuR0Tkt6P6dToEZYWcinRoIQ7ygQ2Mc3+gWfw2WzWaZhtaZ
         5M+SCDPdUik/HvjHT+VRVS6LLOwMT7YbGDPlzyMst3rLEed0RYjNzpTJ02SBkanOsFBf
         HAK+mnZF/qxsaZFm4sVFhnkD3aMRNtI3U8/mrKnhMX5Gyz0OU0Lq2QE1IjA552xNEHFe
         LtSQ==
X-Gm-Message-State: AOJu0YxY4m97ogEZYThJDyx5WfgfmFvGHBEM4751ZkmzOEf+Tm6swh0n
	JVdSiIbbuUcFKiYjqWpHJuE/RA==
X-Google-Smtp-Source: AGHT+IG+wbBd6cLWuNE4po6PuceIR8qhG2PoLlIqxdWq6sdNFUInBbdaSyN+vuocr9pFdiEjB7x5vw==
X-Received: by 2002:a17:907:961f:b0:a1d:530c:af06 with SMTP id gb31-20020a170907961f00b00a1d530caf06mr1820606ejc.65.1702216911480;
        Sun, 10 Dec 2023 06:01:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tg10-20020a1709078dca00b00a178b965899sm3458691ejc.100.2023.12.10.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 06:01:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231209233106.147416-4-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-4-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 03/20] dt-bindings: soc: google:
 exynos-sysreg: add dedicated SYSREG compatibles to GS101
Message-Id: <170221690857.46013.17338443649836417871.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 15:01:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:49 +0000, Peter Griffin wrote:
> GS101 has three different SYSREG controllers, add dedicated
> compatibles for them to the documentation.
> 
> 

Applied, thanks!

[03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
        https://git.kernel.org/krzk/linux/c/d9232785858eafde8553932f96fb7e25c2191ed2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

