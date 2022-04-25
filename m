Return-Path: <SRS0=Tx7w=VD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E762C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 11:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59502C385AD; Mon, 25 Apr 2022 11:55:57 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7EE18C385A7;
	Mon, 25 Apr 2022 11:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7EE18C385A7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5FxN-1nqtQq1lsT-01172y; Mon, 25 Apr 2022 13:55:53 +0200
Received: by mail-wr1-f43.google.com with SMTP id t6so17032974wra.4;
        Mon, 25 Apr 2022 04:55:53 -0700 (PDT)
X-Gm-Message-State: AOAM530tvox2KlvbS21kOOddCdCNOgZMzsn0n4GPU1wFIH3nw1RLSLle
	mZ/6IQZQIT6VmfdHwYj8u2YU6TFuVtSFwuC1W6c=
X-Google-Smtp-Source: ABdhPJy6G1KFbKHEzOAredhlniFlHgR99fdfjjNVGzWiR1NENqqdvyAlm9QrDNMIfUNAfKR7gKHmCTAe8oiy/GkxXHY=
X-Received: by 2002:a5d:6da5:0:b0:20a:8805:6988 with SMTP id
 u5-20020a5d6da5000000b0020a88056988mr13310843wrs.317.1650887753050; Mon, 25
 Apr 2022 04:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <Yk3nShkFzNJaI3/Z@robh.at.kernel.org> <YlVAy95eF/9b1nmu@orome> <c5fad2c0-598d-a90c-5272-398ce48399fe@nvidia.com>
In-Reply-To: <c5fad2c0-598d-a90c-5272-398ce48399fe@nvidia.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Apr 2022 13:55:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fyibqtkNMXDA6JXFWc2856B40C6oD8hBaieR8jTD-Ng@mail.gmail.com>
Message-ID: <CAK8P3a1fyibqtkNMXDA6JXFWc2856B40C6oD8hBaieR8jTD-Ng@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: dts: tegra: Fix boolean properties with values
To: Jon Hunter <jonathanh@nvidia.com>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/UXDsTW0W4xfhNRmU/KiyTAJu5AP2EKGU80+EI0edQ5kdGa511J
 hwqIifvjLaQCSUx3Dv99ps2KQmZJBPBz2qHurv39qe78baGg7IOffZ7iEycZ/zVSCexdfYp
 tJstq102zc4gxT0KMV8niD2iAN4Fk6mRInIeYpnv2qhitTxWR4fm47ItnI1jXOXEiEcplj2
 L0YfDfu/eJ0PhmJU/fsdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XEjKoFGkr5A=:x61pR72G7pBijy3wBWRz2p
 WSHJzuvfTGhvtPoW3lessAYJd9k2jdXlDYukdl9MS4moJCld1W1Y7sfeBucd1Dhh/EuJQNnBu
 tRYuzSzmf6a4CM1EdzhLKITnpSUgRtwNFsag/RfM5Ke4scySfHDYLJSIXscj3IxWhuMzmZ/QO
 uU5sTFf3FnvI22EX7bVUuhttUCvDCufcmatRIjC1psKpdSOwCGH1N8OjSOKhpmhrP7DbbD6f8
 T5PlCxlnup2wMV1xVSFnlNC557+3JwNTSNmpEe8kKmcpcSRobyUb+0d25J1mY9g/sbFVLTKGE
 RDf8acfwlxpRD/VwQFmfiu9LdMyXYljU/bacyQyw/haEPwPnXv1wgyzXAm7FJ7tfPNrmzeo7O
 RljG61RZTAsxJoGGxaPiApl/TIcWLijkBT41YF66uvozgP7w1K5aApaMF0QXMZKiwkH+ej9Ny
 2pkukYcJVDZdUm9wSkXH0eZ06DIOoFVm/WV5mpJrerIWtn5qzVraueF5MbAxC1dzH/iR1xdmd
 kStJ+W7IBQOm0vEQ4Dapfk4rYtQWDzTyv/a/ZX7bodLstbmh3dUU18bcgsili8gfXteuz97na
 ARSnRK8EBY8llRSLbz5ruvzjeC+A0gFGysvVb6Y+9Wo3COJyLydK4YX/MqDQp6wi7clCUxW5o
 2fCmliU0Ko95+/dX9Neyw1YQ1zBjUVIj2Yy38j8U6UOA1kTnH85XPg+cECEFg54owDYU=

On Mon, Apr 25, 2022 at 1:20 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> On 12/04/2022 10:05, Thierry Reding wrote:
> > On Wed, Apr 06, 2022 at 02:17:30PM -0500, Rob Herring wrote:
> >> Boolean properties in DT are present or not present and don't take a value.
> >> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> >> matter.
> >>
> >> It may have been intended that 0 values are false, but there is no change
> >> in behavior with this patch.
> >>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >> Can someone apply this for 5.18.
> >>
> >>   arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi            | 8 ++++----
> >>   .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    | 8 ++++----
> >>   arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi            | 6 +++---
> >>   arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi            | 6 +++---
> >>   arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi            | 6 +++---
> >>   arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi            | 8 ++++----
> >>   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts        | 8 ++++----
> >>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts             | 4 ++--
> >>   8 files changed, 27 insertions(+), 27 deletions(-)
> >
> > This causes multiple regressions on Tegra boards. The reason for this is
> > that these properties are not in fact boolean, despite what the DT
> > bindings say. If you look at the code that handles these, you'll notice
> > that they are single-cell properties, typically with <0> and <1> values.
> > What may have led to the conclusion that these are boolean is that there
> > is also a special case where these can be left out, but the meaning of
> > that is not the "false" (<0>) value. Instead, leaving these out means
> > that the values should be left at whatever is currently in the register.
> >
> > See pinconf_generic_parse_dt_config() and parse_dt_cfg() specifically in
> > drivers/pinctrl/pinconf-generic.c.
> >
> > Arnd, can you please revert this so that these boards can be unbroken?
>
>
> Arnd, any feedback on this? A lot of Tegra boards are still not booting
> with v5.18-rc4.

I have reverted this commit now, sorry for missing the earlier report.
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=arm/fixes

> > Adding Bjorn for MSM, the Nuvoton and STM32 folks.

I'll wait for the others to reply, but I do agree that these are likely broken
as well. Could one of you propose a patch to make the binding
describe what the kernel code actually expects here?

       Arnd
