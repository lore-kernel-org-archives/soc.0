Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27708C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 18:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27A061090
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 18:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E27A061090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJqFtVFplEKcfGBMYeF875QXuIeKdyxgGd0+U6dossY=; b=cjUcecalBqcDpc
	MB42FqvGIwMMLWRAOsl1S5xaPWQS7VwIF3Dq4qYF0F5JfDEWIYGeW8IP4Jas7vLNRH+5teVdA3PKJ
	v7hm3j7mb8nTe3BX1uNTTXxNv15VHwNlOy9jjn1lRJngYaj+1durWzJPZ4RvUKDYHoJVjCR6hfE45
	b0UCAZLKaUihAgU45rl6BrZ1El8Nr+xA2wfPtr4CnwM9VCgLllJqoSxpQ9An6MGDfPgG43yCFkw8z
	2h9sWnnfXn5iFnIOCQ7hOSuhAcctJQlC77jZhr2qLx3wKfHlip5iDT0rrHYEkYkbknI8WETlaQmZG
	VG1JQ1H1BJ9QxnpSZjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mei3s-00ESMI-RK; Sun, 24 Oct 2021 18:17:37 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mei3p-00ESLR-Kx
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 18:17:35 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MpDa5-1n1wFK39JP-00qfUP for <linux-arm-kernel@lists.infradead.org>; Sun,
 24 Oct 2021 20:17:29 +0200
Received: by mail-wr1-f54.google.com with SMTP id d13so5974643wrf.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 11:17:28 -0700 (PDT)
X-Gm-Message-State: AOAM530ercf78KUqbGC04JC0Eb03P0+783Vo0msZ9zNU3F2vAPEEJLUY
 dhK+7myFYmIG7dIJPD4D6r6Yi01GRkVOQO1yxQg=
X-Google-Smtp-Source: ABdhPJwA4yx55xXPjGdoweMWLIzjsgLLmIyhDfO5RJ81PIjOMOGnfiDjEbR4fO6wCEdBYAYuSOM2cYFl2DdATduylko=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr16559015wrq.411.1635099448118; 
 Sun, 24 Oct 2021 11:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 20:17:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1aZ-LMANnvcr4XX=uTbut78yL=48E8iLHr3AFgVqpi+g@mail.gmail.com>
Message-ID: <CAK8P3a1aZ-LMANnvcr4XX=uTbut78yL=48E8iLHr3AFgVqpi+g@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, gregkh <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 giulio.benetti@benettiengineering.com, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com, 
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
X-Provags-ID: V03:K1:jzidXenTCZsQtmbHI0f5OnC79R5XEhh2jGSS6rPFk3tIHsa+MNe
 OdzSjiF7mfUATHaj/5KrdUiqQghQUjSYewQPBzeGkeu4AxCdBmaQ12CWI1Xjai6Yi2xX6Ey
 66iz0oUyyNmlVYVcnUK0W8cnbja87IKzHJVbVEv1stt3kkAQcDla1+oAMhWyt2YZSvDjqWE
 9Wm9jkxAXZwHSQsFBXW9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y9iZFMS8soA=:oPT175Tx/h8EARzQr8bimH
 5vIQ9hPQ7kUZl9o5j0NH+Dha4ywOngGDOZu8vQI+xs84G5VnuK5U85PDUTs9nxRJ23+Lybte3
 ecWmmSWrO8V3mA2k5si4Q1pQIulQOTjxqIkXRV076wGAbXvcYNx4SEeeezhgD0CETnPqkRnHI
 6XmKyNoxY9DYf0oXzoe4co7MEwlCLebpHxVcSlvgYeLiNXO+g2BwQ8QB5pK4oD27Lwswx8P/I
 qZDQ8/Z8N7dgj1keyB7mJfSuP+nOMYeY2oxf5h3QduBLcs6uIwkPXu/Qjvq2SByDdnFV2xtiL
 jrQ3aNrVtz++Ihgg9/4X+2RsGCsb9o7Qcj5vHtK/NC3ozyferxYZyGD/qXmmQc7tPt+ETdd4h
 g3zBovxuWu+4StwtzvE0Ne9SVBeyBCOoB3FgDXwoOkwr273IxQqp6iKDeihGS7n7BEQj4JRDX
 V1ZOYbZbZy7cRKs3qvS0+cXcLXJyCjlJomyWIIGsryFBoC0/YFlbEKcJLk/ZuDslfM20Oq6mT
 AjfRsGA0SxqpyTWGK/YwejcS3UlcXWLnj4X+THsPZeymWD7ttd7sA6ki5T4e+eHdQQNNRJy4W
 MefUi4kdCfpU5g6Gut7wJI2RaoR9tm6Wx48wnng8Y4MHE+XvWY5LwjYTnuYEKgwIL4zMyCvVu
 yHE2B4c9psjxP/dKfJ8Bm2LaPO+JeZob5YOBEqqi7lSRwKuaAcaRCXqa68j/0D8hOhlKbqx+5
 y36GbaT5NF6GgTekBote1Hs0QKbut0gQoch33RKdcyWIEiqV7BOzfd4Fr8ZPtJ26lEtTQzApt
 IJPdacUEfp35saCejhu6090PEH2GhFfU0sLmBJVgzrDonqF1tI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_111734_005528_B1E1E8B5 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211024181712.O7qRdjLgb_a96CWVpYZ1wo5u793U0D124yQZiSYYUok@z>

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +               pinctrl_semc: semcgrp {
> +                       fsl,pins = <

This node doesn't appear to be referenced from anywhere. Is it actually needed?

> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       aliases {
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +               gpio4 = &gpio5;
> +               mmc0 = &usdhc1;
> +               serial0 = &lpuart1;
> +       };

The aliases should go into the .dts file.

> +               edma1: dma-controller@400E8000 {
> +                       #dma-cells = <2>;
> +                       compatible = "fsl,imx7ulp-edma";
> +                       reg = <0x400E8000 0x4000>,
> +                               <0x400EC000 0x4000>;

Use lowercase letters in hex numbers here.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
