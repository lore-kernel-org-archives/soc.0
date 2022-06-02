Return-Path: <SRS0=14BC=WJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04937C43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 06:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E109CC34114; Thu,  2 Jun 2022 06:42:10 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36D86C385A5
	for <soc@kernel.org>; Thu,  2 Jun 2022 06:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36D86C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id jx22so8013271ejb.12
        for <soc@kernel.org>; Wed, 01 Jun 2022 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YcVxfDa9LvCUOkqeRnWeJHFwW9LiD3rmlRjajceH05M=;
        b=MJXE1rnhYI4EtbgnAGDkzJmgeAz5fHOoCVrAd7HfHDIK4UKQTyK3j+GfE6/mDGwnMe
         IkOjUpb2DVq2VAD7M5BZYUsn/2jBIpzfKERlpGokDCM+jIJe+q/dZziGQMoBiny+HN9m
         Bh0jT7xuHaPt/137bjd4VVJzkYpgITu/W2fi3sWXsk1IP1rJ8mwSF14HwiaHHNcopaD4
         Ch+NyQTsIegQfpouRCcN5awRjiWR5RYaSZLPGsH8nub20euyI07Uiy1UPBiLxJlofmvH
         utu7pZvoqMHMtamUPH8zH1QkO3WSBuat/f2k1EF/zMQfZ+DTIFjjXAS9goBT8mHa7klX
         +d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YcVxfDa9LvCUOkqeRnWeJHFwW9LiD3rmlRjajceH05M=;
        b=qjPenxae2p8jDgAU404Xhrf44DLh1bCv79w0MZNjabEOotEvCzUDXPM2M4BsHMnXwv
         kwvoMG5axy1f65XwhzF4J4TmlLsoQ13E8g1PM6Se8E533YvQEr7GRcsjgEs2uNaK1wtn
         iGmbPROZe2HgTBL8rP3+5XqNQfijTSNpNArO6wb49hUdtrRyf1yBZXGtGkYPzO6niFZp
         fH726QS+uuQiqo9F+6VO+y7/YI7nRSQrgZ3CqNK99kNbSrQpBnBWQrcc/acFswyJsJdX
         gG9IlAmHRXZ1ZFsacTuOgrJsRaHmx8ZMfwP5A8ss0gbegky/0i+pz9yHJmzSb+tjfrth
         /LrA==
X-Gm-Message-State: AOAM531BWqZCWAtkT6gKhCjVPoA0CMgmw2kh7LPo0IXIZN9BTNqrJTQf
	Gpg5dCJnDJWhVt2m180QRPmLMQ==
X-Google-Smtp-Source: ABdhPJw8/Sb3u1AXrdJHsfhBh0XKfSg6ceuAhBGJDSd8b17kHdSaHMdFbuG171xpt21Hmqv9rRT5DA==
X-Received: by 2002:a17:907:6d14:b0:6fe:d86e:7e1a with SMTP id sa20-20020a1709076d1400b006fed86e7e1amr2829800ejc.615.1654152128590;
        Wed, 01 Jun 2022 23:42:08 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906254c00b0070759e37183sm1392910ejb.59.2022.06.01.23.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:42:08 -0700 (PDT)
Message-ID: <4f82e7e6-5c36-928c-0b76-c342dbb1e5ba@linaro.org>
Date: Thu, 2 Jun 2022 08:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 5/5] dt-bindings: altera: Add Chameleon v3 board
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org, amstan@chromium.org,
 upstream@semihalf.com
References: <20220601154647.80071-1-pan@semihalf.com>
 <20220601154647.80071-6-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601154647.80071-6-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2022 17:46, Paweł Anikiel wrote:
> Add Chameleon v3 to Arria 10 boards.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> index 5e2017c0a051..400543fbe78d 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - altr,socfpga-arria10-socdk
>                - enclustra,mercury-aa1
> +              - google,chameleon-v3

This won't work like that. You need separate group. Please install
dtschema and run `make dtbs_check`.


Best regards,
Krzysztof
