Return-Path: <SRS0=3UeS=53=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D9EC54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 13:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4945C433D2; Mon, 30 Jan 2023 13:46:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27687C433EF
	for <soc@kernel.org>; Mon, 30 Jan 2023 13:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27687C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso2032374wmp.3
        for <soc@kernel.org>; Mon, 30 Jan 2023 05:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=228jO7mcolLIce23ysolcj5s4Q/Jqb8KJg6xYwo0d4w=;
        b=XI5hmiHKulhOr7MDltA5cRu+olK6A5tPZ6LVuDXXdvVIw+lG54tgIu3WYmc7hQg1as
         bK25TuukeHKU98pJ6iy3KqLlEm3o5KZZ8/l8ETQAtVtFMZr0SdESZ0WN2NKKnBecV09S
         DRcQxxL4dvfyfmAgTrLpfL9ZVQVAOaeSbPN9WImlpR4pooFb6QelczjLpARPd6wk3KIa
         ov943a10wdKBt5++ot5k8mgLVBLSXt+5c+4m+rwhXGyNUYt8doM2l3vPZX29RHUY1g2l
         NDM09ZnFviQjpsa8svTGR41cgk4ImJ7KNaFfSwr87KG6m9ugOy/1qiAaz6ZhQWLsdnX1
         p/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=228jO7mcolLIce23ysolcj5s4Q/Jqb8KJg6xYwo0d4w=;
        b=lLo7nXgf6ixX9776rJsFFRtzYlzcaPFQmPfWXWHpVfu5MiQCfyW0N1uD1Wub0hRxQq
         hd/9MF1jTS+BlsDrfkYRr/rOTAp8KnqQrOklDeEt/RPNgYBmUBnwOV5AMPKgQcrN1gkk
         begaA8BkK5jjIiEP2X0tDN+PkFS9HT7OBLZLzjyvIGHQDrQUB1tP0WlCIE+vqM5dVpwd
         ehtELu+RNrNdfMYxc2l57dGbBlEaoGJFCJHW/C5Zn5DdtEG8eNUZKwDI6sTIMhwnXN0j
         uXPqUUNHcypPu+7nWI72vlkPebClRglN0NELBkL5JvQPc5Fcn8Wnf5Mw32rWjc7hk9WR
         7xJg==
X-Gm-Message-State: AO0yUKVQJ5vX78hgpqs8GF6kazbbU6D7us0A/d/NNe1Pn4Qn/XkyxiCJ
	dlIbGvrl6boKbM+ItpY91AjpMfvI/3H2lpuwjTM=
X-Google-Smtp-Source: AK7set89aOiBLaBxr5FOof0uJvW+UMqFniC9+QJq43Oc44g3pQeAQxdAQpfPzGiU3EgxN2/sYWsntQ==
X-Received: by 2002:a05:600c:6022:b0:3dc:5e16:37ea with SMTP id az34-20020a05600c602200b003dc5e1637eamr1858927wmb.30.1675086387346;
        Mon, 30 Jan 2023 05:46:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f17:219:cb05:7cd? ([2a01:e0a:982:cbb0:5f17:219:cb05:7cd])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003db09692364sm17823133wmn.11.2023.01.30.05.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:46:26 -0800 (PST)
Message-ID: <c1641ffd-71c9-9ac9-89d9-c22da4acea10@linaro.org>
Date: Mon, 30 Jan 2023 14:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.3
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.3.

New boards are added:
  - Odroid-N2L using S922X (Smaller version of Odroid-N2+)
  - BananaPi M2-Pro using S905X4 (Variant of BPI=M5 with on-board wifi)
  - Radxa Zero2 using A311D (Faster version of Radza Zero)

The NNA reset & NNA power domain bindings were added to an immutable branch
and merged in this PR and the drivers DR PR to satisfy build-time
dependencies.

A cleanup & fixup of the ARM64 DT has started, first by covering easy
mistakes like invalid node names & missing unit address.
This goes along a complete migration of bindings to dt-schema, which
are merged by the respective maintainers, the migration will cover the next
Lnux versions.

In addition, the following changes are added:
- Add DT node for the VIPNano-QI on the A311D, a Neural Network variant of the Vivant GPU core
- remove CPU opps below 1GHz for G12A boards, like it was done for G12B/SM1
- Fix WiFi/Bt definition around P212 & Khadas VIM1
- Add audio node to P212
- Fix FAN trip definition to Odroid-HC4
- Fix gpio-fan gpios definition
- Permit Radxa Zero OTG on USB1
- Fix VDDIO_C enable gpio by using OPEN DRAIN flag

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.3

for you to fetch changes up to d747e7f76a5fa6e3deb4c419df768f9ee49c2161:

   arm64: dts: meson: add support for Radxa Zero2 (2023-01-27 18:01:56 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.3:
- Merge of immutable bindings branch with Reset & power domain binding
- New boards:
  - Odroid-N2L (Smaller version of Odroid-N2+)
  - BananaPi M2-Pro (Variant of BPI=M5 with on-board wifi)
  - Radxa Zero2 (New version of Radza Zero with A311D SoC)
- Add DT node for the VIPNano-QI on the A311D
- DT bindings fixups covering all SoC families
  - MAC address nodes
  - ethernet PHY node name
  - scpi & child node names
  - SD/SDIO node name
  - USB supply name
  - invalid clock-names
  - rng node name
  - rtc node name
  - ETH phy mux node name
  - button & adc keys node name
  - leds node names
  - RK818 pmic properties
- remove CPU opps below 1GHz for G12A boards, like it was done for G12B/SM1
- Fix WiFi/Bt definition around P212 & Khadas VIM1
- Add audio node to P212
- Fix FAN trip definition to Odroid-HC4
- Fix gpio-fan gpios definition
- Permit Radxa Zero OTG on USB1
- Fix VDDIO_C enable gpio by using OPEN DRAIN flag

----------------------------------------------------------------
Christian Hewitt (12):
       arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
       arm64: dts: meson: add Broadcom WiFi to P212 dtsi
       arm64: dts: meson: move pwm_ef node in P212 dtsi
       arm64: dts: meson: remove WiFi/BT nodes from Khadas VIM1
       arm64: dts: meson: add audio playback to S905X-P212 dts
       arm64: dts: meson: radxa-zero: allow usb otg mode
       arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
       arm64: dts: meson: bananapi-m5: remove redundant status from sound node
       arm64: dts: meson: bananapi-m5: convert dts to dtsi
       dt-bindings: arm: amlogic: add support for BananaPi M2-Pro
       arm64: dts: meson: add support for BananaPi M2-Pro
       dt-bindings: arm: amlogic: add support for Radxa Zero2

David Heidelberg (1):
       arm64: dts: meson-gxm-khadas-vim2: use gpio-fan matrix instead of an array

Heiner Kallweit (1):
       arm64: dts: amlogic: Fix non-compliant SD/SDIO node names

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: align LED node names with dtschema

Martin Blumenstingl (6):
       arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC address node
       arm64: dts: meson-gxl: jethub-j80: Fix Bluetooth MAC node name
       arm64: dts: meson-axg: jethub-j1xx: Fix MAC address node names
       arm64: dts: meson-gx: Fix Ethernet MAC address unit name
       arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
       arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address

Neil Armstrong (19):
       Merge branch 'v6.3/bindings' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into v6.3/arm64-dt
       arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs node name
       arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs node name
       arm64: dts: amlogic: meson-gx: add missing SCPI sensors compatible
       arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: fix supply name of USB controller node
       arm64: dts: amlogic: meson-gxl-s905d-sml5442tw: drop invalid clock-names property
       arm64: dts: amlogic: meson-gx: add missing unit address to rng node name
       arm64: dts: amlogic: meson-gxl-s905w-jethome-jethub-j80: fix invalid rtc node name
       arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: fix invalid rtc node name
       arm64: dts: amlogic: meson-gxl: add missing unit address to eth-phy-mux node name
       arm64: dts: amlogic: meson-gx-libretech-pc: fix update button name
       arm64: dts: amlogic: meson-sm1-bananapi-m5: fix adc keys node names
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix led node name
       arm64: dts: amlogic: meson-gxbb-kii-pro: fix led node name
       arm64: dts: amlogic: meson-g12b-odroid-go-ultra: fix rk818 pmic properties
       arm64: dts: amlogic: meson-sm1-odroid-hc4: fix active fan thermal trip
       dt-bindings: arm: amlogic: document Odroid-N2L
       arm64: dts: meson-g12b: move common node into new odroid.dtsi
       arm64: dts: meson-g12b-odroid: Add initial support for Hardkernel ODROID-N2L

Tomeu Vizoso (3):
       dt-bindings: reset: meson-g12a: Add missing NNA reset
       dt-bindings: power: Add G12A NNA power domain
       arm64: dts: Add DT node for the VIPNano-QI on the A311D

Yuntian Zhang (1):
       arm64: dts: meson: add support for Radxa Zero2

  Documentation/devicetree/bindings/arm/amlogic.yaml |   3 +
  arch/arm64/boot/dts/amlogic/Makefile               |   3 +
  .../dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi |  10 +-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  16 +-
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |  20 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   2 +-
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     | 448 +------------------
  .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     | 125 ++++++
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi | 445 +++++++++++++++++++
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 489 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |   4 +
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   2 +-
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   6 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |   2 +-
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |   2 +-
  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |   1 -
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |   6 +-
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |  15 -
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |  68 +++
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |  21 +-
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   2 +-
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   9 +-
  .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |  97 ++++
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     | 428 +-----------------
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi | 435 ++++++++++++++++++
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |  10 +-
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   4 +
  include/dt-bindings/power/meson-g12a-power.h       |   1 +
  .../dt-bindings/reset/amlogic,meson-g12a-reset.h   |   4 +-
  31 files changed, 1746 insertions(+), 939 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
