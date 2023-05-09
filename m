Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB17C7EE22
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16D09C4339B; Tue,  9 May 2023 18:09:54 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E369C43334
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E369C43334
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so1904045a12.2
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655791; x=1686247791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy+cbzzMQuxCTrCfzjntf6kXXVEyP3ei1AGAzgxK3L0=;
        b=NPeP8kTFznlWkRMqcClddaeKDzmkjQbgNMwJxBfaSCN0pSkjTnuATgpYWNKk8HP1kH
         pGGpL46W7oww6yNoG0OKriH7VQgtwHYt4Kktq40HB1/WXQhC3ObC8//5Ui/BVPtsoOop
         BBWNXAKjB8XeYJNq5O9CnOS+QIYEprH8BtQHesWyflL+5DB3+7asFS01Vk59YlI5LxHX
         ANBO+LgErYOlDkUucmnl7hE5hasWOhl4EmRs7qf3idPoO0yM3EBiLPLK85/mDn/MnPT4
         N3cZsT3Ld5wsNGYiZZgufpWcr4fawSbi7+0LnsyLiEHvPZbMFT3BBnwkfqqHtZmhLDA3
         +d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655791; x=1686247791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy+cbzzMQuxCTrCfzjntf6kXXVEyP3ei1AGAzgxK3L0=;
        b=NkPJnnabLnEumOvcFxKkyTwgkqGO2U2qwmHv1OL36jsq4X3NWpsStGTa19FWyJtobH
         kjEe0seljmFnbRZDY7ETMyggHVn2TiQDaUsptDTVmKpBkIPNuyo5eXV2KZLm9y0UHzih
         S7zEfvxP30hiPPr5Hc1vnn011j1I3EPCKlAo/lOqKLqVuX1rJiZpqR2H7WLvQSqoufUg
         sDBH4xHCtFGyXblkIRx6ONGLkju2XX8bqOgdxxLY/JU9HZzXun84rmxDE+eYfxwTiZVr
         J0ccOsJagl1x0A+LmNtL3XFQs9JkxRW9ufo0DSO7zRAk2sobUqMN1JAJnjZWrE/pvphz
         gBKw==
X-Gm-Message-State: AC+VfDy8IUX6X0fhcgqJW7UE5GaZPNPQbRhkJVAfev7CkkhN9SmUKuAe
	CK2hLiSlghUZa+AxkXpNYnYHlg==
X-Google-Smtp-Source: ACHHUZ47HeppV/iVh2N6EUDsOtopv6N36J1VqvXDHLRSjrs44zgmwmyzGrm7QSIaJADtmRvpEvSKuA==
X-Received: by 2002:aa7:d45a:0:b0:50b:c4fb:770f with SMTP id q26-20020aa7d45a000000b0050bc4fb770fmr10993092edr.34.1683655790926;
        Tue, 09 May 2023 11:09:50 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:50 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 09/13] ARM: dts: Move common Exynos4x12 definitions to exynos4x12.dtsi
Date: Tue,  9 May 2023 20:09:34 +0200
Message-Id: <168365575565.242810.17999495054025034304.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-10-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-10-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:21 +0200, Artur Weber wrote:
> In preparation for the re-introduction of the Exynos4212, move
> their shared definitions to a separate file. Rename the pinctrl
> definitions accordingly, and adapt the Exynos4412 DTSI to these
> changes.
> 
> This reverts part of commit bca9085e0ae9 ("ARM: dts: exynos:
> remove Exynos4212 support (dead code)").
> 
> [...]

Applied, thanks!

[09/13] ARM: dts: Move common Exynos4x12 definitions to exynos4x12.dtsi
        https://git.kernel.org/krzk/linux/c/b4354b9761437ba136329e3f2ea1386e8d483e1c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
