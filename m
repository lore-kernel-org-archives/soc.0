Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290BC77B6E
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 08:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DD73C433EF; Thu,  6 Apr 2023 08:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9311C4339B;
	Thu,  6 Apr 2023 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680770116;
	bh=Zkl1SAF2jiZ0x2hUitryKkJuiooLlMB7T1GbAHUkwIU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=l7AZ/I8cPIbGh1CT2SKy01cccX6FY6oftd+pIRdrPbcnBs5gbwqdELeu59hdHKfsp
	 d8QtRsD8MEgj/ArdFohdlf2xgytQjRtqVxzHweqyhYU4jmvyzoFuzfL141nu/56RpE
	 t/7gN7xNe1w5DiNo1/0GFJQvxHl+NYs2yWIVkFk87OKNXGNembcUYyVik6eCYgyIwx
	 XgcTb5CxRd3E+tbgfXOJDCxiAwsHFH41GZPazPXXE28vSJ9YJLOQ/Pfjd+phNOi52x
	 ngTUJz9ol+cwIP8+zTCRlaalQ1ar3MNGJRwzu/OAB1F6IWX51WWc2hmdCS4IX03ATO
	 zywOREMbjIMkA==
Date: Thu, 6 Apr 2023 16:35:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@chargebyte.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V5 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Message-ID: <20230406083502.GA129227@dragon>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-5-stefan.wahren@chargebyte.com>
 <20230406014631.GL11367@dragon>
 <ea67b952-d94b-d7c4-e4d4-0e8d9daf1f08@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea67b952-d94b-d7c4-e4d4-0e8d9daf1f08@i2se.com>

On Thu, Apr 06, 2023 at 08:57:01AM +0200, Stefan Wahren wrote:
> Hi,
> 
> Am 06.04.23 um 03:46 schrieb Shawn Guo:
> > On Tue, Apr 04, 2023 at 10:02:41AM +0200, Stefan Wahren wrote:
> > > This adds the compatibles for the chargebyte Tarragon boards.
> > > 
> > > Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Applied 4 ~ 6, thanks!
> 
> thanks a lot.
> 
> What happens to patch 2 & 3?
> 
> Who take care of them?

I guess the patches need to be applied through w1 subsystem.  Greg seems
taking care of it from git history.

Shawn
