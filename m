Return-Path: <SRS0=KPAp=SN=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA8C433EF
	for <soc@archiver.kernel.org>; Sat, 29 Jan 2022 11:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B07EC340EB; Sat, 29 Jan 2022 11:54:51 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E58CAC340EE
	for <soc@kernel.org>; Sat, 29 Jan 2022 11:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E58CAC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C8BAB3F1D9
	for <soc@kernel.org>; Sat, 29 Jan 2022 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643457288;
	bh=Ijka2jOdpqFz2YrK3+F7qMhZIXOz2gEU2sD1tESTLRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ABveYj/PrNhPJwLLSk3ovwcVEUJH/Ndda/VEjayw8/IhGKnwus+cuACer72dktEhO
	 hCSrr/PI5iszPmF9GjZVLBNLBp2qM38I+lbWCHqW3Ol55ptQXArSqq5r3QoaK9QQkt
	 cGGGwEsefGWnAanl0OWq0Q9ut3cJ1jxIy9I90l1N1uSUoPuR5ucatt6PCBh29KYA6F
	 +ZN+iNxiOg2pAD2YHSVZzrQAyRtw4O2R1wdyIb/5wGyCLZoQQHBTzwaMXhepCQZVR2
	 /T8IvvELZ8C1ksQWkiCJZ4fLQvSW1dJ2A0EAtvMW+t3gVUsMSBOJ496lfOgO7RzYhu
	 Tzg4wnCCPRrlw==
Received: by mail-ej1-f71.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so3684158ejc.15
        for <soc@kernel.org>; Sat, 29 Jan 2022 03:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ijka2jOdpqFz2YrK3+F7qMhZIXOz2gEU2sD1tESTLRA=;
        b=ZqdS6rz7qUb31KWUYKUHFaM/VpKqkay+YeGCoJtOAlNNkKxiaERG8BUzbMEn8iFbWQ
         lMy4anWgZ/rlYDKupJm6bCqDtx3VTkQ3d61L8POuBCuLjeTAIRnIay1P/I84By7v8Ps2
         DFgpB2P8+7yAhfHfYNLDTHiYxveD7LVFnuS4wCya9FEQnADraHKettMVmA/Wp30NKjqk
         oAxnoCTADpEWET4vH0CIddq+Z0avOkXEIiODWD5IRUstpG1WhArFa49D1HS3V5G7POlz
         yGItZKZmpMbbPB7m1yTRXRZheQ+hPATIp7IrZ1G4hKIXBsjgSSkPIoL+f3P0zV5CGGpK
         XaLQ==
X-Gm-Message-State: AOAM533soYlqrRaoe3hD6mfyoTGv2AIEMeubfLBCZ0plb9mmlnqtIkqj
	c06X+sM7xAml1UedTns+RcwpshGIlW3hC6mNaKWfwKlIv9InC3HHaqtLReG4fyWbpUy2L67S1kZ
	aJ4hPlUKV1LNRiC52Jb6HgUY=
X-Received: by 2002:a17:906:31d0:: with SMTP id f16mr10332124ejf.627.1643457285826;
        Sat, 29 Jan 2022 03:54:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl4F8K9oN0osyeshGAGks4kNiiTjSReACDvep5GAMERd/Swk/uXL7hADTVqMn//NHDVdJ/cA==
X-Received: by 2002:a17:906:31d0:: with SMTP id f16mr10332112ejf.627.1643457285661;
        Sat, 29 Jan 2022 03:54:45 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b30sm14571734edn.16.2022.01.29.03.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 03:54:45 -0800 (PST)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [GIT PULL] Samsung fixes for v5.17
Date: Sat, 29 Jan 2022 12:54:42 +0100
Message-Id: <20220129115442.13474-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-5.17

for you to fetch changes up to 442b0c08db7e35980bed6af091877f4dda72ffca:

  soc: samsung: Fix typo in CONFIG_EXYNOS_USI description (2022-01-23 18:05:41 +0100)

----------------------------------------------------------------
Samsung fixes for v5.17

1. Typo in CONFIG_EXYNOS_USI description.
2. Add Alim Akhtar as a reviewer for Samsung Exynos platform.

----------------------------------------------------------------
Alim Akhtar (1):
      MAINTAINERS: add reviewer entry for Samsung/Exynos platform

Sam Protsenko (1):
      soc: samsung: Fix typo in CONFIG_EXYNOS_USI description

 MAINTAINERS                 | 3 +++
 drivers/soc/samsung/Kconfig | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
