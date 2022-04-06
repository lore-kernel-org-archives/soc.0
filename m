Return-Path: <SRS0=FI0R=UQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E91C433FE
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 09:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FC74C385A3; Wed,  6 Apr 2022 09:41:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FE13C385A5;
	Wed,  6 Apr 2022 09:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FE13C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXGak-1nUoV81dC2-00Yg7l; Wed, 06 Apr 2022 11:41:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso1237716wmz.4;
        Wed, 06 Apr 2022 02:41:00 -0700 (PDT)
X-Gm-Message-State: AOAM532tQQd9biHOShY1pHK4eljlWSMTS/u+fUps3gGDxKD/aPBBSVCn
	cBnNjjUawaYaTJcovplXAM/i3/sbw9b6A9iy8YY=
X-Google-Smtp-Source: ABdhPJzxUZX+E7XCtlp8CuL3coz4kajfPoqdCKk/EJtWFQ5dur8RDTboYWVRRTfTH1oiwHkEqf8zaBfFzz/1pPZluso=
X-Received: by 2002:a05:600c:4ecc:b0:38e:354d:909 with SMTP id
 g12-20020a05600c4ecc00b0038e354d0909mr6846810wmq.33.1649238060031; Wed, 06
 Apr 2022 02:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220307091923.9909-1-ychuang3@nuvoton.com> <20220307091923.9909-4-ychuang3@nuvoton.com>
 <2669852c-5bb6-1edf-bf58-ea815f54d50f@kernel.org> <ef8efda1-e985-0684-470f-7acf9b8a5e93@nuvoton.com>
 <bba99b9d-6960-f6e8-0ee4-0b5fe8a5601d@linaro.org> <ab89589f-6dd7-d4ff-635d-ff8dbd2d3e02@nuvoton.com>
In-Reply-To: <ab89589f-6dd7-d4ff-635d-ff8dbd2d3e02@nuvoton.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Apr 2022 11:40:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a034bvYcD81h-jo92PbQwDDapa8JvS140fsBhaP7qrFXw@mail.gmail.com>
Message-ID: <CAK8P3a034bvYcD81h-jo92PbQwDDapa8JvS140fsBhaP7qrFXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iyPsplyygbMRtF/eZuuHq1bMJigRqupkgL2EnmD2Gy3dpHbXVi5
 EhTwpY+jzBnF2SY3DYiATJe/HrcpFQhJupQiTqNuV9VHBqcSRkTDk/EWl9UHZGeSoFSyWFK
 pSIV5mc7fx13MQateSAZHZx04g2BGfOVy7eSebEU2J+q/yr5k0Yy8pefGVH/VdvV3AEhtO2
 ICMoxH1OCplQVrpNeqQ0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2rn91rypskQ=:7UrfUAKTiexK1FvUEpMEBU
 S6gmpzi7bPNlzmAJmSnWVwylRqa3TNPbFSPPL1ImMh/HXcp4VPl8rUzcZ0lZ3/w2s9Ko7rJ8h
 RI9u/M1v7piRLTyWinsYEV1cCjwwQN49e+BOQScWaHwXkYYpqVOzqHJhuX3+tEZAx+db/U9Sh
 v0QJSDLGzUYIHa433kf4C5l3cls5JE2A7lta5SbLKxbutbTaqBxVrgXBV8gyR+CwgXSEuIJNl
 o8u9A0sYkb4w7GXHOzHGBXyPPNCmS2RCdR2GbnS7b0ziwIVxejnRcgVKeVIHpEzAkC+yiKFUh
 NDPpC+Dd01XKbfbKXSHJQS+DMo3TL8kzFc6JQ7YNBAUDrFBpJ+IsGQJ1Hkidpyt9op+P7c3bL
 FXx2yfW5RaRERkl9lP1jbZGbAOl81pGnpCU9l3Y+jNg9ksnVwd6UQdGzHcpqFU1gba23XNijt
 mURedHAKC570vLBZrNZgteS2ejA2hSBgAo7E6QnlzAJA4ZNTviokafuVXnFOB15o2DoCww2h8
 c6+zBFWS7WuYGqMjY1Pp6S2+xi6pbgqE00zuU8zznthEQbMTm+5whT80wYbrPWMRLsWz6QYUL
 ba8mXQRKP42GtvVv3mmDrWiG526oNaeBieHztopoJmV17lZkq/dRjqwb0f8A1jX0DjxM3HILv
 ZpveMEBWH5uRuAEeJxF9fzB7aq9I+c4KQk203g9GHbGSqCK8mZ3gI8ZmRYpPYisj/Zf0=

On Wed, Apr 6, 2022 at 11:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
> On 2022/4/6 =E4=B8=8B=E5=8D=88 03:14, Krzysztof Kozlowski wrote:
> > On 06/04/2022 04:58, Jacky Huang wrote:
> >> config ARCH_MA35D1
> >>       bool "Nuvoton MA35D1 SOC Family"
> > We do not add options for specific SoCs, but for entire families, so
> > ARCH_NUVOTON is correct.
>
> Yes, I would like to modify it as the following:
>
> config ARCH_NUVOTON
>      bool "Nuvoton SoC Family"
>      select PINCTRL
>      select PINCTRL_MA35D1
>      select PM
>      select GPIOLIB
>      select SOC_BUS
>      help
>        This enables support for Nuvoton MA35D1 ARMv8 SoC.
>
> (Currently, we have MA35D1 only in the support list for arm64 SoC.).

You could reword this to "This enables support for Nuvoton ARMv8 SoCs
such as the MA35D1", to prevent this from getting stale, or repeatedly
updated when future SoCs are added.

Another change you can consider is to remove the 'select PINCTRL_MA35D1'
here and instead change the pinctrl Kconfig entry to

config PINCTRL_MA35D1
           bool "..."
           depends on ARCH_NUVOTON || COMPILE_TEST
           default ARCH_NUVOTON

That way you get it default-enabled when ARCH_NUVOTON is
turned on, or disabled in configurations without ARCH_NUVOTON,
but can make a more fine-grained selection for a particular SoC
if you get more than one such driver in the future.

        Arnd
