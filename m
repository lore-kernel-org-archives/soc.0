Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C051C43334
	for <soc@archiver.kernel.org>; Sun, 19 Jun 2022 08:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F83AC341C6; Sun, 19 Jun 2022 08:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C97EC34114;
	Sun, 19 Jun 2022 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655626250;
	bh=xLobcLYhlnB02auCNvQWbIct1oEzoYxY7nXKXXx11lI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=bPnpevDkmluLxPexgeG/8wQOWebbsY/bGAbgKgNNKLx9whWhcgOzzU0gCydJA77mf
	 bI71Td7F67TeuphkIYPZ2QW/Ax6Rjy0koPXBxPKVJ9papHgfsT09MDjSe829IpqebM
	 l9bvc7f5HanXqv1U2qAhuhNuB5uMafu6x4GjnJ/KNPzxJCgg5z+303cYqzt5Qi+TFU
	 AI48puaNIhu6c7sJZmJ1kfMHeGHSV7DqhMMXTJo4wW/R0+O8CZUQKLd0Py8Wz5Nalt
	 bqLtu6TKMVL+sgH0URUYYO+jNq1GAgbPQDwly/dm+7WToGf3OCDCq56RHS5KGjA3sn
	 h2CiM5zWXXsGQ==
Date: Sun, 19 Jun 2022 16:10:43 +0800
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
Subject: Re: [PATCH v2 13/48] arm64: dts: freescale: align gpio-key node
 names with dtschema
Message-ID: <20220619081043.GH254723@dragon>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113938.380466-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609113938.380466-4-krzysztof.kozlowski@linaro.org>

On Thu, Jun 09, 2022 at 01:39:32PM +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!
