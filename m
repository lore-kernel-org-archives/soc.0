Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E790C433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 16:45:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DEBF1239D1; Fri, 15 Jan 2021 16:45:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4CF523998;
	Fri, 15 Jan 2021 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610729116;
	bh=n5nWNb65mBT/5pragNHit/Cu76jZv24j6uy/xmwMC2M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WfT3BidHoJh3souo9FmJhV9id547o98MWz+0wVv2RGHOd+Twbr/9GjZHd0iO0HWzN
	 MCvspZk2JLCEEQUxgfMNgKqb38wraKZMmFh0DFdsWklLTz6+K9srcfcrUpHj38ISrg
	 Y+LaQJqlCMnv3zQb30sPf59D6ht0cCMFECXGKptQ+H+9eKjdExeE4jSNA7p+qyz0tI
	 DX6y4cSDsC85oS9gCmztKbN2U8/HvZSAPhO8haLDtDF1e4EpNS+sleZa7vCKPXiXT5
	 5Be8csvGhBERRsqx5hRdP2zJIVLn27s5Ad6pwcznqZLntyHEbRji3myjYnG80DUG5w
	 X0ZQ4YB7WXnng==
Received: by mail-ot1-f52.google.com with SMTP id c18so3323195oto.3;
        Fri, 15 Jan 2021 08:45:16 -0800 (PST)
X-Gm-Message-State: AOAM532QjpbOEPT9xa0LcXZbk3aTB8Cb5GsDW3UYesdDo0Dini3M0S4c
	8+CKR0H7lOwqee8TVKIsFw+pPNzTjHxgD7vQu48=
X-Google-Smtp-Source: ABdhPJwj1a8sfU7lNr6BdJzuh8m5nDjFFYrToOtW7RuAgCpvAzyVv1vParB/4ZilG+PBWJXWZamXlsfQhwrf5tYzqy4=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr8927159otm.305.1610729115945;
 Fri, 15 Jan 2021 08:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 17:44:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
Message-ID: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Remove ARM platform efm32
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Linux I2C <linux-i2c@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 4:51 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>
> Hello,
>
> compared to v1 (Message-Id:
> 20210114151630.128830-1-u.kleine-koenig@pengutronix.de) I did the followi=
ng changes:
>
>  - add "serial" to the summary line of the patch removing the serial
>    driver
>  - actually remove the serial driver in the patch that claims to do this
>    instead of patch 1.
>
> On irc Arnd signalled to want to merge the first patch. As there are no
> hard interdependencies between these, I think the best approach is for th=
e
> individual maintainers to pick up the patches they are responsible for.

I've applied patches 1 *and* 7 now, left 2 through 6.

Subsystem maintainers: Please let me know if you want to pick the
driver removal patches into your tree, or if which ones I should apply
here, with your Ack.

       Arnd
