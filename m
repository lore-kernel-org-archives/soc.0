Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A0C433F5
	for <soc@archiver.kernel.org>; Sun, 10 Apr 2022 07:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 858E1C385A8; Sun, 10 Apr 2022 07:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471FCC385A1;
	Sun, 10 Apr 2022 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649577241;
	bh=CnljcEfeGv6kiF5RGKoE/v2GQGrbyzbiibv+p3fU6HE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=CLHH4xgLau8AZNbP1lYd6OgjFsgi+tCEW937dXBsEtG7yK/b/8wj/JsXhspfY/11m
	 lgBTFUM7tp+WYo93HDeaEVlcEfNtJ/kw070t6EnSonUtalgiBvx/KISU1SnbhkeaDi
	 atBykS6LnaEGR+5lx9E56sP4CmZTQwQniMiTm/i6c6Fx1nfTIb6yp/P1HmpzzR4wBK
	 QG75k3h8F6Vy4NsTByziolrgSbeif9lPLKpq0MXAwhDoIcu8Tbjs857aSIpsbSVvA2
	 AdA/RBOqIT5yreJHcgB4mjUdEfJN4SAd25Hpkn75KZAOm7DwCOKoHf4xNt5ddJ9LbZ
	 8q+IOJ/f0sY6Q==
Date: Sun, 10 Apr 2022 15:53:55 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mingkai Hu <Mingkai.Hu@freescale.com>,
	Hou Zhiqiang <B48286@freescale.com>,
	Wenbin Song <Wenbin.Song@freescale.com>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: ls1043a: Update i2c dma properties
Message-ID: <20220410075355.GQ129381@dragon>
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
 <20220326042313.97862-4-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326042313.97862-4-singh.kuldeep87k@gmail.com>

On Sat, Mar 26, 2022 at 09:53:11AM +0530, Kuldeep Singh wrote:
> Reorder dmas and dma-names properties for i2c controller node to make it
> compliant with bindings.
> 
> Fixes: 6d453cd22357 ("arm64: dts: add Freescale LS1043a SoC support")
> CC: soc@kernel.org
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>

Applied 3/4 and 4/4, thanks!
