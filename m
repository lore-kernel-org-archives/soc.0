Return-Path: <SRS0=Pi41=MF=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7903AC4345F
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 07:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4162DC116B1; Thu,  2 May 2024 07:05:43 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1ADF2C4AF48
	for <soc@kernel.org>; Thu,  2 May 2024 07:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1ADF2C4AF48
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso99259641fa.0
        for <soc@kernel.org>; Thu, 02 May 2024 00:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714633540; x=1715238340; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
        b=aMNSU1QIGFlAOHWRnJ578IT3W6vwvlp7ysMBH1YAI6zVlX2Xub1QT9p0UTFRUFtseO
         PYHH3tOAYakO2kEhD86Gm8azo4cxALSUdDYTPgjXihefSZPr5LW9uwlRB/mIPEUEctIF
         IRycEMYD7yvUduxVN6oTSXlQkX+tY9UQdEHKpzXD3G5uraywyvmtEB1oqqyLXUJiA1eT
         9cNTjqZP1eiI9HGiLzeTnL+jdaaLaXvqfPmkhzZLkNnyDB7FbWrLVHZgOxq+upJD8BcB
         y8j+LaKCu0mEMgzwmUIWKXYJKgkX6HV8HqL/DYQ2sEDA1O9eNJfi/WNe0sblT3i/JEsK
         J3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633540; x=1715238340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
        b=hhqlr2gq1Q3ZsKQkSvJDBthGFUUCehqCt2Xvh51HqhRaB2kRhgJd3xunNvuzlzQ9DK
         cl/qBUfHIdD5mabdWs0DHCv6zbWPNJ0FDb1XQ+HXZ5Jkd/K7/JwIBLFHTHwO8cq7g/Mr
         VD26GneZnmW13zLS9h2QVT6OKSyptyud+pJ6g0ZXY3m17jRHXdCQIXxf8DuVFVTdcN+J
         AuS/ajyrW8TIdQKeDITJ9goQvEfe9P+x28va3KKKzN84nG0wpORGSrjeWMoLBFu4mr6a
         J8zQCCOGbDI4UDF7D07N1dWYAAQEheOvfRt8ifUcKnMXiLIk8G8DDg4oAAI1bVx9wppg
         exJA==
X-Forwarded-Encrypted: i=1; AJvYcCUbGgxe6sqDkVPD4uIkMHo2Y+7363McSJMrvS/MWvmkDwHLYrs8k351B7ewrVmRusvGmKziZKdWFM4/N3BarQ==
X-Gm-Message-State: AOJu0Yz+3pxvf6YrH56x2s4TFLolD6uOKcU71oIzQFLtDRqsk/NW5qrK
	EpyuksHUEiCFwuVc8rxH9U/uF2rZ9uyRE9r1yetb5dcmyjNRBrpxwKvTxpHkLR8=
X-Google-Smtp-Source: AGHT+IGHVWuyebZDGCsij4vuuCGXUnlNacdJhnGzP0jhAixWhDpzQ1nmi4t3DPfRBlZrMwTir+WhcA==
X-Received: by 2002:a2e:a58e:0:b0:2d9:fb60:9afa with SMTP id m14-20020a2ea58e000000b002d9fb609afamr1096872ljp.40.1714633540084;
        Thu, 02 May 2024 00:05:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q26-20020a2e969a000000b002d860a40f9dsm69420lji.136.2024.05.02.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 00:05:39 -0700 (PDT)
Date: Thu, 2 May 2024 10:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	"soc@kernel.org" <soc@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <26aab31b-8085-49e0-862d-24c26ff4d02c@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
 <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
 <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Thu, May 02, 2024 at 12:28:42AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based of_node_put()
> > cleanups
> > 
> > On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> > > @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct
> > platform_device *pdev)
> > >  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to register pinctrl\n");
> > > -		goto exit_out;
> > > +		return ret;
> > >  	}
> > >
> > >  	platform_set_drvdata(pdev, iod);
> > >
> > >  	return pinctrl_enable(iod->pctl);
> > > -
> > > -exit_out:
> > > -	of_node_put(np);
> > > -	return ret;
> > >  }
> > 
> > This will call of_node_put() on the success path so it's a behavior change.  The
> > original code is buggy, it's supposed to call of_node_put() on the success path
> > here or in ti_iodelay_remove().
> > 
> > If it's supposed to call of_node_put() here, then fine, this is bugfix but if it's
> > supposed to call it in ti_iodelay_remove() then we need to save the pointer
> > somewhere using no_free_ptr().  Probably saving ->np is the safest choice?
> > 
> > The original code is already a little bit buggy because it doesn't check for
> > pinctrl_enable() errors and cleanup.
> 
> It was introduced by 
> commit 6118714275f0a313ecc296a87ed1af32d9691bed (tag: pinctrl-v4.11-4)
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Thu Mar 30 09:16:39 2017 -0700
> 
>     pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
> 
> of_node_put is expected in probe, not in remove.
> 

Ah, right.  You'll add that for the Fixes tag obviously...

regards,
dan carpenter

