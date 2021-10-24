Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D09C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133D360724
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 133D360724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xblivDtx/U3cwPqdBJQjVJHkmP6gNIs6zx/UVJv2mmw=; b=silYfLEGyBLdI7
	QS8ZF+inyB3c8uNInDeNTlERMXLr3hkZtZpT8fClRy78w9IGo1XDwmxiJlRmScmhATvqhaQ2FRfpq
	qdAbLSNIBxxxcAAdMdb0KPbcJ9apZVZ8dJNM2a4XJZpbpcIjzCpwnV0j5DIEXAduWCXp7C2luarZn
	kIaJ1K0yZXSz3oVrsOlAGwAioX6gDR5JAxIfPH+qaqK7qG+LlrpAY5ofOebkCPnoOV3AwGitdEh8C
	Wt3Laj8o4gYI8C0m/ORdpdACczE4wFTkMPUSn1b9DCSRXoWlgVQXdTd6+035va/D7p+c/LtZx81re
	eQ7KMCrAW116HEzAWQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meftP-00EJ5w-IU; Sun, 24 Oct 2021 15:58:40 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meftI-00EJ4R-Ma
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:58:36 +0000
Received: by mail-ua1-x931.google.com with SMTP id u5so17184279uao.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFDgY4a8AamGityNJyN/mckXYNdeMMrUI41JEjk31xo=;
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
 b=ATyisQWq0HBv6uMQTgYGlddHs7YZ77u/xGJnbcUZD81d80HJsLxaevAXyh7DLv4JrN
 IqJ+8uWQYpW7jBRAwk8v5RpCAy+rgGpvYdpRVipnRwGNHORlRqREPfT+tsPKs63+lpUA
 4Z0nCOTtu0eTe9G3TvRmlFnRCN3VK0UcEsJ01uORRDZWu4eHU1la18pQGwbtqhsaIVpm
 2ceJe0CSLY5BUypjaOAECdyB/AVNrxj6hlArCdRICrDj9DdpBq45eYbrgA5T7lRzj3eB
 L2ZsUaXkcSzmWvtmsBstCBbDeqSklggZF+OR+zzrHrqnsbps5epV/RE2D2h1lHTmNIA8
 befQ==
X-Gm-Message-State: AOAM5307IgWSXAUMlBZCndtdfioWqOPRtGRtanjnuKUR07r1rgXvwuEg
 cFUIMkLVEpkWJfdBg7EWQfuLWQguuJNnlpavq4Q=
X-Google-Smtp-Source: ABdhPJwt5Iadh+Dx2Pj4qk8HW3e+17XkSpxtZxQTPdo+uVgg87++wO9zbnNui7XEZ6YllAqwOATPkA7hTDBp6u8NIXQ=
X-Received: by 2002:a05:6102:34e4:: with SMTP id
 bi4mr4287265vsb.20.1635091111412; 
 Sun, 24 Oct 2021 08:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 Oct 2021 12:58:20 -0300
Message-ID: <CAOMZO5CZoGRpvtPb0VdjTOy7bOPQRMyxPK-dr8AOoYUrqoo6qg@mail.gmail.com>
Subject: Re: [PATCH 07/13] clk: imx: Add initial support for i.MXRT clock
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
 Leonard Crestez <leonard.crestez@nxp.com>, Anson Huang <b20788@freescale.com>, 
 Fugang Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_085832_789072_3670B17A 
X-CRM114-Status: GOOD (  12.13  )
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
Message-ID: <20211024155820.DDL35hVjEmd15qY1TEx1nVdnJzZYr9RetPVqtdMBqqQ@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
