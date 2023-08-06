Return-Path: <SRS0=mfun=DX=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46239C04A6A
	for <soc@archiver.kernel.org>; Sun,  6 Aug 2023 11:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0F59C433C9; Sun,  6 Aug 2023 11:41:59 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCC6AC433C8;
	Sun,  6 Aug 2023 11:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCC6AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5230df1ce4fso4799114a12.1;
        Sun, 06 Aug 2023 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=Sty5lhf/+MyIEk4hwQ9cvBMD8WViZJPDvPtKFCwKiOj31yKv1xg8RNt7qVng+uuxAB
         dF0J+R1WzMezzlkqB6H3KudnW8pfvn392k/vzmJc+BF6eMwm0XAI9JYi8u3ebjqPp4YW
         6nPWSX99BdkyZld9vm3FaE1/bmmc2r5N8d/VXv2A7o00bUBkNjopUPw/htodQjibsRtM
         IByA4tpKN5ijL6QCap/t2vppD4mGMCtkg+7Jl/4q9XFGGS2tUCtlhYEvXF7Ddqrri8pb
         rgQkzkiawXEXsCF2b6/EgR5dtx5G/51BSm3cSDohUepsNi7iKQwA9xvMfRcxifgKNO9W
         Pe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=T0l6gxYgjZwIrBA/zwPHYLE+Wp4z0i8ZhgmqHnDuZTFCwrogqm5VWo/REKVyFDlBFk
         8BTGTIOttxn/dcUnGLYFCNgc67Rl7+QSEUU3igBwKyUKB8ANFcYdTp6YnyB2S4wRuY3L
         Zt52ndhnrcIoyq2uAaJm6ypXXbfePJAadGxmJwsfn9EcwvUr0a0XHE1N5G3PKFbKoElN
         +HqwJA8tsDLTLF4TCbfzwW5oXuVJIasvssKBEb7GilRgLyXlMU7HiVLlwu9xzq3/T2JD
         WwPmdhkouIOwLIVvQn0k1n5iEtElqH4fXwwCol8y/KF8wk11lGcjBIgUNajJdkg84t4l
         c/gQ==
X-Gm-Message-State: AOJu0Yzjl32zzEMZ6PmwHQddjpZLsN5MQVl6SeXStEkZLkD1QLaYnphg
	SMvpwjOr8BarCDWBqtBPkWRcjc8VGNzzCQ==
X-Google-Smtp-Source: AGHT+IHjfr2mP6x5YwxDkuQ5vcpWIDj7BomvgLaOgkchjT8hDOHRAVJXim0VA8pfWmn5GNkEOKAxeQ==
X-Received: by 2002:a05:6402:74f:b0:523:1410:b611 with SMTP id p15-20020a056402074f00b005231410b611mr5851706edy.25.1691322116476;
        Sun, 06 Aug 2023 04:41:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b005223e54d1edsm3785473eds.20.2023.08.06.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:41:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Has him <shiraz.linux.kernel@gmail.com>,
 Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
Subject:
 Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
Date: Sun, 06 Aug 2023 13:41:53 +0200
Message-ID: <5696647.DvuYhMxLoT@jernej-laptop>
In-Reply-To:
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
References:
 <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to sunxi tree, thanks!

Best regards,
Jernej

> ---
> v2:
>  - Drop sun20i-ppu.c which moved
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 4c4864cd2342..4458b2e0562b 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -15,7 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>




