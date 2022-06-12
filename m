Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA700C43334
	for <soc@archiver.kernel.org>; Sun, 12 Jun 2022 03:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61143C385A2; Sun, 12 Jun 2022 03:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80101C3411B;
	Sun, 12 Jun 2022 03:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655002925;
	bh=AT2ZB7CiBFkj0hlqmuddoqZT/t4mdO5rqZJ+bNtoR9o=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=T+OtSECZ5gIevRRVJRYhFyN9lHO+P5M/T0kJPMo6NV7yuhRsZxVbJ+DmYdLHfAZn0
	 fdITxCHWReNnq9Sxv6FDOYWwJL8vc7/cMNkpRPrM5EsHlP902pO9eHWitIXpmBl9yB
	 yTHK4/BWrAfUdMkUDcFe9oV6FmonmJd7CSHu5gvM7YDUl9sTNHyIQyIWRt0vfqcgyL
	 Bq1pn4o00Kbw/eYIWoFXux0SdTtfGYC2HdtKKRt2PbQ6IFSbmsTeuuO+wfC79LLcYD
	 enCAxAJwn6HYPh7SCTRI9kuGkTKYz1Intrcmm84+dUzSPYQixy4Lhaut07Ob568kAH
	 4qGR2QCgdkaQw==
Date: Sun, 12 Jun 2022 11:01:57 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org, Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: fsl: adjust whitespace around '='
Message-ID: <20220612030157.GS254723@dragon>
References: <20220526204258.832179-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526204258.832179-1-krzysztof.kozlowski@linaro.org>

On Thu, May 26, 2022 at 10:42:56PM +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!
