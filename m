Return-Path: <SRS0=a1DX=3Q=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09768C433FE
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 09:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C488AC433D6; Wed, 16 Nov 2022 09:30:16 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45C17C43470
	for <soc@kernel.org>; Wed, 16 Nov 2022 09:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45C17C43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id l12so28566099lfp.6
        for <soc@kernel.org>; Wed, 16 Nov 2022 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3xDpe3WqLIJ4vWlNtEKnmXozr/q5qKt2awRyjeyGr8=;
        b=cKDokkgwNoTPGUU+9LGCv0aFdwy+mxnCu2is5Bw7otXZunpg4GbYBPW4ePEkZlyk+5
         V6OlzN61lg3bDAI6B9Qq6TlYwGyW7V8T8dpoD/szCqC3TLiqQZDbJqGgJh7NDczxG1FQ
         6QkSKI8yseUr0XhAo0IRZll5XLQu86Ud7f0xCXASoWvvFZeadtraDvskBkK9VlBZrmpI
         /MArBfL2AVRDL2VfJk15aqyMDXS0IJnorn0EPBvCepJBRomkkfENamNHrf/lrd4JcT22
         NCIzvluLHjCN2UO05Gd6bzSoGIordncKC5qBj5L2PzjpuYJQXPtlbg5pm3sE0GZqVT69
         8anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3xDpe3WqLIJ4vWlNtEKnmXozr/q5qKt2awRyjeyGr8=;
        b=ekUx1A69yqPJfHAqRcmgZzwYK9PtBK53X3T6bvVZgcrTEmmQUK1UEkiZo0em8fWHos
         1uJZVp6NuRuSyZkbZvxcjZMI6C5sKGZA+zaji18rAJHRiNtdTxM/QZX17AT7QjmVwn2Z
         PT01mIC8Bz/S3WaUAe3Vo77qoefVswDC16KgbwoziCoePjOEDO/VPapxS1R73v1EMkvQ
         78WHGCEIbRl6WAsRx5vhaiRFivatZPTqqgSudS9c2JM00EHgGVS2KQzvJkPUJNQ1phWF
         Fj2XjpTdz+35gai7SXl4tjgHJBI8kXyUFT5zsd2bOP+H9yYTnVTVeIzCCgAkgXWhCNFP
         NUPA==
X-Gm-Message-State: ANoB5pmOObehrjeErZI8lYGik6HStqYxsxM+yAah4mKs4xgnCB+ngjKn
	m3tDGjy7H3dZ08Y6qrJg41QT5g==
X-Google-Smtp-Source: AA0mqf6FXWk24nAVgpV7mXl+2LnsfzbOAjXFhyukT+R5ZHoVyTJf0CF1npAn/gGfDcYBSiK6aftIHQ==
X-Received: by 2002:a05:6512:360e:b0:4a2:6907:98d8 with SMTP id f14-20020a056512360e00b004a2690798d8mr6515285lfs.28.1668591013337;
        Wed, 16 Nov 2022 01:30:13 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s18-20020a197712000000b004b18830af7asm2517325lfc.54.2022.11.16.01.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:30:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: Pull for v6.2
Date: Wed, 16 Nov 2022 10:30:10 +0100
Message-Id: <20221116093010.18515-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
References: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.2

for you to fetch changes up to 21f6546e8bf68a847601e2710378e2224bf49704:

  arm64: dts: fsd: fix drive strength values as per FSD HW UM (2022-10-18 09:24:00 -0400)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.2

Correct pin drive strength macros (names) and values used on Tesla FSD
SoC.

----------------------------------------------------------------
Padmanabhan Rajanbabu (2):
      arm64: dts: fsd: fix drive strength macros as per FSD HW UM
      arm64: dts: fsd: fix drive strength values as per FSD HW UM

 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 34 +++++++++++++++---------------
 arch/arm64/boot/dts/tesla/fsd-pinctrl.h    |  6 +++---
 2 files changed, 20 insertions(+), 20 deletions(-)
