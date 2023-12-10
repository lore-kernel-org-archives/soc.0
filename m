Return-Path: <SRS0=2rx6=HV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C883C4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 13:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 420E0C433D9; Sun, 10 Dec 2023 13:57:52 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA6C9C43391
	for <soc@kernel.org>; Sun, 10 Dec 2023 13:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA6C9C43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a00f67f120aso474137266b.2
        for <soc@kernel.org>; Sun, 10 Dec 2023 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216669; x=1702821469; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MXVQUF9hBZSermdBHqSrHFHjSYaowAtJg9NEr1OZEw=;
        b=UJgT1i+tbLFhy7QMCMqMJLNwisxcD6Ad9LJAmi3hFpJG+yEp+jHSG6IZtQTvL4lggO
         jpmXO9cO1ga7pdolPDV12R5YgdPVe1pKgWGI7W/5wGeiJcOOBcnVdB5vRHSpJzqXhQIb
         n9wKlzvnO3m/vIlHPr9q0KnxtfqsdmRWKMxH3vnvc4c82/cgxTADA4cgew628kw4n1JP
         wvXdb0pBHj9o6l4LPqrzdW8kRvU92QbDyUyo/cUw0sgWWFByonN47u1uLhLPU9IFhLCp
         NKDBD6J5GV/CQF956ajUBKx3P3cBNMw19HA0vPhUzQNCqjF722aZ2PGWZiwp/K/i2pqi
         OtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216669; x=1702821469;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MXVQUF9hBZSermdBHqSrHFHjSYaowAtJg9NEr1OZEw=;
        b=LyhsnXOXSCQGasiteO1q81a3uLOR7BOi9uOAjHk7YY4FALQkTnpKnA7m3ubDwGZCwk
         c+ixo6mWmNFCQpoW7+BH6lnl/sYQdSLH3eX+QvNmRXWZ0HaQobJYPEZrDonA6wwruKNz
         dLpxsUaocfHc98CyRd5OteZYpWlxdcU5Je3VFjZD28ySPiSbSJ5UehGZ7hTv2NmqA1QS
         x5H2nWSlKvHtDVLYbI5F/zl7H2c64Bk1dzlb3Q33VngXPkk+By1x8LpDjVFwGU0yx+PE
         cYd4X1H5RJbjqzAf0EXkN3CyVYKLDz0F1Cgm47HFVMHJEW3ZG1HUvOgTfGfioXcYwWt8
         mrNg==
X-Gm-Message-State: AOJu0Yw8ALCwsNAbcgyWJdGSyRVv0YhLXiat24Ijpxwqh0+fWhcbVjuU
	g1ynJr9bTx1jUu0YuMSJ6k3CpA==
X-Google-Smtp-Source: AGHT+IGD6qb1/At1uCsJLOjEwryh2b+ycrxGGw6w0Sxcmi0IKmT47n6y9juHoaKzTw5rY4NhKL3RaA==
X-Received: by 2002:a17:906:197:b0:a19:a19b:55dd with SMTP id 23-20020a170906019700b00a19a19b55ddmr1382260ejb.109.1702216668825;
        Sun, 10 Dec 2023 05:57:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm3442809ejc.168.2023.12.10.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:57:48 -0800 (PST)
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
In-Reply-To: <20231209233106.147416-8-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-8-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
Message-Id: <170221666553.44902.5488217525830070811.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 14:57:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:53 +0000, Peter Griffin wrote:
> gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> where more than one pin controller can do external wake-up interrupt.
> So add a dedicated compatible for it.
> 
> 

Applied, thanks!

[07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
        https://git.kernel.org/pinctrl/samsung/c/abc73e50b394f248aa8e7ecdfbd4dfa52f8e8355

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

