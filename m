Return-Path: <SRS0=9svH=AG=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C25C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 16:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10EEEC4339B; Sat, 15 Apr 2023 16:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A9F6C433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 16:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A9F6C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=c4fvZclj7H/dfqfF9/5HYhF0ucn+Db6pvUeEhkUPxzU=; b=QtVTzomt749HvZDTFe3sJ3ywFG
	Np0dQgNK2gQRtj5jj5rDnbIud2cp1Yp4pEMpZ6GliFta/ZeXg5HBI1Hy8S6/zDh92UbSAT0a6SdF9
	V2xjdkZvksZWg+X3AT4FzzXFI0upuSXNhJNJjiPy5RshSaj+Hzyf9XK13Os7EcTe1G7sehTeX9dPA
	w5iFklfbdt+wysqWN39FXW0BkHAns6MQF+hkRoypykvZ4oGxi48yoPz9MOIHLQMNRjsh9MwywVkYg
	q3G5+VMpLih8cusiqCR7RQo8NNXAZaenBxlWtCcPbGm+VNBJRmmYTBEcYPcS2EhmlSMHqfWH1GNk+
	sp4t+/5Q==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pniRR-00CQ4L-2y;
	Sat, 15 Apr 2023 16:07:57 +0000
Message-ID: <1d836cd6-72aa-d7c4-cbc0-71592b13781e@infradead.org>
Date: Sat, 15 Apr 2023 09:07:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/15] w1: ds2408: drop kerneldoc annotation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/23 03:42, Krzysztof Kozlowski wrote:
> Drop kerneldoc annotation from comment which is not a kerneldoc to fix:
> 
>   w1_ds2408.c:210: warning: This comment starts with '/**', but isn't a kernel-doc comment
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
>  drivers/w1/slaves/w1_ds2408.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
> index ad102c577122..7fa911989193 100644
> --- a/drivers/w1/slaves/w1_ds2408.c
> +++ b/drivers/w1/slaves/w1_ds2408.c
> @@ -206,7 +206,7 @@ static ssize_t output_write(struct file *filp, struct kobject *kobj,
>  }
>  
>  
> -/**
> +/*
>   * Writing to the activity file resets the activity latches.
>   */
>  static ssize_t activity_write(struct file *filp, struct kobject *kobj,

-- 
~Randy
