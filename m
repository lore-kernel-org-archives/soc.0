Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24D7CCA47E
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 08:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B02A3C341CB; Mon, 27 Jun 2022 08:30:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11C3FC3411D
	for <soc@kernel.org>; Mon, 27 Jun 2022 08:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11C3FC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id lw20so17550191ejb.4
        for <soc@kernel.org>; Mon, 27 Jun 2022 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=r/k/Wup5MZ0W8s3nAcDiEGYXaMuQoL3NODuPPee+xMA=;
        b=lV0hqjwlV3MZhzxNn8J0ngh91fVXmi9vWf/WIa5/b2W1b9+8oIcFRgKOPrdy+8dASR
         DOdrhMBP+fGLUTzjFZcAkLERbuOw/AEEQlxqYHhNhNrZ18MI1wAyuyOJgJAlRMOStXts
         pxJ0ngjLsurtzrBRPUCQVX1+dMoWH2hBa8MqTyE5pLkJbOPVg2gJcRpoTIfM4aVY/1Lz
         +oNOJz7kwGPZ/nSVXeXvg/udtItq05wcqGBlIengWSF+eNWJXyBA036sa3papisnP6sE
         XoDS2OOwa0O8pEu0ASXNFVkFmRhISkXRsK0HvE8ENyV7PmT+u4oN3sQjlYeY4LSrdCRL
         +Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=r/k/Wup5MZ0W8s3nAcDiEGYXaMuQoL3NODuPPee+xMA=;
        b=WnO1wVWd3GsMFngMaUhV35VYOA4sqB8PGbZyzrDKgN+MptR7hgVA4L+kVxvJWesQ9X
         /w7SjIFerkW4oNNilPV1RJVXFQczp8YYC/+cqqywSGmqHzd3G+6h3vFALdWT6b20BR69
         tSmS2eD5lquOLD95M1xPWJbP7YpVl9aI89XG0Ap0R7nc8NahOfpaExTPUHQKkEeSWvxA
         MBqM74RmQyXi2JKUZ0dZFKbgkCG3TiSXh4tByCNNcX6f1lQ8zcbCOvQ2J64fhDAov6ib
         fC91Lu9gsyAjqgmNW88GX/ncOJb516l04poJ+tlMN5SK9oQHXY542xIyfQbaNf/4hvE6
         4r1w==
X-Gm-Message-State: AJIora+8B8zgAz38paujgxtzwyhzcJMbElIjRAx9diI/YsIO3oW+NRG/
	ETw5qalyx+X6eBp0LnH/zvd1eQ==
X-Google-Smtp-Source: AGRyM1tnzpEH5baCKq/SmMFgmvAPOw8Kzw5ImotQVhY6SXQgyGQuIua8gVHp77Z1u1oYmIlUc9d81g==
X-Received: by 2002:a17:906:5512:b0:726:be2c:a2e5 with SMTP id r18-20020a170906551200b00726be2ca2e5mr643759ejp.88.1656318654433;
        Mon, 27 Jun 2022 01:30:54 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x6-20020aa7cd86000000b0043574d27ddasm7019774edv.16.2022.06.27.01.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:30:53 -0700 (PDT)
Message-ID: <f61cd23e-2e37-accb-6e6c-69fcab0cc3d7@linaro.org>
Date: Mon, 27 Jun 2022 10:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: adjust whitespace around '='
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
 <0a35d997-7e7e-8847-7c87-edd33719f7a3@linaro.org>
In-Reply-To: <0a35d997-7e7e-8847-7c87-edd33719f7a3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/06/2022 10:30, Krzysztof Kozlowski wrote:
> On 26/05/2022 22:42, Krzysztof Kozlowski wrote:
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Output compared with dtx_diff and fdtdump.
> 
> Any comments on these two patches? If there are no objections I'll take
> them with rest of cleanups.

I understand - no objections. :)

Best regards,
Krzysztof
