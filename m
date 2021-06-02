Return-Path: <SRS0=NWdI=K4=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EC0C47083
	for <soc@archiver.kernel.org>; Wed,  2 Jun 2021 08:47:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F2319613D7; Wed,  2 Jun 2021 08:47:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32A7613D3
	for <soc@kernel.org>; Wed,  2 Jun 2021 08:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32A7613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=narmstrong@baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id h8so1413412wrz.8
        for <soc@kernel.org>; Wed, 02 Jun 2021 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ch8odCii0jbUEayBNz5PH1VkcSulmShj14mgcVkeUbI=;
        b=fYAZRTperpNR8a/ILq4ijvaLZlihQDfXCbdbqeOh7VNtYzL++sYPL0jw4+W7uryFMF
         2nTgsjFdFPb8zObAEF6Awj03dCNWBV2xLh8wFYbJNeEeCtq0gLTHUvEvpGTJobj1YJtK
         MXkrkSqbDysOq67K/v0EHw/mDAYgAL5IrZkHTLl65v918f5v99gJatPfOTvY17ru2Yo1
         OuVEVfqusrqLwC2j+9nBeA/V/iEPCmKgodhBNLg/roEH7vuv4a+C4mbDeY5Vdtc+8x1e
         kuj/5BSCWl8Nmp9hYzIM4KQ49vbIfKI+DCgfUpxFPQcLz6lVYtoE15vCmLARIIqq6G3S
         u7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=ch8odCii0jbUEayBNz5PH1VkcSulmShj14mgcVkeUbI=;
        b=LCcl9YtihT/i3FekY7mdyYv8m1AXRhS4WW0mBJVZCgC0tt50SGlra3P0rqjFt+pRWE
         vW+p0uuKzGfcdsUajlrA7Oc5O5yMm6a7/cMuAYt3vuYsQ4PyRnF5hMQbZFJ/QA/2Gd/f
         /t0pYemnLk1UbJ4KXoomCsDTxr0zSseXeWUZBFESMRTG2/QAV0RXKSqmaFGF7I+ICRjJ
         j0Ipb2oWDcTvr0UxONyiSJ0wPnZg3WIEVMrR4PDte9qtn5LCMpVSFG6JXsYjXl6xPiUu
         4t5+y69kAvQrISLwQgk4jFYzhca1gdGl0MMiSIL5nys7mZtQnJyZbOcGQkyzIvi8MLic
         3Gfw==
X-Gm-Message-State: AOAM532o8dpJgt1S7KnutBg+iWTcbDoBFwO8UW0admUhsGxkfN1yx1hk
	GKo+MU2T10fdz6pA6WfW4bNYR5fAACBVCGVy
X-Google-Smtp-Source: ABdhPJxlo3D+p1t58u6+T9S+bruGgJ4TX6cNGRNmCmCd5BuIsfIVgUGCOd8KQpR9NW4IpxI1jHP7jQ==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr25919709wrn.146.1622623623254;
        Wed, 02 Jun 2021 01:47:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:5bc3:680:d34c:955b? ([2a01:e0a:90c:e290:5bc3:680:d34c:955b])
        by smtp.gmail.com with ESMTPSA id 89sm6831225wrq.14.2021.06.02.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 01:47:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.14
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <bb207cf8-fc7a-3121-eea8-56618b5952aa@baylibre.com>
Date: Wed, 2 Jun 2021 10:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's the ARM64 DT changes for v5.14:
- new Banana PI BPI-M5 board
- handle of UART A bigger FIFO
- various audio changes for internal DAC and loopback

Neil

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.14

for you to fetch changes up to a270a2b24de5be0480136cbbd7805b9134762b97:

  arm64: dts: meson: set 128bytes FIFO size on uart A (2021-06-01 10:27:02 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changed for v5.14:
- set 128bytes FIFO size on uart A
- add Banana PI BPI-M5 board dts & bindings
- meson-sm1: add toacodec node to use internal audio DAC
- enable hdmi audio loopback on VIM3 board

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: dts: meson: vim3: enable hdmi audio loopback

Neil Armstrong (4):
      arm64: dts: meson-sm1: add toacodec node
      dt-bindings: arm: amlogic: add Banana PI M5 bindings
      arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts
      arm64: dts: meson: set 128bytes FIFO size on uart A

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   1 +
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  41 +-
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     | 646 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  13 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  10 +
 9 files changed, 711 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
