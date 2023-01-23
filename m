Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAE3C38142
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6258BC433A1; Mon, 23 Jan 2023 15:37:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75CC6C4339C
	for <soc@kernel.org>; Mon, 23 Jan 2023 15:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75CC6C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id m15so9335247wms.4
        for <soc@kernel.org>; Mon, 23 Jan 2023 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cq6ayhJIiujuCk7dC1Dlzy/ufBwMT4etpRQGBEg7fw=;
        b=t5PriCepxNWbx3CJFkfx8mWLYrTlYai55ZReEXgm7VuFu0YZ60muJdfQe0CJ5i5HK1
         HfdV0S0tsNdQUI78o87AzuEtjxRHznyXDAJV5RhXQyeLus2P6zIComcp4nUv4yJuC58V
         D7Ag06WtJBYy9kgp/eQMOSXERUFi3680TE83B5bWgFS1sVL5A/NRo7E7vWpObV8Pce0g
         LPsydiuN+8uxRJNY6Cba0afWzlDerSQZrT4GOdKQixe+Stejugr3QdnJHrGPMPOY1RmT
         kDUHxGs65AeI9PHGgAJ1JrqOd41VU+Vht3l9gYX8FQvn0K1A++/S6LJUBDl98YhNhd6i
         228Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cq6ayhJIiujuCk7dC1Dlzy/ufBwMT4etpRQGBEg7fw=;
        b=7/Mw1ABJcbRyFG0XohbbLym1sViK5ZlNxVLKxD1RPIYeDaTmg6ma9C+EAQvsSUmadl
         Ot+n4/+PN15j+g0FywGANlvJKkr9e63JxNdmho9gapFyVcA6AHijyfT5ObuFBtDqr0n9
         h6jLbbyIgb4G86w1e2V++3tYeXAQiTOsM2cUgudTyBvHYV1CJjNAqTUipz3ny8K3MRb4
         Puul8ZeXj2RS0LoQXmUkK5yltmN1WsnGaYk27LhjX+6m0EvmWmGwzK13JeArABKT97jj
         yf7lQxaRqwBZDfz0QcFBz4fdVxiFciO7/AzVm4EXGuaVOaq5GJMWU+/z4YfYKhM+UNBk
         c2ag==
X-Gm-Message-State: AFqh2kq+VHNYBUkAg/fP5HpWeoHbh4391UWZhUNpvxbVxKjWhVTIh2er
	a4ejnxeTNKsCgt4cq52NTHo6KQ==
X-Google-Smtp-Source: AMrXdXtcZWKJ5j0oRc5YZzjtqWQUSggkx82WJfQ2d9BqVHEZ6eTWX69Z3Ae8Af4FxfHtaoxFpVIblw==
X-Received: by 2002:a05:600c:4d91:b0:3da:fb96:53d with SMTP id v17-20020a05600c4d9100b003dafb96053dmr23424328wmp.4.1674488237771;
        Mon, 23 Jan 2023 07:37:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l7-20020a7bc447000000b003dafa04ecc4sm10808395wmi.6.2023.01.23.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:37:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org,
	Markuss Broks <markuss.broks@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Correct inaccuracies in Exynos5420 and Exynos5800 device trees
Date: Mon, 23 Jan 2023 16:37:11 +0100
Message-Id: <167448788767.376527.17795531099793665794.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230121201844.46872-1-markuss.broks@gmail.com>
References: <20230121201844.46872-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 21 Jan 2023 22:18:41 +0200, Markuss Broks wrote:
> Use the proper compatibles for the DSI host controller and MIPI
> video phy, as the current ones are not compatible with the hardware.
> 
> While this fixes the kernel panic while trying to use DSI, I was still
> unsuccessful to consistently produce image that isn't noise on S6E3FA2
> panel of Samsung Galaxy S5. It seems to only work sometimes.
> 
> [...]

Applied, thanks!

[1/2] arm: dts: exynos5420: Use Exynos5420 compatible for the MIPI video phy
      https://git.kernel.org/krzk/linux/c/bf5de14225625627a35d1acb6739068fc126326f
[2/2] arm: dts: exynos5800: Use Exynos5422 compatible for the DSI controller
      https://git.kernel.org/krzk/linux/c/234b8dac096d74e330ed1266956c756efddf3676

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
