Return-Path: <SRS0=2UBY=B2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40583C7EE24
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 06:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCE68C433EF; Tue,  6 Jun 2023 06:21:04 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9306C4339C
	for <soc@kernel.org>; Tue,  6 Jun 2023 06:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9306C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso8567617a12.3
        for <soc@kernel.org>; Mon, 05 Jun 2023 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686032462; x=1688624462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghjbsto09XqPnsXCUmUZKd24RXiWGjP2OfhheXx+RZE=;
        b=TupcBBlW5YEsh9v8j0nYCbVHO7kh1ulyfMEcAnHSvqrsAxbcWEijEqcLa3NoDkrLNC
         VZ5CLdNHUWr4YbJo1wXbRo6ScBX1r4AqA6CpiILcBP0d8KyHdJS/h5JH5fcbSimOV3TF
         CoQRcqjIH5RKYiXQLZf0jRjIsFnNiyqbFvMvbfIh1sSwe/RwpK0D57LcVg3u7Je4g9Xo
         5flyiey/WV3vroipsE+6eGIp8rgRrH2WAub63Rc3eUdapbw9iH5Ws3qdjT55fpvu+Kmc
         Nq0FzgL743GFM8WbmcVJ7QQn51V/xseA2jDS8D3WILlA9ZC7UJh4W0TwxA2wMN6qzXny
         cm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032462; x=1688624462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghjbsto09XqPnsXCUmUZKd24RXiWGjP2OfhheXx+RZE=;
        b=G8+dd7rmeEGZtPCtaRXu1vfGhRilLNVMoLND3uYAkrj06VXhLYZkz6R4LL13mYeS3y
         3SN5obK3UoerhaK2qY4syiEhU/KtD/wgeB2c1cvxo/ffatrGbYJN80XDaQiThAmOCNIh
         +Rb8pSS2zYjxoPB51P3EQK7k0eICl4hkHjeZo8BeKvhTmXkqoF6epE51GitRmmSYpHV7
         O+QJ/MycalRTQwuaowVl7YtIOEQbOlE5paOkqYTTT9Ir8yyscvUL7ItDvsXU+xJbP7pz
         qk817dHa2lzorzgN630n7xX6Qsb5WcIDjGVP+I170acIaXe7jqcSzsn1kOhHHljKHTa6
         u5LA==
X-Gm-Message-State: AC+VfDx89NyOt1el0HB6gfd7zXltGsfL+mZzsceNzhFj9JEYtOGGetQK
	eeZVjEcSEsVUCzCWrhzKkjGcSw==
X-Google-Smtp-Source: ACHHUZ5BBOuUVEcj0d9nizDVIPtOnYGoIXZ8X7BWvAVGbZl4oKgdIvd4Behhvjfjmvzv3MOC84YPMQ==
X-Received: by 2002:aa7:c507:0:b0:50c:3dc:2262 with SMTP id o7-20020aa7c507000000b0050c03dc2262mr990172edq.39.1686032461745;
        Mon, 05 Jun 2023 23:21:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7d456000000b0051631518aabsm4613727edr.93.2023.06.05.23.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:21:01 -0700 (PDT)
Message-ID: <ee60f6ff-42bc-d30e-8465-39d00320d48b@linaro.org>
Date: Tue, 6 Jun 2023 08:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230604063032.365775-1-guptarud@gmail.com>
 <20230604063032.365775-3-guptarud@gmail.com>
 <3c781ae6-4a45-1d6d-840c-d25f33684b00@linaro.org>
 <CT583OP69XTU.3E141NE263OR3@Latitude-E6420>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CT583OP69XTU.3E141NE263OR3@Latitude-E6420>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2023 04:48, Rudraksha Gupta wrote:
ted patch soon that addresses this.
> 
>>
>> It does not look like you tested the bindings, at least after quick
>> look. Please run `make dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>> Maybe you need to update your dtschema and yamllint.
>>
>> Best regards,
>> Krzysztof
> Sorry. I was only looking for expressatt errors/warnings and failed to
> see the other errors/warnings in the sea of text.

https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/

Best regards,
Krzysztof

