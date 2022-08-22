Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D069CC00140
	for <soc@archiver.kernel.org>; Mon, 22 Aug 2022 02:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F8ADC433B5; Mon, 22 Aug 2022 02:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B94FC433D7;
	Mon, 22 Aug 2022 02:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661134981;
	bh=5yqVwbPJ33WjkzJ5n5n+u2pk3p3AGBZJWxOpjwMlZtY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ENx3NhwSNZoX7mdRdkEsoDTcuQCfONQvbxe1huDuIbgfGDNd9eVozkhpi4ilJMAvR
	 86TM/3gxKYUCeamx5IujQB42dfCr4gfEfp5tK0KiZ9WEka1U35LtE7IhmVkh/Bwpg9
	 vUxodFj+ZQkVZOu/OkRh7mGtAsPnAxovVd95Gim0LCKwqMFY3OQkAvaqpvqi80PmbO
	 L+oAeUjEhgIuzr3DOm3UBQ2Qxy6MJ61mVutN+ApTXLDp5vtVz9F5ESzZlQLMKoH9r5
	 QFub2FsecI7q+gO1Bmw0tXW+bvY9eaLQswhuabCwiiSt2TOSNkzQAoWCr0LhCG3cPd
	 18bPCIyH9flPg==
Date: Mon, 22 Aug 2022 10:22:54 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, soc@kernel.org
Subject: Re: [PATCH v3 0/3] ARM: dts: imx6ul-kontron: Improve devicetrees
Message-ID: <20220822022254.GN149610@dragon>
References: <20220815082814.27651-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815082814.27651-1-frieder@fris.de>

On Mon, Aug 15, 2022 at 10:28:09AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This series contains some simplifications to the devicetree file structure
> and updates the model names, compatibles and devicetree file names to match
> what is used officially by the Kontron marketing.
> 
> This is a somewhat breaking change (for out-of-tree devicetrees that include
> the SoM files) but it reduces the complexity quite a bit, makes things easier
> to read and lets people discover the devicetree matching their hardware more
> easily.
> 
> The first patch also updates the bindings to match up with the changes applied
> in the following patches.
> ---
> Changes in v3:
> * Add A-b tag from Krzysztof (thanks!)
> * Improve diff for patch 2
> * Improve commit messages and cover letter
> 
> Changes in v2:
> * Also rename compatibles to get rid of N6xxx notation
> * Also rename devicetree files for consistency
> * Squash model renaming patch into patch 2
> * Move part of Makefile changes to patch 2
> 
> Frieder Schrempf (3):
>   dt-bindings: arm: fsl: imx6ul-kontron: Update bindings
>   ARM: dts: imx6ul-kontron: Simplify devicetree structure
>   ARM: dts: imx6ul-kontron: Add imx6ull-kontron-bl to Makefile

Applied all, thanks!
