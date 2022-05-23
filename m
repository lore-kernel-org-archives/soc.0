Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D017CC433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 09:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9CF6C34116; Mon, 23 May 2022 09:02:21 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36DB1C34119
	for <soc@kernel.org>; Mon, 23 May 2022 09:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36DB1C34119
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id h8so16389298ljb.6
        for <soc@kernel.org>; Mon, 23 May 2022 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dlfET5UONJTRSOldsSXnP8VfMZiQfkrQWEQeer/UsdE=;
        b=KRLj4pXWt2o7W1VV0l/wVx0AcbODZvZ5qTc9IhTSoe9KF2JM0D3hmubFBImQ9psh3L
         QCeewgiYglpOJ6XSztimgmABmIIAfOHi9C6YCleGn0wOPmMKQiWDKYqQacc/mULtsGps
         bDztuXUAauEEaNTT6etJjzh4/o8foOV1NuPa+kw7djgPpD0VuAdoy1raZ+uhnoq2vYPj
         0CeJfrtNW/1enVLni8bcCj1MLozx1PuYxfhaJDQPucYewE+k+oXIyrdETEmvpNGlAi4G
         HFwV8opJshXqlZjjy8GbRXkO/cLzfXDloIKAqEhLEfwAfzO4ICqKJn8g8du4spdz3KVE
         vKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dlfET5UONJTRSOldsSXnP8VfMZiQfkrQWEQeer/UsdE=;
        b=Oy5eqriXVDtWtvme3vUm6mUmdk0aREtWTge9ZVqpoy1eBcVME7/4UTNifgP8zgP7LZ
         y5fZIR8vBkg+vwzIEiy7lahgyVb4DjEDTplY7WcK44m812yuilreyCo5J2ohuWtLoG9h
         TaOYBI9WW/6utNCeFmjZkZjP1WyQIo/P0xhNzeF1dXcYmDj5WZWUS0yHfq5RmreyKPpK
         R9ahGHFuAvZYWOqzcb7SePH7ECRBHind1GaBAqswRhhyeTBLc4PuBtR7GTsB9DOcoAtO
         p2rgMjkivj/JdVLM1KTA4AEvnZVu1a6D8BQEab7aaxVD7fjSil9imBYbYTJFwL7G+AMh
         xzsw==
X-Gm-Message-State: AOAM532oPDHCjr64atZwBgdErVJkqOSukONflD4tQbM20RtM5p8cEHWG
	X/WZaPoz3C10B09Ps9+yUcjoWg==
X-Google-Smtp-Source: ABdhPJxvLdpCyy9QQcDde8YxjJo46U2wGyCrj9zc+1giCC5FfKz0vl+qvRHh262fNGonLwftr8mNEA==
X-Received: by 2002:a05:651c:50c:b0:253:e168:f28e with SMTP id o12-20020a05651c050c00b00253e168f28emr6833169ljp.429.1653296538266;
        Mon, 23 May 2022 02:02:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e9d43000000b00253dde4720esm1654866ljj.90.2022.05.23.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 02:02:17 -0700 (PDT)
Message-ID: <ec8cb01f-cf9b-2b2d-68ed-96b0b8465537@linaro.org>
Date: Mon, 23 May 2022 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 14/19] dt-bindings: arm: npcm: Add nuvoton,npcm845
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
 <20220522155046.260146-15-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-15-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 SoC and a board
> specific device tree for the NPCM845 (Arbel) evaluation board.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
