Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111E366042
	for <soc@lists.linux.dev>; Tue,  1 Sep 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247223; cv=none; b=nZh0S2wOEwgPPDk3kp3kD/59NTXEMjR70sU/Xyps95UViEbXkxw9hTZ+MvrxiY0FKmsnW/PYkmYdGL3EbpRGeTdna/nsl0lSCeXZhhQ3eh1veUPDTFDTLOe0RFm99fXoMF9v/9ktO8Y9tRDtQ/xFNXrUIC+mGgaBdgorMI226MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247223; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7dR3BtFWpJn4SD/r3Nt2APXQ3pi0gVGDJ/tF7+Hs/tClvYoXplfOEI7NV974MX0UrMkBHmhLDueCTNiGmpWuboYDjxoIRMZPo4HuSGY4I9xDb21B/nM5jHDpDYCssRrBSwfVl57whVrKiYfZ3mezaznDcCKH/p3HIJ/Yc3l2a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52de50e77ffso53613271cf.2
        for <soc@lists.linux.dev>; Tue, 01 Sep 2026 00:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247220; x=1788852020;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=BjqTtoEzLQG1okTpanQST3VmrMpU71B+HC3HVTJ3HM/P6/VmoHtwizWKJOUohAA7V3
         HazPDcXWSRtIbkxNyoMxm9b1LTPiGMrEn6OuYwoeL+hoVMEKzGwAuT7yUejPNwB9/jO5
         oBILgnFvuwNTiheS5IUB3c2lwmjDTlh795vWqH3vQMB6Pr7kk0cpgbKYO4ILrY7jYKeZ
         /bUR4r9b3v3gDACPxVoYPCdgIQE5yS9J/9WPL1H3IVmrm0si9iWXda8WE8prKPVUSGaX
         nDFYeDVPiRSA6pdf2DQw2nthqCmw8/ljO91ctq19IJrD+6JwjOXynAcScLaKaY6z/mBG
         LpmA==
X-Forwarded-Encrypted: i=1; AHgh+RojjsPO0y0KzaxG6LQux+MDamB9JEgubyR9yFEVYW73sl+jTlSzVsWUDhAgdKSOsvABwVg=@lists.linux.dev
X-Gm-Message-State: AFuF++lcnA1fV47M7VG4gjrRhDvzuMy+3TumMnuuOVfj/t29z8eVsgVz
	oq7i753aXNhzTsLWNqgjGUzWovKHAmkIiVWYiE270McnNxlHYRkrB2buT5DMRWv7
X-Gm-Gg: AR+sD135fIWGUtoVyQDrTASHNmfC3SsB/DQxul6ykzCozxv0J3zyvcR6YECsYQ7tJ62
	yC6ncHMFa2Ei2ui3mSV39gJV7xKOMFYvLjxwiD3SxknbOMLrIrXyKMrgOcnf2XMv3o2DZitNC1/
	t1ks1Bcx/nM00n8VgRNLjpR/U7zk0dNKZD0Sly2aiT8X0/QrPftA9xNW9ZRF7hMHa2erRcUG8Ur
	3VyOYEx4cuZAYtZO+RoXNbGp+zdhfhQTD3rUV3HCFrSJYJSI5sM9fgbf0vZl08d5+eMZygl7s3t
	URx+lbT6m6+pHIOvOR8g2/wKj2WyEtF9cOfwXW6/YNJa7EZgwnOkM50l/2wEeGgwTjCtfFrv9Go
	nJDYxyZVybbCg/qLu9My0DRxnMuZZtZ2ecLpuSEv/HOqc4Emop5RAtQXNPQJ2ydKvLbNOMI8+d9
	PNvqHXZUlsrCzm3zrbaTe5MFD6Nxi7iKqLj4x9G7fk8guy5WbPY2LU2FM/5Ehv5/6nf2zjZZP8G
	KN6GDXvWP2YD1xgMlB6T7bmGQ==
X-Received: by 2002:ac8:7e8f:0:b0:52d:771a:23f1 with SMTP id d75a77b69052e-52fb93f2ed8mr384057401cf.14.1788247220434;
        Tue, 01 Sep 2026 00:20:20 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe5495easm89161441cf.2.2026.09.01.00.20.20
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:20:20 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90e7fd978beso42139216d6.1
        for <soc@lists.linux.dev>; Tue, 01 Sep 2026 00:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0L8+B/lmCmPHnAlaNR5rlNuQE0DGyDLHVNmAth8lKbQLzJW70eHYbnLdaBgaGx6OB9WI=@lists.linux.dev
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
