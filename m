Return-Path: <SRS0=1gXN=3V=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F92C43217
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 17:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB7F2C43470; Mon, 21 Nov 2022 17:12:51 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF7B2C433C1;
	Mon, 21 Nov 2022 17:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF7B2C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id x102so17254468ede.0;
        Mon, 21 Nov 2022 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUQHKz1alORL7sfDMVM2m4TT1Si68UWSxELASufCTEg=;
        b=jDe0GlBQCqXx48AQfvwf5q26h5NtpNsCBzzLcKRCGgHSljK6wAadeFKUazmRlJKbRB
         Shat/awnyFmPGGEUGwU22UqT/hyhF5N1LxMcLUxhQCeUpydoj1MIoFUcdmDFBb5tbvuY
         +ihDIit3AHshnKfXaschAvnK8WHyIa6ppatFWNqpAqVKPC7mUn4mMwNzVac6k+T6XXrp
         DPJWk4xgISVgeNVhkPDto3ULhjcjpguuzTfb5F3W/QBtX77RwKyiOGqpVHfx+kha9cez
         FvBYpjuozwWkWkw3cFGNYHZNESllugMWI3UmRQjsmnVoJLtRDHMW0PkF1O+ALPMbnXVv
         FoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUQHKz1alORL7sfDMVM2m4TT1Si68UWSxELASufCTEg=;
        b=MK5XYyu4qeo05GxjqoHJHgvq5x1fy+4oVCmXGI9Uxy7fb0WSJco0XaM27iI3NULdTq
         RGf/msLHvfC/KDRKGbVCDjXCUDjXTTZa19RQOOjVfArJ6Q2FPzYNtPd8yx6FhAP6sSkf
         8Iq1FHOAdcVuT3G39PPJf7y9nEBaJkqErPM6g2LO7FTVZ6oseeCHOc+1tlz7X+Uc+Noy
         Lfx4MKm3y7zK3nFI0cylX6HNKXqKH/nAEgdiy1Q7i49g9z2LL41qfxbjybJdx1stmrtg
         IhJ15BmHTGRn8Q2XQDZDgL4XYqzldSoNorz7mK6aCSSCQhRnb/l5QIsyDO3Wx1dawz2l
         BR/w==
X-Gm-Message-State: ANoB5pnwtT8CKS5vf4wKWJoutNefw3i8C27XeeRJ4ebBm1mpsSjzytaX
	FaH+W97HQB4uvT31LELRqcCDwYHfkos=
X-Google-Smtp-Source: AA0mqf6agvnlQmh/JfbkQRR6OpngWpcxkMJOi45gpkORNvqtqg88JDel89/jxP/SmIqURSV1irDGCg==
X-Received: by 2002:a05:6402:60b:b0:461:9193:7278 with SMTP id n11-20020a056402060b00b0046191937278mr17563799edv.220.1669050768911;
        Mon, 21 Nov 2022 09:12:48 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906648a00b007adade0e9easm5152202ejm.85.2022.11.21.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 6/7] ARM: tegra: Device tree changes for v6.2-rc1
Date: Mon, 21 Nov 2022 18:12:38 +0100
Message-Id: <20221121171239.2041835-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm-dt-v2

for you to fetch changes up to e4185804e191bdaeb10ebe00b1b4aa9e2f147a56:

  ARM: tegra: Remove duplicate pin entry in pinmux (2022-11-18 00:22:02 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.2-rc1

This fixes various minor issues in device trees that are flagged by the
DT validation tools.

----------------------------------------------------------------
Thierry Reding (6):
      ARM: tegra: Use correct compatible string for ASUS TF101 panel
      ARM: tegra: Fixup pinmux node names
      ARM: tegra: Add missing power-supply for panels
      ARM: tegra: Fix nvidia,io-reset properties
      ARM: tegra: Remove unused interrupt-parent properties
      ARM: tegra: Remove duplicate pin entry in pinmux

 arch/arm/boot/dts/tegra114-asus-tf701t.dts         | 24 +++++++++++-----------
 arch/arm/boot/dts/tegra124-nyan-big.dts            |  3 ++-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          |  3 ++-
 arch/arm/boot/dts/tegra124-venice2.dts             |  3 ++-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  6 +++---
 arch/arm/boot/dts/tegra20-asus-tf101.dts           |  8 ++++----
 arch/arm/boot/dts/tegra20-seaboard.dts             |  6 +++---
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |  6 +++---
 arch/arm/boot/dts/tegra20-ventana.dts              |  6 +++---
 .../boot/dts/tegra30-asus-transformer-common.dtsi  | 10 ++++-----
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     | 11 ++++------
 11 files changed, 42 insertions(+), 44 deletions(-)
