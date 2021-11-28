Return-Path: <SRS0=sWnU=QP=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFABC433F5
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1471CC53FC1; Sun, 28 Nov 2021 20:50:29 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B2A8C004E1;
	Sun, 28 Nov 2021 20:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B2A8C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 188so9590800vku.8;
        Sun, 28 Nov 2021 12:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozjJ3S5Udm4B/OHBZ5P2O9zki+yUp9fd6WJGfyI7sV4=;
        b=jL6xsvpd7T1ANE1JqP6l3iIR2W4N08COgcswxreba+5PfVGwvMc9GxbJ5vZtkb4rdR
         mcP70bSrCUnrbWduLH+5RKI5NI8TQNZ8lgsoj1Wzgmm0UcA2ipZIUS1OKKDD+SPz5K9K
         fIYaYX/JPFDrIVE6kGBYpANehgUJwE0pdIGWSt13EKtjpnllqQLfhAGMMbwVJFDMbc55
         0clotCrmP8TpwQTnG/UygBsPcHczlGUHStQz7yQEgcIcjQO4uWxgvvR9t9pMY0rpLxwK
         b++kUHcQQMtIExbSnYMfWvSZOljhDSSoK1f2GkcgGdHreihszyT/Kuh+9cEd2g2uyXlR
         XwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozjJ3S5Udm4B/OHBZ5P2O9zki+yUp9fd6WJGfyI7sV4=;
        b=szYXvhLSyuRbq5pKeT3ZO/+lXkdzxEzdNwYpzfKio1xLnoI9oC1hC82S/q3/ZEYbqB
         LWQUpWUQLG357ODO5ZtuvlSQFSbph2/ygykx1L/XJuznlwj2J7oGuk4JowQAlH7Kgbbi
         yJVSq3qQr1ga1KQcTfLXuhzkayh7wYnbslvGKUanDBJDvzPX/Ap4LMOMss4j/RmDLysC
         S0adN8EhQPvAMiwjA/yrsAyLEaM7drVvuc8gBI8BGlQGQdYkDCqVeNy7bV/nCEO/2Dwx
         jQd5lu0qtArymOANLezprVxkxCWhdswEtiUlWLLlPjqpJSD4Jme9xMcwI0Q1XUzNBVq0
         I//A==
X-Gm-Message-State: AOAM533+lQKG67htr3XIsaLaoqk3UD3vQf0qohY1GMz4b6/dP53kb0pg
	LhLhAp9riBpt+on2WwKd9UUhBsvsH7ew+4VsFNU=
X-Google-Smtp-Source: ABdhPJwqKT0SJSealzpAeOuiuzBx+Ouri6WOg7q88zgMzKFcvEBeTGHbTYv3Au3CQjhcuPQWX3A/YVR/KzwFODrXPbA=
X-Received: by 2002:a05:6122:629:: with SMTP id g9mr27480004vkp.36.1638132627271;
 Sun, 28 Nov 2021 12:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-8-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Nov 2021 17:50:16 -0300
Message-ID: <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] clk: imx: Add initial support for i.MXRT clock driver
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
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> This patch adds initial clock driver support for the i.MXRT series.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * Kconfig: Add new line
> * clk-imxrt.c: Remove unused const
> * clk-imxrt.c: Remove set parents
> * clk-imxrt.c: Use fsl,imxrt-anatop for anatop base address
> V2->V3:
> * Remove unused ANATOP_BASE_ADDR
> * Move to hw API
> * Add GPT's own clock
> * Add SEMC clocks to set muxing to CRITICAL
> ---
>  drivers/clk/imx/Kconfig     |   4 +
>  drivers/clk/imx/Makefile    |   1 +
>  drivers/clk/imx/clk-imxrt.c | 156 ++++++++++++++++++++++++++++++++++++

Wouldn't it be better to name it clk-imxrt1050.c instead?
