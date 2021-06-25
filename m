Return-Path: <SRS0=40We=LT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88A0C2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 10:06:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B37806142D; Fri, 25 Jun 2021 10:06:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C93661428;
	Fri, 25 Jun 2021 10:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C93661428
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3UdI-1lxGsp2BWc-000a0P; Fri, 25 Jun 2021 12:01:33 +0200
Received: by mail-wm1-f51.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so5445624wml.5;
        Fri, 25 Jun 2021 03:01:33 -0700 (PDT)
X-Gm-Message-State: AOAM530JyBiE2+/Hm6b6Iw5NHHW+/iv9K6mpq76tCVpPH/zK1DrwUQex
	g0M+X3wGsGGvmZ1IqLBtEFo0n4JRhXuih9NfJBo=
X-Google-Smtp-Source: ABdhPJyRRakIybOAARLEqgqFsAKTsqLCItavkxySt7puA/r0GJ3aVYwMKoJP0QL2cw8hz9fbIr1BZHd9ZDHu2XJ9KFw=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr9700348wmb.142.1624615293093;
 Fri, 25 Jun 2021 03:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210625095000.3358973-1-mnhagan88@gmail.com> <20210625095000.3358973-3-mnhagan88@gmail.com>
In-Reply-To: <20210625095000.3358973-3-mnhagan88@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Jun 2021 11:59:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
Message-ID: <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yW2snx5bOja0VQGVl8H9C/sFNV2Vq+JLwVs8vJ5TuEtpGlaRGcv
 WL+UGMnJJhfzQzmwfo2Yw+2Avoq3QZOG7R0iYLr4vKbwUW5+6U6dO8yIArw1qBiDEbAKoxs
 mztwMVwB1qNGKYtlJ26wc1433nK/tS6pDiykWIVIJIyNrTYEgt1XaVy3iqMo/4rrZTVNJkb
 Z7TDCVtJhoftpjGt0dAYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9xV0aG1T7qo=:CnMDd9B3CIIJ2B5DwsL01r
 atCD5erkc7bkts9M3ghRHsVEbaWKS/MVhi+uWgQNeb/Ij6/E0RFZ5Bp10e3X3yPfm1CzG5+GM
 zYJLNOJ8YF2hQAQOimZx7dUCUgnhZFY2+GJVoERpjGekQCxsc9I4tD0lM6OXYIwphxWdV5prK
 S8FfEAY+FgIIxh6RXWsV5wJf/6aZobCtt9Zs+r0D5k0e/jAXubRIpEVtAsQXvONGQ0/eA4rOW
 9IZFNNCQBskkHV6Mw0/iCLzAE3qkkH/sJKF26SqeezfaFOCw7LC9pDUuT5XboYvbEz1OPk7DE
 6Gt98jYMOD1epekfROhgxNu98vuGxvdEf9tIsshhEuKUEkHyclAj1rWiBSv9Jk8iR9Pu4PcEF
 So9chTbpkHt3IeqNjaNtyN2GCmVQ8LNBPJpM2lz1+PX4BxMQ850WNqtlGCEjvmLHuM2UqJcXi
 yASCEfZBGrKqED0B+fg8OcE+qUTdBtCRzQLmw3luHTWuDQva6NNXwSiA7aBic+oZ/m5LMHVRn
 pg7LdO5i7LVNUnS58ycuLg1IEQigpWmuwXKGfFs4NEosZbklA5oRut/6V0S4tP0pMTNutjU2d
 hvANFiWJTaMKcVBjiReCdVI+ztjQlqsZGhj8eyn9Jpva7jrV/gTW29ulqlYvt/h2XR4dcBiIa
 +OFE=
Message-ID: <20210625095908.CWJ0OesJzJZ2FNtq6uzl_OoTUFA8MM3bSOQNVhEnu0U@z>

On Fri, Jun 25, 2021 at 11:52 AM Matthew Hagan <mnhagan88@gmail.com> wrote:
>
> MX64 & MX64W Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>   - USB: 1x USB2.0
>   - Serial: Internal header
>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
>
> This patch adds the Meraki MX64 series-specific bindings. Since some
> devices make use of the older A0 SoC, changes need to be made to
> accommodate this case, including removal of coherency options and
> modification to the secondary-boot-reg.
>
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>

Removing the dma-coherent flags in the dts file seemed really odd until
I read the text above. It would seem more logical to me to have a .dtsi file
that has all the a0 revision specific changes, and include that from the
dts file.

On the other hand, the /chosen, /aliases and  /memory nodes that you have
in the .dtsi file should probably get moved into the .dts files, as these tend
to be board specific settings, even if the examples you have are all
the same.

       Arnd
