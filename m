Return-Path: <SRS0=4JMP=V7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF374C433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 10:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EFE9C34116; Mon, 23 May 2022 10:44:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73CB2C385A9;
	Mon, 23 May 2022 10:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73CB2C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f179.google.com ([209.85.219.179]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGQ85-1o4tli0EOr-00GrBZ; Mon, 23 May 2022 12:44:07 +0200
Received: by mail-yb1-f179.google.com with SMTP id f16so24645305ybk.2;
        Mon, 23 May 2022 03:44:06 -0700 (PDT)
X-Gm-Message-State: AOAM5304dXs5+C0YkLlQqYZVBJ9SeAFBTbjT1GAcPRsRoVEHcjGagb96
	XDugwPG5Q8kVtON7f9cHR4zAIdHHrDnXPtrKhz8=
X-Google-Smtp-Source: ABdhPJww6UI3VHujKsiD4GORINdaaD7sInRUTDtpI+wOKYOknAfrhPLfgU/Tcrezf+twApFr3bW/yO+tBPWuypHA/W0=
X-Received: by 2002:a25:c747:0:b0:64f:62fb:f55e with SMTP id
 w68-20020a25c747000000b0064f62fbf55emr13692906ybe.106.1653299558644; Mon, 23
 May 2022 02:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-1-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 11:52:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
Message-ID: <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
Subject: Re: [PATCH v1 00/19] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To: Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, gregkh <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, robert.hancock@calian.com, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Va+Eu4sG2sYMP+9Q+rsZxD4etakQwK4nIGbIGZkTlBNNpVpjOBI
 N1vNeqgHBQ9VTKzoRGTFpP0r/V7j4DQrU8pafN3K7h22CVDqAz+5i+FV+jEKdHgl4l6OrA/
 Tzd/e7kxyXmehSZucsQX/tCMW/hDPSrTfd/Y5eOPGHrZVjt6dDgPYf+zZb3vNR/CCkpq9ip
 MracprCkX4KDaMFoy5QZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lKho5CK5/ro=:o+bIiJyYtdDDWoyKZleNDN
 7uDUvEeEHmUqJxmThxAIkEbuu06njAeQ7ItH1dGtWQDQligDQv1UcTN6d3SFjP/5ZUUWWqxQg
 W+p+Nb3JaHASGR9+yUSlQiN5l9ChoxD6URKzdB2k4jTDSM2Wcu46jCUmf/rBJHG1k1mY4BCn1
 pjQwHypKIz0l1A0CGiojJLiKvSZYu6/HNd3c3VVz8k9JCm4RCLW9la5n27tiaAbhkIaxmHdKl
 Z3UNpbat6q6r2eYBD9mf86ibS6nvWkFtWXoD5jtavZVmWL8dP8X8RtxmzdYc43T7vEETNQ7yR
 OwRbA+wbrElDbPvx4wJ5tXynoD2CRy/dynJXSwzI64xSD7yA3BHHtTQfBNOoNESnZJzwkTa8U
 YlkV0JsnhedzDa2r65nOvlFDx81xDnftvBLJg3Bd6HIadilJCurQmQaB6+HrBsE0CyN2FrzRt
 2oPCzwbqEO1iMvhu5uNlK5O3d86bGL+XYNlILcY3hsDI3Zr0L6nOyzzK6e0CAPiIizbX00b7X
 ZHf5+RJ5gEMJsx+xj+kiB86XX5ROWrISGdkBWX1WCCIbMUwyyg67DbfphxVwxY84W9ndaDphG
 7cDb9cE54vla3lI8TXglW8r45p5ruVaVPBB/aLdd3TOsCqxhDESfg9Cqa9RBvaRx2RSwmKrik
 8uMRYo1tTsnNHodkGU1K9geoQuZaiBKVk2ZMqlOfP7YDuNjs+kMsxbN+lMIEcL79z/jFMk22U
 cMe6fW5s5UdJV8k2QqDg5jAeG4aiCa6aMNYXl/fjpUbMW1M+KjuPb8iKV/J8r43R7Pj6SLuQy
 9pmnVvEVEtZ9nGWdc9q0PRFggbFvOSeQ7mqrpSvKsgZrc/P9QWZoZK5C+8bZYol9hGeKYlP1N
 jWT7TnJXsJnKb1Fl/oP+ZdR1OXo0vIVcSritwSV88=

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patchset  adds initial support for the Nuvoton
> Arbel NPCM8XX Board Management controller (BMC) SoC family.
>
> The Nuvoton Arbel NPCM8XX SoC is a fourth-generation BMC.
> The NPCM8XX computing subsystem comprises a quadcore ARM
> Cortex A35 ARM-V8 architecture.
>
> This patchset adds minimal architecture and drivers such as:
> Clocksource, Clock, Reset, and WD.
>
> Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.

Thanks for your submission. Please note a few things about the process here:

- The merge window is currently open, which means a lo

Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.

This patchset was tested on the Arbel NPCM8XX evaluation board.

Tomer Maimon (19):
  dt-bindings: timer: npcm: Add npcm845 compatible string
  clocksource: timer-npcm7xx: Add NPCM845 timer support
  dt-bindings: serial: 8250: Add npcm845 compatible string
  tty: serial: 8250: Add NPCM845 UART support
  dt-bindings: watchdog: npcm: Add npcm845 compatible string
  watchdog: npcm_wdt: Add NPCM845 watchdog support
  dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
  clk: npcm8xx: add clock controller
  dt-bindings: reset: add syscon property
  reset: npcm: using syscon instead of device data
  dt-bindings: reset: npcm: Add support for NPCM8XX
  reset: npcm: Add NPCM8XX support
  dt-bindings: arm: npcm: Add maintainer
  dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
  dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
  arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
  arm64: dts: nuvoton: Add initial NPCM8XX device tree
  arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
  arm64: defconfig: Add Nuvoton NPCM family supportt of maintainers
  won't be reviewing your patches at the moment. It may be better to wait
  for the -rc1 to be out before sending out v2

- don't send your patches to soc@kernel.org unless you want me to pick
  them up into the soc tree and they have been reviewed already. The series
  is clearly still under review at the moment, and I expect it to go through
  a few revisions first.

- gmail marked your emails as possible spam for me. I don't know what
  happened here, but you may want to look into this to ensure that
  everybody receives it.

Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.

This patchset was tested on the Arbel NPCM8XX evaluation board.

Tomer Maimon (19):
  dt-bindings: timer: npcm: Add npcm845 compatible string
  clocksource: timer-npcm7xx: Add NPCM845 timer support
  dt-bindings: serial: 8250: Add npcm845 compatible string
  tty: serial: 8250: Add NPCM845 UART support
  dt-bindings: watchdog: npcm: Add npcm845 compatible string
  watchdog: npcm_wdt: Add NPCM845 watchdog support
  dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
  clk: npcm8xx: add clock controller
  dt-bindings: reset: add syscon property
  reset: npcm: using syscon instead of device data
  dt-bindings: reset: npcm: Add support for NPCM8XX
  reset: npcm: Add NPCM8XX support
  dt-bindings: arm: npcm: Add maintainer
  dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
  dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
  arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
  arm64: dts: nuvoton: Add initial NPCM8XX device tree
  arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
  arm64: defconfig: Add Nuvoton NPCM family support

- For an initial platform submission, I can merge the
  clk/clocksource/serial/reset drivers along with the platform if they
  have an Ack from the subsystem maintainers. I would normally
  not include the watchdog patch in this as it's not essential, but
  I suppose that it's fine if you only do a oneline change and it
  has an Ack. If you have other nonessential drivers that need changes,
  best submit them separately though.

         Arnd
