Return-Path: <SRS0=Zi3l=Q6=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BFBC433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 13:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D67D7C34604; Mon, 13 Dec 2021 13:28:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9225C34603
	for <soc@kernel.org>; Mon, 13 Dec 2021 13:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9225C34603
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id y196so11891619wmc.3
        for <soc@kernel.org>; Mon, 13 Dec 2021 05:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=23RiMUONgxSu+hkWm+3dwrf+Dsp2HM7Sz/XZAGIt32k=;
        b=Mz061YGBwILW/EknAdMN9Q0Bd8GfMCdJaLVUfzm8Ozk/K2O79v+pTnj40XcvWnRM2Z
         DpF7uzprvcKTJEWgtP0LkKLUJByB6crM5gvWaC7R56cHJgJ/0hD0VS8U52RwbBENrO+n
         o4Hkdg1Mc8QlDA5FwlDmulkQ8fvDjwghzCyObPpU6R6IbEXMq8IAg2M4JmA2nrPqCKZJ
         7H2j82O+PZ1Vk7Ya2jLupKEZtPrqUu5vND/F3t3gc8R7RLfuQQROGTsEvW8d3oYs8q06
         hSzuAoP81D/HIDQjFadHZHYTU9zp/qJnYIc+6csbx8Wf2tLymApV7y8UZMV+MQLrOIIL
         1maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=23RiMUONgxSu+hkWm+3dwrf+Dsp2HM7Sz/XZAGIt32k=;
        b=aPCg/9axvVbfOJ1eSpt5psbDfc7TmX3lKdDYgKo+BXIhlao2EA3OLXdr5z+ubikf3I
         mmtX5rQ5c2WfTMOCL5KuAGMXfSIXXBnxDCPHDUWTi656ttaR6KMsx4QulV9G7N9WzH0o
         /y5jdFnPky6QFptUzTgPUFAt56mB54gzDF1dYvSL4rPcdFrjFqk4XzkCR4tu4+UVhB3K
         +tQqKy/T9LSxHU+LOSZtAVn0EJD162iB5CT220qUYB6o9msqjD0D0JI0ImMb3kBCGWdK
         OLYxgUicXtCcyga94vIuAcfj4Mat4c5IWg7PqFBtGWbQzL4RQ0MZbLfnufgi98TLyc6A
         ZH4Q==
X-Gm-Message-State: AOAM531YhkQEphH33EOG2Cp/PJ8vFRiZXJ2xIGsKX3oaaFLVU/f8fW+n
	k/hPQ6dy10N2RN+A+VMdoraDIg==
X-Google-Smtp-Source: ABdhPJzIBUb6/PVRo+jPBPQcxeKDX3aJlABs5tPk/R0darWP3ToaP2ZpcDX1G931Y4UAqLc2BRQRFA==
X-Received: by 2002:a05:600c:1f08:: with SMTP id bd8mr13796805wmb.77.1639402122128;
        Mon, 13 Dec 2021 05:28:42 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:3328:f8ef:d20f:532a? ([2001:861:44c0:66c0:3328:f8ef:d20f:532a])
        by smtp.gmail.com with ESMTPSA id n33sm7359713wms.46.2021.12.13.05.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 05:28:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.17
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <f47b9b95-6cde-d2f8-eb36-78777d449920@baylibre.com>
Date: Mon, 13 Dec 2021 14:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.17, with minor fixes and additions.

Neil

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.17

for you to fetch changes up to 0a62b3cc0af9322e650fe89bea0bacdedf01960a:

  arm64: dts: meson: p241: add sound support (2021-12-01 10:27:13 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.17:
- Add missing cec nodes for Odroid-C4 & HC4
- Fix thermal-zones indent for G12/SM1 SoCs dtsi
- Fix GPU OPP table node name for G12/SM1 SoCs dtsi
- Fix SPI NOR Flash node name for Odroid-N2/N2+
- Fixes for GXBB Wetek boards:
 - Fix HDMI supply
 - Add missing gpio bindings include
 - Switch to new LED bindings
- P241 additions:
 - Add VCC 5v regulator
 - Add sound nodes

----------------------------------------------------------------
Alexander Stein (3):
      arm64: dts: amlogic: meson-g12: Fix thermal-zones indent
      arm64: dts: amlogic: meson-g12: Fix GPU operating point table node name
      arm64: dts: amlogic: Fix SPI NOR flash node name for ODROID N2/N2+

Christian Hewitt (3):
      arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
      arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
      arm64: dts: meson-gxbb-wetek: use updated LED bindings

Dmitry Shmidt (1):
      arm64: dts: meson-sm1-odroid: add cec nodes

Jerome Brunet (2):
      arm64: dts: meson: p241: add vcc_5v regulator
      arm64: dts: meson: p241: add sound support

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 112 ++++++++++-----------
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |  10 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |  83 +++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  14 +++
 5 files changed, 162 insertions(+), 59 deletions(-)
