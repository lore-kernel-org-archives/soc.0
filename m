Return-Path: <SRS0=eoZA=L4=gmail.com=mazziesaccount@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD80C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 12:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5B5EC3277B; Tue, 23 Apr 2024 12:33:42 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8080C116B1;
	Tue, 23 Apr 2024 12:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8080C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so78911371fa.3;
        Tue, 23 Apr 2024 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713875619; x=1714480419; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LEZu2AGX25WwaFvHUkBYrSSFp3zJKmgOTVkk5e6RoEc=;
        b=it9N7REDs198A11GoCXkzPz5KyrE/DXv47gTRWWUUkLQUPvvAItkZmeM9dPayTB4ee
         2fxwBCiBv6nyM2tRWNNAjAxrxwLdLLCide9dfJPtLah9s4P+/iAFtlH4I9Nk6dj5qm1Q
         5kAcfB6NSpkH4gbymrX2qAqAbIvhWM7dy7iMLKIGe0mJVhFxEVIiLApIpfKTEayUpzYE
         O1phXoKv1mu5pfPT2QyxpsXkZ7eZvIrRvhlHyr9MXAZAP8PmGteLastM4a5YeTMiI0Pi
         QFKFzauzCCZrL2riQNhM0ffEJA01fRHSGY0kUCFMwRP89BG4ncWdNGnSfKEcpZlNTfMv
         3WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875619; x=1714480419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEZu2AGX25WwaFvHUkBYrSSFp3zJKmgOTVkk5e6RoEc=;
        b=VW07bYhPsvImPDsXVALBLRDtre724qk+HNhqJn5OVpuiXBkNUCLbPtQAkr3X0OWCl1
         xW7Oi0Cn5jTDWx+J2wvsnYaFfHcd18diB71vlQnX6DJXZzRO5+S1dc5wkIXOeaJZfJ0C
         NJGPUk3HjO6bjA/OFpjlJ3wmzptyB5/xjlXmE88M7hc2vwA6a5stAkwr5h0OlCCTfAQa
         b7VcivloDZwQWmSH/3j/2GYm4fXpctgUgWj9pDTsVLigBi6sf0sBCRljyg6M3WFZsWw7
         g3dFmLmjESvd+u0VZs6xrNHCMtVpcdnqQTB1N5h0DrYGHrEIxTpfih87MXrqyImzXtcH
         G8gw==
X-Forwarded-Encrypted: i=1; AJvYcCWgOVh6YbBJjZMGUb27xt1DDxwv+ZcgW1RzKeZMoTCFD+khigOlvA95hzEqWL63Dtj5Yd5lKIY40Rgk5NUCcw==
X-Gm-Message-State: AOJu0YxtxiR+dK7ipHIAhPP32pA94LDkeFdCuTfe7vPDslOAVAutmwrw
	6IzYupmykj9vPasweHgQUwbN4JwWHdwzvHkXVbk56GsQfqCAfQajfYRa7g==
X-Google-Smtp-Source: AGHT+IFVgDWEP43oPU2MPvahiq0s3SEJClHpGoxHz43hC6fnz+VO5sMNEF6UYAtF7/975RHkMhN01A==
X-Received: by 2002:a2e:9886:0:b0:2dc:f896:5825 with SMTP id b6-20020a2e9886000000b002dcf8965825mr7513293ljj.50.1713875618648;
        Tue, 23 Apr 2024 05:33:38 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id bj24-20020a2eaa98000000b002da080a84cfsm1660763ljb.23.2024.04.23.05.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:33:38 -0700 (PDT)
Message-ID: <d3818d8f-8695-4bb6-820c-f2822ce6037b@gmail.com>
Date: Tue, 23 Apr 2024 15:33:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Content-Language: en-US, en-GB
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arm@kernel.org
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-9-kabel@kernel.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240418121116.22184-9-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/24 15:11, Marek Behún wrote:
> A few drivers register a devm action to remove a debugfs directory,
> implementing a one-liner function that calls debufs_remove_recursive().
> Help drivers avoid this repeated implementations by adding managed
> version of debugfs directory create function.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   include/linux/devm-helpers.h | 40 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index fe62b28baf03..58e0a7fbd549 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -23,6 +23,7 @@
>    * already ran.
>    */
>   
> +#include <linux/debugfs.h>

With the same remark that I did for 06/11

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

