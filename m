Return-Path: <SRS0=DfUx=DV=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34B3C001DB
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 13:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9D24C433C8; Fri,  4 Aug 2023 13:17:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B885C433CA
	for <soc@kernel.org>; Fri,  4 Aug 2023 13:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B885C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so19713785e9.1
        for <soc@kernel.org>; Fri, 04 Aug 2023 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691155033; x=1691759833;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Im+1O+L70hK8xD7ZGl7fduRRYkSx1vMClGa3ab9UPB4=;
        b=XLtaPLTNyo6Y4Pf0FdtD0IjbhNF3sBebcLB8eIPokoN2AzJl3DxAldaJ1+G2Tnk8QN
         RyJQh0G0352wZvSdai376Z8WV+CKmhByLG5+zntXV8VTsyowBfhVVYo/AWc2ASOrD9mi
         OpbC//x3QVFvXdYTUTH0q57pmra6COoeD+01kty/BeYNItuB8XHGzlU7BeW9cqmerMVm
         q0Ah7wDiUxLsGsLSGXJxY4QpaN0R81yC/flyHsJ7evAlPa/CRHhnMLirCLo8JOhFrM/W
         p5GsXc8ytmYg+VMf+wyr11KZZWvpnV5l4NXC38vnAXaggJQfnGVWxPV3GVdCCuscnR+C
         eX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691155033; x=1691759833;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im+1O+L70hK8xD7ZGl7fduRRYkSx1vMClGa3ab9UPB4=;
        b=d6kUjCFnavr6WcWf8m9hlYx2NB7BD62/Wfhb1pmTCTU8zXt6gW8n7GcO/h3MYHUgof
         vFQbr6NQep2j4MjFQWmX1cggIH3WXIiVj1P+VZOtzQS5qCKeYMluRYySnV2tfRC29bGJ
         Cu1F3tHx3R7demnrZDmq8HpLjyloSA+lBbb/acGoQ5OQjwu2F0h0j1PlI1wJPpDW4ecI
         DKhPUNMD5TCh4aSkx5XdKnnGFQOAqN+bG+CHkfzw+X/ICBNSdpqIirC4as8CkNovvsA8
         WZqBCDG2bOvr71RPAkIllyteod5QWKqatOqNwfk5qp/OEiHcuyQe5cilCdnxsjiBW4jy
         Aimg==
X-Gm-Message-State: AOJu0Yy/s0TZajhgH3oAJHlCLxwLMB0G8cdqQEvERkCPSfWLGqfEzfpb
	XcFzz1MvHojdcOESyGTqFheOx6NN+U/Uw6y+8hp+aA==
X-Google-Smtp-Source: AGHT+IEzqXN/VoKhgcBE+xxfEwAVdU1iUX/+z2BIjzdl0yS7zpNA17dk5nJh4rKXclVZy7OFhBVpvg==
X-Received: by 2002:a7b:ce09:0:b0:3fe:2219:9052 with SMTP id m9-20020a7bce09000000b003fe22199052mr1500980wmc.18.1691155032945;
        Fri, 04 Aug 2023 06:17:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc? ([2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc])
        by smtp.gmail.com with ESMTPSA id f17-20020a7bcd11000000b003fc00212c1esm2352326wmj.28.2023.08.04.06.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:17:12 -0700 (PDT)
Message-ID: <d5f95654-ebcd-bd37-02f9-840e50b17e44@linaro.org>
Date: Fri, 4 Aug 2023 15:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.6
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changeset for v6.6 with:
- Initial support for A311D2
- AN400 board
- gpio_intc, power domain nodes for C3 SoC
- DT bindings fixes & cleanups

Neil

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.6

for you to fetch changes up to cf4befdc463a32cb4a74ed4ca3ba60964e24f7b5:

   arm64: dts: amlogic: drop cooling-[min|max]-state from pwm-fan (2023-07-31 11:46:04 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.6:
- Add initial support for A311D2
- Add AN400 board
- Add gpio_intc, power domain for C3 SoC
- Again some DT bindings fixes & cleanups

----------------------------------------------------------------
Huqiang Qin (1):
       arm64: dts: Add gpio_intc node and pinctrl node for Amlogic C3 SoCs

Krzysztof Kozlowski (3):
       arm64: dts: amlogic: minor whitespace cleanup around '='
       arm64: dts: amlogic: meson-g12b-bananapi: switch to enable-gpios
       arm64: dts: amlogic: drop redundant status=okay in sound nodes

Lucas Tanure (2):
       dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
       arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree

Neil Armstrong (3):
       arm64: dts: amlogic: meson-g12b-odroid-n2: fix usb hub hog name
       arm64: dts: amlogic: meson-g12-common: change aobus-pinctrl node name
       arm64: dts: amlogic: drop cooling-[min|max]-state from pwm-fan

Xianwei Zhao (3):
       dt-bindings: arm: amlogic: add board AN400
       arm64: dts: add board AN400
       arm64: dts: add support for C3 power domain controller

  Documentation/devicetree/bindings/arm/amlogic.yaml |   8 ++
  arch/arm64/boot/dts/amlogic/Makefile               |   2 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |  35 +++++
  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |  39 ++++++
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  |  54 +++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 155 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   2 +-
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   1 -
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |   2 +-
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   2 +-
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   2 -
  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |   1 -
  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   1 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   2 +-
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   3 +-
  .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |   1 -
  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   1 -
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   1 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   2 -
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   1 -
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   1 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   1 -
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   1 -
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   1 -
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   1 -
  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   1 -
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   1 -
  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |   1 -
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |   1 -
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   2 -
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   1 -
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |   1 -
  46 files changed, 298 insertions(+), 44 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
