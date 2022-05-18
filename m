Return-Path: <SRS0=Wkif=V2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9F1C433F5
	for <soc@archiver.kernel.org>; Wed, 18 May 2022 14:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E991FC385AA; Wed, 18 May 2022 14:52:47 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D8D1C385A9
	for <soc@kernel.org>; Wed, 18 May 2022 14:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D8D1C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MjgfT-1nTa8F1BdL-00lER8 for <soc@kernel.org>; Wed, 18 May 2022 16:52:44
 +0200
Received: by mail-yb1-f174.google.com with SMTP id p139so4059184ybc.11
        for <soc@kernel.org>; Wed, 18 May 2022 07:52:44 -0700 (PDT)
X-Gm-Message-State: AOAM5338Pb59uTc1zaG2t+REZNL1THUNRJwhHVMG0isimV8yfuC9qb/c
	vl8TFl3UYnetx3/6VzV12RwN2LMQuBA87K6sE7k=
X-Google-Smtp-Source: ABdhPJxP7e/nEbt8Sasz1ATmrn7JsoRoyZGZHFy6NnNuI493m7yBWtmmAYkI1h0VyER/USaUS+yft+DAg0EBkOlvd/U=
X-Received: by 2002:a25:5e09:0:b0:64d:8543:627d with SMTP id
 s9-20020a255e09000000b0064d8543627dmr8502ybb.394.1652885563133; Wed, 18 May
 2022 07:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220518141542.531148-1-michael@walle.cc>
In-Reply-To: <20220518141542.531148-1-michael@walle.cc>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 May 2022 15:52:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a01B2uEP7=AkVBG5FYdfMHyReFP=120Ay3+s2EV9kO5Uw@mail.gmail.com>
Message-ID: <CAK8P3a01B2uEP7=AkVBG5FYdfMHyReFP=120Ay3+s2EV9kO5Uw@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: enable support for Kontron KSwitch D10
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zeZK6QCEjYKJSVmCzNVVmuw0SYhXZAEsbgjSI7TVH3/0+4yGZCs
 /Tq59Nmwtdfi8TiTyn7EHtcxqaW48Cq2m1WkbqN5YgTUdMshBjJmOcuZTqr5Dgqj/c2zMu2
 6jbZ/Bdxlspn0zgrHoYcEMKANHvn4G5Ojh2PYM4mUHN8GysSkTsMjMBj/Aao8twsxJNJWHa
 JWy13uYpkp5UMfOL7eBJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:miCUDY+0XUQ=:qB8b+VtGsC9+5WHyj0RZJ+
 7eeCg59AXDBUCGOCdfuppYUAxYI6BFukPwIASXCYLA/GrUDzMs2D4Hw9m/t3x1ro91twa/1+f
 1/tOl1t14aUC2rPMVlpPGC33fA3csnLETyklF7b7rtRf2XepiynYNSgpHl9/BlBA1SIOKm0HC
 nEFKJt42ZR9+PWNeUUZaz4rhgExyPc2QzJa8i6ZR8MvC4iWi/kJVNFrrKU58KuiLJmIC+q2G2
 XEvgVbFS8ywfGLJhzy1FDtnPw9gbGbzcUGCdq7MTQU3D2kUkt9r/Yxgq8q2G6uJavsDXIH+OZ
 xB8mbGtAsTIkq/i9i4uQpxhqU+TDgNiJsJHz6cWeA/CoD3DkesPswIVHEYQ+7LbQZLQCjmz5f
 Cd+HGS1oAZWWzZYbHBjvJXlxo5lMT1H/gy8OUXY+H+9UQQcQv2Oqz00cZJwoIzt/oyg30EzFG
 xYVvjoIJ4bEGj3q9gPlKlzZixrQOUwIkCmK1jAxfSGZX1C7Rgo6bATa3an5GirNgRqGBqXGwm
 iL54/6JHrMkLmB1A6P8hfWbAe0dlHZ96zDv/Yqyc/VHpgbkkEGI1Eojzt44J+5EC/E1TTZEer
 50AgXhXsjdFhbf90SSCUlhrWFK6lbHj/zgOv8WDF+ZkFqCq0ukJi8oo1KYPGSYUknptbhwhZ8
 pbuqC59QDaRaALOlA+KxM/v7OvPiVLOsKM9WM8LtT+VeJY4vJuA/0bC2n6lo1TCamsrXI1Por
 I0CFYw4XecBj0ypfNvD1rDMwdbeImtKXqGuDWEjEv3qLvEHxVO4Cl+sZkTKl9+Aaa2fhGU6Zr
 p6gykgi0u8QlVkLOQ9ZAwdGedEm7/NV4APqztuGgh4d0q1UGfPdnt2VBoK7a7v659E9F3widM
 5YViIjyQ61L/IY0N8ANnTFz/MUGXYyUbM6NXEF/ck=

On Wed, May 18, 2022 at 3:15 PM Michael Walle <michael@walle.cc> wrote:
>
> The Kontron KSwitch D10 is based on a Microchip LAN9668 SoC. It is a
> managed ethernet network switch with either 8 copper ports or 6 copper
> ports and 2 SFP cages.
>
> Enable all required kconfig symbols, either as module where possible or
> compiled-in where it is not possible.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> FWIW, there will be a board in our lab in KernelCI using this config.

The patch looks ok to me, but normally I'd expect it to go through the
platform maintainer tree unless there is a reason not to. Adding the at91
maintainers to Cc here.

It's also a bit late for 5.19, but if everyone agrees, I can add the patch
to the arm/late branch.

       Arnd
