Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C374FC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 20:21:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7E59964E30; Mon,  8 Feb 2021 20:21:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 502CA64D99;
	Mon,  8 Feb 2021 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612815699;
	bh=wHZAc6RD+HIapiTCbWnMcMywc4VHz+Gf/zCW2JwA9Mw=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=j9lniCF7i4kI4J5dnmYjuHq8QZHM9GIy5LLGakaxXgHuaVnBsuLNgEFXN7WCThjdH
	 IYRdea5lnUM9dIm5oipAYG3s21LAWaoZ6MnCdaR8ry87XuG/vpslJusjBB7TggKEjb
	 AdVPj/w6dGcwmPTYmxR3yi+1S9YaSb99QBoak0zLR1oNIrOrSnLMu59zJFuw6TcWeA
	 hDI0BIQrcfRBzUg0e4Mdi0gfoe00MbkQoz40f8c8TcFkFrhe5Mmhi7WFvkMcc2+J9G
	 5KaFd9MW1D8ATI+D6KkP7ckySD3sG6+Njs0lFaT7G+x2iXnw/vNsFn1B31Ba/yNX2o
	 xLqMbJLp4xtuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114151630.128830-3-u.kleine-koenig@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de> <20210114151630.128830-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1 2/7] clk: Drop unused efm32gg driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-clk@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Olof Johansson <olof@lixom.net>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 08 Feb 2021 12:21:37 -0800
Message-ID: <161281569793.76967.2912654712529822778@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Uwe Kleine-K=C3=B6nig (2021-01-14 07:16:25)
> Support for this machine was just removed, so drop the now unused clk
> driver, too.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
