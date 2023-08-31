Return-Path: <SRS0=f61G=EQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1730C83F2E
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 06:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C342DC433C8; Thu, 31 Aug 2023 06:21:20 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90063C433C9
	for <soc@kernel.org>; Thu, 31 Aug 2023 06:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90063C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-529fb2c6583so489398a12.1
        for <soc@kernel.org>; Wed, 30 Aug 2023 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693462876; x=1694067676; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MN3/KIBcA6h9wGDVjzSLq0W+eq4AFp91etA4VWB8MhQ=;
        b=AtiZHtnc4SOlMm0a6RHdUIvTYgLQWaybEG4OfFHoBz0UH1pKwZDYcnU6Y9LTf1yeND
         eiTqbTOBc42KevjNbVXIbPwGrAMcoxguMmVjFQisRSo/dcrdqRMCuVvRRbFZfH4mPo7h
         NNg8T8KCZAsE4uE9Y4sa/oyBQGe/+i8QErgl4wCCQ/KnCGBQXotFCIjHHo7YUjaO0bgX
         ZqjWJ1oRe5X5AQBcHWL2DkRj+HtLqHYHzIhw3G0zUV609jrRejg/FJsJJvmaRz6Fe4yw
         xbjnjKkkroUuY2/7mICbk3zKECDs3e0rTd0fosQsySTYTvIpUoWMoI2c8iGQ78k2Czrn
         VH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693462876; x=1694067676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MN3/KIBcA6h9wGDVjzSLq0W+eq4AFp91etA4VWB8MhQ=;
        b=iI1WgA3DMU7HgIsNKu4YwB4SUBaQXZT26XK6YqMbrvSEcG5dA05rq7ZPUsVN6wcD25
         O4mgeQd2G5sM+wjdS4i8nSjpHq4RIrKhoW3FRjvaVLQh5azUCLKrUSRpQvYOlWOCp72+
         um3Cbjl6CiPMjeqWPhU164lD8miB+QeVvdiuhkEvTswlJj795EnohQtUDzo1TRcjJ1An
         E/l02G7wBKrrGjYZZ60VXtsaFaJvb1IpT8lhpFD6/X6QwwAqaUtg3xCa+ms/+3pYve5V
         RgTuMVvYaumfWwhTd/WHlVsxLCMrUjwX94fGgeryIdbpvXi7WC7lZ8SOprv22UTCUutf
         tIbw==
X-Gm-Message-State: AOJu0YxbyNFSQeFtJta5xQfbcwdfGi0Xo8btI+1moj877BeiMuBGSrnc
	wSmuuwDBOLVOw8Afaq2w8/ernA==
X-Google-Smtp-Source: AGHT+IFB8UbQE1K/uA5hBzss6Ee3Nu+tw1dskpb+vfsEvF2olxJ5G/EiW5Bu7rju/ULP+GRYIIUK+w==
X-Received: by 2002:a17:906:4e:b0:9a1:c659:7c56 with SMTP id 14-20020a170906004e00b009a1c6597c56mr3059069ejg.22.1693462876358;
        Wed, 30 Aug 2023 23:21:16 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906278600b00992b50fbbe9sm382001ejc.90.2023.08.30.23.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:21:15 -0700 (PDT)
Message-ID: <3eaa444b-baca-1ae0-039e-94f7811d216e@linaro.org>
Date: Thu, 31 Aug 2023 08:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com, potin.lai@quantatw.com, daniel-hsu@quantatw.com
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-3-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831055030.3958798-3-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 07:50, Peter Yin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

