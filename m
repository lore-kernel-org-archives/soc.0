Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB8C43334
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 08:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51B5EC341CD; Mon, 27 Jun 2022 08:43:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8127EC341CB
	for <soc@kernel.org>; Mon, 27 Jun 2022 08:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8127EC341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id ej4so11905540edb.7
        for <soc@kernel.org>; Mon, 27 Jun 2022 01:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=jor1QhrStR6ApOvhc3xwWQAdwjSthDn3Ozs36STiHgg=;
        b=K4KabGyJXTkVg+ASQfeTMlCJZiVasxZ+4yTJA7quD3VWJfuOLWnMrxUAcHHR2frMSs
         IID0sxqMMtltp6CDyEqfvw7LzZ/j6bw1Q8aCnuJsF00+b4eSwl8QlhHPI0pwZ6gyMlDY
         ed3PiFLh6AO6ACRs7FETbidpTJ53hyMj5/FvbkNR4FK32BRfRx+zLSJEPirPTgWifC0+
         vM7wlVPgRXeuSFBA6QUvF32XTrkTPcbNCO3gG5zAskyrhuaRKhug7eYLveU6xAh1Jyk5
         kHwaLTCxbjKVR6juwK3jukHBXS3+7pzKwoPyN6P3qcpiFagihLGBdp6ZjqFJQsSuutMx
         ISwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=jor1QhrStR6ApOvhc3xwWQAdwjSthDn3Ozs36STiHgg=;
        b=Y2M+lkGUtHnp/f21c8WTGh+3aHgHL1eskJdVs48AJrFjMFMmZJhIUhsb/dFSIOmaEa
         IuOMwJ9aXYwFtmqQsls0BoyyeL0T+FSV4BPr1SFYJeQi8NIuhbC8qDi8M2GKZ+dzx+zB
         SalQ5ZXsQAeeoWpvZZxQIy+Zjswhq+OTKIYSfbVxw29TAXwhfbEJPiBaU6B0Xz9G6sdM
         BUIRQ+AGXMW7rjEyqaSnX74m+n1wPolv95a2WFyllONi0QZf+fIllJVU176vb56iZdcB
         rKxFmDK0Kv7QxFoOjarn47uWa6f9CBPRIW4aj+kdViUIopbtCylWmfUeSG8JZZQMmeeW
         ZBVQ==
X-Gm-Message-State: AJIora9K4LA8HOnZLElHc5Pczgbr5cHv1kiIighgoEvlQ+pcbJ8d1RQt
	UJJ+f47u5/ANeQG8Czn+WkrsGg==
X-Google-Smtp-Source: AGRyM1sbEnLfVkwxoC7QLbqZ9tBFin9K5ugJw1DSXHMx1l+gpYVvTO3Yq2u2MM1VNGAVIBuuiqNO9w==
X-Received: by 2002:a05:6402:1d50:b0:436:beac:a4e3 with SMTP id dz16-20020a0564021d5000b00436beaca4e3mr15419037edb.191.1656319380921;
        Mon, 27 Jun 2022 01:43:00 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a1709064b4c00b00722e7e48dfdsm4729709ejv.218.2022.06.27.01.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:43:00 -0700 (PDT)
Message-ID: <68595b1f-cdd9-6c8b-c68d-59ecfa90d753@linaro.org>
Date: Mon, 27 Jun 2022 10:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 11/40] arm64: dts: marvell: align gpio-key node names
 with dtschema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-11-krzysztof.kozlowski@linaro.org>
 <50ab1e83-f14b-6d2c-df31-60a255552c46@linaro.org>
In-Reply-To: <50ab1e83-f14b-6d2c-df31-60a255552c46@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/06/2022 10:32, Krzysztof Kozlowski wrote:
> On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
>> The node names should be generic and DT schema expects certain pattern
>> (e.g. with key/button/switch).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 +-
>>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Andrew, Gregory, Sebastian,
> 
> Any comments on Marvel parts? Shall I grab them with rest of cleanups?
> 

I guess answer is yes, I shall. :)


Best regards,
Krzysztof
