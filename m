Return-Path: <SRS0=5Rs0=QO=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7CCC433F5
	for <soc@archiver.kernel.org>; Sat, 27 Nov 2021 12:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09CFDC53FBF; Sat, 27 Nov 2021 12:49:12 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44140C53FC7;
	Sat, 27 Nov 2021 12:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44140C53FC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id j1so7723652vkr.1;
        Sat, 27 Nov 2021 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhTTFdq9Ouec2Tp6O3ODQcGsU1dD+1o+XNr7Zcpuux4=;
        b=aUXDxw+wxuMfK0NN8FA5RBdWoJRuGZruR2eeUtw9vunGcBVFcz6a94bYV7441YRx4J
         YSDVawbU8r3G2qYRzqCU/7UOrnpDE8jSYZ7BORrxpOkDBiWyXln63uSXVywij0e4oZyE
         lj1F6POIHIqjc9nkAKgFL5Ma5m+fFnQIEjgGi0gbfV7XrbDHEidWN+hKDpHSjZ/ux/Bo
         ELw6MphLUtfPiAqSEZgbyU0QC6skids8eW8GsKzyoflJhPXz486/jO7VDkV5ojirizmR
         i59FBFk+VzAaa9RJ8PILqercKpdsI5QoOJDuBqod72YkgOy8RilIFiZ30bjiOuvWHI1f
         USIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhTTFdq9Ouec2Tp6O3ODQcGsU1dD+1o+XNr7Zcpuux4=;
        b=OmKPrCa/Kps/E/vKos1O2EgElEdrVBHSq2dFz9YCh7BFprOrDpA9NVQwqlHYO66AKQ
         e4MT3hnrrMuZBSHEC4oFCvbx/dTAJtAtP3EZsCE/+nbwzXEA2ynwSOixLRW0PrlAtFlj
         536WtWKcuwhg9AYLrcTJEADBuNa5uRkdzD4WrgUPt8dl/gpG/TbGfYyGJiLLYF9P54/f
         CLo7TKSndrw06yDq2Ygy/0bmfAonJqZsVUCw1CySP8dNADLdup4dF5LgYcvmf7DWa2z0
         ANm1/tNtH5zGm2+y4rpZhEw79TrWCCiCjngwz0wHhEnUTgxk3NdOymuZERq9CYm6+vRX
         Od2g==
X-Gm-Message-State: AOAM530NZ78VSvQb8k7T2TlbteLjbwAfBgwwlGOc3vMyuhvkcumJXsYU
	EXjsRdIeozHsPBFzcZMmDK7Y5/96G1VqNm1+6VA=
X-Google-Smtp-Source: ABdhPJwR6Ggz9AFJAtv78Mk3+wpQfGFn/ZWsDVX2sy5m5SBxiY/eT8fXvH489Y2Xkh4JHYdHbxwV7GG3sGXn2rRmx3A=
X-Received: by 2002:a05:6122:629:: with SMTP id g9mr20722297vkp.36.1638017350280;
 Sat, 27 Nov 2021 04:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 27 Nov 2021 09:48:59 -0300
Message-ID: <CAOMZO5Az+JJB7pokhOue+DZpKTxu3uQFkDJd7LpLgri5aLv9zg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl
 driver support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 6:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add the pinctrl driver support for i.MXRT1050.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks good:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
