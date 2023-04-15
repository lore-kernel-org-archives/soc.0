Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D8C77B70
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 15:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F20DC4339B; Sat, 15 Apr 2023 15:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD394C433D2;
	Sat, 15 Apr 2023 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681572510;
	bh=X6trzWnY0iolJMvBZ0LXqif49Qe7S8tclfdLM3IsDcI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=MMQ/Mu+Mr+/yaYNv2pHw7mZcwwH5ZNBX1R8vvFGzTxCpuTfPDpYnuV6MQDlBvzztF
	 tEB3ucklSJGslKbnLkMNLZNnJeEFxaSk9OWghuojWKzcHSZkKvvxRLjI0qf9SVw3Rf
	 WIQxnv8enLMqcQ4qZuNQWlFzcomL3ahmo+HEGsvA=
Date: Sat, 15 Apr 2023 17:18:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] w1: omap-hdq: allow compile testing
Message-ID: <2023041542-arrogance-jury-ccf1@gregkh>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
 <20230415104304.104134-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415104304.104134-5-krzysztof.kozlowski@linaro.org>

On Sat, Apr 15, 2023 at 12:42:53PM +0200, Krzysztof Kozlowski wrote:
> omap-hdq does not depend on anything from ARCH_OMAP for building.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/w1/masters/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/w1/masters/Kconfig b/drivers/w1/masters/Kconfig
> index 692cac3ff0ee..ad316573288a 100644
> --- a/drivers/w1/masters/Kconfig
> +++ b/drivers/w1/masters/Kconfig
> @@ -53,7 +53,7 @@ config W1_MASTER_GPIO
>  
>  config HDQ_MASTER_OMAP
>  	tristate "OMAP HDQ driver"
> -	depends on ARCH_OMAP
> +	depends on ARCH_OMAP || COMPILE_TEST
>  	help
>  	  Say Y here if you want support for the 1-wire or HDQ Interface
>  	  on an OMAP processor.
> -- 
> 2.34.1
> 

I'm guessing this shouldn't be part of this series?
