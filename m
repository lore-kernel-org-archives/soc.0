Return-Path: <SRS0=jKnc=BT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBA6C77B7A
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BEB7C433EF; Tue, 30 May 2023 13:14:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB73FC4339B
	for <soc@kernel.org>; Tue, 30 May 2023 13:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB73FC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5149bdb59daso3648628a12.2
        for <soc@kernel.org>; Tue, 30 May 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452446; x=1688044446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUH9XtAzWIRgOsb1MqDJfvd6qVENrkssqR4+2VADmQU=;
        b=iLSrL45SV8BP5SNaj9ihAs/HG1rHntKH8UaPf63oqwFqxFSR3voahRiA6NEluOhKtu
         ZTWv7fK83uKK5C7t5jOu7RMYdZ0qCXslmYTpIm+t+1WULQ0dTV+ziS/8Isu6K3DlYOjz
         8TG5F71WCuwaE7AwHpS7Zj7M1Lo5T+UykhITrpppwUN8RqIsUUf4Iee/kT71bNlhbuuF
         /XkTcRCmJr1HZNRZeq17NBZww56GGHJllapgC0nC/bEuBsHqLQzx+zttBSsa5qMY8IR0
         OIlVyz9O7ET9giNoKqD+fXIkU923lQIPOBa2AmO4BtTdrIgWdhXOVkNilDHJjMDJY/hn
         y/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452446; x=1688044446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUH9XtAzWIRgOsb1MqDJfvd6qVENrkssqR4+2VADmQU=;
        b=XeUzrvGttUNOrznDNkxOzCe3V8XytC3Yd3zcfrpCgu2Bq8JKFmXJyvFfjh3uACotQf
         rsx2nnjVuBhXYjXUnTBb4lTcMMf7FRKhlujxImFt+0boWJFXvsPPookW1qgqdOHVzGjD
         lpRMDCe6SKeJkdHPVk4cA1vEBvlmRBHCzZW2FlKPMwKgAYymRX/+1uLCmFlZzj+7EPbx
         aU1q6mnYzRcbZmpdWRgpXrPuNx2GH/ltZWonsdVxmNaawOAjV3PFPyYAe0QHiKhZRrc1
         22+hoCVcSm2oWpLq5zSHjgVal+7cJiRGPIcCB265l0hHHPJ9/4gyeYAu7sBmy7d+pLfF
         axrg==
X-Gm-Message-State: AC+VfDz0Mtqav/KM8DopiTH6AAcuo0pSnvGKjVtsBl60+KAUDFD8htbn
	Yy8EXsZ1NZihV8gDlvrYtoB7ug==
X-Google-Smtp-Source: ACHHUZ71bUnQXRzAkoYWkylcW0WPdqFvOlzeWjYH5TDzER83v471t24VZ6980CJNywvjLuGF0XQLiA==
X-Received: by 2002:aa7:d8cb:0:b0:514:9474:f4b7 with SMTP id k11-20020aa7d8cb000000b005149474f4b7mr1588818eds.31.1685452445895;
        Tue, 30 May 2023 06:14:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b0050bc4600d38sm3929947eds.79.2023.05.30.06.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:14:05 -0700 (PDT)
Message-ID: <34864c2f-dbe2-8598-ad4c-f9c3acc13164@linaro.org>
Date: Tue, 30 May 2023 15:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, olof@lixom.net, palmer@dabbelt.com,
 robh+dt@kernel.org, arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530-multiple-whooping-ee5706fceb67@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2023 14:49, Conor Dooley wrote:
> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
> would be helpful in trying to bring on board maintainers for the various
> new platforms cropping up in RISC-V land.
> 
> Add a document briefly describing the role of the SoC subsystem and some
> basic advice for (new) platform maintainers.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - add Krzysztof's suggested method for avoiding inter-branch
>   dependencies
> - explicitly mention that tags should be signed
> - link to the devicetree abi document, rather than trying to explain it
>   here & reword that whole section
> - fix some typos, capitalisation & unify bullet style
> 
> The devicetree abi doc feels quite out of date at this point, and could
> probably do with a spring clean - but it also feels like hallowed groun

Yep, but that's another topic.

> d
> on which one should tread lightly, so I won't go near that til Rob is
> back.

Thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

