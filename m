Return-Path: <SRS0=LI7+=2S=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6DCC4321E
	for <soc@archiver.kernel.org>; Mon, 17 Oct 2022 21:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D671C43144; Mon, 17 Oct 2022 21:51:07 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2754C433D7
	for <soc@kernel.org>; Mon, 17 Oct 2022 21:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2754C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id x13so7562133qkg.11
        for <soc@kernel.org>; Mon, 17 Oct 2022 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asQ6wQfPw4pQZQWUz3yt+YcvcuAHgYbKLKLuCiLZynU=;
        b=eaDBWGwoBtaE0yzMxgPL+Ngn/eTS24uik4vxjNg/Kx4z6T9tRGwX61NGsbBn/WF7zD
         b9RvyBbCLy7LVXQR8VduQRJVCka1P8m1DxCdNFFK2clfrWxQHxP59NB1+1lt/meCdyvy
         DEWSlQU8aH1+KiR559wHDxGstXIUDdYlTg5e2L+yonG37IHqubitMfMN2+flF7BDnwa/
         AXOfPI2M6uU46doh6W+1K9CG0W1Gus1dSZQ0TbAPPcuKUAbUzjJvdCWI7RaSIB508+gw
         plcmFJIHP2XW3P0TfsWsk2DhboiBgSEGkhZoh8LodbxcvUYMNyfg+0D1JrB07zZ9Sz2A
         lfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asQ6wQfPw4pQZQWUz3yt+YcvcuAHgYbKLKLuCiLZynU=;
        b=5Tb5rkj4NQjhPmwOmSr8QZZnkK5rNTpdOGT6qWDM8u67nwqlD5eP69HzFMK92rfFg2
         n6O+z7offGEk+5lIkuB2SfiaIYcnbpNPofW/VhrGbd8NTU+VccVU+ukTRSVzf7XKvoml
         onezYJlNoVp5ot6DW5PrZWxgyeHhpkb6CCvnML3AtWBRnw0tp4tAP0EkiE4WvxtQCyiI
         Un97HiEhRpxOlh7WmXkIvPiIxEexqHIhFWh4iNSF71bJBwEJzHpXPT+p/7P4zySKKeqq
         zvp+8m8Om42Uv5qx6VJ9Bh1SsKXbM2zbP0Ik1dVCEb1lzBSHQoAYBNjVf6gRLjHMIG2c
         iaZg==
X-Gm-Message-State: ACrzQf2IGx9hPulWzR/iC3VwV0bd6IkCMHo32Lcsu3j6Oh5JiErQ46IE
	LBznS+y/QmrkHrdF03I+wJUQoA==
X-Google-Smtp-Source: AMsMyM5gtzXN0spdmBzyo1fgXB5onAsId3ZixrXT4v3pJmureW3+6TW1EVyUaHii2NsfdHMgrNobWg==
X-Received: by 2002:a05:620a:424c:b0:6d9:7c3:fe1a with SMTP id w12-20020a05620a424c00b006d907c3fe1amr9137193qko.197.1666043464741;
        Mon, 17 Oct 2022 14:51:04 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id h22-20020a05620a245600b006b953a7929csm768143qkn.73.2022.10.17.14.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 14:51:03 -0700 (PDT)
Message-ID: <79d9b77f-f7e1-61d9-2e86-301f07a03721@linaro.org>
Date: Mon, 17 Oct 2022 17:51:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [GIT PULL] memory: late (3rd) for v6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20221003073237.11488-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003073237.11488-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2022 03:32, Krzysztof Kozlowski wrote:
> Hi,
> 
> Late pull for v6.1 with minor stuff - cleanups and bindings fix.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 5514acb0dd030356e628cdd88b266efaa0a22315:
> 
>   dt-bindings: memory: snps,dw-umctl2-ddrc: Extend schema with IRQs/resets/clocks props (2022-09-21 20:34:58 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.1-3
> 
> for you to fetch changes up to 56efd6435c6890a3a38a33d192a0f9d5c835a24b:
> 
>   memory: tegra186-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code (2022-09-28 09:30:23 +0200)
> 
> ----------------------------------------------------------------
> Memory controller drivers for v6.1, part 3


Hi Arnd and Olof,

This was a late pull and missed the merge window. It was based on
previous pulls. Shall I rebase on 6.1-rc1 and resubmit?

Best regards,
Krzysztof

