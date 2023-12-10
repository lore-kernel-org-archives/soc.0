Return-Path: <SRS0=2rx6=HV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50DAC4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 13:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACC9CC433C7; Sun, 10 Dec 2023 13:57:49 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33418C433CA
	for <soc@kernel.org>; Sun, 10 Dec 2023 13:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33418C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54bfa9b3ffaso5075556a12.1
        for <soc@kernel.org>; Sun, 10 Dec 2023 05:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216665; x=1702821465; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW/HPfKMhok3sdax4/7yRdGspuPrVo40wKyVBvTDbfY=;
        b=wPBcMJA5MF2OaTB7f72ZS5oNOmrKO5Rb0Vveu0JuKjpLXuWSRUPuVq4OOGpe7aWqeu
         aIoikLUetCWCB7D+k5b9OkBlWYx+br2s+6wZYApllcN3EYK0ZJkE8wwUQbnYU3Gl8QhY
         asfw+M5xJJKZn/b3nC4rxFAxFcWfu6ec7ecFt+r0/klPK7KsNhKdpwZFpifLEAst+6A0
         Cmf4n87j3tES+9X6qZQRz+9GzvNVnLpkkaRZvEP6D+UImDr0lJ2aRLlFaSQQCslJ68yQ
         9lCGyQ5WnaNS1IFUcZ+g1WlVXs6MwASDVwCg30H7VTAttESecCMwXxpk3aCks3kSiEJ4
         kJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216665; x=1702821465;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW/HPfKMhok3sdax4/7yRdGspuPrVo40wKyVBvTDbfY=;
        b=CPGYybzd6rHKtv7Gk7dDrEIQz1BjB5jECh5DkOHB4F8MsIvqa20e8NLEQTx6PFsgHZ
         PxJ9cW++p27ucB3sagVjboMIsJ/Nhu2D8llQVAt+GDSAPYvkWkLUZnCkj4OllIVfr3BE
         mY8Exh8UQ0FAbBmu9DmlTXPTYWqFFpbwfC5NU1n0UC7qTmpla11kQD76YDtb9CnTKPFm
         l3S8Wsxcq5CjJmddFeoD4KcW0SuoPF/mIJ6KWFB9eC2FZTqWsZIQJ+F+A0yrRlJe212b
         UiXn9FmVdCrGesyOwJTmaF4/eRxeI9VO2HL1CpOy5jmT83zFNPXzdRIx6atJAhehzDd3
         sHgw==
X-Gm-Message-State: AOJu0YyFbrGyLdaR4ucb5yfBrT2xGSN599xLo4LnQm4sSiDsB2WCDxWS
	fkEgrjOeOw8F7mwj+hlcFq1DMQ==
X-Google-Smtp-Source: AGHT+IEiX0Ga0iSCeXy/H7DeCARzWj52tQUW0/WK6+nGTq3Be9t4FyM4BtE4El+v2+woOUipXyOwaQ==
X-Received: by 2002:a17:906:1787:b0:a19:a1ba:8cd6 with SMTP id t7-20020a170906178700b00a19a1ba8cd6mr1495305eje.116.1702216665431;
        Sun, 10 Dec 2023 05:57:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm3442809ejc.168.2023.12.10.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:57:45 -0800 (PST)
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
In-Reply-To: <20231209233106.147416-7-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-7-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
Message-Id: <170221666275.44902.3863677775174337941.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 14:57:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:52 +0000, Peter Griffin wrote:
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
> 
> 

Applied, thanks!

[06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
        https://git.kernel.org/pinctrl/samsung/c/4a2006d0c338c95352bf9f06e5b3cb8afa0bc885

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

