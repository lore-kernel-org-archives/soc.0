Return-Path: <SRS0=8Eph=TE=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A4C433F5
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 11:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4C95C340F0; Mon, 21 Feb 2022 11:38:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8424FC340EB
	for <soc@kernel.org>; Mon, 21 Feb 2022 11:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8424FC340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id d3so10892084wrf.1
        for <soc@kernel.org>; Mon, 21 Feb 2022 03:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :content-language:organization:content-transfer-encoding;
        bh=+3Cdr3UnkNe6hBDvjgKna9hDC0LxHXWc7I7ZTNIF3bc=;
        b=JtwqXnf+s8ap/WJHlzhKn2g2471HfSI+wX45QPGPvjGORdJcZI850z5jYx6z+cIMRJ
         zXPSFPTK/tJC57bNzuydlALyqHO1/MT259xP+1dfLX5LvKznJvCMhTWiW9+NOF9qFLGI
         fv5Q1Lyy0fKfM3W15BE0R/wfPEcFaw1NGDMQmIqO4SeDzkNC5VEcljomZGbBj0FVQd6n
         DSsBvXxGXBo6alTnUljT0jQjRhh5uGhELf6uIf+DVF1qAc0i76Wv0XkrM2X+e3knNCRs
         +kRF9i/hy61qDXpzFekZa2cIy4I270wit9DUMy/X0z94+3vffX1Mx3+G2RVLyncTUCSQ
         Gd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:organization
         :content-transfer-encoding;
        bh=+3Cdr3UnkNe6hBDvjgKna9hDC0LxHXWc7I7ZTNIF3bc=;
        b=1IqtrhHXYc+vsOLN5DzHKSC0U0Bh/AH2ngTwHjUGlZA104R2h5arBCeDoTYk1H8m9p
         aJHFtyOe7sd7zwiWnQLd/cNRfwhGDa+yQXkWe4ydesg8IKGS8j9lSwI/34mT+R+Fg3Vc
         TokgtoeASA69/luNgtrQCfcZu/2MAWUWP3N6BVUxJQbxX4oyzFjpR8oFnjKWb8hosXnP
         g6Bhto1POWwf+R95PmTx6H8gloWZVeW+siWdr3dLezLl+m9FJ+z4WVygbh5120EK/okr
         3M2yQFmy4GcGUpnggGn+4zKU1z13EkOczYauOiMxrN5piEWwwcvDYRcqw3QW1y8+z8Pu
         qxIQ==
X-Gm-Message-State: AOAM532eWeicZHHxb2C4474p6kyN4jdN+BE7KlUUdEgZSnmph3uSwd+T
	XGq6iY6zA6Seqh64+rBKA0V2sa2m8Uk4Wsb7
X-Google-Smtp-Source: ABdhPJxKX1byj/LtVfl/YytFP4/8WtXpzyG3GoO/xZal4Tb9lygDy8NgygA864+QsEDQ1r3S64qCsA==
X-Received: by 2002:adf:e705:0:b0:1e3:14aa:db8d with SMTP id c5-20020adfe705000000b001e314aadb8dmr15025056wrm.398.1645443528416;
        Mon, 21 Feb 2022 03:38:48 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:77b7:547a:df0c:28d8? ([2001:861:44c0:66c0:77b7:547a:df0c:28d8])
        by smtp.gmail.com with ESMTPSA id bg20-20020a05600c3c9400b0037fa5c422c8sm793852wmb.48.2022.02.21.03.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 03:38:48 -0800 (PST)
Message-ID: <a7cd9937-d441-3e1f-9709-8e80cc8814f1@baylibre.com>
Date: Mon, 21 Feb 2022 12:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.18
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.18.

Notably, this adds 5 new board and a new SoC family from Amlogic, and minor additions.

Neil

The following changes since commit 0a62b3cc0af9322e650fe89bea0bacdedf01960a:

   arm64: dts: meson: p241: add sound support (2021-12-01 10:27:13 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.18

for you to fetch changes up to d926a4fe25338e120ab49547de9707dc6e5e5824:

   arm64: dts: meson: add support for OSMC Vero 4K+ (2022-02-21 09:23:08 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.18:
- New Boards:
  - Amediatek X96-AIR (Amlogic S905X3)
  - CYX A95XF3-AIR (Amlogic S905X3)
  - Haochuangy H96-Max (Amlogic S905X3)
  - Amlogic AQ222 (Amlogic S4)
  - OSMC Vero 4K+ (Amlogic S905D)
- Initial support for Amlogic S4
- Support for uart_ao_b & pwm_f on G12 SoCs

----------------------------------------------------------------
Artem Lapkin (1):
       arm64: dts: meson-sm1: add spdifin and pdifout nodes

Christian Hewitt (12):
       arm64: dts: meson: add common SM1 ac2xx dtsi
       dt-bindings: arm: amlogic: add X96-AIR bindings
       arm64: dts: meson: add initial device-trees for X96-AIR
       dt-bindings: vendor-prefixes: add cyx prefix
       dt-bindings: arm: amlogic: add A95XF3-AIR bindings
       arm64: dts: meson: add initial device-trees for A95XF3-AIR
       dt-bindings: vendor-prefixes: add haochuangyi prefix
       dt-bindings: arm: amlogic: add H96-Max bindings
       arm64: dts: meson: add initial device-tree for H96-Max
       dt-bindings: vendor-prefixes: add osmc prefix
       dt-bindings: arm: amlogic: add Vero 4K+ bindings
       arm64: dts: meson: add support for OSMC Vero 4K+

Gary Bisson (2):
       arm64: dts: meson-g12-common: add more pwm_f options
       arm64: dts: meson-g12-common: add uart_ao_b pins muxing

Xianwei Zhao (2):
       dt-bindings: arm: amlogic: add S4 based AQ222 bindings
       arm64: dts: add support for S4 based Amlogic AQ222

  Documentation/devicetree/bindings/arm/amlogic.yaml |  12 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   6 +
  arch/arm64/boot/dts/amlogic/Makefile               |   7 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  43 +++
  .../dts/amlogic/meson-gxl-s905d-vero4k-plus.dts    | 117 ++++++++
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |  30 +++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  99 +++++++
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 129 +++++++++
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      | 108 ++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   | 300 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  | 145 ++++++++++
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    | 133 +++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  | 112 ++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  27 ++
  14 files changed, 1268 insertions(+)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
