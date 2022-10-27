Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE35ECAAA1
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 23:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4941EC4347C; Thu, 27 Oct 2022 23:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E68C43470;
	Thu, 27 Oct 2022 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666912230;
	bh=DJtlW8R7X3gH07Kyv1IwYCt6Y62ulGrlHHPtXSse2F0=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=QE7c5uQNVVImJ6L/uYRiqD8k2KvcV6ojt3/Ny/IfnNmLEYlFzwqQ41ThiAoPnRyEs
	 jVKq5ZrDm3QczAJ0odJqpYU7XrLGMWgpVkxOJZSjmwS0C+tHdlfapRel6fwXvaAZ8I
	 7FJ1V/haBz2PpztIl1RQrYjtRN6dOWGdc6uLJ2lBDUe3g3fDXvXxp9uaJmkeblp22q
	 nmN4nMZVPDbDz4M3LrlywuZ5WsA4Y2ejLVUoxz9oS5eFqAC9N1NNtxkIs+QS9kQ5mA
	 P1Yz/K7ZyAxJQPzXk4182ery3e0UQi1H84J/J+1zffWG5LgIpc4QAJ+fHqCLgD6IZA
	 uzlTZ2nyn2diw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221021203329.4143397-1-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org> <20221021203329.4143397-1-arnd@kernel.org>
Subject: Re: [PATCH 01/21] ARM: s3c: remove all s3c24xx support
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>, Arnaud Patard <arnaud.patard@rtp-net.org>, Christer Weinigel <christer@weinigel.se>, Guillaume GOURAT <guillaume.gourat@nexvision.tv>, Heiko Stuebner <heiko@sntech.de>, openmoko-kernel@lists.openmoko.org, Jonathan Corbet <corbet@lwn.net>, Alim Akhtar <alim.akhtar@samsung.com>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org
Date: Thu, 27 Oct 2022 16:10:28 -0700
User-Agent: alot/0.10
Message-Id: <20221027231030.19E68C43470@smtp.kernel.org>

Quoting Arnd Bergmann (2022-10-21 13:27:34)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The platform was deprecated in commit 6a5e69c7ddea ("ARM: s3c: mark
> as deprecated and schedule removal") and can be removed. This includes
> all files that are exclusively for s3c24xx and not shared with s3c64xx,
> as well as the glue logic in Kconfig and the maintainer file entries.
>=20
> Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Christer Weinigel <christer@weinigel.se>
> Cc: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Simtec Linux Team <linux@simtec.co.uk>
> Cc: openmoko-kernel@lists.openmoko.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
