Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D55DC7EE31
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2258CC4332C; Tue,  9 May 2023 18:09:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE5E7C433A8
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE5E7C433A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so11248748a12.3
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655787; x=1686247787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTAOCVPOPtOy5y17r+mtI5VSueoAcoLIpQdMbfiTcg8=;
        b=D1PFvAm7SlYpPsPFpbjzQy80gA8ralWcfpyiMeU/EMEfyrmde5hbToU9wgYycOcF5v
         YAGOBiJA9kXiZKh8/GLzZg7upeXk909wM4m461AZhHh7bb2RhFQ8yBduQ0nJJ4Nq/o2K
         RJBJUS6ydoWHlz9PeO/s9mEkytwTeKthMGp9hCNp8d2M6W/gi66naI1GvRJq+QY4uGz3
         ajzSsfVMOtdHHDtZEvJR4ZoDkE3zvfXq1G47DUgEzDOobj7be99w7fHB6KSl80Yqzuw4
         Bzc8ItdSUVWIHCFNGojsGVJQUzgptt6T3EG/wu3hWZwAytyZn5TQuhJcJP6Fph8ngztz
         7J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655787; x=1686247787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTAOCVPOPtOy5y17r+mtI5VSueoAcoLIpQdMbfiTcg8=;
        b=BnWIsgNMoFFLuHfJzKDCM30zwlP9La9jbQjkcTcuPMs77BUOeTIVXFBCsy2lgFhh8T
         MCVJiXg1tjn07WPgQ3mWsoxYJG9U04H3eDwOebcnqfZpXNKQtIB8H7y05ruBEsgksYx5
         g8GrC1dE3+ZE2RYj7LlDQSA1Cpt2hYJrGTwjyS34drhGRiLjqJJy0y5r2eG2mWekmXNb
         zWGWMuvA3FDdSUVsaq9+LRhhE67sBE1sbVuW+VT6cVTcan482rf/NrOAxhido1Gt0LEq
         Tii3o6Zuw76mufEFYxtn785Pq8ijz2hu5IzEL2sOruNcvzJ1nInW7wR3W9v+NOhowbB5
         ZaIw==
X-Gm-Message-State: AC+VfDw0m1CTBnGd7fV8/i7wy3B1UWcBDuMdWKnn6wsocWtL28GDLM65
	hTEdGQW84CUBh4t+NsZ9RGrF+A==
X-Google-Smtp-Source: ACHHUZ5hovFjTjykdEntWpkRkWy8gjb9Ub7wb8Lh4BgtsqFJo3AnBC7o0FPzHT4uW5ImOYI0KpKMUA==
X-Received: by 2002:a05:6402:10d7:b0:50d:bb87:247c with SMTP id p23-20020a05640210d700b0050dbb87247cmr2359508edu.1.1683655787536;
        Tue, 09 May 2023 11:09:47 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:47 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 05/13] clk: samsung: Add Exynos4212 compatible to CLKOUT driver
Date: Tue,  9 May 2023 20:09:32 +0200
Message-Id: <168365575565.242810.6906601762854965924.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-6-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-6-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:17 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit d5cd103b06f9d766295d18798de484528eb120ea.
> 
> 
> [...]

Applied, thanks!

[05/13] clk: samsung: Add Exynos4212 compatible to CLKOUT driver
        https://git.kernel.org/krzk/linux/c/48b359732e166d0f5d53649e21eac8d9343b8e13

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
