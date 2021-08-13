Return-Path: <SRS0=BwRQ=NE=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A42BC4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 80E1D610F7; Fri, 13 Aug 2021 16:22:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58FC161042;
	Fri, 13 Aug 2021 16:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58FC161042
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso10065793wmj.0;
        Fri, 13 Aug 2021 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=na+WKuSW69ggX7scxHBH8lK2fDYI3JGQA48xr5ljTBg=;
        b=uAI8DEbf+fOWer1VlBt0DU6R9RoJXUdqwH+7FrhTJ2M3emj0lIdaQsVys7sYtZytv4
         4V+PaD8MqEk0+DOAUVnQLrRDmNXKC+UQl3KLKQJbK7zS6MAKiPs3+2HN8WHa6PBacvGl
         ig9tQL93P3ZTY+GisuEs9vJARu2WQS2WnCr8Jj2wRB6T+XlmrJldcZ4MOcfy0uKwKOnC
         OCEhpK2YRr/O8vfJ7AQWwOhQ1Ce9NyUzmgc3doU7NXQBPSo6m1MkOcj7q2SQ6VVfOETI
         Zgj/U/W+M2TQscUyOd4C51uuW9Nga25Bbtl37cVXKoETmpy5V7bycEDiZxn7I08fO+uc
         XVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=na+WKuSW69ggX7scxHBH8lK2fDYI3JGQA48xr5ljTBg=;
        b=MO/abUoA3UKOPNvoKdJCXcTvl5D9JnPuYAQrk2l29+qyRyzuizJ+011nCaXBKIgQ5+
         0m0d8MnNO/PxuD6IB18Y78lf5hoyeV0cQoVWRlNaPvSlpxqU9XZHta3gFD6bH08oN6l+
         HL2R8tO/uXGnw+QVJXgw445SNoeabtP3gBHVMPPZNe1xpNXJsMqtkqFEZC0rIo8gpoqQ
         M5M8pFortON93oPPKGdPmkxUuUjERQUbPnPiY90SpRwPIiWdE1TM0YB8aFfAurt5JvUE
         9Z3AVUm4LPgGyy2iYm4TcqJtbXsUmrd0Fh7+arnk3IQUiwN/pemjMlZCHzhXP1Gj0kFi
         mGJA==
X-Gm-Message-State: AOAM533h5k2IYiXO5aJMVUox1vd6tgqtjVh1WqR3vuAS6V6CTXCZYtri
	avUJW1UnrOfLU33m8Iq5hw2GoUG9czY=
X-Google-Smtp-Source: ABdhPJyR7mqyoJ/Ie3E1m/so/oG020CZ4raAk3ZnLRHH7Obbkp76F1v2zZNFWMVZkiXU2gCjnniS+w==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr3650192wms.115.1628871725411;
        Fri, 13 Aug 2021 09:22:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g9sm1812046wmk.34.2021.08.13.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:55 +0200
Message-Id: <20210813162157.2820913-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-dt

for you to fetch changes up to 2270ad2f4e123336af685ecedd1618701cb4ca1e:

  ARM: tegra: tamonten: Fix UART pad setting (2021-08-13 17:59:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.15-rc1

The majority of this is temperature sensor additions for various devices
and fixes to the trigger type of the thermal interrupts.

Other than that there are various minor fixes across the board.

----------------------------------------------------------------
Andreas Obergschwandtner (1):
      ARM: tegra: tamonten: Fix UART pad setting

Dmitry Osipenko (15):
      ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
      ARM: tegra: ouya: Add interrupt to temperature sensor node
      ARM: tegra: paz00: Add interrupt to temperature sensor node
      ARM: tegra: nexus7: Add interrupt to temperature sensor node
      ARM: tegra: acer-a500: Add interrupt to temperature sensor node
      ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
      ARM: tegra: apalis: Correct interrupt trigger type of temperature sensor
      ARM: tegra: cardhu: Correct interrupt trigger type of temperature sensor
      ARM: tegra: dalmore: Correct interrupt trigger type of temperature sensor
      ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature sensor
      ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
      ARM: tegra: acer-a500: Add power supplies to accelerometer
      ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method value
      ARM: tegra: acer-a500: Improve thermal zones
      ARM: tegra: nexus7: Improve thermal zones

 arch/arm/boot/dts/tegra114-dalmore.dts             |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |  2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |  2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 90 ++++++++++++++--------
 arch/arm/boot/dts/tegra20-paz00.dts                |  4 +
 arch/arm/boot/dts/tegra20-tamonten.dtsi            | 14 ++--
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 60 ++++++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 13 ++--
 arch/arm/boot/dts/tegra30.dtsi                     | 87 ++++++++++++++++++++-
 12 files changed, 218 insertions(+), 62 deletions(-)
