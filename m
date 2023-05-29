Return-Path: <SRS0=jONn=BS=linaro.org=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589FBC7EE29
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 07:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E2F3C4339B; Mon, 29 May 2023 07:41:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AF0FC4339C
	for <soc@kernel.org>; Mon, 29 May 2023 07:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AF0FC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f4d6aee530so3082863e87.2
        for <soc@kernel.org>; Mon, 29 May 2023 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685346068; x=1687938068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIyR1lHJkA+sNFp9J1o6uPmPADLzeJ2t6TMfApH2cO0=;
        b=G4I84p/8BXGAdQhmvw9H0kqEpMVZkOZUBt1/JCz/TZyyBkJgH/IVNGlt15swfM6pMU
         +Fz3vw2l93bpO61w3Y+E990mCaxZK0f3QXKYGJNdO1bjSIkEotzDCWZNwoa2rOVGuUNO
         EHDv7+aXWMsQyIRxe0nJszhH+zeykKrEwcn7YFUZFi3YDUVX/u46i0vk4t/34hJAfAEb
         Q6Jw/uXk9OfQkm9iNVpZfH/o+jKj+73h8eIwawuDVl9h/ElsGaqsxjDs1rrezm6RP+4j
         7FcFeOdfk+CUI/2xH+tFurLaTKS9UsTdVahpKofk0V8vY8sSEDvdS9zcOzkZO9vLPANZ
         cc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685346068; x=1687938068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIyR1lHJkA+sNFp9J1o6uPmPADLzeJ2t6TMfApH2cO0=;
        b=iqDRFy3QDYOpSDb+Yd40tF1/mNaVAu69hQQw80/wgBUC0xH4fwFfHbGz7PycAyEyQG
         j30x1nbP6dkpV6YAneY5tBmuv0Hios13qfpJxBB8dSF7PWr7HXptOBCWTNbQ8UmzLmoI
         Wv+ID1hLR/+OVaTtmtJpFU/VLKNK5MXZyb/mTheGIcNQYP+ZU6lmsLSV5YgnlLO9ky5A
         cPf9lYoRjxz717K5lX1LMbJOHPSCyt/FGvBEX950jXmXF1kUD+B79CsKZBRLrs7kjE2X
         +8s6StK+zPE0qEY2Tcz3L/L/B22yG+XuZtFg9E38RJEc9KMMXrzaiaC1A/Vm7bV+6nqV
         6GFw==
X-Gm-Message-State: AC+VfDwxPADSn8D5MnGIhr+O/Z9RFoM5iWGXIBAvklPT0P6fl8WqGC99
	ahqablrCm3c8HnRw+Ivuua4B3A==
X-Google-Smtp-Source: ACHHUZ7CGoVzdq3YVY4Qh7oruPyoZkhaD7bLodOYquMFSgOk89OF+fipcK/1Q84XygMuQ4wDmXzFjQ==
X-Received: by 2002:ac2:4423:0:b0:4f3:b2a7:68ef with SMTP id w3-20020ac24423000000b004f3b2a768efmr2891357lfl.10.1685346068232;
        Mon, 29 May 2023 00:41:08 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w25-20020a05651204d900b004cc8196a308sm1876082lfq.98.2023.05.29.00.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 00:41:07 -0700 (PDT)
Message-ID: <a8d3d68d-d202-ddba-3289-65b347807538@linaro.org>
Date: Mon, 29 May 2023 09:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Content-Language: en-US
To: Rudraksha Gupta <guptarud@gmail.com>, Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
 <20230528-decode-creasing-f5b3996163e5@spud>
 <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.05.2023 15:36, Rudraksha Gupta wrote:
>> Where did the "att" come from in the compatible. Is this some carrier specific model of the phone?
> 
> This is the code name for the device. Since there are usually multiple variants of a device, using the code name differentiates between those variants. For example, if I left this as "samsung,express", it would be unclear if I am referring to the GT-I8730 (code name: expresslte) or the SGH-I437 model. This is typically done in postmarketOS: https://wiki.postmarketos.org/wiki/Devices and XDA developers. I believe it is a carrier specific model of the Samsung Galaxy Express.
> 

Please fix your email client:

- wrap each line at about 80 characters
- don't trim messages unless they're very long or
  there's some other good reason
- Don't send v(n+1) as a reply to v(n), send it in a
  separate thread.



Konrad
