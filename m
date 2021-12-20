Return-Path: <SRS0=vNIe=RF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C9EC433FE
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 16:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F040C36AE2; Mon, 20 Dec 2021 16:48:59 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7032C36AEA
	for <soc@kernel.org>; Mon, 20 Dec 2021 16:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7032C36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0EC9F3FDC3
	for <soc@kernel.org>; Mon, 20 Dec 2021 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640018935;
	bh=DYfa/5ectGQzZ8y3l+jSOjS0qhsMHbXVqnPyDEeUiM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=CVb89qtzXNMni1xhBNFe7EUmjZFPa+UEPKzkJd4f8Q0omm0BALqcuUaJcjv2qOxnK
	 LQiWAgsMJIn7lmO6AlhYduCsDgyAcseJmV/UxN+M0YnqtOOvOxqBcEQLuuw2bAYFlH
	 zh/Ed+PAEBuL73YTc2Y7qu32O6CtOZoHAlJt2uFxklOMnY0uaZRf8UcCQ4ir++wAKg
	 o/lmH9g/LooSGePH12JFZyLh2bB2+gB6He3j4c0/sSmhsVCxuZo+6IpEZvLMnqF+EV
	 lncBNfYJGRBVDPFN72/dbGqyzW92dioQncqqwDuc+mjNeBFY/tMhG2RWhumwQCbSW4
	 1jmI8vZfEJbiA==
Received: by mail-lf1-f70.google.com with SMTP id d2-20020a0565123d0200b0040370d0d2fbso4775226lfv.23
        for <soc@kernel.org>; Mon, 20 Dec 2021 08:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DYfa/5ectGQzZ8y3l+jSOjS0qhsMHbXVqnPyDEeUiM4=;
        b=yFsTn0NaiKEOsMTJhgQPKaZsNN9zSt9dVdiscHiKD++zXeCBzcOdOodleaw2IBmWNM
         JzPswx6Nzf3VE4eHdHXVRsT64YiM/U2CBYgZUb4w5Fk/CmC87Z1YuI7ct0iN8T3H3SO2
         BFGlFVmHTdNGZ40uIViuVhWbGH4u6x/YGItiTWinUqeQJ6rqeDnJZYCtxdmJuHUsmA7A
         ftZVYgRN8HgyNp2XQhF/141lo+fDWWSjdQgQyhg0KwalcZ8P+LodOAOiT/ise3i0sDv7
         UZvm5K1upZSMH5MMjoaPrDO5trxrvi51VKXGr80RZak1eouaTUYbxjj9UwxwFQOtdotT
         y/1g==
X-Gm-Message-State: AOAM530cG8FDLEbrbbuCN14XsB3opyxlFmTn4egFiqAGCnYOaO4zA8/v
	hIjnhSPhep62iQO20CHbSaYcGQR+PbwcorWaoKhyIGTEznJ92vyC7c9BtStrQUaxCS4RQKCHOeV
	pPkErnkTMKPSB9Fr6hkhtabk=
X-Received: by 2002:ac2:48ae:: with SMTP id u14mr17041124lfg.610.1640018934459;
        Mon, 20 Dec 2021 08:48:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8yqg4GqMCAMMT7Glf5y+TjFZrXMjASbZ479SQVeZWWxSO+eS7MRPqHEL0i+Cg7sbAuuZLPQ==
X-Received: by 2002:ac2:48ae:: with SMTP id u14mr17041093lfg.610.1640018934138;
        Mon, 20 Dec 2021 08:48:54 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j10sm548950lfp.286.2021.12.20.08.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 08:48:53 -0800 (PST)
Message-ID: <81b39068-a06f-a4c9-bca7-6fb296d4b05d@canonical.com>
Date: Mon, 20 Dec 2021 17:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [GIT PULL 1/6] samsung: soc: drivers: for v5.17
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Chanho Park <chanho61.park@samsung.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
 <20211220115405.30434-2-krzysztof.kozlowski@canonical.com>
 <CAK8P3a1A+6f1OsJ-8-8kbmXXbbsrQZTQywOAy59tJoUmdDN49g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAK8P3a1A+6f1OsJ-8-8kbmXXbbsrQZTQywOAy59tJoUmdDN49g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2021 17:26, Arnd Bergmann wrote:
> On Mon, Dec 20, 2021 at 12:54 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> ----------------------------------------------------------------
>> Samsung SoC drivers changes for v5.17
>>
>> 1. Exynos ChipID: add Exynos7885 support.
>> 2. Exynos PMU: add Exynos850 support.
>> 3. Minor bindings cleanup.
>> 4. Add Exynos USIv2 (Universal Serial Interface) driver. The USI block is
>>    a shared IP block between I2C, UART/serial and SPI. Basically one has
>>    to choose which feature the USI block will support and later the
>>    regular I2C/serial/SPI driver will bind and work.
>>    This merges also one commit with dt-binding headers from my dts64
>>    pull request.
>>
>>    Together with a future serial driver change, this will break the ABI.
>>
>>    Affected: Serial on ExynosAutov9 SADK and out-of-tree ExynosAutov9 boards
>>
>>    Why: To properly and efficiently support the USI with new hierarchy
>>    of USI-{serial,SPI,I2C} devicetree nodes.
>>
>>    Rationale:
>>    Recently added serial and USI support was short-sighted and did not
>>    allow to smooth support of other features (SPI and I2C). Adding
>>    support for USI-SPI and USI-I2C would effect in code duplication.
>>    Adding support for different USI versions (currently supported is
>>    USIv2 but support for v1 is planned) would cause even more code
>>    duplication and create a solution difficult to maintain.
>>    Since USI-serial and ExynosAutov9 have been added recently, are
>>    considered fresh development features and there are no supported
>>    products using them, the code/solution is being refactored in
>>    non-backwards compatible way.  The compatibility is not broken yet.
>>    It will be when serial driver changes are accepted.
>>    The ABI break was discussed with only known users of ExynosAutov9 and
>>    received their permission.
> 
> Thanks a lot for the detailed description, very helpful!
> 
> I've applied pull requests 1 through 4, though it seems that once more
> the automated emails did not go out.
> 
> I can't find the two defconfig patches you mentioned in the introductory
> mail, neither in patchwork nor in my inbox, I assume these were
> numbered 5/6 and 6/6?
> 

Yes, these were patches 5/6 and 6/6 but maybe I made mistakes in address
list. Let me resend them now.


Best regards,
Krzysztof
