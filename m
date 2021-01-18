Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC216C433E9
	for <soc@archiver.kernel.org>; Mon, 18 Jan 2021 15:21:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F24122AAA; Mon, 18 Jan 2021 15:21:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 762A7229C7
	for <soc@kernel.org>; Mon, 18 Jan 2021 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610983274;
	bh=ER2r2giR28b5esnhi88+x3d/UsSbWXp2fQ0xfzYXHLo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=m04F5pNRyZm4uPl0gPJTZ74dp9ZBkfOE7I+lq++oLWqkp7Zcf8EQ3VXPGLsvmNj49
	 RQwHJDxEV9JQ3HZcqThk/o+IO4My4MP1Byj2Ra9V5vkc8fHdQ/m5wZFpg/eSJlPTZr
	 m0CyGJ/ZSm/9wbAoL+FzfanUhi/6PZnCaWO0WUPBJdYXvdsJJk3EzyaRkD7bAiVQcY
	 bNE9WrfDzRpPwYKKYPCLF07Q74QJ107k/kS5Df85hHE3llKuttUI7Yvb+Sc8dOLIxH
	 8c54Tw0W/YE+Or+Z/eWUxVO0uFiAZmhoOpktv70w/X39h+H+9ZlNeTKbJiXIMkWvG+
	 OyZumTKZ+QuGg==
Received: by mail-ot1-f46.google.com with SMTP id e70so1118695ote.11
        for <soc@kernel.org>; Mon, 18 Jan 2021 07:21:14 -0800 (PST)
X-Gm-Message-State: AOAM5304+NqQ14SZyIM4fUTkzQ5wat/2wX6Ksxm+ih2+IYNklNYmeLuM
	LY6JYLtqimvc2/rMOPTdAdbj9DxV2/IuxaFRCUM=
X-Google-Smtp-Source: ABdhPJxo+FbwPtcR/KM/ExQ4Vi/39GUf17/M51OAsCOJB/yW2MFk0+n7jwLwa8Oo5f1UtqxDAjf3hSswWCPCe4y1oC0=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr3921otk.210.1610983273879;
 Mon, 18 Jan 2021 07:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <20210115155130.185010-4-u.kleine-koenig@pengutronix.de> <8293fc1b-20fb-58e9-d610-86eefd218ee9@linaro.org>
In-Reply-To: <8293fc1b-20fb-58e9-d610-86eefd218ee9@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 16:20:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0xP98ya0KZfq_6nOj+Ahn0+zmnFWqDQOHxKc3sq7u-CA@mail.gmail.com>
Message-ID: <CAK8P3a0xP98ya0KZfq_6nOj+Ahn0+zmnFWqDQOHxKc3sq7u-CA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clocksource: Drop unused efm32 timer code
To: Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Sascha Hauer <kernel@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 4:18 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 15/01/2021 16:51, Uwe Kleine-K=C3=B6nig wrote:
> > Support for this machine was just removed, so drop the now unused timer
> > code, too.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Shall I take it through my tree ?

Yes, please do. I have a couple more coming for the other removed platforms=
.

       Arnd
