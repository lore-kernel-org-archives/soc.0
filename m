Return-Path: <SRS0=xSpP=5V=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F8FC54EAA
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 10:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2900BC433A0; Tue, 24 Jan 2023 10:36:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D77D9C433D2
	for <soc@kernel.org>; Tue, 24 Jan 2023 10:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D77D9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id y1so8919286wru.2
        for <soc@kernel.org>; Tue, 24 Jan 2023 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cq6ayhJIiujuCk7dC1Dlzy/ufBwMT4etpRQGBEg7fw=;
        b=DLrzKI+hCbokwD2fwMQtd3TC+VEXzPFfCFKtTj0ef//D21zlqQXJqJBmvSMkrycn7g
         Yehr+ppyackumlQ2kZYRaOHQGv2NwmShbNfd+GC6tFK91fg/zPY4Saq59g7/IqlQRHZw
         goueE3fLTkbG/NUuvGzE/WEAgFJwU2xGbc+Nrxvp6UHSt4l1llQeuM1VUK7Pu4qUraml
         RrmE70S6ZmO0+DIrG0FL/zqG9IOt3QtyZldonScrXeZV8TNG+rWWwMiWtu53f1VNVILc
         9fIxZ+NnlfR8bLuQoSobntsJzqss9hxpqqNgF/ZmPAobvsvMXblnylkyn4ivsYBpDwtQ
         eGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cq6ayhJIiujuCk7dC1Dlzy/ufBwMT4etpRQGBEg7fw=;
        b=t4KxQh9hQgWUnNELieDoHTkXwNjLc1i314dS3YIrV7ArFm8Svep+qx+XSpsRxE4jZh
         gE6rjM59KYCn3m0AHofReWz1rV6Eb/LjbDVP9d956tHI+FaB38sCJh5WSOd55JdaiFkX
         vzBoSPQZMOXjJ2/c1dPTH0urJCAfFyFBy/HKPnoMgsxmUf1+d89HQqAsVGs2KwcD/qHW
         82KpES8b4bP4+Yr+BnqZbthcGNUW0+IVjSPTYbegx3zp0skd5+YC5wWq2m/EE+PUBTfI
         g4KwZrEth+arAtjYcwa09E9S3RzSqlln2r3uwQLLtFnCTEFDKDkeFXK2MIEwF6RYQgOz
         2feA==
X-Gm-Message-State: AFqh2kqpMlDl54EEqNoFd0Jab3fRQNpktdCcr+7jKEOTKDUsSeguVfO6
	zKA0oY4vy22ktYwTZxlEgCmzRA==
X-Google-Smtp-Source: AMrXdXuzQ/c997mVqB2Kwg5p+g5vYhXX8C6p8cM+GEtoyt8uzs1al2TGxLuJeEaN4QTPjYMPgLV7NQ==
X-Received: by 2002:a05:6000:a03:b0:2bd:e036:6b1a with SMTP id co3-20020a0560000a0300b002bde0366b1amr27524136wrb.64.1674556602173;
        Tue, 24 Jan 2023 02:36:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x4-20020adff644000000b002bdeb0cf706sm1559196wrp.65.2023.01.24.02.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:36:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org,
	Markuss Broks <markuss.broks@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Correct inaccuracies in Exynos5420 and Exynos5800 device trees
Date: Tue, 24 Jan 2023 11:36:37 +0100
Message-Id: <167455658659.245058.7412257727955360080.b4-ty@linaro.org>
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
