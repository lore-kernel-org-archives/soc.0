Return-Path: <SRS0=6LjJ=I6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BADC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 17:26:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15D50613BA; Thu,  1 Apr 2021 17:26:09 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A02C61373;
	Thu,  1 Apr 2021 17:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A02C61373
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-ed1-f46.google.com with SMTP id h10so2786270edt.13;
        Thu, 01 Apr 2021 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5sLzzLW3ME8Xe8VqYfMyA7U25GpLo2zuKXzOdcoRKY=;
        b=fMyLwNAl16sg3Najvg/gxxAfWYQYJWo6FFTC5aQ4NfcfFj+7bs47jmjSuh9LRIkX3R
         83Wk/V5NLiYy/SSpUY228BUxI+Cuet5RWYo2CS4HbVnRpNcROxCdqHLnbhO7KmsZ7vMK
         C2vNpBJEy4XDGdLXfF0ytJ4uh1iLXWQ5/MoZGg0Ytl4smHYTjx8rrz5hmj0/4TIBGGh2
         GdexAPTyyywyoZJ6qho1j/h/PBLcOzjZ4NyGAxpPmu6bi2MMDnFntnrnTpgqrV7XSoby
         w+jE4pouiq8y2g82hqYSDpaDjSU1QJ1qc6dmJFJ4+i/tq6aTnMRPCzTw7TK9GXYNaEj+
         LoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5sLzzLW3ME8Xe8VqYfMyA7U25GpLo2zuKXzOdcoRKY=;
        b=rJUeBN0EuLjyCOruI0QSxM9f5ZLfXp7kiB4IpA9mwNOWoJYD9/83ROzniDWxgfKcrh
         oLPFPWekb3PpJH4oqZ/Djq3frZfar6tgrmfjs5WR8MNqxfXD5jw840+Y1y2d6lJs/BG6
         dMXajhqAeRAAW9XaLF25/O484cpfzKibYLWaVIQK1aq6HUnMaDRSlLlQFnbwBAQ9h4ti
         Q/06pKFlSm/urfgdg3LeWKRyvY8PG4P8NUV6aDvtoYZKERCOOHTjBQjB84AntNR4Qgkz
         fjgyrq6KJZXB3DmZV2fCWNz8buOF4WwdRSB2chSQ+zwghrl5ToubYH/+MmDlKvJ96Kbd
         eX1g==
X-Gm-Message-State: AOAM5327TNUTvdRyZwbePg5OVlO/iIYolj7lsSbyeBMNkgg53bKRfp96
	Rb7argtakCtOrELaRUsBVtjH+Yn9Yn0=
X-Google-Smtp-Source: ABdhPJzIO9me1GxZXSNCR7NdpxHXdxcnYyP3uc3QZBz6aEJV0912UIwloUJFSuLMCdCoSAL1UuMEiA==
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr11495614edy.30.1617297964690;
        Thu, 01 Apr 2021 10:26:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c17sm4377374edw.32.2021.04.01.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:26:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:21 +0200
Message-Id: <20210401172622.3352990-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm-dt

for you to fetch changes up to 3a6c267dd7b8822eb722835b503c5a438cbd3700:

  ARM: tegra: acer-a500: Add atmel,wakeup-method property (2021-03-26 14:21:28 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.13-rc1

This contains a couple of improvements and fixes for various 32-bit
Tegra-based boards.

----------------------------------------------------------------
Dmitry Osipenko (15):
      ARM: tegra: ventana: Support CPU and Core voltage scaling
      ARM: tegra: ventana: Support CPU thermal throttling
      ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all board variants
      ARM: tegra: cardhu: Support CPU thermal throttling
      ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core domains
      ARM: tegra: acer-a500: Enable core voltage scaling
      ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
      ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
      ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
      ARM: tegra: nexus7: Specify all CPU cores as cooling devices
      ARM: tegra: ouya: Specify all CPU cores as cooling devices
      ARM: tegra: Specify CPU suspend OPP in device-tree
      ARM: tegra: Specify memory suspend OPP in device-tree
      ARM: tegra: Specify tps65911 as wakeup source
      ARM: tegra: acer-a500: Add atmel,wakeup-method property

 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  5 ++
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 16 +++--
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |  2 +
 arch/arm/boot/dts/tegra20-paz00.dts                | 14 ++--
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  1 +
 arch/arm/boot/dts/tegra20-ventana.dts              | 78 +++++++++++++++++---
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  1 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 14 ++--
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |  1 +
 arch/arm/boot/dts/tegra30-beaver.dts               |  1 +
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           | 48 -------------
 arch/arm/boot/dts/tegra30-cardhu.dtsi              | 84 ++++++++++++++++++++--
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  1 +
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |  3 +
 arch/arm/boot/dts/tegra30-ouya.dts                 | 16 +++--
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  3 +
 16 files changed, 204 insertions(+), 84 deletions(-)
