Return-Path: <SRS0=9svH=AG=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D0C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 16:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6C66C433EF; Sat, 15 Apr 2023 16:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8117C433D2
	for <soc@kernel.org>; Sat, 15 Apr 2023 16:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8117C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4my/HdVpvEW7ZsohZBuFTRTyuBzPr6i6gOfM7+nk0bs=; b=PvXjVvdgAC+nBUCJF2RkC1Kayr
	Zru0Yo8URlH+eWoljrVADs4S4LuZFpov7rLs31nhVbOV+LvnvAGDSwEYVep1dNA/XYkTRLYCHMTQk
	UMo4b4OtIdNfx6CTrKSzRLLiZeLGly/9xXBLVcM+/nTdnsXpZfeiPCIo2JP1fb9XemTGExMB1+9Dm
	fMWZn/+e5yzFeSdwvvrZhGPHN600/UDKPT1TnPh5ujg1jE0EY7ASAZZi+SLXO/cl3de+j4e8Gh7lP
	SpuHv5NgV1eajwbAihIiVWRelyOQ9D1UiUh6qEet5qsa4DZDQycu+BKUDZqvuMOtTbToDCsLEfEO5
	1Z5N3QxQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pniS5-00CQCg-2V;
	Sat, 15 Apr 2023 16:08:37 +0000
Message-ID: <84fd6222-89e8-58de-f386-b51af8cf9ebe@infradead.org>
Date: Sat, 15 Apr 2023 09:08:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/15] w1: ds2433: correct kerneldoc annotation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
 <20230415104304.104134-2-krzysztof.kozlowski@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230415104304.104134-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/23 03:42, Krzysztof Kozlowski wrote:
> Correct kerneldoc comments (or drop annotation) to fix:
> 
>   w1_ds2433.c:46: warning: This comment starts with '/**', but isn't a kernel-doc comment.
>   w1_ds2433.c:141: warning: This comment starts with '/**', but isn't a kernel-doc comment.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/w1/slaves/w1_ds2433.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/w1/slaves/w1_ds2433.c b/drivers/w1/slaves/w1_ds2433.c
> index 0f72df15a024..6134ca2f37fe 100644
> --- a/drivers/w1/slaves/w1_ds2433.c
> +++ b/drivers/w1/slaves/w1_ds2433.c
> @@ -42,7 +42,7 @@ struct w1_f23_data {
>  	u32	validcrc;
>  };
>  
> -/**
> +/*
>   * Check the file size bounds and adjusts count as needed.
>   * This would not be needed if the file size didn't reset to 0 after a write.
>   */
> @@ -138,16 +138,17 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
>  }
>  
>  /**
> - * Writes to the scratchpad and reads it back for verification.
> + * w1_f23_write() - Writes to the scratchpad and reads it back for verification.
> + * @sl:		The slave structure
> + * @addr:	Address for the write
> + * @len:	length must be <= (W1_PAGE_SIZE - (addr & W1_PAGE_MASK))
> + * @data:	The data to write
> + *
>   * Then copies the scratchpad to EEPROM.
>   * The data must be on one page.
>   * The master must be locked.
>   *
> - * @param sl	The slave structure
> - * @param addr	Address for the write
> - * @param len   length must be <= (W1_PAGE_SIZE - (addr & W1_PAGE_MASK))
> - * @param data	The data to write
> - * @return	0=Success -1=failure
> + * Return:	0=Success, -1=failure
>   */
>  static int w1_f23_write(struct w1_slave *sl, int addr, int len, const u8 *data)
>  {

-- 
~Randy
