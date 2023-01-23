Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA93C05027
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E9FFC433D2; Mon, 23 Jan 2023 10:52:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35B59C433EF
	for <soc@kernel.org>; Mon, 23 Jan 2023 10:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35B59C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so8218796wms.2
        for <soc@kernel.org>; Mon, 23 Jan 2023 02:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wf6IzpiJWgjJ8XBMtpelOXKyiBWR2D24WcuFGb1gZAE=;
        b=GlQ/yiKj9WQ0flHkW2fHsanVpC+Hem4dYMR79eUouO6vNaJrIOpzsZLC5O2/W1JW1R
         zX2IcYdHng+NyIddvZzen0zGg1zo+ZYCyMJeWd0iLUt5jDc9LtLbidsFsF2KL900HzT4
         wIHn885vLC5xLEi2NK4lKZDJnU+iU+qc2LXyG+aj7M+AcSv5wDq+NiSM4ne0s0AmG5qJ
         qo0lKVVjFy3dGZaFhg0E+qF903Oj220vWSS9maki1xTMfJgmNvV0AsX9W+NaUXXBmHYQ
         IeKheWQvNppCRDwx00kSWiS+G7+LApgte/BzEUsn2/HVacuDIMuJsSpRPBhihEaW+Z4s
         tdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf6IzpiJWgjJ8XBMtpelOXKyiBWR2D24WcuFGb1gZAE=;
        b=5ph3DrVJKc/4j6D5Xka0Mxe3Deb9Vxmd7mZEPtQHJ2do8Pr3JVAnGvzMlpXa7S9Zs5
         NozbGdTMb9yfqG1FSnCfqbYZEdReODj3XOhkMweAg1BnEPxB4pV4BORE8Nc3zHQy3KKD
         TZZPDmxI8WqPWMoBfe3baSXXQuzr9fCMhurNzVRYt2KYdMyG2ilK6je/75nkzy6kZj5B
         CQMdheucvFYc3eQFyronqoZqgbPEk8TzmFI3SdCuwoLJDx9SY8/Oo8PXRnImk6hoh4Rd
         Jgt0TVCuI1vS1+7CtgnOWvb+O2GAiy10TuAfINiMzM2LmUlzKA3IOBfGIvxVDlXYKjDo
         pFNQ==
X-Gm-Message-State: AFqh2ko73LLNKfXwUEpPW8jIol/1XmgoB/wx5T19+o29QDk3bUTqUtYe
	wlsZE5P4X/aK0z5hbbpHng5foQ==
X-Google-Smtp-Source: AMrXdXvqdASlQuynG2I5qf1duw5CyxmiHlmIGbxP9uDal5pHcNeK8sS7LdFXWlaKWwSjzjs4PNWM0g==
X-Received: by 2002:a05:600c:1ca0:b0:3db:1ded:1769 with SMTP id k32-20020a05600c1ca000b003db1ded1769mr15551397wms.10.1674471132537;
        Mon, 23 Jan 2023 02:52:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003d99da8d30asm11192811wmo.46.2023.01.23.02.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 02:52:12 -0800 (PST)
Message-ID: <65e5d86b-ab79-9652-2f08-bdab6ba03f89@linaro.org>
Date: Mon, 23 Jan 2023 11:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [GIT PULL] memory: drivers for v6.3
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20230122121129.28699-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122121129.28699-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2023 13:11, Krzysztof Kozlowski wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.3
> 
> for you to fetch changes up to 4fd1a0e496cb81e939c55143fc81c2be130099c4:
> 
>   Merge branch 'for-v6.3/renesas-rpc-if' into mem-ctrl-next (2023-01-22 13:05:21 +0100)

Please ignore this pull request. I'll send a corrected one in few minutes.

Best regards,
Krzysztof

