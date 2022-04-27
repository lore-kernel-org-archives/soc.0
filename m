Return-Path: <SRS0=pgBt=VF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA2C433EF
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 18:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CC25C385A7; Wed, 27 Apr 2022 18:11:05 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEB52C385AA;
	Wed, 27 Apr 2022 18:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEB52C385AA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDyoU-1nc6c51cyC-009wn5; Wed, 27 Apr 2022 20:11:01 +0200
Received: by mail-yb1-f178.google.com with SMTP id v59so4814687ybi.12;
        Wed, 27 Apr 2022 11:11:01 -0700 (PDT)
X-Gm-Message-State: AOAM533HDS4fh7HMVpkTWjveokg6GUljSrn13CDu4Bv7zYqCd9jPQnYD
	8ld5AaZ1TpddscH0oKNlldeYPDY4uvln9fR1IPg=
X-Google-Smtp-Source: ABdhPJz22H6zLwd+GQ1ANmp6QFVu2RDLvZP9bEbt2PnDoUH1ZGpsMPOKH9dNoFLAzC1zGYNRo02HhlzOZXnr+IAT5X8=
X-Received: by 2002:a25:cbc9:0:b0:645:879a:cdd3 with SMTP id
 b192-20020a25cbc9000000b00645879acdd3mr25485724ybg.550.1651083059995; Wed, 27
 Apr 2022 11:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
In-Reply-To: <20220427162123.110458-1-maukka@ext.kapsi.fi>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Apr 2022 20:10:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
Message-ID: <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9lbvN29PCH/D2XKEwUNIuK6nXTQndruIFUgAj6zelOClCEBI2Ku
 E1ArV8Ka2ap0JHujlUnyGTVOSizhfD7J3dVEaoXE1keA1XXr+3sn3jmjZyrRveOXVSJB7Ey
 y5tpu2+yem4BTsPsnsdd5qcEWFLXR6jMcYLvnyUyj/1rjdXPKtVdv7IqyIP8/8Lf6UbjB+W
 /J96KVLD9G3uA5vgHRgWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ltcEXqwa5Ts=:O7s+FbGKt8Tpk9RIO849rI
 GjUMJinSVVxqPjhAClHmA6c2rg7Fajtut25MAonK4OYtFG+cvBZ8gQ3YKy4giU3sMZBmPB0cn
 qxodUWwliM0K4zjgBR/dIygajtecfEDqkwXIDAjgfEyjiL6x3StaTmZkTm56PucigzqWh0LKp
 k7Z/mOjwYdSfWkUO5a8ZnroIl30vOqW9eGfMFpLCj3MwwrbVmZjJJN3Dxttul5GkduxyKNi4q
 Yam49wU6+vsxOsRxM+ReBUdSY8dNut8Oo2vOdUmEBTrxzIDQPqjWZEdrvDwd3XyDFc0yQE6wV
 yROkE+/FLtQVoIqCQGGosUI9PoVB94dHg0jNY7XGRqqxYPYpxS7/lK/FD37gwQQQB0m05EX8+
 90hqFY8wa6gflglGXwDh8897NAKTL6mo9krGG/4CSqNoZk+1wU9JA+J0vCbt/ImYMtwbhrROM
 6pQoofRflAHJcPQX6751N7/kiBCXbMLPYUvuavAE1BOQFpX+WvHkmbQbWQ5lD0t54/qTI3xgE
 gFA+/ejKYZ5DsZLod3lo4ifemxqV+oGtNclW9maElvQzTY3NoFVAjglkrOfJ8bdFR+Ig0fYa9
 5GBS4BH+xjTGyDlZQeJECW6xm8WrXrtcKqV25+SnUysaS3jrQ5AWSgcIqdSoBiL9fVkZb1fwU
 ZUZDkjeRaZysd4JSbGocM6Y7GD/u7n2LWDLKVnK8ivOFzO5+ii8Vnzk9uYJpKwFpZY926cok9
 oQzDmLjT3oGyw4QbZJs8PlRgp2XUqE3ucm7SBW+wdNP0dSlUrrZ7VlwwqnIM0E416fXWFloxW
 K0vw/+/4VyGYQA8McI9E0mS3rrvW/VO8DYKto892+h1zYXBO4s=

On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> Hello all,
>
> I am making an attempt to create a device tree for D-Link DNS-323 devices
> but I am falling short on a few specific details. I am requesting a
> general review of the device tree files. I have access to DNS-323 rev A1
> only and the B1 and C1 need to be tested separately, so I am reaching out
> to people who might have them.

Hi Mauri,

It's really nice to see some progress on this! I don't have the hardware,
but I'll try to answer some of your questions anyway.

> The questions that I have at the moment are below.
>
> - some of resulting IRQs are different from what was requested in device tree
> - logs say NR_IRQS is different from mach file one

This is all normal: with a board file, all on-board IRQs are statically
assigned to fixed numbers. With DT based boot, IRQ controllers
usually define their own IRQ domains, which get a number space assigned
according to probe order, and above the preallocated IRQ numbers.

> - sata_mv fails to initialise with -22 (-EINVAL)

No idea, I'd try inserting a printk in every code path that can return -EINVAL
from there

> - there is no concensus on how to get ascii formatted MAC address from mtd
>   partitions so eth is not fully functional without setting the MAC from
>   userspace

Ideally this is handled by the boot loader, but that requires being
able to update
it. If you cannot, this could perhaps be done using something like
https://github.com/zonque/pxa-impedance-matcher

       Arnd
