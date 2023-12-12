Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1BDC4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D3D5C433C7; Tue, 12 Dec 2023 19:39:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78650C433CA
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78650C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c25973988so63007405e9.2
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409977; x=1703014777; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfIE14hL6Ep14FvcPfTlhNuMzd4StQYiUQOMVEI79FY=;
        b=hAq3HtePud/mFvY/F7iwvvtqjxNqIsmqBB28eTF+EVtTpR7gx2Era0WSqJ9aDRSoVw
         AkEUjsl4st3M+06VWliImcXd5JlKt3nm3I2rtHy4WWrl3xddJ14EmEh4aGh/WF6bfVJF
         33Ir7ld6TFqapcNaXfHAPODn8P48F+pq+hawyY9wyQpc+xTZRuP2VDSLkeUP8kiPHOem
         YXWOj2MH3pq+a7acZzTBqD6CZbIt5OEgST9v0nmbJO+ExMKQAgyoo9YFeKpqAMVjr5PB
         qPOQEFmOZwZGDPmTLNS4IumRFV5+IzhZmgqSjFKllbqYdoZn25ztqkd0fC1zuc4ZP4Vm
         sAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409977; x=1703014777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfIE14hL6Ep14FvcPfTlhNuMzd4StQYiUQOMVEI79FY=;
        b=TEBzj528PkJCYiKGBENKhfuzinW2ubPAby1O3fvzjtmjlCrMYfGMe76K10iR7ai741
         zVUcVP1duCV1W6ZAC1aXQd1bKvS3pJXeCLN+U9ds7maoq6gkYxmj07FFJMJtSPsJ4Ze1
         /Yd6Flrud3jcN7Zr1ucW4Zi40OZSTZzOxPsiA7W2yHPSObDsxjoaObS2bed+1xMDbD/n
         5YxTxOj6agYr14LoZYKYISFWhbG7EGrjz4KZHzDdJovcVdZ7I2PpGwR59OZul9LlnJuj
         9P+9sNG69Innlqw19/qdKT/Uwj/5+3dSEoQfaG9ytrtiruUCGNghBVf01l3W7KSLCVfQ
         H7+w==
X-Gm-Message-State: AOJu0Yyml1xC9EyLFzHY3M4hGFxFQv1W80NJLD10U/uMoOS5GS1CGtqz
	zUG1aHXhf9uk8bLEMBYzBKqpZQ==
X-Google-Smtp-Source: AGHT+IFWZYXSA0jeqrFGRPP0p5X1RtlD1sQyP9vBTipqUAYQV1kqPm945kUXEvHmP/pUg4PI+y0ClA==
X-Received: by 2002:a05:600c:21c7:b0:40c:2c6d:c82b with SMTP id x7-20020a05600c21c700b0040c2c6dc82bmr3603964wmj.60.1702409976898;
        Tue, 12 Dec 2023 11:39:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: Re: (subset) [PATCH v7 07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Tue, 12 Dec 2023 20:39:16 +0100
Message-Id: <170240988142.242356.3792346192498410733.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-8-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-8-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:22 +0000, Peter Griffin wrote:
> These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> 
> pll0516x: Integer PLL with high frequency
> pll0517x: Integer PLL with middle frequency
> pll0518x: Integer PLL with low frequency
> 
> PLL0516x
> FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> 
> [...]

Applied, thanks!

[07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
        https://git.kernel.org/krzk/linux/c/13ff3bdafdd569e62e59330de18aae25ec15c97b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
