Return-Path: <SRS0=TV3V=ZL=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28A2C54EE9
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 16:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B960DC433D6; Thu,  8 Sep 2022 16:43:38 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 004EBC433D7;
	Thu,  8 Sep 2022 16:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 004EBC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id k12so671136qkj.8;
        Thu, 08 Sep 2022 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0XsbLIO6zVoDWhejmU39Vgqhd4Id8+NIThNM5fDQGJ8=;
        b=dkIclgXFiQcPf63niixCbV1YB5e+2rmvMam+EBVqIO1AxOXeaqrbCjSRsEk/6+vQTP
         3WOA1TsjypG9xgqrSg08UZM6fEE1Eh2eoFk9sd1p96MSvp0LkmnVuHrolbBlVFMhb6DI
         DmQST4dXAkhHDP/giELuIVyhMbCi1MWhYQRAWjeCN3nTsho87oOibbV9wEik2LnXjN3j
         8aNWwVhxEZXDPXi1xOaRZQnL57f5znNfqEZPEd/SXbKlvHt5I7cRyWlPYYvfu1k9nLVH
         guF5vd0UjRGSCorXoN9t1eZCWrnK16HBbLCWpZ4tdVtt4i+u6I/h7NuwEC5xKM6jRdxO
         pHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0XsbLIO6zVoDWhejmU39Vgqhd4Id8+NIThNM5fDQGJ8=;
        b=SyBXklziDvKjVok/xmrW5/JPspcQky4RTIb0FrrBRJKJoEHYpsV83NT4/YnNz+HV8o
         QjVfGPpihHxqbkgToEmCivmwXuo0LSsloZPYlaDlSfWIX6RJ+LCzEO9nfoJgJWk+94zy
         BxB+5c6Gi55fSPcAbivY2uIey58Wl+lygoJprNpFhWI39ylEYsfpKfOX1WcVRyQLIVB/
         y6iDhJ0pWsrKUEVxDBZGEY9rzv6utFeUQ6sFYAGCcRksLotiWdlr1QpUEzy0kjaa/4GR
         egIcPYOxwTU291zTaTWyO6vTKA+EgJkd1TL8lRbyP+qNdHLSppwCT1cwKc6ZAinKYRwZ
         JOxg==
X-Gm-Message-State: ACgBeo22iKJLx+ZS+SudbGtcSU5SfMD9JFt9fEyQDXFZfw724PXbHeOK
	vq9s+lwY36K+GPjBYrEQ6P0=
X-Google-Smtp-Source: AA6agR7g3zVAk7I9S7IVnTFx/3++VjeSP7TWm1Mv2UB0P/n9uSMqp0mScOrZ9lRAtC/kZJW9Jz1X3g==
X-Received: by 2002:a05:620a:248f:b0:6bb:89d1:3e85 with SMTP id i15-20020a05620a248f00b006bb89d13e85mr7084450qkn.408.1662655416764;
        Thu, 08 Sep 2022 09:43:36 -0700 (PDT)
Received: from [192.168.1.102] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id hf9-20020a05622a608900b00342fb07944fsm13911957qtb.82.2022.09.08.09.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 09:43:36 -0700 (PDT)
Message-ID: <588be35f-9293-0d26-1e89-5ba3a0f9bbc5@gmail.com>
Date: Thu, 8 Sep 2022 09:43:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: arm64: Kconfig.platforms: Re-organized Broadcom menu
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: anand.gore@broadcom.com, arnd@arndb.de,
 bcm-kernel-feedback-list@broadcom.com, catalin.marinas@arm.com,
 krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, olof@lixom.net, soc@kernel.org,
 will@kernel.org, william.zhang@broadcom.com, anders.roxell@linaro.org,
 lkft@linaro.org
References: <20220712164235.40293-1-f.fainelli@gmail.com>
 <20220908110451.66564-1-naresh.kamboju@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220908110451.66564-1-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/2022 4:04 AM, Naresh Kamboju wrote:
> From: lkft@linaro.org
> 
> LKFT test farm found that Linux next-20220906 onwards the Broadcom DTB
> builds are not happening. And after bisecting we found this patch is
> the reason [1].
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> FYI, We have not changed any kernel configs.
> [1] http://ix.io/49Wq

Fixed with:

https://lore.kernel.org/all/20220906033957.4377-1-f.fainelli@gmail.com/

sorry about the breakage and thanks for reporting!
-- 
Florian
