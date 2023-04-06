Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0BDC7619A
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 01:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0FE04C433EF; Thu,  6 Apr 2023 01:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8584BC4339E;
	Thu,  6 Apr 2023 01:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680745673;
	bh=9WbDKZosrCXTsUtAQGMZgcJi5OcwU1MrdsRoFKjgStk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=AgkT8B61lJddYqRem5134nPvt7nDy9IhYfhL2HEsSikV3iTxHH6VfoiimRqwo4ln7
	 kVu9rnnYT2kkJQTWZYB9qCf9SRlldF9QbyPOsSDW80VouVklQKGN7A388gHXs0ztcg
	 9Lr+XdWcjIvCg0L37CnaBdheG/hBR+cSNHLeJv/seWkNx8tRbcd3gECKJZwZ/tfjon
	 /02qbAqxqYebbqNY7gHddlJWOkXXo4k0PwXf5q0anLxUxfxprO4mK3PQe0cL4EfKWX
	 Po297A6wejnge6QAPEV32f552Y4sQRU98jzQI4UZEAv214xStqT5B6MbNwn77iP0N6
	 6XWZUlLPj67rA==
Date: Thu, 6 Apr 2023 09:47:46 +0800
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
Subject: Re: [PATCH V5 1/6] dt-bindings: vendor-prefixes: add chargebyte
Message-ID: <20230406014746.GM11367@dragon>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-2-stefan.wahren@chargebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404080243.9613-2-stefan.wahren@chargebyte.com>

On Tue, Apr 04, 2023 at 10:02:38AM +0200, Stefan Wahren wrote:
> chargebyte supplies hardware and software products for all
> aspects of charging communication.
> https://chargebyte.com/
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!
