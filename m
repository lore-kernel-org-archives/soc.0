Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B42F2917
	for <soc@lists.linux.dev>; Wed, 27 Aug 2025 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756300420; cv=none; b=X6L9plB/cylMQEqMPO7Xz7BkFf2vs85yqEJjE87qmiP03a/WfIRgiTCkS/VfzBlzh4oFpn4Vrkp9SALg1JFk1UzvKESWVXnBjCa3AZmpaEa9CrAwfMknjKZsWI2tujxW+GUrZQwAcGLIN62gRS+lygby6qjov2QnmIEYVDS9nD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756300420; c=relaxed/simple;
	bh=eRhLjVe67iKErrxJ74pmlvZqDh8RQqKX7+TmAocxpuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lz6+uc5gU6KBDZz0LSYSw70tlj7XwBOo7qJSSg3CSkOdgA5sZGjnrE1dxGkFECuP270ZzEWGImtWRgN8h/YSD8BTgDuulIqOScMgB0bUvPZnDNleaO28Z6yYGnQFCjbhK407eMtCfx/wMcQdYi0PSuuLtXL9k+FJ+FPdZhiAyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A8SQDFlh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A8SQDFlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756300417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=13LJOrVZbt5/bZNb1010AyPGLHEYUJgw1i+wJLdf1Rs=;
	b=A8SQDFlhg/ova23HLpDJ9MA0tTUa6MHqBg5sTfIbKr0uG8T1O5g5s386O1MWIiK+MG9jEx
	jdyxPWCORr4PHjEN1BLGA5RCFEh+vZAQbeisN6r+XVAlddjSX7W9x6ceb9b1knfkNcGboe
	GDeNSV4DpWUCJxaMGKa9W+avZfmFr4I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-G6yYRV6LPYuUtA9Q2VAYrA-1; Wed, 27 Aug 2025 09:13:36 -0400
X-MC-Unique: G6yYRV6LPYuUtA9Q2VAYrA-1
X-Mimecast-MFC-AGG-ID: G6yYRV6LPYuUtA9Q2VAYrA_1756300416
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e86499748cso248869285a.1
        for <soc@lists.linux.dev>; Wed, 27 Aug 2025 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300406; x=1756905206;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13LJOrVZbt5/bZNb1010AyPGLHEYUJgw1i+wJLdf1Rs=;
        b=hhUY//Hy3ZkVZ3X05/22lIRySMWyfp6+gDpWKmaTB2o19ASvDryxk8j1vpqn25cZyF
         4HhvYoFIc1k6AWzXZbmvwA/5/LBZO75NissaWUW9Vt0Ms1F0ficvt4ymbAX6EkxG1aC8
         N8Mez7Avh6xn+wYC/qwBhCXRqD87xjDGLW62Sy/eRkLw1XSavFFjx2NE3cHDP1uAAQOh
         2EQ8N9ct7Fd5nJRxZd6sK3AxlGMhkDmvlkDBJnbDRIzfCf1jZacQMldg5tPOd7hjeI7L
         3cmZeNG0iVMZV5UG83FHHEM9a9M5WGweSdKN4yVp1bnRfxxWI9FrWb68hk+Qg+K4kn5u
         VOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLd1xEBuIqxer5G9R1dOj1uUeMOufaLqVXeB3jLS91gE2mQmLEPbEIXK3PxrnlDxO6emE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0+3YJkUUNkypGChXEskWv9AaxMbTVQHYQ77+LR6CE74w/ASR+
	Bzd7se12Bt+Be/fsMyLzKGuYu4zkWIcSaX/8RvRV4VT4RsDHY/g0ze5lZJrv8shS2afyrhLsr0B
	GPqkbd0TT89WeHthYMTmm3iFphsTNYwKa1x7X/eoTh7+3zl0VSTNRdA==
X-Gm-Gg: ASbGncs5TQuEOyp4EO81QmGjul8CSr3bwi+hQgnrMzrCw0y5+dFJE+iWBHfBztPwA04
	GnGnhS3/+4drOrbSUlUF5JUrqXSWeLmThXZ9uMaTmVeI7QLsznUSeNfgtO5mV0uTYHid98Ky1V5
	Fqr3Ri34EpIvb4Mxnm/wqjR/C4K36sVA/pGm5jKwVa+TpqPcEAYB4zMLxDo1kWWBNsqG7c8Y1n+
	htMMUalJ5JarZ5CR8healFCAoWflQsnDvyV85HprdTuob5gz6wlb5cFO9620srUVRF5rtfaOY5n
	mCHlInZg4Sf1oRmBEHL0KTGg2OCC6ja0j4I/5L+sO2uKoVCNYL5zqXaSvsqIOpzviFADpNSY+Uq
	MmuslpenjZyVYqBqW6CI=
X-Received: by 2002:a05:620a:7101:b0:7ed:92c8:7d16 with SMTP id af79cd13be357-7f58d941f59mr592251485a.31.1756300404941;
        Wed, 27 Aug 2025 06:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG//kDH7SoWg5eCSBiMLHP3nCnmfnmaReGS2V45T15TfIErjBPeekutHDc1uHZhw0fUtcQytQ==
X-Received: by 2002:a05:620a:7101:b0:7ed:92c8:7d16 with SMTP id af79cd13be357-7f58d941f59mr592238785a.31.1756300403878;
        Wed, 27 Aug 2025 06:13:23 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e10sm885475785a.6.2025.08.27.06.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:13:22 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:13:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
Message-ID: <aK8EbcEHz3Yzpa1W@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
 <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ABjZGCp2uHdXI5m7asmd9dEDEBCvUeUNTq45RmW4K1U_1756300416
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 27, 2025 at 03:09:33PM +0800, Peng Fan wrote:
> Hi Brian, Sudeep, Cristian
> 
> On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
> >From: Brian Masney <bmasney@redhat.com>
> >
> >This driver implements both the determine_rate() and round_rate() clk
> >ops, and the round_rate() clk ops is deprecated. When both are defined,
> >clk_core_determine_round_nolock() from the clk core will only use the
> >determine_rate() clk ops, so let's remove the round_rate() clk ops since
> >it's unused.
> >
> >Signed-off-by: Brian Masney <bmasney@redhat.com>
> >---
> > drivers/clk/clk-scmi.c | 30 ------------------------------
> > 1 file changed, 30 deletions(-)
> >
> >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> >index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
> >--- a/drivers/clk/clk-scmi.c
> >+++ b/drivers/clk/clk-scmi.c
> >@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > 	return rate;
> > }
> > 
> >-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> >-				unsigned long *parent_rate)
> >-{
> 
> I see the point of round_rate is not used if determine_rate is there.
> But reading the code of round_rate, It might be better to rename
> scmi_clk_round_rate to scmi_clk_determine_rate.
> 
> Anyway, need Sudeep and Cristian to comment.

In this case, yes the round_rate implementation is filled out, whereas
the determine_rate lets the firmware handle it, and
scmi_clk_recalc_rate() will later populate the rate the clock is running
at.

I can convert round_rate over to determine_rate in this case, however it
would be a change to what's there now, and risks a regression. Here's
the relevant code from drivers/clk/clk.c where the determine_rate and
round_rate ops are called:

    static int clk_core_determine_round_nolock(struct clk_core *core,
                                               struct clk_rate_request *req)
    {
    	...
            if (clk_core_rate_is_protected(core)) {
                    req->rate = core->rate;
            } else if (core->ops->determine_rate) {
                    return core->ops->determine_rate(core->hw, req);
            } else if (core->ops->round_rate) {
                    rate = core->ops->round_rate(core->hw, req->rate,
                                                 &req->best_parent_rate);
    	...

If Sudeep / Cristian want the round rate converted to determine rate in
this driver, then I can do that in a v2.

Brian

