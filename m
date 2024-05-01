Return-Path: <SRS0=mNxT=ME=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7FAC4345F
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 17:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C168C4AF1D; Wed,  1 May 2024 17:16:59 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A27BC4AF1A
	for <soc@kernel.org>; Wed,  1 May 2024 17:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A27BC4AF1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51bae805c56so8139167e87.0
        for <soc@kernel.org>; Wed, 01 May 2024 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714583815; x=1715188615; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOHqyTk2nsRZy88pDJJ/quBzrqb3UUPa7Yn14ZhLib4=;
        b=GgDCeOxlEeDhUgH2ATjapN0xcJxdV0cRT3F6YEj6/xT8XQ4JHEQS7CuwhtElMCyC5X
         KBil7ISjVIVIUFrHc58kYgUZJKBAe/omFcRKLao85JQihEeym7phN74LXfcI6o+VSLLe
         7Rz14E+8PooMB55/Y0SDmAzZH3QRzfGdrq/A3vOAbhsT9lNPDz8guJ1vhHB+T9mdBouG
         wNV/R882yAk9ft4dlINiNCTzFlPrp3r3zsZzgBTv5aHQFqhOiDVmoF6p7upvqVzDzezI
         dKJ4+hLORMuBGzLQdLGmAzsbASK5eIJ4npFuwtI5NlBrz91Pa2SDEibHlS/DlfZ5VD82
         R7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583815; x=1715188615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOHqyTk2nsRZy88pDJJ/quBzrqb3UUPa7Yn14ZhLib4=;
        b=DlrfUdKfe9eh4aAYB7PniI+aUFIBqxSrJdSVFYDrbtPo7/cV9k8sTExYP+WqPPi2BJ
         e38NDMX0r7HzDptEC83UITchRXCPFD/PCaW75Il7swDl6A0wNzelmRIGcqu2sbaqARFI
         HdJRy8Eg5MsCHNE2tIgFkV9YbIN9bjmPHHaRavD0R6XAhFoRBZpdzH+psisRIDAuPNkJ
         ixh6vOArEEkOVPzr0cK0d0lRMi82nrQxzl7uweonzBdIVa3vVXzT67Cs6UOaNug51V2x
         2bh27k/K494MNHYdBw8varNpFca2AkyEtwHIQVAMyN4ECAMdT0pWiDdj8kWneVmFO6jh
         9wcw==
X-Forwarded-Encrypted: i=1; AJvYcCViOF5OzVh1fIK44MCz3SqgzuYJssRXI7A3PsA/eF+IIpSCU/W5DjYB8Zc3e7s+00S54qUv8VgD6mhLEkUg1w==
X-Gm-Message-State: AOJu0Yw/NGEUZiyZPGCK0w1SW6xEv8hay4HN/AxBpBU+AlbYwtgHvd48
	tgdPfRsgAGaxLOdjnp7cqDlM6+JzyCKW/B4D3jUphIo5265mFJ/7sXvugn6qnII=
X-Google-Smtp-Source: AGHT+IGQV4KLhJUah5uwpDXzYUszrhPNSItjqkYS07RJilfCu8tUsg9Dz64nf2enkLVMqtqy/1k75Q==
X-Received: by 2002:a05:6512:12c7:b0:51f:196:d217 with SMTP id p7-20020a05651212c700b0051f0196d217mr197144lfg.63.1714583815158;
        Wed, 01 May 2024 10:16:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t10-20020a192d4a000000b0051d5616c3e1sm1524897lft.231.2024.05.01.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:16:54 -0700 (PDT)
Date: Wed, 1 May 2024 20:16:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
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
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 10/21] pinctrl: st: Use scope based of_node_put() cleanups
Message-ID: <f6aa3a17-90d2-42e3-8c55-639dfcdbf8ca@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>

On Wed, May 01, 2024 at 08:56:08PM +0800, Peng Fan (OSS) wrote:
> @@ -1224,8 +1221,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
>  
>  	if (!grp->pins || !grp->pin_conf) {
> -		ret = -ENOMEM;
> -		goto out_put_node;
> +		return -ENOMEM;
>  	}

You could delete the curly braces as well.

regards,
dan carpenter


