Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDFBC4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D87DC433CA; Tue, 12 Dec 2023 19:39:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F358DC433C9
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F358DC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so56990755e9.3
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409962; x=1703014762; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHCKqEsShPqcjb6XeOamSmX9Zt5UjanurpUFV2/Ak8A=;
        b=S/JWrf75x+5it5C1z65KdF5Uhuw2PLPCEw3qo5vFuL9dQ5uGuuxRHsuQAgk8QoywLl
         wrkvySDNGI2j0nVxSbO3Xgq3+3rc+s7bnhO6S0o8JUseScQ+JbEP7ZNDl/zo23GR3IJc
         yPqXBclIDSXWWudIp3UWlURysymd3oEwWlfcF27FBFRl/gITjRuLl2kOFIACreBdG0Z5
         y4BWWVu24XYXFGCThpbq/SwO2HcABwPVIHIA1XqawpW5kOuGgtG58BLZgr1xHY+bODZd
         A2U7m2sWX+x6HKyPAMFoKERHY7A5wtgU6zyf/lcu9rZ4UxmIbOmY++u7JW0owR0pneXq
         AK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409962; x=1703014762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHCKqEsShPqcjb6XeOamSmX9Zt5UjanurpUFV2/Ak8A=;
        b=UEkI1fdtXBzrV3Rk0R8K0t0BD6K1b2e1/u6dhG8yrvu0jA2K+KTLivC7hO2gsVju1e
         CtES2SfIr4lBrJL5jeBxm5APfF9w04sSzFVZ/p60aD8ZXdAXFAoOvAxY7qYMUuAHxx/C
         4RrkrwXJeUkcwXSr41/zW/NLPVlxcplnoTW+vZ5Lk1Tv6UGWACEUfNBYZnqZ5zpJKDCZ
         B+NRrom0JmJrsWUArOu2xc3rXTOY6Pqz7/8RUcGNOPeXvldkjTwSmTjIIydTNa+1j+tQ
         xoL8gYxxclKQfCRfW9mm6PPywR5RzTJPUQCsmqgt+BprfM4zDWyUGWqKxQ5bIt+c4pKp
         BvtQ==
X-Gm-Message-State: AOJu0Yz3+NyweGhnKq1I0oFY41B7kCNM9dvOTRNveEr1CMyN0habFGeC
	YygDejxLIa/JafyPpYKqBTML5Q==
X-Google-Smtp-Source: AGHT+IFEm8UKTARU0fexc14vH9SqSnbtk/kvHEWMUUBqxyH6Lcs+bK7kJJPq63ERjUJGAnmF5Xwuvw==
X-Received: by 2002:a05:600c:1819:b0:40c:3630:264b with SMTP id n25-20020a05600c181900b0040c3630264bmr983498wmp.249.1702409962237;
        Tue, 12 Dec 2023 11:39:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:21 -0800 (PST)
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
Subject: Re: (subset) [PATCH v7 01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Tue, 12 Dec 2023 20:39:11 +0100
Message-Id: <170240988143.242356.11503491743323659918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-2-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-2-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:16 +0000, Peter Griffin wrote:
> Add the "google,gs101-wdt" compatible to the dt-schema documentation.
> 
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> 
> These WDT instances are controlled using different bits in PMU
> registers.
> 
> [...]

Applied, thanks!

[01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
        https://git.kernel.org/krzk/linux/c/81306efd22fff7eecf4e62919283dd27111f0173

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
