Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73815C2B9F2
	for <soc@archiver.kernel.org>; Sat, 22 May 2021 12:37:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 18EB361164; Sat, 22 May 2021 12:37:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 270EE611AD;
	Sat, 22 May 2021 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621687063;
	bh=hPvJRi/4YD//sBf0sK2WpeQ/WH/A56zewUfTgUKlz2A=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=IvFmp7nItbd2K2+6CnXqQV9F6k84vHhKy2yVJXo8PispX5scQ/sm9qa5S6zFaMjcn
	 wFO/b6dVJGhEd4AI/UrP3kZQ1ztPepcsIW+zfcv8i5TI9adNT7a2GhLoZvPbUzCJxU
	 IU5sJfwuMnqdNptnfJRz8g1106qxDext6UbiP8MoXGtvao/1Bch89fueP4P29+gHm1
	 qv8bfMEVSJMKLyfKPPMaFlrHLC0KShmET8jiqD/3TtZXGgVMfSVDapys1giEQ1Pw2o
	 PugVh97noHAb/PwnmgXTodZ4NYh0f23xJQQdOpwmzhFzph966LF+Q8HL+RxDFYuIVC
	 ptwyfaYuuEAaQ==
Date: Sat, 22 May 2021 20:37:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: imx28: Add DTS description of imx28 based
 XEA board
Message-ID: <20210522123734.GB8194@dragon>
References: <20210518142857.26170-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518142857.26170-1-lukma@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, May 18, 2021 at 04:28:57PM +0200, Lukasz Majewski wrote:
> This patch adds DTS definition of the imx278 based XEA board.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Applied, thanks.
