Return-Path: <SRS0=cKhR=56=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E11C61DA4
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2ECA9C433D2; Thu,  2 Feb 2023 09:55:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 474A6C433EF;
	Thu,  2 Feb 2023 09:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 474A6C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id o36so939122wms.1;
        Thu, 02 Feb 2023 01:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8EnhWnwszf0qr8z5+wPtUgbjgq6MRr3dIr/Z/EQU9c=;
        b=TvqFHFwagLxB1rxmJuY4K7HYNruvzblKn97uEc0ZoJyWESaSBp53RH7YJRw/mSQR3r
         xJaf1N8A7YBBWJhCJKawNXow4sLXInXZMFcpCqJV4xSOIzE3Te/D3znVNQrzQeUXN5FB
         rpdIp+ZDdgnIv/GSbTBPKq3J5VQWmxU1uIKeNDrYF2DnkhQG8EsIQwLj/t8SnAphgqQx
         lMVthwwQPoi+rpPYdHkHgOrM/2KETd5X4W6zhgaXvbu6/HuEGBic5ZFlPD3wyTdVS6ek
         LdkSrfz68mselAT4dNi+vulRummyGiLeq0jw+sA6Rq7993S1hZtvNp0fOKK58O0Q+wmA
         tUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8EnhWnwszf0qr8z5+wPtUgbjgq6MRr3dIr/Z/EQU9c=;
        b=QycP160HyY1p1z1y3kcOlPetgBmeLnRV90Xy6ahWIpftbqZXooodAf58rIf9pjZcvF
         E1gvhwz9uRAFLaZjgDhFnz1nSaPO1iR8GTiulC9049wD3MHeRpu2fMiz/XOxy7cXLuvQ
         5CV1+Z7mPMvpX2LokNfu7P1aIAKPs5iNpCh8kRZu+HcJXkCXEz1/u7doyCtnxSBlv3p3
         NSXdKsX4xJX6VE4LbiFYDEfc2yMJfzwFXXURKg4EWVrsqNqs3A9FRnFGNH+WR3xohKEN
         VawNnw2qhceAjlSiXKITOCBf88f417HpcXtwpTQiBXMxidb0YIgB4atoKBKkijQcy+88
         +8MQ==
X-Gm-Message-State: AO0yUKVm/KimxMP+1plPsn09XUo6s9LS+rgqY4eCYopuFPev1PMLb67j
	ypNGAFFaUTW+uRXCQaHT2ZM=
X-Google-Smtp-Source: AK7set8sKz/UU4df3SC+11Rw2FrDgvYF6OZErkElcifAIA8x4teukttDBCFRgb6Q9oYMhmoE5bmLag==
X-Received: by 2002:a05:600c:538b:b0:3df:a04a:1a7 with SMTP id hg11-20020a05600c538b00b003dfa04a01a7mr2300590wmb.22.1675331717450;
        Thu, 02 Feb 2023 01:55:17 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c130e00b003df241f52e8sm2877394wmf.42.2023.02.02.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:55:16 -0800 (PST)
Message-ID: <1423871e-7dd1-4582-3bb9-85913868e951@gmail.com>
Date: Thu, 2 Feb 2023 10:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: Update entry for MediaTek SoC support
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, arm@kernel.org, soc@kernel.org, arnd@arndb.de,
 olof@lixom.net
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230201152256.19514-1-matthias.bgg@kernel.org>
 <4db8fb55-a02b-d98e-65f4-1a095c43104f@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <4db8fb55-a02b-d98e-65f4-1a095c43104f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/02/2023 10:08, AngeloGioacchino Del Regno wrote:
> Il 01/02/23 16:22, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> The linux-mediatek IRC channel has moved to liber.chat for quite some
>> time. Apart from that, not all patches are also send to LKML, so add
>> this ML explicitly.
>>
>> And last but not least:
>> Angelo does a wunderfull job in reviewing patches for all kind of
>> devices from MediaTek.
>>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Is a R-b tag appropriate here to say "yes, go on with setting me as a reviewer"?
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In general yes, but I think it got already merged :D

> 
> P.S.: Thank you :-)
> 

Thank you to you for all the effort!

Regards,
Matthias

> Cheers,
> Angelo
> 
