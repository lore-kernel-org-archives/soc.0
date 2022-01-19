Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E20C433EF
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 20:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49615C340E5; Wed, 19 Jan 2022 20:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA67C004E1;
	Wed, 19 Jan 2022 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642623178;
	bh=KJSjEDxSElYzBdNpJttZBHT8pLoyPOqG8hUFrM9cDig=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=b6CCgWDdgiLDPoxexhu0amovuoGPHQER6/kOb9iu9+H+ZwK+aAUjUNfKGKO6FjbfE
	 xGF+OgcYup29kVNY2wP7p5YVaya2lhSVKLa3qYnkNPaCbd+lnuXkICaMxUPVP33i4z
	 4CmXBPyyTUkEESQqu4EmKfhm95FDxOc0byJUEaXwXQTYxTq617ZiYRrRL6901QxV7a
	 nRkWSXpSv0Xze5P/RF3nnAp38z59xwLhehf0oMREgNmUU5vwmzCrcXRYtbKxi+8AJs
	 h8HnEBHCfT5lMH2Ox0TD/jLjMvmtWkHfLeMAAWHJsrC8gSU9oa7b3hooBhHbUuNTeg
	 /NJ+S2LwR/AAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220118144851.69537-4-alim.akhtar@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com> <CGME20220118150022epcas5p21912423606220552a78c7e22e4133a05@epcas5p2.samsung.com> <20220118144851.69537-4-alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 03/16] dt-bindings: clock: Document FSD CMU bindings
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org, catalin.marinas@arm.com, robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 12:12:56 -0800
User-Agent: alot/0.10
Message-Id: <20220119201258.1DA67C004E1@smtp.kernel.org>

Quoting Alim Akhtar (2022-01-18 06:48:38)
> Add dt-schema documentation for Tesla FSD SoC clock controller.
>=20
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
