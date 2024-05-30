Return-Path: <SRS0=JNsn=NB=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EBAC25B74
	for <soc@archiver.kernel.org>; Thu, 30 May 2024 10:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4E08C4AF07; Thu, 30 May 2024 10:46:39 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3946C3277B;
	Thu, 30 May 2024 10:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3946C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b80e5688aso455501e87.0;
        Thu, 30 May 2024 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717065997; x=1717670797; darn=kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz3V9iZ9GUeS/4lYsW1iAj8Ti45jGQbQe9Z5iScKCj8=;
        b=Xj45OG5fvT4ziEKIsCMtmmU4UxiQ/bvf6XLzB2f0NsPY6DwyQbwhnY40ID7pGx9gL/
         KyBMgUez25Zf71p5bx96yX/SGsBjB0xpsm/tIz2xSex5PElt0Y+tJofrBkpdFDxISjRK
         0cde7vacJ4fA6L0lgNhKYN8cRQsWrlJBigTuth03uUQthcKSC4/WKU+HirBjOTPyA11e
         EIoOED3zDXy4tUO9VWiPvwmElSgcG6TQG/lA1ZpsR5FuLkmQ7yQ/3yZ1RNQTQsbKN/qQ
         E5GhSrGghzoEmxu0n165ak/EDVrtnBzxtn9Voz6FMNCOfJxvQEw32o46a58b9JSiytkF
         6r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717065997; x=1717670797;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz3V9iZ9GUeS/4lYsW1iAj8Ti45jGQbQe9Z5iScKCj8=;
        b=K0ecCY4CjffrQwmVfU624D+3omAVd9eRmRI8DnctJVr8HLvAx3AdGV9YKJ8qrbYZI8
         ApRPa2rzsbk0zLNs31VcZ1kXOx1IS6PWnVvd3cL4naPx+CAnejBp0LYesY/s8QAm5qv0
         l0lKYnAwplptl5rOIt+YRqSFmNTgC0ucF1pXvMkcn0d9CMqvkC1FMs9ZAkVq8txxwluY
         jkrNtQ6rpWsuE6f/KbhRq1kCt96n3UET0btcmIeMHB35uEp2JW0kzR5Eoe/+dp+iNnPe
         QHo87JpClB5laQLHvX3dpqTBdlfeBLtaWT8HXQly+bp9y7yCagbTNmarMCAlfp4HOCdn
         GFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUt/d2UMzf/msS4gNRNFxdNT7w5D16gwpPYa2G9PD9zCGGZ3HG0dZBWAYXxsWuzdOQn4o+he61mJBLIlDSBwsEic53Vsj0bFGcTgGvsuqC9ykmsLpVUojjZpKWL9voG61hagz47Of1N/nq6PA/k5wB6ydHvwsckFsyC9ghBoDU7c9msKwOqp+kTfHeVXyTav1o8NjdTHoKSyWV4xJOKSrNdqfE=
X-Gm-Message-State: AOJu0Yz02ajfhJOEZrHnGT/Cv+Xeo9YnuFjiY4qi4kGQiRHw9eete90e
	gXkI8KdV8SejIm/EKTtNcTRBr/LtN4xARPK2ln53xFXf+UZ/rlr3
X-Google-Smtp-Source: AGHT+IF8HtLfN2jy2u5b6qrXpWEdw3o5ChBVoUHw6Bx6hyhWP9jrTNwrZOX6TBLkr1VZDWVNaz6SDA==
X-Received: by 2002:ac2:5979:0:b0:51a:c3b8:b9cf with SMTP id 2adb3069b0e04-52b7d4b1c97mr1485781e87.69.1717065996469;
        Thu, 30 May 2024 03:46:36 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9376dasm807478466b.54.2024.05.30.03.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 03:46:36 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 12:46:34 +0200
Message-Id: <D1MX3G6VN849.WKRMI0MU71Q@gmail.com>
Subject: Re: [PATCH v2 02/20] pinctrl: tegra: Use scope based of_node_put()
 cleanups
From: "Thierry Reding" <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Dvorkin Dmitry" <dvorkin@tibbo.com>, "Wells Lu" <wellslutw@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Emil Renner Berthing" <kernel@esmil.dk>,
 "Jianlong Huang" <jianlong.huang@starfivetech.com>, "Hal Feng"
 <hal.feng@starfivetech.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Viresh Kumar" <vireshk@kernel.org>, "Shiraz
 Hashim" <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Patrice Chotard"
 <patrice.chotard@foss.st.com>, "Heiko Stuebner" <heiko@sntech.de>, "Damien
 Le Moal" <dlemoal@kernel.org>, "Ludovic Desroches"
 <ludovic.desroches@microchip.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Dong Aisheng" <aisheng.dong@nxp.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Shawn Guo" <shawnguo@kernel.org>, "Jacky
 Bai" <ping.bai@nxp.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Chester Lin" <chester62515@gmail.com>, "Matthias Brugger"
 <mbrugger@suse.com>, "Ghennadi Procopciuc"
 <ghennadi.procopciuc@oss.nxp.com>, "Sean Wang" <sean.wang@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Joel Stanley" <joel@jms.id.au>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Tony Lindgren" <tony@atomide.com>, "Stephen
 Warren" <swarren@wwwdotorg.org>
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>, "Peng Fan"
 <peng.fan@nxp.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat May 4, 2024 at 3:20 PM CEST, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 7 ++-----
>  drivers/pinctrl/tegra/pinctrl-tegra.c      | 4 +---
>  2 files changed, 3 insertions(+), 8 deletions(-)

Looks good to me:

Acked-by: Thierry Reding <treding@nvidia.com>

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYWQsACgkQ3SOs138+
s6H2yBAAgeFKUkMlk3cWjVf9KNcypicIrr3j8r7LwohalNat613qoJ9YbzqqhwI4
Gz6WRZUeiS7foiJu4a7gpc+lM2BsBe1fH2Qp8quSuXvd3qUCG7X5x3lf3NKsgqTY
cXTyByotLJvYp5A/oUqWp1lwEyHec33GjJhuUzl7SD/HXun7zOdGWkBDonQJBlLj
Bs5fE7wt9ekYvMAU7EHBDbIg10fvay+qWs4EJoqxhFgSgnmFSK9NrRZIW8IpWcU+
AYMf2SPzWXdNPHij0BrXcWhV94d+XhSjSk1ERGByH2AOAr9WJ2YtrZm/W+7KVHXe
G/4DE+Ss2wpYr6d4kAVn9GEDwH21w3DBKY38Ah/0B2SE1Nv1LXdaPD2m4SiNSIMb
X55kEyxnrVPM9TTH9LlMKeJBwUDqohmQ9vYKDVuTVGO6Kdu3fc8euMIjCaWW7RkA
lbmgGT83eBp279Bw72mbM83wtPgVvBY9ufV0oy6Ox8cY7D0pDOFCCxLhxYld7XT1
7Sqg9E9rNlM/OX0QBFtCqcx/RtAY6ILPMioWUfFOS6FX8JjA9hviTvPYGNrSdvRl
ZC6LcNmGEY9OjNMxft3NCl+kjz3fkiYyd9UglVHjAi+q4odk2HFwg93bVAEC705u
xsy5uZQ96h1OIwzr643CV9p79G4CjuxDndqb4RfPWrnW3Dkw0iY=
=tJx3
-----END PGP SIGNATURE-----

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11--
