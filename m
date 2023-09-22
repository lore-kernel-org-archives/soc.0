Return-Path: <SRS0=tt/r=FG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013ACE7D0D5
	for <soc@archiver.kernel.org>; Fri, 22 Sep 2023 06:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6730C433CB; Fri, 22 Sep 2023 06:54:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC564C433C8
	for <soc@kernel.org>; Fri, 22 Sep 2023 06:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC564C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9a9f139cd94so223844866b.2
        for <soc@kernel.org>; Thu, 21 Sep 2023 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695365675; x=1695970475; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gToN5+6JwVeDuumtcYBw5pOqRC5acN19XXI6I4cvNRg=;
        b=M4EFTNNJk1imPTCYFSwJj9O+xhYZs8+VRCmyF37p8xVam20fbGHnM4GW1xnN9egzJD
         pwy1zCdxLTtPn3h32MoWc1kX1mUA7FoQHXoJLwcTvouNFFKYlPQO0nFo0SrYGuAllegu
         FdUY1ik9opbnKVZperwBgTa2eS2hS4hA2XcNHe7Wl0r6S8IAePVc7WeohX0s6kgkcbrk
         LDnLfjVv3z+4EVOIDX7+bm5fnAWRDi8H73o6ZMsQl5uoUOFo/G15eERy8K2ofKnkgq2p
         3T/r7d2BnErXcyT9iEg/I+0RqG6k75Q7z4ezcNDzf723Zt3wBP3jNEXEUwDY8N6HnzkA
         8sJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695365675; x=1695970475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gToN5+6JwVeDuumtcYBw5pOqRC5acN19XXI6I4cvNRg=;
        b=hJcP0OxrkVyQDhUggPhCaJk8t3/Y4VwU7aPaL+PNf2LeS+/i6UMnxr4pGs4Jhmj/1c
         bw+tEIj93l+RzOpjxdQVxufnCsMEznDJblg8An+NW4C/YtHp9uQiQpQbb5kOQIh9N7QZ
         0u+4/cekfvdiArpU1NgxdFGMx6kQGk1pHawWQ2YcaifIKl7C5CaLJuAGCj19cNa+oghS
         bt2o5gTaoPVt0S+r5bs5PEVNvNbNM9sP0iwYESurUkxWOUA61r18JQZVKlZ/Kq1FvyIN
         uwJOkBJFw0IEW+Fype6NE0VfuKdhMjtU6q+FskMexTSlEgKSHBF9wkK6mniURE69yVQl
         hHmQ==
X-Gm-Message-State: AOJu0YxIgTEJNltsaH3i+jreiOfcIZYpua45pqYDp8FtNNdiG9+Ro8V/
	5A+OduraZSn3FCfA1wvkPXGYbQ==
X-Google-Smtp-Source: AGHT+IEZFCJDHohHe4JKbsOqirOzRHeUYL/ExlT80NznCPTppvF7tvNtES/IatjqF5+9wrq06izRcg==
X-Received: by 2002:a17:907:778c:b0:9a5:cab0:b050 with SMTP id ky12-20020a170907778c00b009a5cab0b050mr6467199ejc.13.1695365675095;
        Thu, 21 Sep 2023 23:54:35 -0700 (PDT)
Received: from [10.41.192.245] ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b009ad75d318ffsm2274050ejb.17.2023.09.21.23.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 23:54:34 -0700 (PDT)
Message-ID: <d68a9ae2-a457-d8f6-d328-2d0cdb98b362@linaro.org>
Date: Fri, 22 Sep 2023 08:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
List-Id: <soc.lore.kernel.org>
To: mikko.rapeli@linaro.org, soc@kernel.org
Cc: Olof Johansson <olof@lixom.net>, stable@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>, Jon Mason <jon.mason@arm.com>,
 Jon Mason <jdmason@kudzu.us>, Ross Burton <ross@burtonini.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20230921145723.2167927-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230921145723.2167927-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2023 16:57, mikko.rapeli@linaro.org wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> There is no code for this config option and enabling it in defconfig
> causes warnings from tools which are detecting unused and obsolete
> kernel config flags since the flag will be completely missing from
> effective build config after "make olddefconfig".
> 
> Fixes yocto kernel recipe build time warning:
> 
> WARNING: [kernel config]: This BSP contains fragments with warnings:
> ...
> [INFO]: the following symbols were not found in the active
> configuration:
>      - CONFIG_COMMON_CLK_NPCM8XX
> 
> The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
> v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
> affected.
> 
> Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add Nuvoton NPCM family support")
> Cc: stable@kernel.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>

You need to Cc mailing lists to make it public. soc is a special list,
not LKML.

Best regards,
Krzysztof

