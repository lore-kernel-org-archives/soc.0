Return-Path: <SRS0=6dyC=Q6=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522D3C433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 12:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23932C34605; Mon, 13 Dec 2021 12:15:04 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7C5EC34604;
	Mon, 13 Dec 2021 12:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7C5EC34604
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id x15so52195513edv.1;
        Mon, 13 Dec 2021 04:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APONv3SOJu6jCNgkwpRGUa5SLi10GbfkrOQc9B4NjY8=;
        b=pnT73e/Ftu4uEmb+E16AXdk5b6ca4DPxjdMjO8quZZKijpit8bPkMgIn+X6xOj3NKT
         h4e19eBUv5LF+pjrK/eGrMS/xiCz6iSxTlHBC1hDlE+vFIW11dLfJPHw+ibiDBGpDzIB
         ZLOprS+pTuporKHrxq7MEsOksS7mm2k2P4oezg0BuOSaezMZqAL3kWhXh0zA+rlmx19N
         kqqzHtFdH79xHwI/zNe/Ye0Bu39MY4VWBiNj9v3onZo3tIAQkVTuceOBNwBN2wg3saNJ
         WbBSImyM2PeZW3+dd/Y17EKHRVautWP9DJpwJzsPg83X+eNO7AXU+B55oEK7DGq1qnmp
         h+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APONv3SOJu6jCNgkwpRGUa5SLi10GbfkrOQc9B4NjY8=;
        b=gdx8LLwrFIpZ/gcABPjIiWP0NjeiyKIZ3bnJD1Enx0bG7OycdokaD5gsoKVzddLXit
         TUnfL5MT+OPl7LCPpDcebw+7xX6WgngQFBp18KcsFbEd2PwcdakAm5dN9Va/fLxNimSx
         wmDGZNgcn1/F21ufuNCPztvo9FRy8HwR7J2/h0CA+v4GRLuOJByytkt8r7e7bM4E3xNE
         6jG2mXibwDO0EB+TXTc4Y6MWzDpkWA8rVmVq8gW1tcnFn6K2LLATxVn+rJQWtCOiuEjV
         CsOTqOpRz6KBNIHZXlPdPWBf24M8M6GAT7bM3BTJRq3UKUw6cX3cTuxV6NaqxrftEICz
         4tpA==
X-Gm-Message-State: AOAM530QjgsTwAiQDbjQ1dxz4+dc6Ifsvdhdh6wLP73NeLov0vT7QJ+l
	iU0I3wzUigutPLZMykHfWHaUjyFRBSX/aU1F+K0=
X-Google-Smtp-Source: ABdhPJzIhAFiXAukZI7VpH2AcmByRzDMPngbJIecaJ7gymB6ARFyfskeqZxnSgWa4URc7fbRLHmlfOwb6iPmIjZkKBw=
X-Received: by 2002:aa7:d495:: with SMTP id b21mr65090593edr.363.1639397701965;
 Mon, 13 Dec 2021 04:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
 <20211204061042.1248028-8-Mr.Bossman075@gmail.com> <YbcuweQlw3inhye1@ryzen> <bc7a718c-2cb7-1c23-a8fe-524b327fbcd5@benettiengineering.com>
In-Reply-To: <bc7a718c-2cb7-1c23-a8fe-524b327fbcd5@benettiengineering.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Dec 2021 09:14:50 -0300
Message-ID: <CAOMZO5D9ytHBACojwk3mtaypdc4s5gWT7ctJQiUzmmP15hzGww@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] clk: imx: Add initial support for i.MXRT clock driver
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
List-Id: <soc.lore.kernel.org>
Cc: Abel Vesa <abel.vesa@nxp.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Giulio,

On Mon, Dec 13, 2021 at 9:06 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:

> > I would suggest module platform driver instead.
>
> Can you please point us an example?

Here is an example of a commit that converts the imx8mm clk driver to
platform driver:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.15.7&id=af7e7ee0e4280c29c41b6ec64b892bb53987a997
