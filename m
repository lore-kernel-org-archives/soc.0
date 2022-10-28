Return-Path: <SRS0=9oDq=25=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD837C38A02
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 14:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA255C433D7; Fri, 28 Oct 2022 14:39:19 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F1DCC433C1;
	Fri, 28 Oct 2022 14:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F1DCC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id b2so8624876lfp.6;
        Fri, 28 Oct 2022 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=438MwCH9BTrA9BcLzWtnTn0JobWEvRhTpMnkj9ZVmww=;
        b=D6fblxQFn5vZbZOLKFcWYLtI+c5zEeyTAZFyxcD1/OuwZbjwiAe7Rx2XzqRykO7NB4
         FD3Urrlg6EwzXqeeeBNgNG9L6NGUf7kpLhdjTANcQw2PJyshDO1qdJS3j9dfllmSO+iF
         fitc0zBqXUiIdk3ZmY3elt03yduCSbxd8TDrrJ1EPruopt/jKNNHQf9V/ACPqJHvlXia
         Ai7z3Ow9ZFsPEGz/dt5LHnZDFLU7Lw/HQV2e3+9Ta1gfOhN3LHYGmslCk+z29lv0Ds2J
         5pdseKa35npP7brfhnpTl9nLjdYEbwiDiXAD3Kh7VYpGwghSFsUEAkd94mmCWgh+PtT3
         hWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=438MwCH9BTrA9BcLzWtnTn0JobWEvRhTpMnkj9ZVmww=;
        b=5ITHsSFm6UxheatVu/7mjhTYjwGwkbszr5GUOUDoBPQtqoJtOU4lYcFZz+6aPk0xSu
         SbLCjaZRtEVLwjXfE/yNT+nv5oWP3K3PNQ1oER7eFGbqUECjlh4dYCwbXQCypMiXELd0
         iF4Kg2Y7rEPSFgULB0R3t7ODcMy53zDIw0etncIiVi+nTMKGJe4d/qG0W116VwYjcSPg
         MJMQUWg9IcK46qYR56glZVX+QL7rluYI9gGlp7rkzDiXKJ0hkoMJawdwNsS3z6wLsSGU
         VdK3WErL70yDw2Sead/sI+UlW5LJwxEmXPptvIAMaPXLw/L3xgAuesWI+4dsb5e1UiiQ
         GpIA==
X-Gm-Message-State: ACrzQf1x3vkz6Su8GwDs/CfSJ3Cplq60x+KgPANvSWGlhkcQc4RKbVBu
	CFy4UgQtgP1w2+6vLfVALQAvgdVzZUA=
X-Google-Smtp-Source: AMsMyM62WjvitZ/M1z2g9r8bWwHww4iANV4p1qKSM1aGXF74m8W47uJXLz8akxUC5+rl6g/WQgKGBg==
X-Received: by 2002:a17:907:6288:b0:78d:ab30:c374 with SMTP id nd8-20020a170907628800b0078dab30c374mr48265363ejc.266.1666967946292;
        Fri, 28 Oct 2022 07:39:06 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906314200b0077e6be40e4asm2293971eje.175.2022.10.28.07.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 07:39:05 -0700 (PDT)
Message-ID: <e83964fe-ad87-0905-4586-e235757c6b2b@gmail.com>
Date: Fri, 28 Oct 2022 16:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 0/4] Add basic Rockchip rk3128 DT support
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
  Help with testing on hardware.

===

Changed V2:
  rk3128.dtsi:
    remove aliases
    add gic interrupts mask defines
    add virtual timer interrupts

  rk3128-evb.dts:
    use generic node names
    remove underscores in node names
    add more aliases
    sort

===

Johan Jonker (4):
  dt-bindings: arm: rockchip: Add Rockchip RK3128 Evaluation board
  dt-bindings: timer: rockchip: add rockchip,rk3128-timer
  ARM: dts: rockchip: add rk3128.dtsi
  ARM: dts: rockchip: add rk3128-evb.dts

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../bindings/timer/rockchip,rk-timer.yaml     |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/rk3128-evb.dts              | 110 +++
 arch/arm/boot/dts/rk3128.dtsi                 | 916 ++++++++++++++++++
 5 files changed, 1033 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3128-evb.dts
 create mode 100644 arch/arm/boot/dts/rk3128.dtsi

--
2.20.1

