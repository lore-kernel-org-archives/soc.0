Return-Path: <SRS0=Xs+J=I5=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C4CC433B4
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 21:48:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F2C2B60FF1; Wed, 31 Mar 2021 21:48:16 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B1D601FC;
	Wed, 31 Mar 2021 21:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B1D601FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pf1-f177.google.com with SMTP id c17so15517035pfn.6;
        Wed, 31 Mar 2021 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QxwbFNGWRYXm1HiDbgF11Bs9rZKtKZ9CCG1+aVTkq+M=;
        b=CnX/Z9Py6pTQ1I2p7AnUknT9diXcMDz+Ygk7+vtocc2TbExrmpnLlgzVc59Tqst9ct
         /tPymd3xh89gRjPyFarZS4URfNc89VMsdKYL6iobLrMGgndfg3zZaFOTwlXuSLqFRfKF
         fyozmm5vFAl39ODKtHFEwSZgI2tWJpW2dSccr5IIH10BYGfc0PUbUGJXvvs/pX5xvc5r
         BhCfcfBteO0ANfZShRrMWC4Olmh9m25qeeaJPCVkG1kiEPGzp65xi4sKSMDb5UabL5Ho
         KbN2I2Gnt+sm0DvqA5unsIXNNw3s2KEUL8Tw3QkN2cezc5ql8FWQMVsRS24LySrqk5vw
         K+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QxwbFNGWRYXm1HiDbgF11Bs9rZKtKZ9CCG1+aVTkq+M=;
        b=t4fN5EtpE4j0QcKy3fKQFCbmFcU5qssaMc9r7lYgupTh35rJJrbO9wOAFYYn3+jhH2
         WZc/mQUOyypJFN6loTBkYIbRoALetbuAp19C/2bR3Pnx0ub9z4C6OaOzSUdA5fTNGUMd
         SAFPJMbhWLsYeRUJ22yL3vZSbQmvmFCdV4aQi/8sHrDIDc7pA8vyM3t67oKpkTP3yg/t
         VXE5povMbbpuL3tJX8wfRfpY5lIIyS1GNSFS8gdpAbNo/k/nbGwNbIKuiYOTKeBrrHRc
         cVnbd5t8DfKVEdUEJfa3fgjvVNrUwHoPX7qhQis3+tL2ql1LtPqrMreHeATU5PiKHmnV
         XTsQ==
X-Gm-Message-State: AOAM531P/1fXFUeLG5fl/Hx/V9a+VamLuLPwpssoMcGr2fVksVY3Uq1M
	WoH6/aktO/WCjp5JsYtWb7R9m/6baRA=
X-Google-Smtp-Source: ABdhPJzzMDB1hCSMHfd2CbV2YmmOtNWFPCpGHZfkaqADWmP23D5Q+DHb4gHqqC037vaVQ8+4/GK6Ig==
X-Received: by 2002:a65:5a4a:: with SMTP id z10mr4844600pgs.240.1617227296132;
        Wed, 31 Mar 2021 14:48:16 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d5sm2900928pjo.12.2021.03.31.14.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 14:48:15 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c71b8949-b709-cb5b-b5a4-87cebf8cd8df@gmail.com>
Date: Wed, 31 Mar 2021 14:48:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/31/21 2:36 PM, Rafał Miłecki wrote:
> On 2021-03-30 20:40, Florian Fainelli wrote:
>> The following changes since commit
>> fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
>>
>>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/Broadcom/stblinux.git
>> tags/arm-soc/for-5.13/devicetree
>>
>> for you to fetch changes up to dcb56d61d5a8acca0a357cc603397bc0272ce4cb:
>>
>>   ARM: dts: BCM5301X: Set Linksys EA9500 power LED (2021-03-29
>> 11:43:45 -0700)
> 
> This one seems a bit confusing.
> 
> Command:
> git log arm-soc/for-5.13/devicetree
> shows me only 2 of mentioned commits
> 
> Web UI:
> https://github.com/Broadcom/stblinux/releases/tag/arm-soc%2Ffor-5.13%2Fdevicetree
> 
> references dcb56d6 but opening it shows page with a warning:
> "This commit does not belong to any branch on this repository, and may
> belong to a fork outside of the repository."
> 
> My guess if you didn't push your local devicetree/next branch.

I did and then overwrote it, it should show up correctly now.
-- 
Florian
