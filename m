Return-Path: <SRS0=TRi9=FM=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C3EC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 19:24:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2621323B87; Tue,  8 Dec 2020 19:24:54 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B48623B8A
	for <soc@kernel.org>; Tue,  8 Dec 2020 19:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B48623B8A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pf1-f193.google.com with SMTP id t8so14829468pfg.8
        for <soc@kernel.org>; Tue, 08 Dec 2020 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=t3WOl358dt0CDoScwgClIE5ynsRAkRb5i51bvq2hopY=;
        b=fJ99rhjl/cqzr7cyXlf8RIIV9PFjN+cJ5morfBF7MpVUwi7qwu1gzOdUCUP4Il4hyR
         bIGXdb7g5oqnkHIbxjl0/xNy8lRDF3t6sn2S+JuVEz2mdPHWwL7d5kvoUMu2vxChP8AB
         RNrbCKzKAOvLPSPrO1g804NYW/LDo2X/kJw5gDt3zxu/0DeQgFplQiGw4/+3r12rBkC+
         6ZBMgbaRDMNFIOJXNew0vBP4Nw0sxGIrRyJf+rD037DNj5v+HhSe9MkC+6E+Nk6+0rkh
         ZBTW5/GHasUj4m9ItfBv/Qg1ujsbHGZ9Lg7FGpFaSLWgmYay7kcs0gtFZHIH0L3DuN67
         Zz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=t3WOl358dt0CDoScwgClIE5ynsRAkRb5i51bvq2hopY=;
        b=C05roXONlW0pmoO17IBQcBAsda5GFL5rqB2KuLU2nRW2udYe+FaBYjEacuMWKrSnmW
         BAOcUR2/5WuAxGVz3Tf/m15ZwiUNTHvHVwmmWmIZLUYOFc+VLbCrKheRYxJdMujRpo10
         mPg1is1Dmdn8iTQ7Q62XV7Xu9OqlK0ztbzIXP1kiaUt+4R3O0pJm9ajB0jQ9WesZCSe2
         3fdmT5+EyDsiS0NOy/BI3ucvBQ0nAQOy8qlq/1LxNtpjde734I/RQFBRrCC7wgB26PI1
         TbFyZAypCLU4yM9wFaEC2OgRPQV2G9WuNjKo8G3BKEIzKfYTXKuJSeHmOazGbQlIk3QX
         xM/g==
X-Gm-Message-State: AOAM533LjiYJlDCMaK8qFEh6JpPkmJ7RBexqX+xoMD8L94LZtdUH1oEy
	DU1gDG7Gd9dEAJV/ibqQFPtC4tAIKPO7bcLT
X-Google-Smtp-Source: ABdhPJwsqnJJlR+MVODg7zivdCnmlrnej9e2ctd3tMENGWyM0q6ixab37dLdteDqHFH0qe8x9iT+Ag==
X-Received: by 2002:a17:90a:6393:: with SMTP id f19mr5750654pjj.227.1607455492521;
        Tue, 08 Dec 2020 11:24:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id p1sm20179911pfb.208.2020.12.08.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 11:24:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.11, round 2
Date: Tue, 08 Dec 2020 11:24:51 -0800
Message-ID: <7ho8j4gkxo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Hi Arnd, Olof,

Here's a final round of DT updates for Amlogic for v5.11.  Based on top
of the first round.

Kevin



The following changes since commit b6a1c8a1eaa73b1e2ae251399308e9445d74cef7:

  arm64: dts: meson-sm1: fix typo in opp table (2020-11-30 16:12:46 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 7704b100719cf0fead976a1bc839c60ee552d045:

  arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to GT-King/GT-King-Pro (2020-12-08 09:48:45 -0800)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.11, round 2
- audio support for several more boards
- PHY timing fixes

----------------------------------------------------------------
Christian Hewitt (9):
      arm64: dts: meson: add audio playback to a95x
      arm64: dts: meson: add audio playback to khadas-vim
      arm64: dts: meson: add audio playback to khadas-vim2
      arm64: dts: meson: add audio playback to nanopi-k2
      arm64: dts: meson: add audio playback to odroid-c2
      arm64: dts: meson: add audio playback to wetek-hub
      arm64: dts: meson: add audio playback to wetek-play2
      arm64: dts: meson: minor fixups for Khadas VIM/VIM2 dts
      arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to GT-King/GT-King-Pro

Neil Armstrong (1):
      arm64: dts: meson-axg: add GE2D node

Stefan Agner (5):
      arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requirements
      arm64: dts: meson: fix PHY deassert timing requirements
      ARM: dts: meson: fix PHY deassert timing requirements
      arm64: dts: meson: g12a: x96-max: fix PHY deassert timing requirements
      arm64: dts: meson: g12b: w400: fix PHY deassert timing requirements

 arch/arm/boot/dts/meson8b-odroidc1.dts                     |  2 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts                  |  2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                 |  9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts      | 17 +++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts          | 18 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi      |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi           |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 42 +++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts     | 40 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts        | 42 +++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts       | 40 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts     | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi          |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 43 +++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 46 ++++++++++++++++++++++++++++++++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts        |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts             |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts         |  2 +-
 21 files changed, 361 insertions(+), 19 deletions(-)
