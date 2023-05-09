Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D3C77B75
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C3DBC433AE; Tue,  9 May 2023 18:09:53 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F08AC433A7
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F08AC433A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so11248843a12.3
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655789; x=1686247789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6Mk+624yxmJZhHaO1qWp2thr1eQhOU4HhCuia9Oec4=;
        b=gnn4JGqkuL8679yPpfpJdLY0T1E3exoerCewjeQWuzGfcaQBijpRSoJjdv7PKTg3Sy
         Mr499xZTPJvKc3McHFl/2hOG7VqPYfzv9aMhAh/UdAVJ0JbAQv/e6W1KlN6e5OZOc4JQ
         X9k9nod95QBEbjCPVdfD2pUVSLu1p6D2C+nB2wxq2S7lTXW5b4mmUtsFgfisFgbNP5kL
         VOKmBxCYBb+iZJtTaRMdF84Dl0G08u2Bd2c8IRTziwDnV4M1FEXFr7zztZGL0YkAxr/n
         qBRd95ga2VNqB4uS9X5fqnxSwIU3XxPet8Nkjfjqix6bUGegq85AY/8X/H9RDvpFIwdO
         iOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655789; x=1686247789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6Mk+624yxmJZhHaO1qWp2thr1eQhOU4HhCuia9Oec4=;
        b=G2wRUReehx3KEf/Nnr1jWgvJA7WJfmZmeU6XkP6tVYfj1A7a5bAzO7kI5eOqOR7HaP
         aZ/j+fNOYSETb4oSHcRkxXuEeAm1CuDASa6IfTQM4kV2iFv0ptOe44MfKFaUxf70qDQk
         Rr4Y/eGeqk+He4TjURmMR4H/SdoTYCFoAIj7tBg0R2RtKkffQJ7xJHzZOo3lAwENkPBw
         KAXtuLLcFmG31Gz2AvAkFI/Yys7TWb5J8RVGhFQa27wMoAqxqAHXNGeR8+NggxDbbNbM
         75VaU+ZZ7gQTYtlJIfo2CK90SYkIH7O19nLDZeUJV6hQ1U/boauAUxyVjrWK7PmGPMyc
         aQhQ==
X-Gm-Message-State: AC+VfDz7pIGj25fkrBUCA9VTgnUKjCvCZJ/8a9YS/ssiDRye5M9CJ4gT
	aUlhWCD69POY9hAOJ+Gam2wbEQ==
X-Google-Smtp-Source: ACHHUZ5Jg/H32sCIUzGZPIgCeMhANkCcCtIqqsjY4T3Eu0k8izMnFpTqj3Zeqww7zEiNewdh7JADeA==
X-Received: by 2002:aa7:dbca:0:b0:50b:d557:d446 with SMTP id v10-20020aa7dbca000000b0050bd557d446mr11080825edt.2.1683655789189;
        Tue, 09 May 2023 11:09:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 06/13] clk: samsung: Re-add support for Exynos4212 CPU clock
Date: Tue,  9 May 2023 20:09:33 +0200
Message-Id: <168365575565.242810.17090653188259271875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-7-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-7-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:18 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit c9194fb623b0158029a268376df09fe28a2a2b05.
> 
> 
> [...]

Applied, thanks!

[06/13] clk: samsung: Re-add support for Exynos4212 CPU clock
        https://git.kernel.org/krzk/linux/c/40b4ffe5e921a8db911a7e5ffe3ad8da86ac0dfd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
