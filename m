Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84422C7EE24
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5155CC433A8; Tue,  9 May 2023 18:09:49 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00E62C433B0
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00E62C433B0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so1903914a12.2
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655786; x=1686247786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOQJ77m1hn2uL1cTNrMZrbjBsCRcFkR8CI8TyWOVeFY=;
        b=OovPyp7aIg8w0Y2PWf73DJevlnGdLg6GkUsrV5aMhfHSA/KQaHoY89Y1q4g8zhbUe3
         cNTyTRLnrYWmioL+NQm7sH+YoyOTLtcEI0eXmQNHMGO3O6AxcD3g101jAc2BFiz5jCYc
         DkQLoj06QPse32O1Igj++xPPUtAcks/RooaQrH5VyjbCpwaVfCb4mmftt5wGXpO45jEf
         wwGvn+faJfzqPADD5jqw/msSmUOcrzf3WOJVTyoS/mLKIJ+GMoBF/C8DO/yQSWtmsLKj
         2XXq0b3BuqHulO3w8gNELQpPD8kbuMgqvsMLTJT2JtRJJw91y2SGsKK0pVUq/dYp9P7E
         k7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655786; x=1686247786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOQJ77m1hn2uL1cTNrMZrbjBsCRcFkR8CI8TyWOVeFY=;
        b=Bt63YX7uXGbY+AFp133wAPOg8YDvANPdjqM7UGfY0e/RPOCb5woJUeUpeCxFrmJTdA
         Xk/C9BCW4R/P5bA4+9sWIFBvhpEOFfcHilm1WD73cHJ+4wXzw3BxWsRK0uX2f9VrwWVt
         6sm/yRsBm1oRvD8KlsblvHKuh1BsjBLWbPh47K8ExHInfS0iQskuSi2cHQH+lnNUBAsq
         mSCWm1hreKqPANPvrS4Hni/6PgPYdGc9eMz+h+Lxsjk4uO443km8x2c456N4G9h38FQH
         Z7OhPRQluih8HgkLAYH3wK8JiRfWcY3M/sLvLQqMuzMN8a1szZf/9YgOaS7/Lpticsct
         47hA==
X-Gm-Message-State: AC+VfDy8vuhXvhLoIIS0zK0ROgldYq5+eqcuYAaU82RtjIg6+qkxvzMa
	moeOVWojpnyP5orWPp8F0gdf+qXsy9+sZyFEfIU=
X-Google-Smtp-Source: ACHHUZ6cDJL6YidGvvj6uPnksNjdWxWsEBzwCc6yc87ckzFi/G3UAAmcV2j/+o2UMJfpv4L8Y5V2aA==
X-Received: by 2002:a05:6402:10cc:b0:502:2494:b8fc with SMTP id p12-20020a05640210cc00b005022494b8fcmr10929397edu.7.1683655785888;
        Tue, 09 May 2023 11:09:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:45 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 04/13] soc: samsung: Re-introduce Exynos4212 support
Date: Tue,  9 May 2023 20:09:31 +0200
Message-Id: <168365575564.242810.10871458937058949630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-5-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-5-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:16 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit c40610198f35e8264f9175dafe74db6288a07eda.
> 
> 
> [...]

Applied, thanks!

[04/13] soc: samsung: Re-introduce Exynos4212 support
        https://git.kernel.org/krzk/linux/c/514a935fd0d4d522a08257f5acbc5439174c7cf0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
