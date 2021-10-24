Return-Path: <SRS0=R5WR=PM=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E799EC433F5
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:58:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B19BD60FDA; Sun, 24 Oct 2021 15:58:32 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7280060724;
	Sun, 24 Oct 2021 15:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7280060724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id b4so5120281uaq.9;
        Sun, 24 Oct 2021 08:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFDgY4a8AamGityNJyN/mckXYNdeMMrUI41JEjk31xo=;
        b=B/Eg8KEM1fssiL5S+4I9z89ur6kddjZ5vwXho1mI8rwu99hFwx87TVYXFOoXMojBVO
         Cnl9CBD9j2ZOQsgfOVUFOhJXwdLKpzcnf1P1bmMgOF7/M5UGSCpqDdIdqfS354PON1jB
         vGbilL0TukEnCDqELMQVLBGIapLGofd3IzHrQpkq9n//cEG0YMA6tv4EcaNj1B/cM1ks
         DqPDkblLMgJrhoVG7zwlIgNW4TMgNO5VDdWfe/u9kRsLjcWcL3CDFYxpJx4XcNdhLsYe
         bJfxDRZpNl8iUrb0ujayBuYvuSW1loAiHhPS/DJwc3JXuLMOH/PcJ+56Wq4Eh1HtTSFf
         zxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFDgY4a8AamGityNJyN/mckXYNdeMMrUI41JEjk31xo=;
        b=gPESso5M70QkoHXhxbCM9zDwk7IzTVNJHGNKctiucbHgLGY+ObwSVU2YOJG5pU6HIL
         1jaAbMLc87MyAi34gDAfVQv+HpElphZATcPq4l0hRALKlgaOha6t1qZuV1ktqMaroatO
         yP/SOMjLMZVh0AeXy9sJO6XTyf6gDZTHnHmQiS4A+Vt/2i+0+eBhciVA9oEP2UmaaQ6L
         NoT47XzbkdQSe8n3ZcDSxkidk+uJ1bbuWJP+o7pPnEz8ddDPBxnNxpqwUxjVfSBuvCoV
         4sKonFbjPQmMo8DIh/hITgkKitrGJ4tZECjxLEk/s/ROvHETDAqXxnJfmE9fEkvm40z0
         siFw==
X-Gm-Message-State: AOAM533hgVzt+OuTXbgIA2PzXpMV6QPsMp3ChJ+EYe950TLfm8J0cYmK
	u0ZuSZ/SxfQK7NVaSq8y+WDwgRhtI+bgIe/ANBE=
X-Google-Smtp-Source: ABdhPJwt5Iadh+Dx2Pj4qk8HW3e+17XkSpxtZxQTPdo+uVgg87++wO9zbnNui7XEZ6YllAqwOATPkA7hTDBp6u8NIXQ=
X-Received: by 2002:a05:6102:34e4:: with SMTP id bi4mr4287265vsb.20.1635091111412;
 Sun, 24 Oct 2021 08:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 Oct 2021 12:58:20 -0300
Message-ID: <CAOMZO5CZoGRpvtPb0VdjTOy7bOPQRMyxPK-dr8AOoYUrqoo6qg@mail.gmail.com>
Subject: Re: [PATCH 07/13] clk: imx: Add initial support for i.MXRT clock driver
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Leonard Crestez <leonard.crestez@nxp.com>, Anson Huang <b20788@freescale.com>, 
	Fugang Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jesse,

On Sun, Oct 24, 2021 at 12:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +#include "clk.h"
> +#define ANATOP_BASE_ADDR       0x400d8000

This should be retrieved from the device tree

> +       imx_check_clocks(clk, ARRAY_SIZE(clk));
> +       clk_data.clks = clk;
> +       clk_data.clk_num = ARRAY_SIZE(clk);
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +       clk_set_parent(clk[IMXRT1050_CLK_PLL1_BYPASS], clk[IMXRT1050_CLK_PLL1_REF_SEL]);

The clock parent description could be made via device tree.
