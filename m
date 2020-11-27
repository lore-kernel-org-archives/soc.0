Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BC6C3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 19:42:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B77C2417A; Fri, 27 Nov 2020 19:42:36 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 255512415A;
	Fri, 27 Nov 2020 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606506156;
	bh=xI9pJ3oJiicXGqPwBkY4XG8T9Gjl2smJsWkYBxwzh8w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hNuSsTsR8GavtaqpKeC2cAgc8P8OlJ6SP5pUs0bHH66hPo0wGunxNGvuZZmsQs5uc
	 ekYLEKZKUuo4EN64e57F5APeZdNKzXcz190ngQVI+1LGXHqIFL8WKclPuIW8xCxx7v
	 t8HmNr45Ej3g9enmNkt9NUiVZPzBYh7+3/PUdsCY=
Received: by mail-ot1-f49.google.com with SMTP id h39so5592856otb.5;
        Fri, 27 Nov 2020 11:42:36 -0800 (PST)
X-Gm-Message-State: AOAM530efqbAWT5iCdU7l+IfLsFlyXibZoDnm0nRi2aNsnm0OYAmG51N
	kZBEknKgOi3ihAHf2whE0JMhhy4Mls4YLCrZZrY=
X-Google-Smtp-Source: ABdhPJzsov2fD9SeFes5Dq3BOlNd6GoSKW50T8TRpTPtol9WFWwz3mV3qCAF3WYmYdPU5tym95uL5AGqu7Xi76rId9E=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr7577014oth.210.1606506155536;
 Fri, 27 Nov 2020 11:42:35 -0800 (PST)
MIME-Version: 1.0
References: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
In-Reply-To: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 27 Nov 2020 20:42:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1o6Dt0wakXB=sUC-t9DkFqSe=ZwSMYtYKsoZNaNfXUew@mail.gmail.com>
Message-ID: <CAK8P3a1o6Dt0wakXB=sUC-t9DkFqSe=ZwSMYtYKsoZNaNfXUew@mail.gmail.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.11 #1
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 9:54 AM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Please consider this first round of STM32 DT updates for v5.11. As usual
> main changed concern MPU part. Various fixes have been done, a new board
> has been added for DH and USB type C support has been added for ST DK
> boards.

Out of curiosity, what is your impression of the state of the MCU port?

It seems to me that STM32H7/STM32F7 is by far the most active NOMMU
platform in mainline Linux (with some activity for j2 and recently rv64), but
it's also much less active than it was a few years ago and slowly winding down
further, presumably as other OSs are getting better and full-featured MPUs
are getting almost as cheap.

I also tried to find modern distro support, but I couldn't find anything that
has the elf-fdpic changes that were merged into mainline gcc, instead
it seems any user space is either on binfmt-flat or using elf-fdpic with
ancient patched compilers that can build user space but no longer
build the kernel (which now requires gcc-4.9 or higher), so I wonder if
I'm looking in the wrong places, or if this just doesn't work.

Overall, is this something where you only support existing users for
as long as they are around, or do you keep seeing new products based
on STM32F4/F7/H7?

> Due to company IT changes, for upstream "process" my mail address in no
> longer alexandre.torgue@st.com but alexandre.torgue@foss.st.com. Let me
> know if it causes issue for tag signature. On my side I updated GPG key
> with this new address and it seems ok.

It's no problem on my end, thanks for letting me know.

       Arnd
