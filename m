Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07623C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 07:53:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D68B66101B; Wed, 14 Jul 2021 07:53:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B21A06135A;
	Wed, 14 Jul 2021 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626249237;
	bh=mbg8J04ooRjG0u3tte7rd9I7gItkVa3cKltqn6+sYtU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=LEEhUn5SITGAuBD742pvd13yGfnNLi75bv7N1kFLPPfEhmJw4uI/E20LU7jad88JH
	 QXxqFXIByrVTNuXmWQQ9Pp9DV7kTCUud+axwi08cDTgwtbLSuP6GvDzkmRI9GmiiXJ
	 He8JI4u4DFPynnXfUlbNvHJya8staP7dJtVmmkbaC2k0QEr0XBClu3DU62vCbxlGo7
	 CTGsLMWe6i3O/16GN0Et+3b8+UuzpiGfFu8EkRSx/rtiloERuOFoZBxpWpQKZ41Vk+
	 tuhLdocBEDs9g3cHqb3YnHkssBziunPcliWii5BnP7rU6eoKdfAKNcOAba63p9i2mY
	 FIuacRQvsdLQQ==
Date: Wed, 14 Jul 2021 15:53:51 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add SolidSense boards
Message-ID: <20210714075351.GH4419@dragon>
References: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sat, Jun 19, 2021 at 04:55:26PM +0100, Russell King (Oracle) wrote:
> Add SolidRun SolidSense boards.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Applied, thanks.
