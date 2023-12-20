Return-Path: <SRS0=FcB2=H7=gmail.com=gsomlo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B43BC3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 20:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEB88C433C9; Wed, 20 Dec 2023 20:36:32 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A052BC433C7
	for <soc@kernel.org>; Wed, 20 Dec 2023 20:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A052BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7cbeaacbcb8so30068241.0
        for <soc@kernel.org>; Wed, 20 Dec 2023 12:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104590; x=1703709390; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUVV3nvmIFREJ94/uU3gKA9j+xl55+CVV1feR0augDU=;
        b=WaR75jGPE5MjKoLWMPDFDfAN+1MQBJd7AYahB+o+KSqxL2paTgvU4c4FGy1/+njYVO
         JOjrusfDRziEPuHz03YVeDonoh+lI98qJHK8BUlzPNQW17HT1ENtOoYqf5vb2uRc3hYp
         h7XPwr4fKC33cl7PpoxpsA+m0uVs71NFetxhAE7O95mz5qkTXdM2DDxpTDRmxhR5W+0P
         YY8C9HZLHVtZ/9HShHQrlDOb2vyOjh18ojKJD7F24uPw5BBI+I8dW9s10UyqbTd1Syet
         iKO0P4IySxz2n9hSJqFlgq1hQZyLQJR6pVTRwGgkRsfhOuSGCoq+i8LVVSNR4gIIIP7V
         IRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104590; x=1703709390;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUVV3nvmIFREJ94/uU3gKA9j+xl55+CVV1feR0augDU=;
        b=ArdFsQy8siXkOgRF+pB/IzwEKnH/Tkxw2xBbjwI1oZNNDYgGhL0JZSw4b9BiZe5+td
         fRXfG0X/Dt0CZnecmG0xeAZJ6s27aXCfOYD61XzpQpGR9+pNh75PyPzIZzHU7hZngodm
         6LuD3z3BxPKCcaZi0Qs69nLAF508evd9P59GhmJNxW8MqQfv1WlcpkS6nvXykVHKKvFY
         VI2eNHy9RkpuJXb9adc2gd7uMw4ea91g2JtWMvFm7T5hEcaVAkU96loU867Bc7RS3pi0
         2lA5suBRjGTerKHBF6wu78ocRhdkJ7Lzo5ZagodWk1NaaA7hpV49b0hQaPThlRzdby//
         IYdg==
X-Gm-Message-State: AOJu0YwZqDpw7+u8E1dzCIa3FIpeOY/78dkB03OWkyWdwlGklBPCp4lp
	xOxkhzzAcIhkvXp4hliIrbo=
X-Google-Smtp-Source: AGHT+IGlkuEIgtq/nlBc2/TpOgKhmmQQ7kSmxneFHS8SKf3JrvH1xOo8t3EsXoRMjo6Ovw5SmTJ9Fg==
X-Received: by 2002:a05:6102:c93:b0:464:92e8:5db1 with SMTP id f19-20020a0561020c9300b0046492e85db1mr323216vst.9.1703104590555;
        Wed, 20 Dec 2023 12:36:30 -0800 (PST)
Received: from errol.ini.cmu.edu ([72.95.245.133])
        by smtp.gmail.com with ESMTPSA id k15-20020ac8478f000000b004240481cee0sm182102qtq.58.2023.12.20.12.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:36:30 -0800 (PST)
Date: Wed, 20 Dec 2023 15:36:28 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: jdelvare@suse.de, kgugala@antmicro.com, mholenko@antmicro.com,
	joel@jms.id.au, linux-kernel@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH] drivers/soc/litex: drop obsolete dependency on
 COMPILE_TEST
Message-ID: <ZYNQTLzKBLW29nUS@errol.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124161618.34ca07b3@endymion.delvare>
X-Clacks-Overhead: GNU Terry Pratchett

On Thu, 24 Nov 2022 at 16:16:18 +0100, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
> 
> As a minor optimization, this also lets us drop of_match_ptr() and
> ifdef-guarding, as we now know what they will resolve to, we might as
> well save cpp some work.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Karol Gugala <kgugala@antmicro.com>
> Cc: Mateusz Holenko <mholenko@antmicro.com>
> Cc: Gabriel Somlo <gsomlo@gmail.com>
> Cc: Joel Stanley <joel@jms.id.au>

Reviewed-by: Gabriel Somlo <gsomlo@gmail.com>

Arnd: since it's been a while (sorry about that), please advise on
whether Jean should re-send the original patch, unless you can grab
it directly from here and pull it through the soc tree:
https://lore.kernel.org/lkml/20221125142756.3e51a28d@endymion.delvare/

Thanks much,
--Gabriel

> ---
>  drivers/soc/litex/Kconfig          |    2 +-
>  drivers/soc/litex/litex_soc_ctrl.c |    4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> --- linux-6.0.orig/drivers/soc/litex/Kconfig
> +++ linux-6.0/drivers/soc/litex/Kconfig
> @@ -7,7 +7,7 @@ config LITEX
>  
>  config LITEX_SOC_CONTROLLER
>  	tristate "Enable LiteX SoC Controller driver"
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	depends on HAS_IOMEM
>  	select LITEX
>  	help
> --- linux-6.0.orig/drivers/soc/litex/litex_soc_ctrl.c
> +++ linux-6.0/drivers/soc/litex/litex_soc_ctrl.c
> @@ -82,13 +82,11 @@ static int litex_reset_handler(struct no
>  	return NOTIFY_DONE;
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id litex_soc_ctrl_of_match[] = {
>  	{.compatible = "litex,soc-controller"},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, litex_soc_ctrl_of_match);
> -#endif /* CONFIG_OF */
>  
>  static int litex_soc_ctrl_probe(struct platform_device *pdev)
>  {
> @@ -131,7 +129,7 @@ static int litex_soc_ctrl_remove(struct
>  static struct platform_driver litex_soc_ctrl_driver = {
>  	.driver = {
>  		.name = "litex-soc-controller",
> -		.of_match_table = of_match_ptr(litex_soc_ctrl_of_match)
> +		.of_match_table = litex_soc_ctrl_of_match,
>  	},
>  	.probe = litex_soc_ctrl_probe,
>  	.remove = litex_soc_ctrl_remove,
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
> 
