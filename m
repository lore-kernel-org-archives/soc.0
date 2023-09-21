Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FDBE7D0A7
	for <soc@archiver.kernel.org>; Thu, 21 Sep 2023 20:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63133C433C8; Thu, 21 Sep 2023 20:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4955CC433C7;
	Thu, 21 Sep 2023 20:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695327255;
	bh=yYs2CgKb9n+7sBl8yvTJuVlELR8rdX7wS6kuW1trsJU=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=IdhwwAeCeL24WM9IvgLLVGcgMKf+GGzxMy+eQJtf4cGq9HVX3ihxTmpn6DwNO/ANy
	 uYmrt5q/iPUDUX+7cY8Q0Ot7x3M2e+KM1EkU+UCKdEzSPiySdCbfhEfxznjXpE8GsN
	 2Dzq+gK7NTH3FZuDdbM7Ok+SlbtkcfnerAoB0lxf6QdyISIROVk+bGMAOxy9eup3nJ
	 S0MPoHWBTFF5iZyb3mrp22/ZsvPR8FBvWcBVOLP4xJ9DQ7h5HINjTCDvu+rM2VliST
	 Tc79PGZ4WtFBzIL8McY6GcIxIeyKs3YnEbKIag/ZQrdx3amCHHlaI8syuVy/h0R3ur
	 yrSDIJs2pV5AA==
Date: Thu, 21 Sep 2023 22:14:09 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20230921221409.4a01f541@thinkpad>
In-Reply-To: <20230921214541.0dae4d62@thinkpad>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-4-kabel@kernel.org>
	<CACRpkdY8GcDYEDg=w4_ggY7O7kj-_X4ejpXni-t8M3yMivU88Q@mail.gmail.com>
	<20230921214541.0dae4d62@thinkpad>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Sep 2023 21:45:57 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> I could use ffs(x) instead of ilog2(x) + 1.

Pardon me, I meant fls(). Or maybe get_bitmask_order() from
linux/bitops.h.

Marek
