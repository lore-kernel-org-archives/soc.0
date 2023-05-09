Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B717C77B75
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E096DC433B0; Tue,  9 May 2023 18:09:56 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8F84C433D2
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8F84C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so12058227a12.0
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655793; x=1686247793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ykc+NJpWYwnllZDoX+4ReA3Lc/adaxGurWdFgmTtwT0=;
        b=B6Yv33IStPyelhF8OdQygmYARdIpTY5gvloVmpFKVFLdmY36IHBVaIqGzzC5awUkeN
         /IkIB9KZxwsd3X5wqYzNtkm/8WuidZ39KahyAroxdgonmgJprWHZLx06lUeOSWhvTLFX
         2nEPns/1AE9vYOfufWTnTHwL+KDXRF2nWToaeiaBH0YaCCBXcmTHk1ia03YOuMN+qh4g
         nQfU874wLJOcTPMvwggyb2PLML1Z8y+KxRvxqvm//kJzsW37Ry7j4oBBmdDVjjbTrUKc
         OrzU7aKP6lTL7mwQgjZajKzB4caL1HBVIphp38ZfnuM9BngPb6E/t82gJV6hu0H2NKef
         S7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655793; x=1686247793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ykc+NJpWYwnllZDoX+4ReA3Lc/adaxGurWdFgmTtwT0=;
        b=Yyt6vCK3mhP0UGTftO4udQjqN/aZ9m8zPTuog5jForp0G5KM1InZ9gDNOxpWo6c2/t
         +Xw7UUoaNafExxIrVhj9Ebp36WjCjAq6tyEK0c3Ujr4BvHU31aeya+7dhZgZcdjnZN1B
         VzRnLW3Y2DDwuGNrUGQhn5Z0osr8C5SgbMUXQbL9dr63G/BU3v/FymxUHLIPY/na1nxF
         FtzFi5dE04jDXrx9Mftmx+j/r4JZgQV4FwMDoutqaRhaEdFz7gjy6zQIKAjZXf4ct7BZ
         bH4ffYWrhmTIA6BfqkHFhoLaX79SeGuy1Y9FwPjk71KB6i+YBytdBrUmr7ZXwCRJQuxI
         jR9Q==
X-Gm-Message-State: AC+VfDxKR79hg1bLRfOJeodRHFPHah0hVS8z8YOlBFx5TTBOHilvzLYc
	YFz+9jFcEIkalAMWeb5FwtQCsw==
X-Google-Smtp-Source: ACHHUZ4K/EPxDUp5cN5i+MrYJtRHUxzNOUDZ9RANSIgFtgZnmxcaiqDZslD35IsjyHMjpIBOsiCHEQ==
X-Received: by 2002:aa7:cb87:0:b0:50b:c8b1:574b with SMTP id r7-20020aa7cb87000000b0050bc8b1574bmr10792916edt.3.1683655792838;
        Tue, 09 May 2023 11:09:52 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:52 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 10/13] ARM: dts: Re-introduce Exynos4212 DTSI
Date: Tue,  9 May 2023 20:09:35 +0200
Message-Id: <168365575566.242810.2057690967168679631.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-11-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-11-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:22 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit bca9085e0ae93253bc93ce218c85ac7d7e7f1831.
> 
> 
> [...]

Applied, thanks!

[10/13] ARM: dts: Re-introduce Exynos4212 DTSI
        https://git.kernel.org/krzk/linux/c/41bf1a9f9fbdec5dd1ba69fe26157f42e44dcee4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
