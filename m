Return-Path: <SRS0=t/un=Q6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0311DC433FE
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 16:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BF0AC34603; Mon, 13 Dec 2021 16:29:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C46FC34604;
	Mon, 13 Dec 2021 16:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C46FC34604
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQuPJ-1n7znc14x5-00NztV; Mon, 13 Dec 2021 17:29:27 +0100
Received: by mail-wr1-f53.google.com with SMTP id o13so27958698wrs.12;
        Mon, 13 Dec 2021 08:29:27 -0800 (PST)
X-Gm-Message-State: AOAM531va1Wdz14ynQJ7EzDqHXt4R7GiICZMZ7eCb7nTuc2pDBYbajkE
	j6EaYPk3ZW0EhDnzTmhbU33ZC5Jwfdxl7A3HEBU=
X-Google-Smtp-Source: ABdhPJwG1WZRcYp8Ayblot4FmiUPU2o8ulqLJOd1oO3UWNGAmNWkt5SFVqDLLkyRFkJ8yFRh7CcmrgtDmB9Gegd1GTQ=
X-Received: by 2002:a5d:6902:: with SMTP id t2mr32606385wru.317.1639412966819;
 Mon, 13 Dec 2021 08:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20211202095255.165797-1-herve.codina@bootlin.com> <20211202095255.165797-6-herve.codina@bootlin.com>
In-Reply-To: <20211202095255.165797-6-herve.codina@bootlin.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Dec 2021 17:29:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3YGOS5Bp+vFCfsGOUsEfwgJoNxJAGVXZv=QQ73k6Eoqg@mail.gmail.com>
Message-ID: <CAK8P3a3YGOS5Bp+vFCfsGOUsEfwgJoNxJAGVXZv=QQ73k6Eoqg@mail.gmail.com>
Subject: Re: [PATCH 5/6] irq: spear-shirq: Add support for IRQ 0..6
To: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FRPJBLoecxhWGN3iMQtlPIgePp5eGHHvdx7aAJ3vjmCJoiWIvVS
 70eS2vzESk3U/rbwAjyiarHgmEd/Yuk+rftBXcmlo3rKDLY8XR6yaXr/lQrT+0KU5Gw4Xk6
 V43pbFM0vyqiy8UraYf6itF4p1aNmzVMBHO5n7+Cm9Z4pxuo2UNEI9i1uIeJQS5eVA+yaG/
 hlnWZcXv/evvUVvJ9Awzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gmBW95zFosU=:f01jL9eZkOFHkcTA1JfA98
 e22/UwPxeZPvEXiOAcbBPbukmHvX0QPVSJq7wVVCbHqkLEsEduFRTU9qqXL8HVuPUyQRwfAOg
 WjjYLhzmFVIqq2IP5p299pVgRy0wTROwArkksinZzSFUxnRoSGNXAiURRisoAzw+QtR2ymAuy
 YfncCTKRw1wR/BpiUoEZXPpLMZn02DNJMV90KSxcq3w9E08DOGhbyYusSNlRESoOqeJLMr89p
 qy7/aTfLpCHElVxAhmrp4nSGal4WVz7Sh6glkBzcNCuhA7bT9MsC+xbJw+tztnyHjrusOXuhL
 3IMP7apGy3tCm2/ilbrXfqj59M4eafOSjPWATcvoAEYqfaaacQmLhimHcFlj3v13ZGeCYEbc/
 Y3812fkADl87/0QwhlPB1gwcQQwUpq6FWMUtS8MXotZQaZLC6vtSqVyW83Gw0/lDuBpAKRYGn
 Gp4e2AqEBrxW21XHBYER6FbeQwlPuZIdXXKaBC8Tmoo3pOBAHrja+Oum1sHA1DZLm+d5PvV/s
 8GVhm4cRxFMyOUgHV6Re3wJcTWRsKTOTRwhBVLespXxG7NNaXSXUks2GzYqj4tCHcAiQsfyqD
 WCv6mPF3JsPCtCsm/ZL73ZrpaWmWpCwKTUCqe634hSBMBLsRk+eG8ygWNKl7JDsCkjYZ/razE
 Jfvtlb1PxbcRhfJ830BxGMc2IU5lCy+vfmsO6O8OJQIdcjyHfPLcPA0ckjKUoEALeuwxjqlQh
 XeV472aVwSySr6jbZg0Aqjpzyg1ORZgxmL8OJJZ3jDnwSfdnSA0j5cTzGNCidUncNIY63fak3
 8Fj1hIRLd6djnIABRwK0R6naMbNFq7WKJdw4Oio7uZqKC20fas=

On Thu, Dec 2, 2021 at 10:52 AM Herve Codina <herve.codina@bootlin.com> wrote:
>
> IRQ 0..7 are not supported by the driver for SPEAr320 SOC family.
>
> IRQ 0 is not reserved in SPEAr320 SOC (assigned to GPIOINT).
> Furthermore, in SPEAr320s SOC variant, IRQ 0..6 are assigned
> as follow:
>   IRQ 6 - NGPIO_INTR: Combined status of edge programmable
>                       interrupts from GPIO ports
>   IRQ 5 - TX_OR_INTR: I2S interrupt on Transmit FIFO overrun
>   IRQ 4 - TX_EMP_INTR: I2S interrupt on Transmit FIFO empty
>   IRQ 3 - RX_OR_INTR: I2S interrupt on Receive FIFO overrun
>   IRQ 2 - RX_DA_INTR: I2S interrupt on data available in Receive FIFO
>   IRQ 1 - Reserved
>   IRQ 0 - GPIO_INTR: Legacy interrupt from GPIO ports
>
> Add support for these IRQs in SPEAr320 SOC family.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I took patches 4 and 6 into the soc tree now.

       Arnd
