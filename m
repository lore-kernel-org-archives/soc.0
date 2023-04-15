Return-Path: <SRS0=9svH=AG=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25048C77B70
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 16:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D84C3C4339B; Sat, 15 Apr 2023 16:05:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C5ADC433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 16:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C5ADC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vfX97L9Ghd2i2aJ8EsgFqKiFciZdaPZEWkAYB8x8dUg=; b=xX1Qw8/uP+SCaLglZGcGollNNP
	EI0wTxxcL9JqoVdJQrmJruSGuJPPGhS3+G21M/vG5JpOxhUzDrgaWmwF0NIoq4NOADsY3iZUrfL/i
	DUh8hNshsiuERtWS8XYFnzLah3uTZpVyQpyILuDuDnxfmtIBbuIHJDj3ii2LTXd0pdrU9Rc8P9l+g
	e2njLQTCBzM01NHTtMw9UiLoxKjZBBnLL1fnQ1N0IImjsjnDpLdI7UcU+Jj0vaEpWMROCetpM0VpH
	ZSKh7qkjuOmdaIftyabA2BlTdQF8YWR65OFpSatbY7Q2f+AgQZAkoFMlFoa+RQpGv7F5XrazBX55s
	e6ks4vqg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pniPE-00CPmo-0B;
	Sat, 15 Apr 2023 16:05:40 +0000
Message-ID: <f5683efc-733e-a5ee-b3ba-6b35e04e23b4@infradead.org>
Date: Sat, 15 Apr 2023 09:05:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/15] w1: omap-hdq: allow compile testing
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
 <20230415104304.104134-13-krzysztof.kozlowski@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230415104304.104134-13-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/15/23 03:43, Krzysztof Kozlowski wrote:
> omap-hdq does not depend on anything from ARCH_OMAP for building.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

It appears that patches 4 and 12 are the same...

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

-- 
~Randy
