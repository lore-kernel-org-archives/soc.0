Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F265CC433DB
	for <soc@archiver.kernel.org>; Thu, 14 Jan 2021 15:34:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C127323A7E; Thu, 14 Jan 2021 15:34:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4D632311F;
	Thu, 14 Jan 2021 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1610638454;
	bh=9Gq0KtOVc9YBeAyJxY+p8LWOlsPnpJOVBjZZNgmm7vc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=cw+yATQ8ZHpk07zNyxsFc3V4Ceac3jKnvkSS1V/WmVAl2RNbkEfOT7pHEZVB7O6i5
	 1mrh0sDBbMLoF/EEFsPciSAVn7+ChoT5i4k6ldpMP73x28lozo8Vij/RtqpImOx/J2
	 pQobKfgG+dk089Ey/ZYJfMLqAafTaeZyP5ScLOi0=
Date: Thu, 14 Jan 2021 16:34:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Jiri Slaby <jirislaby@kernel.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v1 6/7] tty: Drop unused efm32 serial driver
Message-ID: <YABkcwgOLhrRZqRK@kroah.com>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
 <20210114151630.128830-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114151630.128830-7-u.kleine-koenig@pengutronix.de>

On Thu, Jan 14, 2021 at 04:16:29PM +0100, Uwe Kleine-König wrote:
> Support for this machine was just removed, so drop the now unused UART
> driver, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/serial/Kconfig       | 13 -------------
>  drivers/tty/serial/Makefile      |  1 -
>  include/uapi/linux/serial_core.h |  3 ---
>  3 files changed, 17 deletions(-)

Shouldn't you delete the .c file for the serial driver in this patch as
well?

greg k-h
