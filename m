Return-Path: <SRS0=dXuL=PB=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5635C433F5
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 16:24:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BE90361053; Wed, 13 Oct 2021 16:24:24 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3289061168
	for <soc@kernel.org>; Wed, 13 Oct 2021 16:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3289061168
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5B8213FFDE
	for <soc@kernel.org>; Wed, 13 Oct 2021 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1634142262;
	bh=rIEj21HHKhJcsySyHApcwExmEsShxKv23rfMFAlFGSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=V4rg/Cz/R+BoFKXe4B+BYQ0rHB/1jqbZ8RqoHNbCPlWmfuyllcIezoMCb0hltroJH
	 gn2nn6w2JGMWRLUuNT+G2Ylw7zPf5ZWng82mNNq6V4dz0st0F0ItEGQL0PsVz+cbKe
	 0iQ6HF9n6i2/4OR88H+w0qUnHwIQb0PGbRowcsXnNPXUZJ0jKOh99pckIxAlvTlg66
	 UcT43/rBnhQvZNeNDlmRODXAnx1JnEL5HA8h6pJ1itPBMmyqazDBhrdCdEmOSnYRdB
	 AvHF/d1qP7x/yP/Xl7ttfKNstkDq9Px3X7ajE0poDAR4De6x7T23BXW/DIPsbaDzhv
	 60QJSsLEgEQzA==
Received: by mail-lf1-f69.google.com with SMTP id b36-20020a0565120ba400b003fda644089bso2374918lfv.18
        for <soc@kernel.org>; Wed, 13 Oct 2021 09:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIEj21HHKhJcsySyHApcwExmEsShxKv23rfMFAlFGSI=;
        b=bT/MC01u2aEXryOnV4xRG1bCcEQ6nC6VOBM5fsPIaLL4hEoa8fl009sCku4k0MrUlZ
         /uBYESXXQbZB77L1COn67jsPaduGvt6fnTixrP5PuzDMb19iEtctqgPicUuK2cue4jCb
         KBol3VJdVITG1d9WqA0vUw4jWCsUroX5cHlZi+hoq3xuTO8g/42jfti31bIZ+hZrcUWD
         JKVIYicBfVQ2r81sr8oyaEX3E5Q2iAmSmJvvGHHeZOGFTQHAxIGyI0xz3Kq8tSQKIAPD
         7LMILgArCsChWjZzgZPB6rbpWRIkcecOBsX9s2NB9pwUfDTKnT4eX9hqEwyecaKHIhKL
         9NwA==
X-Gm-Message-State: AOAM530lZw8sULvRsjcUArJRnCvRwuayqjHfhKGOrff17A9LKewCyuhi
	kWJaZMZrCdABgQYhCF2OlwKKf0yXVlfEP8Vpb0J/GIdvu/DOq5rgTo7Ur5DzOvWg6B4gN6Axv58
	QfsWZr/5CalHQyhgg7+XEn9g=
X-Received: by 2002:a2e:9790:: with SMTP id y16mr323444lji.175.1634142261793;
        Wed, 13 Oct 2021 09:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoTIiea+8iBrlt5YSeJhanTDXQjxIM9l83Tywf3oR1RICkS2ZGaOCR5f49WvdAq4nAXfiLdA==
X-Received: by 2002:a2e:9790:: with SMTP id y16mr323422lji.175.1634142261620;
        Wed, 13 Oct 2021 09:24:21 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r3sm1372281lfc.169.2021.10.13.09.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 09:24:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: dts for v5.16
Date: Wed, 13 Oct 2021 18:24:17 +0200
Message-Id: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16

for you to fetch changes up to 7ec804d6025c952e3122ad7fe768178efca3300e:

  ARM: dts: exynos: use spaces instead of tabs around '=' (2021-09-30 13:45:55 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.16

Minor cleanups - from undocumented or unused properties, coding style.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: exynos: drop undocumented samsung,sata-freq property in Exynos5250
      ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
      ARM: dts: exynos: use spaces instead of tabs around '='

 arch/arm/boot/dts/exynos4210-origen.dts  | 24 ++++++++++++------------
 arch/arm/boot/dts/exynos4412-origen.dts  | 14 +++++++-------
 arch/arm/boot/dts/exynos5250-arndale.dts |  3 ---
 arch/arm/boot/dts/exynos5250.dtsi        |  1 -
 4 files changed, 19 insertions(+), 23 deletions(-)
