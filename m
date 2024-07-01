Return-Path: <SRS0=KWei=OB=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07444C2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 08:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3FDAC4AF0D; Mon,  1 Jul 2024 08:36:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8169AC116B1
	for <soc@kernel.org>; Mon,  1 Jul 2024 08:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8169AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42574064b16so16185685e9.2
        for <soc@kernel.org>; Mon, 01 Jul 2024 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719822998; x=1720427798; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43Jk5ICXouubFnaN+i30n+gCprshHo+KzXIWWkI6eis=;
        b=nYo3AI2Uuv4wvuxWs1aYXi6NT1/qd0SymLkIggXttiDcMA+0LUCQYd18y3m4k4q4v/
         C1EK5OL7KUh9n7IfrG+aVsd0vd+pWySCnGgmJtL7Cv+Cwbs5O6UYQEcwXCe4MGKlrN4h
         xETBV/KOSkDf4T/MvQgOQPRnCIrHDQsbyv85d7iU0sPqIESKmftnIQ9Zd+6ryhEIdIXg
         c/42lFCa1oycf3Yj0a6XPefRHnIKeIau/g3juH3HgzHBbz8AoJ33+3AOKOmnN27WHaRy
         CzFGvLaESVjZy2xHSCkIoVWfHZeRjHrctLIzm/KjoXWeyvggsCigaIj1dtXOPbHSBujE
         SOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822998; x=1720427798;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43Jk5ICXouubFnaN+i30n+gCprshHo+KzXIWWkI6eis=;
        b=M0GAkAvhXM4cAM+rFGoEQWnllErebFkw6zey/GF2qaD1hvQrRQjvqzSP2ePwHRxsBw
         lIrZXQk2A2NpT4npYfvf3NVuzbasPQEOShrI4nD44Zb2621NrA4OEk2fLctl5CsTdJR2
         4S3Y0oBDTFBtcgm7T9JDAKAW4svTuJ7TLvW5WgmAhaZRZaPb+It9zMQcOH0g5zeiyRxo
         4yVRrc1y8uYtjcGIUsHtkltuO/FRZaFQL++1D/O1WAA54pAiOSGAlHiZjja3PtOQWO4O
         AJl03ZH+9oNia6ZTCJP8GkHc0VthIyJeAFh0dvbVuCAkXZ9L5PGvKkcQhcCYV2jbMGLL
         mg2g==
X-Gm-Message-State: AOJu0Yz7bNpRYvOH+XurR7kFhzlN4PJJHxKSs9kXpDZvL2zE6WAEjrJi
	IGKPskHwSUPPhqM6zdGbDTstMLZs1/3oJVG3yd3eEJHl7sjNfYByvwpShsW9euUAe8acl+wa2ap
	suD0e9A==
X-Google-Smtp-Source: AGHT+IGQz8F4xDL3eSbOZj3rv4Jkj+ouvv1UCierzK1/V4cOwMD1ZhKY6BHDa5byKSApNt9TwmFRPw==
X-Received: by 2002:a05:600c:1582:b0:425:7616:f0b5 with SMTP id 5b1f17b1804b1-4257a02f834mr32985025e9.16.1719822997341;
        Mon, 01 Jul 2024 01:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4719:99ea:652b:10d0? ([2a01:e0a:982:cbb0:4719:99ea:652b:10d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675f9dfbdbsm9023940f8f.103.2024.07.01.01.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:36:36 -0700 (PDT)
Message-ID: <7f71e76c-c793-429a-b0ed-7296553a3eff@linaro.org>
Date: Mon, 1 Jul 2024 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.11
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.11, with:
- A bunch of DT fixes to allmost solve all remaining check errors
- Some SM1/G12 SPDIF & HDMI updates an fixes
- Amlogic S4 PWM
- Amlogic A4 Power Domain
- New boards: OSMC Vero 4K, Dreambox One & Two, GXLX/S905L p271 Reference Boards

The PR is based on -rc2 since I merged Ulf's immutable dt branch for the S4 Power
Domain DT changes.

Thanks,
Neil

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

   Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.11

for you to fetch changes up to 1443b6ea806dfcdcee6c894784332c9c947ac319:

   arm64: dts: amlogic: setup hdmi system clock (2024-06-28 10:10:42 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.11:
- New Boards:
   - OSMC Vero 4K
   - Dreambox One & Two
   - GXLX/S905L p271 Reference Boards
- Amlogic A4 Power Domain
- A bunch of DT fixes to allmost solve all remaining check errors
- Amlogic S4 PWM
- Fixes for:
   - SM1 SPDIF compatibles
   - Bump G12 SPDIF driver strength
   - Add power domain to HDMI TX
   - Correct HDMI TX clocks

----------------------------------------------------------------
Arnd Bergmann (1):
       arm64: dts: amlogic: ad402: move thermal-zones to top node

Christian Hewitt (8):
       dt-bindings: arm: amlogic: add GXLX/S905L/p271 reference board
       arm64: dts: meson: add GXLX/S905L/p271 support
       arm64: dts: meson: radxa-zero2: add pwm-fan support
       dt-bindings: arm: amlogic: add OSMC Vero 4K
       arm64: dts: meson: add support for OSMC Vero 4K
       dt-bindings: add dream vendor prefix
       dt-bindings: arm: amlogic: add support for Dreambox One/Two
       arm64: dts: meson: add initial support for Dreambox One/Two

Dmitry Rokosov (3):
       arm64: dts: amlogic: a1: add cooling-cells for DVFS feature
       arm64: dts: amlogic: a1: introduce cpu temperature sensor
       arm64: dts: amlogic: ad402: setup thermal-zones

Jerome Brunet (5):
       arm64: dts: amlogic: sm1: fix spdif compatibles
       arm64: dts: amlogic: g12: bump spdif output drive strength
       arm64: dts: amlogic: add power domain to hdmitx
       arm64: dts: amlogic: gx: correct hdmi clocks
       arm64: dts: amlogic: setup hdmi system clock

Junyi Zhao (1):
       arm64: dts: amlogic: Add Amlogic S4 PWM

Neil Armstrong (13):
       Merge branch 'dt' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into v6.11/arm64-dt
       arm64: dts: amlogic: meson-g12b-bananapi: remove invalid fan on wrong pwm_cd controller
       arm64: dts: amlogic: move ao_pinctrl into aobus
       arm64: dts: amlogic: sm1: fix tdm audio-controller clock order
       arm64: dts: amlogic: sm1: fix tdm controllers compatible
       arm64: dts: amlogic: g12a-u200: drop invalid sound-dai-cells
       arm64: dts: amlogic: g12a-u200: add missing AVDD-supply to acodec
       arm64: dts: amlogic: axg: fix tdm audio-controller clock order
       arm64: dts: amlogic: c3: use correct compatible for gpio_intc node
       arm64: dts: amlogic: a1: use correct node name for mmc controller
       arm64: dts: amlogic: a1: drop the invalid reset-name for usb@fe004400
       arm64: dts: amlogic: gxbb-odroidc2: fix invalid reset-gpio property
       arm64: dts: amlogic: ad402: fix thermal zone node name

Xianwei Zhao (2):
       dt-bindings: power: add Amlogic A4 power domains
       arm64: dts: amlogic: a4: add power domain controller node

  Documentation/devicetree/bindings/arm/amlogic.yaml |  10 +
  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   1 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  arch/arm64/boot/dts/amlogic/Makefile               |   4 +
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  10 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   3 +-
  arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts     |  45 +++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  16 +-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  24 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 438 +++++++++++----------
  arch/arm64/boot/dts/amlogic/meson-g12.dtsi         |   4 +
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   2 +-
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  14 -
  .../boot/dts/amlogic/meson-g12b-dreambox-one.dts   |  17 +
  .../boot/dts/amlogic/meson-g12b-dreambox-two.dts   |  20 +
  .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      | 154 ++++++++
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  24 ++
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   2 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  10 +-
  .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    | 199 ++++++++++
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  10 +-
  .../boot/dts/amlogic/meson-gxlx-s905l-p271.dts     |  51 +++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 199 ++++++++++
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  44 +--
  include/dt-bindings/power/amlogic,a4-pwrc.h        |  21 +
  25 files changed, 1048 insertions(+), 276 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
  create mode 100644 include/dt-bindings/power/amlogic,a4-pwrc.h
