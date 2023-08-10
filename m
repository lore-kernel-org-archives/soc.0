Return-Path: <SRS0=8sTx=D3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAA1C001B0
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 08:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56398C43391; Thu, 10 Aug 2023 08:19:20 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37213C433CA
	for <soc@kernel.org>; Thu, 10 Aug 2023 08:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37213C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d4b74a4a6daso591861276.2
        for <soc@kernel.org>; Thu, 10 Aug 2023 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=YAetKf4q0nZa/dO71z7++J7KKpe1E1CC7O3ahafQ7APpHv5jmvyn5BBv2mwDpYC5is
         aCqkyV5eahWJcbkNVk0H4ZuATN+jOIeGgJTiNul2i5t9tXVMigNJA6VlxX/a8OMvNSIA
         YaLs/IE+usEOobqLkPYKtN3CknTSd/aP7iBrjDMEftqOkGi4Hzn8W27JugL/elhtZAtS
         lvN5G1ptPirqDO85jdOp47BWA9MJm/z4Kcuzuh6yVL2pnLpcF/Uw4mERq/Siv1vZ2eMQ
         WGKJAkQHqeDReRN5me9rxTKini4wIOwCZjirxG0wunRnpyvqVfZs1EDQzXiZjCK8xLxA
         VFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=AQH0NZHA7xToM6xiJ1zElLx6OyBPUhxHQXWlHOGViopMHKrZKHwOOuR9t8DRL1bZzX
         Zts4Cr1Y2WW8i/FuCUce717hl+ihBJAi1xLUqrZ+7P5kEApg3nS0WEYyzfigHz3y+p1i
         1MitmEFWEWFFyy9caKr4VFnjgUSQOifWp0S+AJsOeER3q1mWZpsZAx9qYz+aLni+FvAX
         TTvLNRtwVMOOCoZPUfmUBWOy6ELOunQvmUePo8M/xRYt33pUFRg2SG/2I3eHYeBRiCWv
         VcJ3wHwYMwi1GaSsPFp5V8Ca+L1SwTCS9E7t5o+6hM9CyjwKx7JVRuraLG1SqKK+Znhh
         bcgw==
X-Gm-Message-State: AOJu0YyFebxAe7Y1eIpm5wH+EyqRQaH6hooomG2fCQW30R3eq5QeNK89
	cY0hSsWurcdPtp+3tuo0j0wmXo8qdz2Bm7DLc7bzPA==
X-Google-Smtp-Source: AGHT+IG5aWoH89NQGXx33HlD2q+rxamc3JsaObqeeE5H8gH+u446bjvEEFYnXEHJg1VQn5y6v1yXRNGsOkfTWSlQZaU=
X-Received: by 2002:a25:d711:0:b0:d1a:b59c:502d with SMTP id
 o17-20020a25d711000000b00d1ab59c502dmr1894292ybg.18.1691655558135; Thu, 10
 Aug 2023 01:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org> <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:19:07 +0200
Message-ID: <CACRpkdYsdKCrQpfoXZFv1XqT-o1skX=TDY-WJ1CSpgavMb+UrQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] ARM: versatile: Drop unused includes
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Has him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 12:43=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> Several includes are not needed, so drop them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
