Return-Path: <SRS0=6p2j=GG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36AEC07545
	for <soc@archiver.kernel.org>; Tue, 24 Oct 2023 13:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0A1AC433C7; Tue, 24 Oct 2023 13:26:22 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22076C433C9
	for <soc@kernel.org>; Tue, 24 Oct 2023 13:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22076C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso675503166b.1
        for <soc@kernel.org>; Tue, 24 Oct 2023 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698153979; x=1698758779; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gyNlHssk7VPcI9eA9kJqbgReX3FCvfI7Vr3By9Yhi4=;
        b=M9VNpiuRipFsPMXkOVJDH/n1Pybzq5TbSs4NgFYaSuuyIpxoysAjbUBPsak8xXXp5z
         NX+hRRyaGRx358TbVpTjAPZwmBSb2g/Ef+CEJb04qerokHDofMvzYH8PbfYcnS2P0res
         DpK2Dw9/ayRCSv1QdIRgTK3+OhlM/bcrks6ORcUx6ETH66IqdHGdPhRjtbyZBJQn3oGH
         oWiope0pMw1A8n9jWoHlzZqTnXK/H8CwlG43GP+nA41lV9ifxziP9P0moSKIhYSZRX3b
         rqXwJTr2PjMWkvvJU6ofws931E/EYoGbi2HGcR8bm00SEGS1ZG1tYWJu+06QHFK2iigp
         4+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698153979; x=1698758779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gyNlHssk7VPcI9eA9kJqbgReX3FCvfI7Vr3By9Yhi4=;
        b=n4njIAHKdgJiZJHVgcjlBE4Nz6R5St80jPtBz5+ho9p5hU6T0V9U8dxG88BBWkEjXk
         b3ymu085IXcib3boU1t5CDmeSb6K/+Y6U+PKLXMCKh00cCbFjuMGSyPVu837qBW+1+fH
         NKn/by21SC1HrfXU07AC97y2L48VFPJk0nZFxEvfD6lUV4CZhMdGm7RJO9Dde21wDWUx
         RJLPhYMVuTr3R+CkS0Kg+eb73OdjhHcCkRHG5H8L8sjt/TaObuKvNsOGulI9gfdxngoP
         Bu87KaeGLVIFO1FPBjlu7MuBJVxPFhHRUtn010mTZndnZfop0iavPZhblhr237ygSEiV
         ZLrQ==
X-Gm-Message-State: AOJu0YxQTezxVJLI4JI9QldwPZ4xfr6duHxg/2T+K3fn9McT78LqpN+0
	HLgWF44uKh9gOOnpK2clxmKo0Q==
X-Google-Smtp-Source: AGHT+IHGOKn4MfzpARtXzrt/xZhf+z7fzKiebIFbygjduW6NklJfnaZHtqpK9v35XDluS/8922ZriQ==
X-Received: by 2002:a17:907:728a:b0:9ae:41db:c27f with SMTP id dt10-20020a170907728a00b009ae41dbc27fmr9101041ejc.10.1698153979219;
        Tue, 24 Oct 2023 06:26:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709063c0700b0099c53c4407dsm8285842ejg.78.2023.10.24.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:26:18 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [GIT PULL] ARM: dts: samsung: Second round for v6.7
Date: Tue, 24 Oct 2023 15:26:15 +0200
Message-Id: <20231024132615.65609-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request, last minute improvements for v6.7.

Best regards,
Krzysztof


The following changes since commit ef399736c3ba77fb82d778b1b7285baa65a7e079:

  ARM: dts: samsung: exynos4210: enable polling (2023-09-14 10:05:21 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.7-2

for you to fetch changes up to 4a48fa417abc5b86da393c93ab63a9160076a248:

  ARM: dts: samsung: exynos4412-midas: use Linux event codes for input keys (2023-10-18 08:22:23 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.7, part two

Two minor improvements for Midas boards (Exynos4412, e.g. Samsung Galaxy S3):
1. Correct the middle hardware key to emit KEY_OK instead of KEY_MENU,
   because there is already separate touchkey providing KEY_MENU and
   both label and node name suggests this should be KEY_OK.
2. Use defines for other key input constants.

----------------------------------------------------------------
Raymond Hackley (2):
      ARM: dts: samsung: exynos4412-midas: fix key-ok event code
      ARM: dts: samsung: exynos4412-midas: use Linux event codes for input keys

 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
