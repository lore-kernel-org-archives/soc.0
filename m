Return-Path: <SRS0=iQxS=RF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD7C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A0FCC36AEB; Mon, 20 Dec 2021 15:27:57 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4488C36AE7;
	Mon, 20 Dec 2021 15:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4488C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5lvf-1mOgPi32CZ-017GNH; Mon, 20 Dec 2021 16:27:53 +0100
Received: by mail-wm1-f45.google.com with SMTP id a203-20020a1c7fd4000000b003457874263aso7606038wmd.2;
        Mon, 20 Dec 2021 07:27:53 -0800 (PST)
X-Gm-Message-State: AOAM532TytsK3lbgdjgqQgLCmiPLJ5yk+BTBqn1ugoZZb6MFZDAUT522
	9uC+ROs4KW6qrhkCcsPgwa38/FE9S1sF8g9mimo=
X-Google-Smtp-Source: ABdhPJwcwOobEoLcg19twwbzlytK2IfVNFN+eE1j0Rgj8askqzd9F9mG9seAa7XGnAqbDUH0VwfAeXPvWcdVn44rEcg=
X-Received: by 2002:a7b:c448:: with SMTP id l8mr21138198wmi.173.1640014073329;
 Mon, 20 Dec 2021 07:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20211217172806.10023-1-vigneshr@ti.com>
In-Reply-To: <20211217172806.10023-1-vigneshr@ti.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2021 16:27:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
Message-ID: <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC <soc@kernel.org>, 
	arm-soc <arm@kernel.org>, Tero Kristo <kristo@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h5+mjeEW95cBE8bP7avJmTk1oZkJhVcOVxSc+SzgDVVlnofWGCH
 HvVR0NcEvS3hoYOv0cW29lIYQUhPibNxHW2FEXTSmENhmtvEtHyx5eBOEufISp5mcr62GUc
 0+ctAP4JdEyAwGUu1LT7ERafVuVLQqGSagh+t+RuL02S+HvlI9/vlOA4W4ahs0ES6UGj0qy
 nVd7pn8Bz4GeiV7JW5CCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9eMSi3yUHBU=:zHpLhQw0DANFB6bn1iEzS3
 HXHCuV3fDiLZA6/7jflNughL7vO1l9dhjsNdWYl6T8beb8L+nCz94vQPcb/5fVb1mahBT0tOk
 zoA2/R7nLMdPZUKlSvRwQT1MOA8YtHSN7RcN/41UAEVDcFEGPk4NntzH3wBjNTEQFHthYu0u5
 l5fQoqOZwKofdHOgVsLPzd4+s3grbVzbYcaePqOphtJfUt1cacls6y8WHBpNhn2L8jk+ApHLL
 VldkfXCtKO9yyjVsDOydKPgLyZoCgGt8jnUhN+0nHyCZlx8gxsxlUvWFlSJog28BgM+a7CjFM
 uTYFO3ORmoaKefR/ZoD5xJVhOHNX63YcIHeW0ohg2eNkok4YJUcmNmoQfoOTP0pG79aEPYDWo
 Sdf15MNiUeDR4aDAzkoXSU0OPJuGcCs10cnnuj0qFzmUiZE4x6d6fFTRfIH6UxwJDOIKhmp9D
 N3Q9t23kFSVCxOcEvU/ZXgbZZEMQvG9efEWc0xE6XD9Pp0tq227psZTGi4di4CAV+GJ8jLhO9
 lPRYN80aGYjjTbgKnI/atRL43ntDsvNI5kFRCPhamrFKrKeKxM5/hbFtY9d7TtqcXTMFEiMfb
 Wf/GdFecx8iGkWoakiIs+ctMwlPSv70sRC4qiSAJbhdOcDk4pfrlaEKthrPRIY99wCNCigoQf
 u39/cqNV72jOblbbf2wiFCj+PJZBEd3MORQ1eOUxUWGQYFqONUDEvysfc9EU8t7bqHjI=

On Fri, Dec 17, 2021 at 6:28 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v5.17
>
> for you to fetch changes up to 8d73aedca28cbed8030067b0d9423a0694139b9c:
>
>   arm64: defconfig: Enable USB, PCIe and SERDES drivers for TI K3 SoC (2021-12-14 16:22:25 +0530)
>
> ----------------------------------------------------------------
> ARM64 defconfig changes for TI K3 platforms for v5.17 merge window:
>
> - Increase No. of 8250 UARTs supported in System to 16 for J721s2

This looks a little excessive, I'm holding off on this pull request
for now, as I'm
not sure exactly what the downsides are.

I see that your dtsi file has

+       aliases {
+               serial0 = &wkup_uart0;
+               serial1 = &mcu_uart0;
+               serial2 = &main_uart0;
+               serial3 = &main_uart1;
+               serial4 = &main_uart2;
+               serial5 = &main_uart3;
+               serial6 = &main_uart4;
+               serial7 = &main_uart5;
+               serial8 = &main_uart6;
+               serial9 = &main_uart7;
+               serial10 = &main_uart8;
+               serial11 = &main_uart9;
+               mmc0 = &main_sdhci0;
+               mmc1 = &main_sdhci1;
+               can0 = &main_mcan16;
+               can1 = &mcu_mcan0;
+               can2 = &mcu_mcan1;
+               can3 = &main_mcan3;
+               can4 = &main_mcan5;
+       };

which I think is the underlying problem here. The aliases are really meant to
be board specific, and I would assume that none of the boards actually
uses all the
uart and can bus devices, usually this isn't even possible due to pinctrl
constraints, so please follow up by moving these to the .dts files listing only
the actually used devices instead of working around it in the defconfig.

> - Enable USB, PCIe and SERDES drivers on TI K3 SoC

I see the PCIe driver is built-in here. Is that necessary for booting?
If not, please
make it a loadable module.

       Arnd
