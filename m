Return-Path: <SRS0=TuKk=Q7=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0438BC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 03:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9814C34604; Tue, 14 Dec 2021 03:36:22 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27B8AC34605;
	Tue, 14 Dec 2021 03:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27B8AC34605
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id x7so13361123pjn.0;
        Mon, 13 Dec 2021 19:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=plrzF7/Re5iSOy9jPcdK2BdXAHf+KzdftstClz3zPnI=;
        b=iIE/NDjVVwwkF7s1BTLw16OB88FLU4agz4UX8VCTH3vkUKvKQVo4Z+rKTCTn7wB8DJ
         C7+7s/wdZsIzGhqDEzDAgKBkCVTvM7qvLgAqzzUZHRha5d3j3ZaaMK9Tg1UQAZm6+CA+
         FGPbKfDbZyC+5FMbwcSTS76Jl6Fs8mRsTbMREXjUDpvnSzatzLiodezZl/GHyXljNjAS
         J0VCMxB3PVksZzxVM60PULyHvidz4/EwaQhXeJ81x8W+nLII8u+qArty3jdE0NAt99ze
         30m5ImRF3XnhTmA+AJ1gbLB6Q2efu7Z/EWEDLJYdcERviW54M8LC5smRu7c9dRmDkZcr
         Kx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=plrzF7/Re5iSOy9jPcdK2BdXAHf+KzdftstClz3zPnI=;
        b=sq/8IHjSNrFFurlQiRyaTVrki7lICOmbpTgphhI+HLSDsef/SlRmVD182hX8N5Q8Pj
         X28NUXgpRu6IOx/pKKV1KEQuusu7cNIkcLVjLKpvmZixmffiKNMTNh3M83xTBLyZE2mK
         ncCFO8J3zq6qdZXzHxGR24sx+EqR2XBcCziOB58mgKmx/Rswty+B2sxOLyyxEtBn2fnR
         MG0IJVjcw31UuEUCLIc9GK2C5IKx0O7mYCy4fpBx/PX5JbIJgpc2k9aD9ok/QoigfTYF
         ewr/IrZB+ERloeOunZs3KFLK+hQAHSbh8A2MfaPFgWPSSU+RbJ2nAVPtEnucjPLEFCzO
         xxww==
X-Gm-Message-State: AOAM531RY/HwshO/QUKZbavH+3EaxaBLGgUB2zDm/JJ7n0beVg32AnyN
	pgBeFFtziKClOL6Zuok2kYC3g+zbuw0=
X-Google-Smtp-Source: ABdhPJy6YeExsqW4UiNv3Yo4/SqFymtk9OvwuLtNZY4mab3EWD9jor+9G+s6p/RzoAtqkux49nRtRA==
X-Received: by 2002:a17:902:e5ce:b0:142:780:78db with SMTP id u14-20020a170902e5ce00b00142078078dbmr3085867plf.12.1639452981303;
        Mon, 13 Dec 2021 19:36:21 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u3sm15289267pfk.32.2021.12.13.19.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 19:36:20 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
Date: Mon, 13 Dec 2021 19:36:17 -0800
Message-Id: <20211214033617.2979148-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 98481f3d72fb88cb5b973153434061015f094925:

  ARM: dts: bcm2711: Fix PCIe interrupts (2021-11-15 19:09:47 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-fixes-part2

for you to fetch changes up to f1d8b8561e84c9caf3e01d726b874d80475b0ffe:

  Merge tag 'tags/bcm2835-dt-fixes-2021-12-13' into devicetree/fixes (2021-12-13 12:20:59 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
5.16, please pull the following:

- Stefan removes a fallback compatible string for the VCIHCQ node in
  preparation for allowing the VCIHCQ binding to be converted to YAML

- Phil fixes the GPIO expander labels for the Raspberry Pi 400 GPIO
  expander and adds the missing 'gpio-ranges' property for the BCM283x and
  BCM2711 Device Tree include files

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-dt-fixes-2021-12-13' into devicetree/fixes

Phil Elwell (2):
      ARM: dts: bcm2711-rpi-400: Fix GPIO expander labels
      ARM: dts: gpio-ranges property is now required

Stefan Wahren (1):
      ARM: dts: bcm283x: Drop fallback compatible for vchiq

 arch/arm/boot/dts/bcm2711-rpi-400.dts | 4 ++--
 arch/arm/boot/dts/bcm2711.dtsi        | 2 ++
 arch/arm/boot/dts/bcm2836-rpi.dtsi    | 2 +-
 arch/arm/boot/dts/bcm283x.dtsi        | 2 ++
 4 files changed, 7 insertions(+), 3 deletions(-)
