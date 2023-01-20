Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6ADC05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 20:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C82C7C4339B; Fri, 20 Jan 2023 20:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE5DC433D2;
	Fri, 20 Jan 2023 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674244957;
	bh=GlglYW3c/pib3zrqdUBnkb/zVk+CILGBj0OPOTkq6GY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=LTJmUej4vUhNgH4bmLp+HJHIBL426vrn7mh95SQ6zjj7BMqsk6OHb5YRDdev9TCH7
	 qI5PL494W5x+U4lLYwe9cN5Xd75ff0dUBORA2MybADtOZeEl3xnxQSHz5DhFl0b04m
	 uFFLqFqdNGynin73OtiDKfz+Xh6wd8S+7TQIHf+2un7mwGh6Mi5Jr5bGfkR6oi6KAi
	 i2jw5xRX7qTo//kQ8l97WVdGlPa2RiIltsXesioPXwpAZlCmIbh4qKenxTiRTpBhNO
	 ZaD9gTlm7TwIHOknXl9KnIAHoDq0kozNTDxRdPo09xE7YpcQgFymiJqomXBf19Z1+Z
	 n+yvdmr2oPE2w==
Date: Fri, 20 Jan 2023 20:02:30 +0000
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
Message-ID: <Y8rzVkAC+olX7Kcb@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
 <Y8rMJcX0cqThKj2N@google.com>
 <720a7d19-4b7f-4948-b044-c46a539a4b36@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <720a7d19-4b7f-4948-b044-c46a539a4b36@app.fastmail.com>

On Fri, 20 Jan 2023, Arnd Bergmann wrote:

> On Fri, Jan 20, 2023, at 18:15, Lee Jones wrote:
> > On Fri, 20 Jan 2023, Arnd Bergmann wrote:
> 
> >> > Marek Behún (3):
> >> >   leds: turris-omnia: support HW controlled mode via private trigger
> >> >   leds: turris-omnia: initialize multi-intensity to full
> >> >   leds: turris-omnia: change max brightness from 255 to 1
> >> >
> >> > Pali Rohár (5):
> >> >   dt-bindings: leds: register-bit-led: Add active-low property
> >> >   leds: syscon: Implement support for active-low property
> >> >   powerpc/85xx: DTS: Add CPLD definitions for P1021RDB Combo Board CPL
> >> >     Design
> >> >   dt-bindings: leds: Add cznic,turris1x-leds.yaml binding
> >> >   leds: Add support for Turris 1.x LEDs
> >> >
> >> >  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
> >> >  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 +++++
> >> >  .../bindings/leds/register-bit-led.yaml       |   5 +
> >> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    |  92 ++++
> >> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |   6 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |   6 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     |  44 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    |  37 ++
> >> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |   4 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |   4 +-
> >> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    |  37 ++
> >> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |   5 +-
> >> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |   5 +-
> >> >  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    |  33 +-
> >
> >> >  drivers/leds/Kconfig                          |  10 +
> >> >  drivers/leds/Makefile                         |   1 +
> >> >  drivers/leds/leds-syscon.c                    |  14 +-
> >> >  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
> >> >  drivers/leds/leds-turris-omnia.c              |  46 +-
> >
> > If everyone is convinced that applying these drivers is the correct
> > thing to do, I'd be happy to (rather) take them via LEDs.
> 
> Ok, thanks. I had not actually looked at the patches until today.
> They were in the soc tree backlog but appeared to be misplaced
> there until I read the  0/10 message text.
> 
> Looking at it now, I see:
> 
> - patches 1 and 2 seem obvious and have been reviewed by
>   others already
> 
> - patch 3 is for arch/powerpc and should get merged through
>   there if there are no objections to the binding in patch 4.
> 
> - patch 5 is the big driver patch, with a Reviewed-by tag
>   from Marek Behún, who is the author of the last three patches.
>   An earlier version of this patch was sent in June and got
>   a few Acks and detailed feedback from Andy [1], but he's also
>   not on Cc, and I don't know if his comments are all resolved
>   in this version.
> 
> - Patches 6, 7 and 8 all seem simple LED subsystem patches,
>   they just need review from you in order to get applied.
>   These are also missing a Signed-off-by from the submitter
>   in addition to the author in order to be applied.

Very well.  Let's have them resent then please (with past reviewers on
Cc:) and we'll go from there.

-- 
Lee Jones [李琼斯]
