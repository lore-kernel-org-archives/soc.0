Return-Path: <SRS0=ZEIE=VT=gmail.com=jirislaby@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A12C433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 06:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A79EC385DE; Wed, 11 May 2022 06:51:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76E8FC385DB;
	Wed, 11 May 2022 06:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76E8FC385DB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id h16so844414wrb.2;
        Tue, 10 May 2022 23:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1wEl4hKP70nqNM7+s33aDLROWITXXzeuUXQCyFgNxKQ=;
        b=dXtt6McRrBbztGLE6Sy7m4HBvEGbf3qdy8emAd79mnX2GwapYkoV9Jp0YmgUwpKgLM
         4R+GccA6SpDbPJENgTuS0N2i8uZ2b7hQ7gzcO2AZBB7EEQ8zgmQLuXDs4WXXVr7CQeFS
         Sly+UYfC59FECKvBkO0yGIuK6K0u4IvXzUIFWzcMnlUNK2aLgxJu8EK2J8fBsYIz6jxY
         mrsyQJJDFIDrzZVx6rU5yPIkDFi4HxlMWKchrH/8AV45dwDJP6hycX2KV//kqrJx0CYG
         QF/5yqiPALMrjAevx1EsiyofU6C2D1W0rfDJZZkuDsUzSk/egmgQkimO+qPD1hol16Dk
         cVVg==
X-Gm-Message-State: AOAM533cGQh5jeHlOIQNGZBEj8xXkb+YbKnm6krV1Sbtqphqgk8m/e+i
	guxp657nX/WX6ZcKvPJB/68=
X-Google-Smtp-Source: ABdhPJzvSiFXK+Pkx1A+5Jgez3pwE0NnwYeWyDPJFd2IMdUv3cDPSfUbrL34eucFRES0Ji7AeRNSEg==
X-Received: by 2002:a05:6000:144a:b0:20c:6b73:804 with SMTP id v10-20020a056000144a00b0020c6b730804mr21963700wrx.88.1652251877878;
        Tue, 10 May 2022 23:51:17 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c424500b003942a244f3asm4242899wmm.19.2022.05.10.23.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 23:51:17 -0700 (PDT)
Message-ID: <e9a112f8-a35b-1df4-0567-9fddf80c8e17@kernel.org>
Date: Wed, 11 May 2022 08:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Cc: arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
 gregkh@linuxfoundation.org, jason.wessel@windriver.com,
 daniel.thompson@linaro.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 peterz@infradead.org
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11. 05. 22, 8:21, Hitomi Hasegawa wrote:
> --- /dev/null
> +++ b/drivers/soc/fujitsu/a64fx-diag.c
> @@ -0,0 +1,155 @@
...
> +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
> +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)

And I noticed here, I would:
* remove unneeded parentheses
* drop the "_OFFSET" suffix
* just write 8bit values (0x40, 0x44), given they fit
* order them numerically, 0x40 goes first

thanks,
-- 
js
suse labs
