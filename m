Return-Path: <SRS0=7ELp=DA=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFA8EB64DA
	for <soc@archiver.kernel.org>; Fri, 14 Jul 2023 04:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D312FC433CA; Fri, 14 Jul 2023 04:12:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0286CC433C9
	for <soc@kernel.org>; Fri, 14 Jul 2023 04:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0286CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-313f1085ac2so1525866f8f.1
        for <soc@kernel.org>; Thu, 13 Jul 2023 21:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689307946; x=1691899946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0om7TZyUtm78+G+6P856aCHHrm1f5f1KaX3wUrCTAY=;
        b=ccczWNKODZuxkRpCg56pFlAaZdQRexz9nkS8tlC/ZdzAfGtdQ7nZ1awhlh+/BomWyx
         5BdcclPjEkThLWEV8IH5urqxA2zYVv3RSNPbwp+Ldrkk68PnG/DDzCTpNjxtmxn9bbu8
         sScBjzCiOzSl26cwhrYen9VMYqMOWNP9a0EBjrokc2xFiuRz9EVmEL8RqB029L+4IpTu
         5K7L6NNTrMK5+dnmEMxrRuvwRIqBNp5eyMjp6EIMkDr2ve9FGv/xzhDZWkIckiUF6pVt
         /KaJ0PKvC6H4DbG2iqHFmWn02efNj6CIx67rNmxCdhyiDAxMunEIaoB9FMFDxnRwZqZP
         gnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689307946; x=1691899946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0om7TZyUtm78+G+6P856aCHHrm1f5f1KaX3wUrCTAY=;
        b=EK/vlEhTV/iabU8USVu9L4oTG0A5++LAX2Wkjo5WtNbC/pBiZdm/EuFZMf6CsmpLfW
         SRzw0a6aBiikCcWF10N0ejOk9HMe02zkQGUE2eRudBU649IFqlqKIY9QCXOyojbhud45
         YEMYeGx8nBHhnnDXbK0EGYFZgsFtrpcsxQRbMBPidGqjwC+C9T/ZLRzbiQ8vfy4o5jir
         XhamcwQLBz2gXtsP/Obk+JG8R5bZc1xMt8JLIQmErIfi1HHQZRV0sUGHDXmXZ7raM1Jt
         TmDoDaDidWt2hkNxw3CK2kSLl40UU9FJHRXlOY0r2W8TDumDxgX4WcDfo4cDxNBK7Sua
         lZgg==
X-Gm-Message-State: ABy/qLarJyxZZSQKzGBp9vzNEzr5WvzeI9mOTN19q31B+6JTYfnbFWl/
	UFD3eeRvrGCXV/vX2ipHC5v6fA==
X-Google-Smtp-Source: APBJJlFirpaQfMgeNnJNmqD/IIFh+MZqYnv5ScO0xHnlU6ErTOZlfdl92D5b5W6MJdqzRwxs+uoReg==
X-Received: by 2002:a5d:4641:0:b0:313:f0ef:1e55 with SMTP id j1-20020a5d4641000000b00313f0ef1e55mr2799626wrs.37.1689307946155;
        Thu, 13 Jul 2023 21:12:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d6947000000b00313fd294d6csm9783978wrw.7.2023.07.13.21.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 21:12:25 -0700 (PDT)
Message-ID: <58b40977-5223-7431-3c0e-dcf87bf1ef3f@linaro.org>
Date: Fri, 14 Jul 2023 06:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230712073752.54624-3-Delphine_CC_Chiu@wiwynn.com>
 <20230714023502.3225096-1-Delphine_CC_Chiu@wiwynn.com>
 <20230714023502.3225096-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714023502.3225096-2-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2023 04:34, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite V4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L552

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

