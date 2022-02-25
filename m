Return-Path: <SRS0=2Acm=TI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD17C4332F
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 14:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 862DEC340F0; Fri, 25 Feb 2022 14:57:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF859C340F2
	for <soc@kernel.org>; Fri, 25 Feb 2022 14:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF859C340F2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4bd0-1nPFvK3Zpu-001moJ for <soc@kernel.org>; Fri, 25 Feb 2022 15:57:04
 +0100
Received: by mail-wr1-f51.google.com with SMTP id d28so4937306wra.4
        for <soc@kernel.org>; Fri, 25 Feb 2022 06:57:04 -0800 (PST)
X-Gm-Message-State: AOAM532guonn2BVrOSSPhTaj/60WfzS5REsO65ho0IQz4GasEXf8vaTt
	Wxv1ewt92yrLe85T78Ks1TF1Ocxgu+HLJ6Xm0/A=
X-Google-Smtp-Source: ABdhPJxs/UBnuO14LHbRouIs21YkqnbZNCCxHjPVMtCICEgTlGkU6axtUINGNfvp5WkcqXNuhm8URJhevkoTEnCviq8=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr6413403wrr.192.1645801024500; Fri, 25
 Feb 2022 06:57:04 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
In-Reply-To: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 15:56:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
Message-ID: <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.18
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RSRnvGChArJDtbNyvULk6IApcQg3qpY0EJ78C6tA8Z6xOamP0Jv
 bcbgTmbg4BvmE5r/97mL1YI9O/cCUr5ZGPMeg9lIE8pYlOE68r+n0q6jCsSfGHYJ6PDeIAA
 H/oI+LySMYNyjpfvqsRB1xC18GlyrWCwGH3or/lGe0TGuXkOX28X0cdPlzOyns1vUmBof6v
 UFStz1vBktvh1dyOz7UBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Sz/gd7gQhA=:z9SoSDU/gCIzuhHZu1v7dL
 qaOcmPm0AfbwqLld1LiVOfuL5PYdiiU2C+D5N1iPzIl4rnAbv3VtbyHtkT8uDSgocRQ3nNY1z
 HHHmJwNABXOQrUCa42HNe70CWJ9aqpGY2gZEiM05XJXeyK88KgpiJbK+6kagubZwzir1c2gzg
 9jbuiHPDN4+CU4Zotri7ONn78hlfcdLf4ffJmNCoKiiJyKh5UZSvEXCF5lWKhcAjC5quOi/YF
 89RlO33MVswZ7D5dzujOQqHrW8B3J99pqUGNPHOnpyDI2qLuG1mEULt3nf1M4jQCXQ98zLdKo
 ZDUw/Iij5CI7ENjllYq3ij4LeKbrJ5gczlZqJX3pfdjkXAtAPklZ6btQY8as1OF+ag3MB9BEj
 mXnk8OrvheTjxNwS5jZlbsPjSD7Jdd/8S9L+ttRr7D7qdZH9v3HDDAYC36dZiRxdHRSf9Lb/5
 dp1x/hlto/a61HDFLt6YC0bjBHotWWHJizO32jR90Tz7KcEpSCngIqUSfg7/jfiJThnJXyj/D
 lkjB0MRc3tlMCmGfxEiMmz1X956QgAeXbZ4IoqdXp9rKO3BIPVm4Bt/jFIuXy/A9Ghg8RXxV5
 jK5AX4xQI0iMObIwthZ7VVcyekOV+eJxx2rNzaRMUyhZ84ial8XYC7VT3D1e/PLdPGWNhHZKw
 2RrU4NBLs46sFp2oX46xXuUl1XLq+c4Jfibc1iGCFXjDgVLF2Rh9NXrLtHRBcEG5d3Hvtti/I
 d+dtcU4McKJzCkXwhG5J2TO3o4WTcCp1cuWTc7M4QH0Ef0mr8lk1leBGlJygWa8ke8zEJszxE
 xZbM7z4Kn84Bul8kuM45nw+c6yPk1gU1SsayRRvsp9GXYMfbF8=

On Mon, Feb 21, 2022 at 9:57 AM Joel Stanley <joel@jms.id.au> wrote:
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.18
>
>  - New machines
>
>   * Quanta S6Q AST2600 BMC
>   * Facebook's Bletchley is not new, but has a large update
>
>  - Small clenaups and additions for Everest, Rainier and Tacoma, and the
>    flash layout
>
> ----------------------------------------------------------------
> Jonathan Neusch=C3=A4fer (8):
>       dt-bindings: arm/npcm: Add binding for global control registers (GC=
R)
>       MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM archit=
ecture
>       ARM: dts: wpcm450: Add global control registers (GCR) node
>       ARM: dts: wpcm450: Add pinctrl and GPIO nodes
>       ARM: dts: wpcm450: Add pin functions
>       ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
>       ARM: dts: wpcm450: Add pinmux information to UART0
>       MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki

It looks like you tagged the wrong branch, these are the same contents
as in the nuvoton branch, but the description is for aspeed.

I assume you have the correct branch somewhere local, so please resend
the fixed pull request

       Arnd
