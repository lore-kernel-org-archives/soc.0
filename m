Return-Path: <SRS0=kSmn=73=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC7AC761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 09:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46272C4339E; Tue,  4 Apr 2023 09:23:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B525C433EF
	for <soc@kernel.org>; Tue,  4 Apr 2023 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B525C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id t4so26802678wra.7
        for <soc@kernel.org>; Tue, 04 Apr 2023 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680600230;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghAFqdmGcU4lhfwTGUAyhjw+iMHmA3vlPtFvKmPXH18=;
        b=Vgxw2bPrkM+3FrDiFE86KdS6dS4uMGHFlWawm5jeKQUX/ihTZ+oOVU+aNJTKEccao0
         o/v9vVlvskdY1Hi9+sK+CEdPqx1Dpew+UFc+ccfa4HfdyDNMzG9VmUp6iUK2RjFD70Wk
         fu2Ad1GS/xlrvn8hj6T/PB1fy++y4ouuT1NbJR+fPrGcZ7LVwRTwU7h0NakRJa8twUJE
         TNdT+NHoTET4F6HCN1UUxgFjhYPAcSpVaN73vs+JZdaIjeTmiyuouN8cz80rU+ijuHc+
         hIlHRhxVjVcX90nj/N3NdESGADErCMDqUguR5mTi+Og/Y7Xk9PivXvWzHdpv+/ZR2xWi
         hANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680600230;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghAFqdmGcU4lhfwTGUAyhjw+iMHmA3vlPtFvKmPXH18=;
        b=eO6iuKIfJEOS9f03LdUq14Q6T5K0bS8FKyRXuvz/BqYSur8sVNEk4d5u8p/cGe9zNp
         R0QSd/dAARrHuHSnhKNGauIfsE4sWODvpePqfiVo2oZYU/YZxfPIpqoxN1LitCrBclXb
         pVI2gfYCerxTB5j+S23HUilU0e5TyItnHxs36Ze/5sBBehSa0dD/tQwD3Ml+vtetQNUU
         vYq9P0wlFv91/fVWrAR7fjI3Gas4CT161BCn0oYWp19sNqZGUqtSRZIW0YUTsV7mhZ/d
         znHNscJKGOtugKr0l/W82rvzoHHYgI5dmRq+VGl0ZY+y12cJcMkSwpr0vISrzyYBQPjK
         EsSQ==
X-Gm-Message-State: AAQBX9exHnCk84ORWkWGQ4KYCZ0x+YJ+CBr6OTLig1WL0ec8JcHUB3Xg
	Eas6WVroqLRec93EeMFmnIHG3ltwlek9b4MDS9+neQ==
X-Google-Smtp-Source: AKy350b/9xy6eCOiux7oKbcFnm6xPQZObLfZY6wqmUbtMl6yn1lgbbzgX+R4vb15E7zX4w2OV2wnnA==
X-Received: by 2002:a5d:4143:0:b0:2ce:9f0d:df51 with SMTP id c3-20020a5d4143000000b002ce9f0ddf51mr1084943wrq.69.1680600230246;
        Tue, 04 Apr 2023 02:23:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id s16-20020adfea90000000b002d21379bcabsm11745668wrm.110.2023.04.04.02.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:23:49 -0700 (PDT)
Message-ID: <1b955bb7-1a35-8d67-beb6-dd289533ff6f@linaro.org>
Date: Tue, 4 Apr 2023 11:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.4
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changeset for v6.4.

New boards are added:
  - BananaPi M2S, which can be mounted with pin2pin compatibles A311D or S922X SoCs
  - BPI-CM4 module with BPI-CM4IO baseboard, a RPI CM4 compatible module & baseboard

The other changes are DT fixes for dt-schema checks, gpio_intc for A1, new GXL MDIO
multiplexer for GXL and audio & bluetooth support on gxbb-kii-pro.


Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.4

for you to fetch changes up to 0262f2736978b1763363224698f47112a148dab0:

   arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard (2023-03-07 09:02:03 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.4:
- set of DT bindings check fixes
- adjust order of some compatibles to match dt-schema migration
- add support for BananaPi M2S variants
- gxbb-kii-pro: add audio & bluetooth support
- meson-a1: add gpio_intc node
- gxl: use gxl mdio multiplexer
- Add initial support for BPI-CM4 module with BPI-CM4IO baseboard

----------------------------------------------------------------
Alexey Romanov (1):
       arm64: dts: meson-a1: add gpio_intc node

Christian Hewitt (5):
       dt-bindings: arm: amlogic: add support for BananaPi M2S variants
       arm64: dts: meson: add support for BananaPi M2S variants
       arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
       arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
       arm64: dts: meson: gxbb-kii-pro: add initial audio support

Heiner Kallweit (1):
       arm64: dts: meson: adjust order of some compatibles

Jerome Brunet (1):
       arm64: dts: amlogic: gxl: use gxl mdio multiplexer

Neil Armstrong (10):
       arm64: dts: amlogic: meson-sm1-bananapi: correct usb-hub hog node name
       arm64: dts: amlogic: meson-gxm-s912-libretech-pc: add simple connector node in fusb302 node
       arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: remove invalid #gpio-cells in onewire node
       arm64: dts: amlogic: meson-g12b-radxa-zero2: fix pwm clock names
       arm64: dts: amlogic: meson-g12b-odroid-go-ultra: rename keypad-gpio pinctrl node
       arm64: dts: amlogic: meson-s4: fix apb4 bus node name
       arm64: dts: amlogic: meson-sm1: use correct enable-gpios
       arm64: dts: amlogic: meson-gxm-s912-libretech-pc: remove unused pinctrl-names from phy node
       dt-bindings: arm: amlogic: Document the boards with the BPI-CM4 connected
       arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard

  Documentation/devicetree/bindings/arm/amlogic.yaml |  10 +
  arch/arm64/boot/dts/amlogic/Makefile               |   3 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  10 +
  .../dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi |   1 -
  .../dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts  |  37 ++
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  | 165 +++++++
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 388 +++++++++++++++
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      | 521 +++++++++++++++++++++
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   2 +-
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   6 +-
  .../dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts  |  14 +
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  82 +++-
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   4 +-
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  29 +-
  .../dts/amlogic/meson-gxm-s912-libretech-pc.dts    |   4 +
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   2 +-
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   4 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   2 +-
  19 files changed, 1248 insertions(+), 37 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts
