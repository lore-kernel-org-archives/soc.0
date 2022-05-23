Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042FEC433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 07:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2EEAC3411A; Mon, 23 May 2022 07:32:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0F31C34115
	for <soc@kernel.org>; Mon, 23 May 2022 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0F31C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id p22so24007447lfo.10
        for <soc@kernel.org>; Mon, 23 May 2022 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=17JqV26wVHdgo28ZqibLwQLBrW+2wdRYXH2zbWrVfCo=;
        b=Ib9IYf1AvLT27iihXTu9RkqmCryClPTfougnJ4FyWIlLyfyQLNoahME9lk60jT7YXm
         jD+7fF0WQXgTnEJ244khLVZ2ruXBE8MS1uUVUlTeK2ut3gzKojOjbTDWEHyZ98VTUslE
         NjdYJQZNiVrEOIgva4BhEJiS4Ewom+kaGwXmokXK9WVHBOaGDsVce74hQ1PaoCqMtfm7
         tmQCCcjUUAYxDvOTYI9RRd+9Bf0ud4XjKoAI+6sp0abtcwlOGdCJsf7ESg6hkRNhtrw8
         nO0lprI8/GsPSj3vbIte8Vsmr0wnD5DbJ9z2/t0tu+2zMycYVUyl8WY7wWrEoa1qh7HP
         gHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=17JqV26wVHdgo28ZqibLwQLBrW+2wdRYXH2zbWrVfCo=;
        b=V5DEroQRD5gzr5/EpEoczF518KUk2j9YjbMvsZIvbm7AZTkPO9A48sb9yEfcihsp4U
         YVd+q08QwxLJ6djgXwSdOdkXwOV4A3lHGLwMOyo9kG0rm+T2NyCE7cPu35Jtk2r0lDNH
         7FK7Dl6yplpZwQGVduxMpq16bj4OLEzV3p0DMmKvlivVKSODYV8m/xuCgbmpQHQREsyl
         cvcPCSzxVGCEORMh9mblk3Z1wph85oJmk9IjRe1EHl8ExJBXkfv2MhKZtDohJ7+aRmQF
         6r9d7yU4POh6w2ZqPCoVsj8GaWCmygoGPOBdHOr4zExBztsLhlFVYaWOOQP5JUXoiuyM
         zbtg==
X-Gm-Message-State: AOAM530ZE5hM4QIBRHcnRBKMSpsrKlExReKjVOqQDZK5DbpaJ4U1+77+
	xV0idfJRAdfXz4XhaSeOYxrZPg==
X-Google-Smtp-Source: ABdhPJwr/sSdCGIN0en6yM1a+IjJKGEZWdESs2RUoX6hwQ9lIqGKLwQqPAREwe3x2yxzBpnbbnpjpg==
X-Received: by 2002:ac2:43a1:0:b0:478:5867:5047 with SMTP id t1-20020ac243a1000000b0047858675047mr9556576lfl.37.1653291135678;
        Mon, 23 May 2022 00:32:15 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r5-20020a19ac45000000b0047255d21167sm1828342lfc.150.2022.05.23.00.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:32:15 -0700 (PDT)
Message-ID: <d48f8b9b-92e2-2fc9-6d06-0b1496768d4e@linaro.org>
Date: Mon, 23 May 2022 09:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 03/19] dt-bindings: serial: 8250: Add npcm845
 compatible string
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
 tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
 bjorn.andersson@linaro.org, geert+renesas@glider.be,
 marcel.ziswiler@toradex.com, vkoul@kernel.org, biju.das.jz@bp.renesas.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, robert.hancock@calian.com,
 j.neuschaefer@gmx.net, lkundrak@v3.sk
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-4-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 UART.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
