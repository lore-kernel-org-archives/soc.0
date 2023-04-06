Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7779FC7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 01:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37430C433D2; Thu,  6 Apr 2023 01:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD25C433EF;
	Thu,  6 Apr 2023 01:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680745598;
	bh=PFG4OEhZApBHE0ImlIOBqZz2jesMOKmAJVcF4lHhKvM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=incg1uFGOHRa1d+Z+fjX4LOiQi4clu4i2Tr7eVpsaY2uWjbVAnW/bcB0Mh5cV5Mp3
	 5pQefrPoUEMuTRVW9cf/ZoJyJt8p7wQoj46NG8CvElSxBt579qQy9sZbEylUURcWjk
	 qokgtzmByuizf5PrqZQ5QPpX9lH4L9sFQKZtyLe/hFHAJi42m0y6QflNTok/V+bycO
	 QZ0kgS2Hbr1buneOZxXcVg2G11ME5PFc5l8zc9yhQSSzTKUwxqxRhpU2qUY433X3I9
	 gvY8f+Pz8KDzCwLemc+UYGluUEDtYC+QcZrST9w3qCYHrhHk3Z0m5TJeafX5QIdPXe
	 pFzQ3iJw6TttA==
Date: Thu, 6 Apr 2023 09:46:31 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
Subject: Re: [PATCH V5 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Message-ID: <20230406014631.GL11367@dragon>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-5-stefan.wahren@chargebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404080243.9613-5-stefan.wahren@chargebyte.com>

On Tue, Apr 04, 2023 at 10:02:41AM +0200, Stefan Wahren wrote:
> This adds the compatibles for the chargebyte Tarragon boards.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied 4 ~ 6, thanks!
