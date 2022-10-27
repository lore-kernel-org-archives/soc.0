Return-Path: <SRS0=a/FV=24=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DC7C38A2D
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 00:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD805C433D6; Thu, 27 Oct 2022 00:50:33 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A0CBC433C1;
	Thu, 27 Oct 2022 00:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A0CBC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id b12so167702edd.6;
        Wed, 26 Oct 2022 17:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt3MIRMKXjXJnnd81rELlMmSLDWwlHxTIiZ16VJwbbw=;
        b=ldaVpeXnNCizOC81BoRZpy0h3vlJqWMvSMySEkRZ8RTWUhzLCXCG2mzZUhcQyWzYAp
         +53PxdCtY+eC7j7sDd8eOPmBzNwH0Z5YDD9VlcE4HVmlDhAoo5lBwtbsCbkITU9ciGZ7
         /RD97MuWjjKSnr3CJ9AEcU8efAWzwCWCLCfSxfDQI5lY0BkxBkq1TwEIhp0noV3G9Nka
         f5CE8BMYF0vCYxm4Srcts/Tc9B5IGgfk5SdaqiXMPrH57jqggQHoY+XA7Mk4z8qHNb0E
         z6ki+TvbuRhUjzcIFGcm0airNcaT5p4t8p7EpHEK2aj47IScVThsAu+BYehnss9igfcH
         rSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jt3MIRMKXjXJnnd81rELlMmSLDWwlHxTIiZ16VJwbbw=;
        b=CjsReRTcceZYSwPmwr11V6YLz4nxuHAgfDHj2eUjhGrFWh1T/sPfcRSmTwl+JeCFcJ
         q8KoAEkB70JOZniZMgTQsvia8eR/OHUug0OrZL9lLFObtr/frWiwUiBH4cOyW+i/onMd
         1OjaMDqJeEU6WUL1sposinVRHsyz3rPPM63PoAUkEazo2E+Tp9V7nlWJrww0axf7V01/
         JQZG3an0ffCbUvEssYlIzkOCuHwfsrpmVkhTYU6G6rYEP6JTrcJ4OH4ghazZQoN+7BQI
         xJnh2DZNixw39IlqrHcv7Yk/F6fdjBCxBxdOs2pxv6Ir1N8b6z9tobY8l+Wi9LFMvZkx
         TGTA==
X-Gm-Message-State: ACrzQf1pxzC9ks/tKc/QGC1TbUD/I4Iry+FL/YTI+iKyV+udcvzyMgRv
	KdmVj/k37/AaHfuMl7aqFpbYbUQD0ZU=
X-Google-Smtp-Source: AMsMyM4UN8PRjyzxfcCMWbPkvysSgG57BxsgajhoMihbcJPaMRC9bTJ77a01K1tO4L3Qm2mElKka7w==
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id sh30-20020a1709076e9e00b0078c55334158mr37883433ejc.417.1666831819650;
        Wed, 26 Oct 2022 17:50:19 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n3-20020a170906724300b007a7f9b6318asm3632975ejk.50.2022.10.26.17.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 17:50:19 -0700 (PDT)
Message-ID: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
Date: Thu, 27 Oct 2022 02:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 0/4] Add basic Rockchip rk3128 DT support
To: kever.yang@rock-chips.com, heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add basic Rockchip rk3128 DT support.

Features:
  Quad-core ARM Cortex-A7MP Core processor
  Clock & reset unit
  Power management unit
  Interrupt controller
  DMAC
  6x 64 bits Timers
  4x PWMs
  1x 32 bits watchdog

Internal memory:
  Internal BootRom
  Internal SRAM 8KB

External memory:
  Dynamic Memory Interface (DDR3/DDR3L/LPDDR2)
  Nand Flash Interface
  eMMC Interface
  SD/MMC Interface

Connectivity:
  SDIO interface
  SPI Controller
  3x UART controller
  4x I2C controllers
  4x groups of GPIO (GPIO0~GPIO3), 32 GPIOs per group
  USB Host2.0
  USB OTG2.0

===

The Linux kernel has added a rk3128 clock driver in the past,
but the DT is still missing.

In U-boot the rk3128 DT doesn't conform the latest bindings
and also the pin definition don't match the TRM.

On request from the U-boot maintainers I submit a basic rk3128 DT.
https://lore.kernel.org/u-boot/258c2dbf-436d-5935-83f5-a2dbb8cf62d7@rock-chips.com/

Based on:
https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/rk3128.dtsi
https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm/boot/dts/rk312x.dtsi

rk3128 TRM:
https://rockchip.fr/RK312X%20TRM/

rk3128 datasheet:
https://rockchip.fr/RK3128%20datasheet%20V1.2.pdf

===

NOT TESTED WITH HARDWARE
NO THERMAL PROTECTION

===

Request:
  Review of nodes and pin definitions.

  Help with testing on hardware.

  Help with correct "arm,armv7-timer" properties.

===

Johan Jonker (4):
  dt-bindings: arm: rockchip: Add Rockchip RK3128 Evaluation board
  dt-bindings: timer: rockchip: add rockchip,rk3128-timer
  ARM: dts: rockchip: add rk3128.dtsi
  ARM: dts: rockchip: add rk3128-evb.dts

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../bindings/timer/rockchip,rk-timer.yaml     |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/rk3128-evb.dts              | 105 ++
 arch/arm/boot/dts/rk3128.dtsi                 | 930 ++++++++++++++++++
 5 files changed, 1042 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3128-evb.dts
 create mode 100644 arch/arm/boot/dts/rk3128.dtsi

--
2.20.1

