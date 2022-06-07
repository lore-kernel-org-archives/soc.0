Return-Path: <SRS0=9Cuv=WO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586BCC43334
	for <soc@archiver.kernel.org>; Tue,  7 Jun 2022 11:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4131AC385A5; Tue,  7 Jun 2022 11:57:44 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A41C0C3411E
	for <soc@kernel.org>; Tue,  7 Jun 2022 11:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A41C0C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id v25so22672805eda.6
        for <soc@kernel.org>; Tue, 07 Jun 2022 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yZDBuoVlQ71P4cKl6Kapb0clRrwsrrvDiAbyCiR8ot0=;
        b=Kmk6lPezqek4hazrchUlF3SwI3blkWE9a1Oms0ehWdjz94uADugBjeyrjtU+zCmV5N
         6QdG/2Bp5tUYJlu2RG+1e4G2I/90ULDJ5R4iK0op0G7znqXcM+7HPC1RyhkUqjPqMW11
         xOMNnKBoLfZOfZszGKbaxBrJOF6CW+upTZhvQiSoiTHqjBtbMH4IuqjBcs3dSdsvvcNc
         vWa0tpEdLOPruoTK0oK3kde6/E5DgsgRJkEGZ2tSAF773DHvMAwvo2LkxfkvTyryz/kj
         0J4KcNpXIPrTcXOEztHmQ9bQfP0haiJeLKYMQkmFraHHqEr1UpbC6clqXTdpHsk9gswm
         ecEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yZDBuoVlQ71P4cKl6Kapb0clRrwsrrvDiAbyCiR8ot0=;
        b=2qfoW6yJNGOM+MWyU3k+2XEBkrFN6jfsBYkNpG60r1OLTlyTj1QBNXF19jukJofX/K
         oEJqUrEIbLOl427PhYsryv9alQ7CpOY7xXQUg+Hfyra4ShMKLutHc4daG7c8P1sYQPUs
         2y53tNyZWh0bTRMoxbQ4ZS/yf4Thb1dhNxhJn/n7UgFy44knpTe5tytfemHb2/d1Kbqn
         51w1fCBuMWZcfD5WMitjFiI+f8m5gKKEj1IosTwrKUhYMXUOgmJGWhoVJbT21NbO6Qmd
         8Au59KyEcvIZeZDa9ZrgpVJEEil07BnOtxxaYlAveydD9UbfCzyvJR/MsOi0JjLlcC5e
         y29g==
X-Gm-Message-State: AOAM532+KLkITRXClFiDrkWFNiuiJsFrs0PDxoZjtYgb5dbt0Dowrlth
	GQK+SgkcF2XxeIPVyv8u+jckFw==
X-Google-Smtp-Source: ABdhPJy5IOhjy3MQT0HkzRMlUxWQFG4EiGON9lppvA3+TQzxKlphzo1A5dyIGWXxh/ppAL7ZzunKkg==
X-Received: by 2002:a05:6402:289:b0:42d:cd82:be22 with SMTP id l9-20020a056402028900b0042dcd82be22mr32920366edv.373.1654603061912;
        Tue, 07 Jun 2022 04:57:41 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id da7-20020a056402176700b0042e032164a4sm9126964edb.61.2022.06.07.04.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:57:41 -0700 (PDT)
Message-ID: <7aa025a6-a08a-a11f-3931-7a1a0750a15f@linaro.org>
Date: Tue, 7 Jun 2022 13:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v17 04/10] dt-bindings: clock: Add bindings for SP7021
 clock driver
Content-Language: en-US
To: Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1654565776.git.qinjian@cqplus1.com>
 <8f5673ae8730ec117c1d8fe1e28fb50a2216e891.1654565776.git.qinjian@cqplus1.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8f5673ae8730ec117c1d8fe1e28fb50a2216e891.1654565776.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2022 03:58, Qin Jian wrote:
> Add documentation to describe Sunplus SP7021 clock driver bindings.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

Wrong address...

Best regards,
Krzysztof
