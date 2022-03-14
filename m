Return-Path: <SRS0=ZaKQ=TZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F70AC433F5
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 12:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB886C340EC; Mon, 14 Mar 2022 12:32:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60AADC340E9;
	Mon, 14 Mar 2022 12:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60AADC340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLyzP-1nl88W0InR-00Hwtw; Mon, 14 Mar 2022 13:32:41 +0100
Received: by mail-wr1-f48.google.com with SMTP id t11so23674195wrm.5;
        Mon, 14 Mar 2022 05:32:40 -0700 (PDT)
X-Gm-Message-State: AOAM5313DMdSy6p5AotH8BOxk/6mcSjGUXvyBuDQeMQhGwdO71J23Q0T
	GWS16ksk4CwvnKWMIoGBKYWyJOfS08Uci8UqSvI=
X-Google-Smtp-Source: ABdhPJxkFLmHM1om+Pm/EdZjlu/oHNDpfpDjWiz13UF+c79mJMkNbH3uFQXob/61v67y1ilq+j5Sa2dGjBYC2XD0inI=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr17319150wrh.407.1647261160730; Mon, 14
 Mar 2022 05:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
 <20220311093800.18778-4-singh.kuldeep87k@gmail.com> <4aae560d-d266-d0d0-136f-32891b15bc01@mleia.com>
 <CAK8P3a3a_WXbDKN-jJUt_Wuvop0rfaUs4ytwyhogOxdtJAPx0w@mail.gmail.com>
 <4f39f086-1932-1729-8761-d5c533356812@mleia.com> <dc599cae-7245-73dc-8050-14ec6c1336b8@arm.com>
 <f497fb65-3568-cda2-f086-2275b50daf4b@mleia.com> <faea4c0c-e20b-c043-6f74-95af8177e8bd@arm.com>
In-Reply-To: <faea4c0c-e20b-c043-6f74-95af8177e8bd@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 14 Mar 2022 13:32:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1KLHwABtXwu-8Kg-GyKbETz1uRhdCz5edELOGG7JdaMg@mail.gmail.com>
Message-ID: <CAK8P3a1KLHwABtXwu-8Kg-GyKbETz1uRhdCz5edELOGG7JdaMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: lpc32xx: Update spi clock properties
To: Robin Murphy <robin.murphy@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cGDi1h5RCZcO+Bv1Bjp1V5YqAVUB81tcVVojhLdoj5rmJOWSHfy
 leqIG5Rz8naZTmMvwjujBxiSCxKq9dWYcJq9EdIziKWGP93ufYcqBqtmIBAjzRoo/WeNz+2
 wDVLb8dimZltjz59oQXNB+qGCR50HtsXNHX7+T2NKn1vUGSz+KD9roXu6/to81VWciax0Vk
 0wHvtw0cyvb90am3pc30g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PoDXC3HIH3Y=:brOUpedL7+zoFIuFLTwWJs
 3Q9IjKirOyNfSxxHyuSwk+rpBlZRS1Ayx3zK6B+m7L+xX2G5ps0Dl+jFXGf59PBalPL56UPjj
 IBhPe2dojb4ZqPqvJ1LQYwdTOgwSppE5JmbX5cr7zrXH1FqZ1dS9eiEui5cGILmakkQ9PXjvM
 MMtaQEQ6aNmgnYOrU5wRkpHVKqluPmYAW2Ud5I+3BVSundUSc2OLnrDi19akssvATR5iHhYjt
 FO6z4PzJy/DQQYeS1hr88DAJ7g6tGRNWFbSbTJ3jxt5bDgxuOnT54cCAVgBKZIIJZr6DRpTJL
 B2NFYxqPiYusOjXHq2huQ5kkBGasF6oTWoQZlrwmXb/j9KHkH9jCP6tv9JBPepvgMCK1y1OT2
 s2uDhdxFJzWjf0jNXUkdznAZVHXq63jrQPBGpfYBudRcS7/ibVR664yB1b3Yn1CrY0Agqba6U
 DtfBssn/KPPi7DRw3IiUoX+nQvT6HRSVyUu0fOE4Yk7TbNLdVrF8t98RLD/wsECKeZaE1WMHK
 lZJI+pJIs32G97IxPKVS6Sz9PcMg6ScBJYr6iY2krm0aNSgiR92IllgS+3tb86mF9wWa7SMA9
 TH1xyGBk8ATq6lWDfGGcG9KjVeW//c+mnJ1jRkAZDAoWHneghfyg+Vx/sRhsBqyb4lmFSO7NL
 mJ4xowdY8IyvyH0TFpggL3tAh7/Y23ZSgeyvQ+/F2DLHnhWkiIT/ZuFyuc5jh1HRCNJM=

On Mon, Mar 14, 2022 at 1:20 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2022-03-14 11:50, Vladimir Zapolskiy wrote:
> > On 3/14/22 1:43 PM, Robin Murphy wrote:

> >
> > Thank you, it explains, why "apb_pclk" is required for all PrimeCell
> > controllers on the SoC. Nevertheless, in commit 93898eb775e5 it was
> > misidentified with the sspclk clock, the latter one is the only clock
> > explicitly utilized by the driver in 2015 and till today. Fixes in dts
> > files should be preceded by a fix in the driver.
>
> There's nothing to fix in the driver, though. In fact it can only be
> working today because the Linux driver isn't very strict and simply
> assumes that the first clock entry is SSPCLK *without* considering its
> name (other consumers of the binding might be stricter; I don't know),
> and because presumably the HCLK happens to be enabled already anyway.
> Changing the driver behaviour would only stand to cause functional
> regressions.

We can change the driver to look for an sspclk by name first, and
then fall back to the first clk if none is found. This would be backwards
compatible and allow new dts files to have an arbitrary order, though
we still need to be careful about changing the existing dts files after
that, to avoid breaking older kernels.

       Arnd
