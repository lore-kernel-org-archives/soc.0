Return-Path: <SRS0=uEZM=R2=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90003C433EF
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 09:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7650AC36AF7; Mon, 10 Jan 2022 09:23:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E97E0C36AF3
	for <soc@kernel.org>; Mon, 10 Jan 2022 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E97E0C36AF3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id n19-20020a7bc5d3000000b003466ef16375so9310192wmk.1
        for <soc@kernel.org>; Mon, 10 Jan 2022 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9jz9tNwdzLsw7w4Zl2qHQumH6RcFiB0/JZN/3mnViHE=;
        b=o74mvAvePykr8pBkRAIfGkCE+jZyOIQDE3u1T/KcLw9WFfYNPgiMXLQ6rjRdjAgEaL
         IRGLm9hsd99LkyblWxHEtDxolvDthX1Q86zYnzaGBJdHwSwDFIbKWJ4MtG+xESCxTBDs
         Yq6XDTyHyEUyJ0Aq6iNvtije8VaxppilvmVVUwlZdqzYCOdgqvy1WCjgPuCfJMof77LZ
         1CGcz4B9I4SN3MrciU4lCfHLRUcX7CX+vz9U/VxD0kmF89Kdf1JdPmpx65PNaLda1WBM
         vuGfqgMSCDsQVHINFmq8W7CB0h2q6IPX7HQCF8JZoalvhEE9pc/R/FN8CuWMF8X4XJSW
         ud6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9jz9tNwdzLsw7w4Zl2qHQumH6RcFiB0/JZN/3mnViHE=;
        b=XKzHic41xNdSsYN3KJRMlj+SPwojIa3+j27WkOxslS4ok5ps9gRLb+vSZ67q0OSqch
         bND82ws3lwxNdnANF8T9Phh94LfnpPjPSE6Dt1kX8mWV0UihiAqvL6fRU4gIJBZ1Dzyz
         DYEYh4MuEe+J4xiJtFYh8y3s5LlE0y4T5IyG/UElSactcPPbE+du5Z1IQ/Oalpk08Bl/
         Txv/KqiRmQx9ATcmlWX68GGiW28hCwYHXAmTqJVdyTOtmgtkwuqhLTogZB0pOYnu1OIq
         xl3pd5N6yKftdkjg/1sf8qVEnqTennPe4bgA7Q5W+lzlE06C+p5CMVsEtxBOpgz63Czf
         7uLA==
X-Gm-Message-State: AOAM532OWNY2XmEPPz3AcldEoVFVcay31vVwGAmrZVc3wHwoCGgH/DjK
	t2cutuKh403MaJ+8PaQ8asITGg==
X-Google-Smtp-Source: ABdhPJzbFEoNkxF7535gvm2QMeTxG1bbLAD3RCO4UI4i+sGuXs4K/lvjLWKnVlad475XlMkoyKcgSQ==
X-Received: by 2002:a05:600c:22c8:: with SMTP id 8mr12087174wmg.150.1641806631154;
        Mon, 10 Jan 2022 01:23:51 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1? ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
        by smtp.gmail.com with ESMTPSA id p62sm5921856wmp.10.2022.01.10.01.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 01:23:50 -0800 (PST)
Subject: Re: [GIT PULL] amlogic fixes for v5.17-rc
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
 <YdoBffKeAvtOeRSe@lx2k>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <df36156e-eb2e-21e0-e5f2-28666409547a@baylibre.com>
Date: Mon, 10 Jan 2022 10:23:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdoBffKeAvtOeRSe@lx2k>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 08/01/2022 22:26, Olof Johansson wrote:
> On Mon, Jan 03, 2022 at 04:13:44PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
>> the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
>> applied by greg in the tty branch for 5.17.
>>
>> I know it's early for 5.17-rc1, but at least it's in the pipe.
>>
>> I based the changes on your dt-5.17 tag pushed to linus for 5.17-rc1,
>> if necessary I can rebase on v5.16-rcX.
> 
> Hi Neil,
> 
> It looks like this branch is based on our arm/dt branch? Please don't base your
> topics on our branches, it'll be awkward if we ever need to rebuild them (it's
> happened a few times, but we try very hard to avoid it).


Sure, no worries, I tried but I was wrong

> 
> In this case, you should have based your contents on top of your latest dt
> branch (if it would have had conflicts), not ours.

Noted for next time

> 
> Mind rebuilding and send a new pull request?

Sure, rebasing right now on proper 5.17-rc DT tag

> 
> Thanks,
> 
> 
> -Olof
> 

Thanks,
Neil
