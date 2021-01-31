Return-Path: <SRS0=OvMt=HC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9BDC433E0
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D549164E27; Sun, 31 Jan 2021 22:19:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E6D64E29;
	Sun, 31 Jan 2021 22:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E6D64E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f43.google.com with SMTP id md11so9198594pjb.0;
        Sun, 31 Jan 2021 14:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6VE3SxdXhb/VJqVGUYcnGRiUq0o7UmpUrQqTKiWRK98=;
        b=J6BRswfyLA0VL8sR/7T+TImWTwgrHHc8w+1Iylrgan9NNql0qG0m+HZ542PT+su4JX
         UNrJwGAdz1zJkk3aFT0e5TIn0i2jq0WO3yYwV0Bx+JGRNLy+eCWaKmB3O98O6hJWIe4R
         UTpumSaNE004UztWrQUuywzlC+d7qH45spv6Wqah2/yOjmXTIz9V43h5NxIykBSW2/5f
         JWRbOjWfzjp7kYtKNFIfQeNpBcH58c3KHPCi57e2tEgH2QjBGWmNVEI7qVKYFNFUXFqI
         UPfwuPOH3ycWv9V9PRPUIWK/zf6HE3fH9MQ5Flf2TnpaLdeE/wE6PSATCcUscdIweLrr
         oLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6VE3SxdXhb/VJqVGUYcnGRiUq0o7UmpUrQqTKiWRK98=;
        b=iPIF1AVTrymO6sEv1gEqXLcyINWbHrutrn/A6bwcgnsYDUwwBdjetBvvm4CPxdS6AO
         lU64tjERBQA9GMQtmx66Va7v/nIqAv86ipSgQ3Qrm9yIHbffrbiUU7UfeNB3NKoVMfSQ
         MK4+leBD1ITsL6eT6OsHfFyA1eCdrRTeVHTrb741tmmEhp4C1rk7Cqsfw/XtpgaKX7oZ
         m2ZmmhuxMsvhcsmlmjVJ80+FSGFMQgbGvS2FQU17N96v5JTw8pBTiSfrtNJKShqPR+GJ
         HXPfYCtdfAO7DPGXe16X5Hk4CTcfjkFQjcGE42T5fcOUtgJsHccLWYWqOUirYCFbd+Lq
         Nbuw==
X-Gm-Message-State: AOAM530SJuAVjsJmOXjLY/qZii/7em3pAlpj3gjYxZtaggGVoMk+YH2L
	FHYyIOGYSxKwXjwPWei9cS4=
X-Google-Smtp-Source: ABdhPJx8DID0hI6w8D2ZWwo5h0GgEAacQX8UhZhIIUkc4xroXaDcZ+m/mY8XzDmxTrs5KmiaWkxrQg==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id mh18mr14385364pjb.137.1612131540308;
        Sun, 31 Jan 2021 14:19:00 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 197sm15424489pgg.43.2021.01.31.14.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 14:18:59 -0800 (PST)
Subject: Re: [GIT PULL 7/7] Broadcom soc changes for 5.12
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-7-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f517c5df-bf3a-861c-1bc4-df6a89b42230@gmail.com>
Date: Sun, 31 Jan 2021 14:18:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131221721.685974-7-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/31/2021 2:17 PM, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc
> 
> for you to fetch changes up to e066cfd867aabe621be5c1855fc42ff699781ae4:
> 
>   Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next (2021-01-25 13:14:49 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Kconfig/machine entry
> changes for 5.12, please pull the following:
> 
> - Maxime adds a select of the Broadcom STB standard L2 interrupt
>   controller driver which is used in the Raspberry Pi 4 HDMI controller to
>   support I2C and CEC interrupts
> 
> - Florian adds a debug URT entry for the 72116 STB SoC
> 
> ----------------------------------------------------------------

You can ignore this one, my script had a hiccup and it is strictly the
same as 6/6.
-- 
Florian
