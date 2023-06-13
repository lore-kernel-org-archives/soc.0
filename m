Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F50C77B7A
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64961C433D2; Tue, 13 Jun 2023 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC559C433EF;
	Tue, 13 Jun 2023 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686652090;
	bh=hwhRVY/U8OOY9aUuR5CfYMofJxlb/LPcsEErTaZj9DE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=wvaxvHobJCTvf4R/mqOl5LiBcHZVvAu5NG5I5fvpRDvhU263ik5r7AhPwzhY9KhLd
	 wYV2l3z935Mln7+6ZqhppEaND5Fdy6HeUj2l0j+5Rqw6GwZo3bsc0LFKw16GDDFpqs
	 xWrHt7pVqlTSLX+47TPTC54csg68JYgGuIrEegCU=
Date: Tue, 13 Jun 2023 12:28:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	arnd@arndb.de, soc@kernel.org, schung@nuvoton.com,
	mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Message-ID: <2023061338-lunchbox-snorkel-e6a9@gregkh>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612025355.547871-2-ychuang570808@gmail.com>

On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> This adds UART and console driver for Nuvoton ma35d1 Soc.
> It supports full-duplex communication, FIFO control, and
> hardware flow control.

You get a full 72 columns for your changelog :)

> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -279,4 +279,7 @@
>  /* Sunplus UART */
>  #define PORT_SUNPLUS	123
>  
> +/* Nuvoton MA35 SoC */
> +#define PORT_MA35	124
> +

Why is this change needed?  What userspace code is going to rely on it?

thanks,

greg k-h
