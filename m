Return-Path: <SRS0=pgBt=VF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0141C433EF
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 18:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91241C385AA; Wed, 27 Apr 2022 18:12:53 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1853EC385A9;
	Wed, 27 Apr 2022 18:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1853EC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f179.google.com ([209.85.219.179]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvryJ-1o2fmo3gHP-00ssCD; Wed, 27 Apr 2022 20:12:50 +0200
Received: by mail-yb1-f179.google.com with SMTP id y76so4900890ybe.1;
        Wed, 27 Apr 2022 11:12:49 -0700 (PDT)
X-Gm-Message-State: AOAM530SzA3j8y4ZCScR+UMT490y89qq2e1pYtS+grCmgKOBgR/lApcJ
	WlOzS1pf8q9qmo00q+nl+i45vBpHoEB+c/ubbd8=
X-Google-Smtp-Source: ABdhPJyvIQ6D3x49OiNKnaLLSiVJHsuCNnQ3wyi9FtzBNbA80wvadvDkfUVYkIpT7NF74EwdQ21G9vqZ8d9sa8bTn1k=
X-Received: by 2002:a25:75c5:0:b0:648:dccd:e1c with SMTP id
 q188-20020a2575c5000000b00648dccd0e1cmr3057440ybc.452.1651083168625; Wed, 27
 Apr 2022 11:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220427162123.110458-1-maukka@ext.kapsi.fi> <20220427162123.110458-2-maukka@ext.kapsi.fi>
In-Reply-To: <20220427162123.110458-2-maukka@ext.kapsi.fi>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Apr 2022 20:12:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2renoWK+rUYBAyUb10v-TKfv6gLTQUiGFRroFgLCv+9w@mail.gmail.com>
Message-ID: <CAK8P3a2renoWK+rUYBAyUb10v-TKfv6gLTQUiGFRroFgLCv+9w@mail.gmail.com>
Subject: Re: [RFC RFT PATCH v1 1/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:aOlRDY7lD82X+PQ8WlhrwX//LhBoJaZcpzDx7kWU91f7mZZS76/
 Jm5Z/WdNULOaRMcR75yRcR8P5EElsfi3dZasK8qoV3jBwZDY2wARaXE63bYwiX9/hy2qsi/
 cBRdeu38cnsyL+BocndhDRBxzN/GC11fJDvcl+2l6D8wu63WR1mhMppee8cxrX6Fliyms7h
 6P7/Fuf8Gpgq/+w+80kQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hQvVtI8KZ+0=:PYeHXLbKmUvTgzRj7z3NSF
 oAsCXsnXi4j4Dih9qqduHl7RQYbPUkGtm3ir7femajU7ZmiFNkAXwjnRrRgwEeE0bFV7mHheK
 ucwyWw+VmNhQT270s9Jmqq74CeQPuFoaIHGrDLO0BRGK4jtFluc9gvZWJF6vZmiTzv4yadw3Q
 fpSDKMkqCJwQV257AGpd941ObJ0Epvgx2z3KShHLxnRJoo6cvKbb94DAyjNedo8kbS76/aMJ0
 UHx9+UIL2H6RoJtcfU70gv45YV6rIhD9gikOQpDin5ksjXru0xaMZzuj515paWwS0vdfg1t3e
 4IUtI0ci1o4Ph6ntt40LUF9F2k0Vs5gGcaxVq3a5NVEI0fkH6AuGoIMXH8ifqUqsN0y61n1Uh
 +sp4c4i/d2FCE/jNh8EKWL04Kpw+mJ6cA35SNz/hNS0Cer1MVBrLgyUxf6P4pz+Stid+LVMoa
 +/vmu4g5QMTZ6rNJnImcSe4xTYfoEd+QV2IzHw7H6eV3Q8Kwm+cU5laBXdeUEftLYa0Ia+O9Q
 mh4//u4d3Br2dHd1v5gPXgQ1BQ+XYhRtsWNsLWh4+S0TVdB2LqzB9a+9uOXsOzH2kexfNSsSW
 qH1o1YfJpSN9CLHY30uHKItp2vJn37kP6bOjixFVtXxJ1POsWC87R3AU+kcjSK4l+cynKzWtg
 MTJL/TFk7uorjA6Rzy/JPgTie9klq4wwBWcSTzrTEpOPf7tEG404lr1XqpcVRWUaUhY8PmA85
 ATjl4DUi8i3O5BaDfn2uA4MVeLi1Gx3iH+RpmwKAGaVQ/wziqNHymVK+rCb1LE/2UTeRYz1rE
 K6RZWf65sVv5qt2TiF3Yw+UdFPyM6Js5wWWaCdnCSvvsUDPZW4=

On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> Convert D-Link DNS-323 to use the device tree and remove associated
> mach file.
>
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> ---
>  arch/arm/boot/dts/Makefile                   |   3 +
>  arch/arm/boot/dts/orion5x-dlink-dns323.dtsi  | 217 ++++++
>  arch/arm/boot/dts/orion5x-dlink-dns323a1.dts |  59 ++
>  arch/arm/boot/dts/orion5x-dlink-dns323b1.dts |  38 +
>  arch/arm/boot/dts/orion5x-dlink-dns323c1.dts |  80 ++
>  arch/arm/mach-orion5x/Kconfig                |   6 +-
>  arch/arm/mach-orion5x/Makefile               |   2 +-
>  arch/arm/mach-orion5x/board-dns323.c         | 118 +++
>  arch/arm/mach-orion5x/board-dt.c             |   3 +
>  arch/arm/mach-orion5x/common.h               |   6 +
>  arch/arm/mach-orion5x/dns323-setup.c         | 724 -------------------
>  11 files changed, 528 insertions(+), 728 deletions(-)
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
>  create mode 100644 arch/arm/mach-orion5x/board-dns323.c
>  delete mode 100644 arch/arm/mach-orion5x/dns323-setup.c

Having the combined patch is generally fine for review, but for actually
merging it, I would prefer splitting the new DT from the code removal,
as I send these through different trees to Linus.

       Arnd
