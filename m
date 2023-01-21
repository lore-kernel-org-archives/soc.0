Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52335C54E94
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39B30C4339B; Sat, 21 Jan 2023 20:18:58 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51668C433D2;
	Sat, 21 Jan 2023 20:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51668C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id v13so10384020eda.11;
        Sat, 21 Jan 2023 12:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVSO49G+90zNDzrj6MAr5GjdLJ2Rrum8smiQJoUXN+E=;
        b=Ktqtj+r02FZQaYel1XTo+d4okKkl0sNay94nq6NRhXwXAyAVoGLoW7A2YVuJnBujpy
         oCK+C1lWCsaVqVa9bzgTNvKxVLYdDFAAFWHDhR6i4hBYg9Tw7820Gbw1KMyCWgDeaTsd
         AMZWXxj1y9cUD9F01nm0Zr9yM4BM2OliyHUIhFgJdwPDs2xlOmeBG/R/eOsgrFSfZrr8
         Wtf12eAQW9K1QnaNkOJH3zlMrLBt+RCPqHwpBdExoMUVFRf8iSuOlk+cHg1JDqe7zvTR
         kq5JMPFV+5BF6kWTBkkn3g0I4XO+1Bx1hz4FPm029EQ/8f3fxVyiR+s/ngmZE9J5OazA
         EC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVSO49G+90zNDzrj6MAr5GjdLJ2Rrum8smiQJoUXN+E=;
        b=r9qhvbBh3dXfrUWQeiqD+ebiGrP9aM5BmPN2adHkTHqhnALyps7D9AzsweE2k0Bsaf
         dASLRsNzgWBQYlsBuuSsAAevlypyT8uXKDcszTVLxCQ50t2WZ0LJSHcRZpJYlPvElmLp
         EtLbP9oNv0miBEdPIdibrbw6VcarMN2ta78IHUA7jZBctYogseMm2MM8M/nQuJd50HHL
         4Hsy5jh5MNJ7MiAPOTQfnLFEjMrlhrRC6QSdinal4Hb6xbNsygW/it2nl1og5r/8vID6
         Ph7XkgC7mGXaoPs615tHNr8IIqjKXFTeg9QNPaoMcRcYaUcewBcyAAx/VKMo/ySO2sZH
         4Dpg==
X-Gm-Message-State: AFqh2krqFjc0da6Xc77+Mc2zhk9v1V8nicc+G+KAKsSj+vtn/IfK0Hhf
	NCFL/XupE8pVoA55nIlgJgk=
X-Google-Smtp-Source: AMrXdXuFmN6u3MxCqMpo+4RPCuRTKeRNijeNYyRJhci6brkCoAJdlqPDIb1W631UAXXidJekm1m38w==
X-Received: by 2002:a05:6402:27cf:b0:499:c332:3b50 with SMTP id c15-20020a05640227cf00b00499c3323b50mr26900820ede.39.1674332335663;
        Sat, 21 Jan 2023 12:18:55 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id i23-20020a50fc17000000b0047c6f3eccb2sm19203423edr.50.2023.01.21.12.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:18:55 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Correct inaccuracies in Exynos5420 and Exynos5800 device trees
Date: Sat, 21 Jan 2023 22:18:41 +0200
Message-Id: <20230121201844.46872-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the proper compatibles for the DSI host controller and MIPI
video phy, as the current ones are not compatible with the hardware.

While this fixes the kernel panic while trying to use DSI, I was still
unsuccessful to consistently produce image that isn't noise on S6E3FA2
panel of Samsung Galaxy S5. It seems to only work sometimes.

Cc: Mark Brown <broonie@kernel.org>

v1 -> v2:
- squash patch 1 and patch 3, making it one patch for adding the label and
  changing the compatible
- use better subject prefixes

Markuss Broks (2):
  arm: dts: exynos5420: Use Exynos5420 compatible for the MIPI video phy
  arm: dts: exynos5800: Use Exynos5422 compatible for the DSI controller

 arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5800.dtsi | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.0

