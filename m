Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1001CC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:36:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C462D60FC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C462D60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHtFigrN77EAOAOjYZeDll+/tUkHII348+uecYxuNOA=; b=s2nMX0EZLi/Ei4
	hiyCslsC8FG/SXxvOPu5OCDyNOLajupMhrRic2SaDchtoBlEU2uPvtBxxz20DJfdbyQz1vsrZx1tt
	sdi8NxkEE8SvXmRiKs/2wFOQruDsQaP90y/e0wd5eAfKqaHlYolWOaXgqvNnlrpFLv3jjt2qi2CT6
	8SywNwyA8vg8hF2h2QdJDBKj+iAq/JR6/buX9bhatmIBmVDiIqXZ5VAIGd+voHlLba3HJyGBgmhsr
	DuHGbQHpsID3bpQOYGQ2R1erfIDwX7UYb/7BgjkI76FiOhAL5wzgJksM7QOe0o4aY+hOoBePY/gpd
	pWVS/kSRsKcpNEX0qLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3If-003Pjw-Ms; Tue, 02 Nov 2021 23:34:41 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3Id-003PjE-22
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:34:40 +0000
Received: by mail-ua1-x92d.google.com with SMTP id q13so1178986uaq.2
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WExrQsHq2+oSn64OIwRtqz+A7F4kLA/sw615cMT17iA=;
 b=HCmVnRxR0fmsMlryA0puisk728Cvco3Lv5XxJp6kRibLhmBpMZfrnNErKOsheskWB+
 22RUFqwoPnQBcSIZIYFO7pkAtmaFQ4CTgo1OBGBeIJxpYc6WyT70Ks7XagV+jnHtqwhk
 tnfPsRCiSFpcemJLu+256qHzVVNSnZgvS8JSsk4skTKgkHqqFH1/ra95nJtRG9M7l75e
 Fl558NlMqAlMABEtstkuxphKjN9f7s6qxsIIDScN2ws2WQd+zfOTZoY+ICSTE5bPag8E
 ltdHM9ZDHfY02MPV8i5FSOTnDNuehgxDHoZxx0igYv5QNYAJeyc/OsxB/77QJ4MNBJPu
 HeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WExrQsHq2+oSn64OIwRtqz+A7F4kLA/sw615cMT17iA=;
 b=L5X+EARlYVgVU0Qy3m5iNqsNJCkbLXMMub8woSsWsmSw1rm5lzvNynaFdVnoGzenZT
 rS8yl0iDr1lsWiUfgBsI1oops5gdxZK+JU9sahwhcOKdcLMz1kkad6E9YLMgirY781bh
 RbFxcA/0+kvopx4U32YnLs12gf339+KL1EjF54++DLLW4PmQMv4Gv4myrpEQ+2/DhiWy
 TZDuiHVEDK7kCHOBlpSAsMQtkAMeonf0WbQx7WSAr4tsQqkkG101Zo4Cb0TuG3yi5fMI
 1eR+F/10V7LUsXk3iiVKAoQgbxgnbWWreRPNg8aUu50sHZ9NBgq1W2N+LLWhvFvSbNGZ
 VWWg==
X-Gm-Message-State: AOAM531tv5ynFausThB2Ht+Le9ZrFkLlqxGzer91ifTEPbKxE+w/0N/7
 6sxIrzQxwVVD7bzM2UMvlzc8GBn05OL4EhJ+G7Q=
X-Google-Smtp-Source: ABdhPJyg9qRXJgiaZC755Y6Kg2Kx7dGx91462pdNgdkRYuajrdDidJO71uWcnLsyRo5wkzhZhKVLuOabQ7FZcUXZ5Hw=
X-Received: by 2002:a67:af13:: with SMTP id v19mr4344787vsl.5.1635896077608;
 Tue, 02 Nov 2021 16:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-8-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Nov 2021 20:34:26 -0300
Message-ID: <CAOMZO5C9wY-BRbF-3D+mvaK3DaYi1kURt5QX-r3=umqpsT+hhw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_163439_138702_AE436F1C 
X-CRM114-Status: GOOD (  14.53  )
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
Message-ID: <20211102233426.TWqNaTX2uWTJbSCONH-NqfDwVi48PlPTSzQ5WmT5fPE@z>

On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +#include "clk.h"
> +#define ANATOP_BASE_ADDR       0x400d8000

This is now unused. Please remove it.

> +       clk[IMXRT1050_CLK_USDHC1] = imx_clk_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
> +       clk[IMXRT1050_CLK_USDHC2] = imx_clk_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
> +       clk[IMXRT1050_CLK_LPUART1] = imx_clk_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
> +       clk[IMXRT1050_CLK_LCDIF_APB] = imx_clk_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
> +       clk[IMXRT1050_CLK_DMA] = imx_clk_gate("dma", "ipg", ccm_base + 0x7C, 6);
> +       clk[IMXRT1050_CLK_DMA_MUX] = imx_clk_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);

The imx clock drivers have been converted to the clk_hw API.

For a reference, please check:
f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")

The same conversion could be done here.

> +       imx_check_clocks(clk, ARRAY_SIZE(clk));
> +       clk_data.clks = clk;
> +       clk_data.clk_num = ARRAY_SIZE(clk);
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL1_ARM]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_SYS]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_USB_OTG]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_PFD1_664_62M]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_PFD2_396M]);

If these clocks are essential for the SoC to work, then you could pass
the CLK_IS_CRITICAL flag instead of calling clk_prepare_enable()

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
