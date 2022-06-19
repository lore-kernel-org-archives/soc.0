Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF162C433EF
	for <soc@archiver.kernel.org>; Sun, 19 Jun 2022 08:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEE78C341C5; Sun, 19 Jun 2022 08:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76EDC34114;
	Sun, 19 Jun 2022 08:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655626338;
	bh=FfPNOR5fF4DUco8uUF8DVNhZrBSfCQiITKG10Lq8r8o=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=twGYGDrQQ207wM81Nok9wPcCy+mWfPjNP2umToVAylwud1puPHGMMokRLiIPwPeXU
	 V0wIylzyRr6Y+YTs9tFRChE0er1ZZp8Olcrq2MWJ3wRQf2Pj8LUCDfB8bvxuR5twzp
	 j8ShIkoiCv3htN5PPIoDdf1VFowax6QtWlPYS6A08OncRDFpb8MUpsbuIG1BImS2G4
	 Lo7WBVNGia1LXlkHJz894XlXIs1kj+uBGILdZy9vEPfO68d6PJyM7b6jBHpDKcnP0w
	 GAcYYBQuPiQIjuTIID4nyqIxgR7A57/OgYnl1LY5eYTXNDII5IoYJm8OyJNqzMCAcy
	 No/U5ZJLAtlNA==
Date: Sun, 19 Jun 2022 16:12:11 +0800
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
Subject: Re: [PATCH v2 14/48] arm64: dts: freescale: align led node names
 with dtschema
Message-ID: <20220619081211.GI254723@dragon>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113938.380466-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609113938.380466-5-krzysztof.kozlowski@linaro.org>

On Thu, Jun 09, 2022 at 01:39:33PM +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> with 'led'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!
