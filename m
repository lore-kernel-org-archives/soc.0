Return-Path: <SRS0=XHAu=M3=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D995C4320A
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 14:02:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1175A61002; Wed,  4 Aug 2021 14:02:45 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D39060F14;
	Wed,  4 Aug 2021 14:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D39060F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4s91-1mC6IH3fMd-0020Sy; Wed, 04 Aug 2021 16:02:42 +0200
Received: by mail-wr1-f49.google.com with SMTP id h14so2370735wrx.10;
        Wed, 04 Aug 2021 07:02:42 -0700 (PDT)
X-Gm-Message-State: AOAM533Vn7v76nyQaf+RzQFo3gTlyP+A8ofjhCo4+nTIuX8ZZyDtRo4Z
	2crPNp2QRfOc5qUHt3C8m50Aig+zMBIvTUjp8Jc=
X-Google-Smtp-Source: ABdhPJyUUeOCz/Sk2BVN80rO0xJi/O5dl+Q4BFErr7/7beTnL2rPo8aHa2QbQNXmTdgzOQJLehXZ+Akx9LGpcakr4fU=
X-Received: by 2002:adf:e107:: with SMTP id t7mr29024487wrz.165.1628085762592;
 Wed, 04 Aug 2021 07:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210804084631.12934-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210804084631.12934-1-nicolas.ferre@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 16:02:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
Message-ID: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.15
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IsSFj+dwFxg6VjuW410NY+rpTOK4A9KaVflnDpOolXkvcjGpjKz
 JhxGmBaTCbZZ29cyjn6TfSgtK/Z/L8TWjEasaknkoMJsAhitNEd2Kq+Ki4nYrORQ+xwJgEX
 OXw+wRuazjjKfLNxmlSxE6GLxczOcjpdRlicQE3HAOFfbZhLOjKASzlXyjTfe0nX1Kc9c95
 fvIJ/wmCluazg1APVtUiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jwwMC8l6C0U=:264wmcLgBFKDWGhiY95CZi
 LQPI8wW+MD9NKpGuO0OPcdzfnHn6ByraH25V9+txKViqqOWNMN6s6zryaXi7cdOLYx7Yjy886
 sCrqN/66IU/d0kVNc2zeBxVbPgLi18YWGKWtwIqi7KNRIp+JPE/QIVG2jCmIJc3KfJmGb0v3b
 NgINXXfX+WwdhwfHAjSG++QH5JKCSEd+YScUOCdWmpjwAbq6DVkMCCP2Lmc2swDFTdP6JnD1f
 X6C/je0gmnTywYjS4Z5if7wBACR5FqjLb2iavlHBkUUcfuI8DVBHrNPduKZWcswS5JjQJC043
 cuZ6hxSFNHBvCfRLwkhdO34AZAiZ00+bsp9kUtcJcGS3le7yoWMAFJr+NooXwxhtYqR4B6e83
 kft/cEn0MwsBjqFrCEt7IHYro7Nhy7IciD7bAgIe231g2zC23Oxut3I4Gt8guIYR/8jEWxfpG
 zB8btvYi31gXETFRYSXf0/oDdn3pZ11/M5nbfuDdM4/QEj0/z7fmXxkITi7uD6Kp4Ju6T6EMi
 XmiMEEXlgdq6woETpRCtQ0nTft9rrUqGD5bLiMObvqJ18f48BoSCztD/ZLjBvGmM5otJrPmrA
 SaVGytu4vpoHESeg1HZWvMwiI1SFF0Ht3P0zqxAaZ+TNdpviHYBfph1LuFVeR87zgdTFg0GKy
 UbvwH2k42EoyCdhsexR2yJ4Ow9jPLN1clDcHiA0MtIsHZxArivJl49TcHmkJpwR6TO6kqB/0N
 hkB8aiD0wpPF74d/f2uePLgH2e/RJ6PxCzSBbDjgy7F7W8bqK7bR1MyHpWqOX1pL4FebEKdyI
 VCIMi0C+/rVzV5m/IC2Bafqa1WtPThTOqy4ZoVmSE7MSieszYQoCpMA3Ri78ilP63ORECgKXg
 KREbfW0FYkh0mAjqaaE70QIW6kmIBagbTVbSj+UNbcjm+o2FvVjarpTV3IFnvsErDtmuV78Ih
 kHRGKkOKrBx2Tk0KN2hoyL9Ey/dgNt0Wcf6+rOJc0r312bi5NcG0o

On Wed, Aug 4, 2021 at 10:46 AM <nicolas.ferre@microchip.com> wrote:
> AT91 defconfig for 5.15:
>
> - add defconfig entries for new SoC: SAMA7G5
>   - dedicated sama7_defconfig to match the needed peripherals and
>     dependencies

I feel this needs  better description in the changelog: Why do you need another
defconfig file in addition to the existing sama5_defconfig? Are they so
different that a single config is not a good fit for both?

      Arnd
