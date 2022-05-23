Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAAAC433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 07:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EB5FC34116; Mon, 23 May 2022 07:32:45 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB419C385A9
	for <soc@kernel.org>; Mon, 23 May 2022 07:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB419C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id t25so24052027lfg.7
        for <soc@kernel.org>; Mon, 23 May 2022 00:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WM2iSjOLNX4HMYT1KBJ2aGaH1i/fqUVeTTeRZ7BJWqI=;
        b=xpgnLsJaW+uiXjqcvBRtw1Ox3btq1Zpc6LoTPGuU+r+GEYHXTeZv1y5BsKu6YnI+lV
         rGii2wxRug/9TVgLd9KhL+MhCvqOKZZd81IFpx4Z1UnUNbLeVTtOKmVWMNWX80qopIpL
         NbyDgx39jmkQQWv42A3xhY8EOEwFA/bmBAwMyuMUocborhxaNUlNwTtyUWnPh6u/ILa4
         fFGtP295rUcnHZmb3yhcRw5jXHf/r6OkUeSCP75ebJ0Hdcflz9n7K3c6E04z8+HpYY8v
         P9xh0fyukxvZ5anO/cG8Woy8w337KFzZbpg0O8xWBLtSuPRYANQ/5O8SIRY9s0ku0Ye6
         W6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WM2iSjOLNX4HMYT1KBJ2aGaH1i/fqUVeTTeRZ7BJWqI=;
        b=HSBOfmJCT/JzlEy0fTGkDgEEvY2iy5wYFvNBW529MV7cm6bljpMmQ4RZ0v2RvpF/jg
         L5vmVIWZmK2Bmv1FrzWAfp5WKAAprojCYPe4j6WiJKSGKromPQwIwZuMyndVoXfcWztz
         CNfOe3aBoPRi4COaj3gUToKDrDIOrsHhv0TrnH6mUII17IGQIeafIDm8ts4tQcD98g1+
         Q8DdT0UbLx8/BQAwzphRZ1ni54NBwWEhug2cZPIWE0aOsb58I2tEsymMh5uRu9RR8YF9
         I7dIFBSgNSZUY+FACqBaokKInqkH5DybOrua7sahb+JX67xip+GnR7NPjjJn+6kOEgb0
         ah3Q==
X-Gm-Message-State: AOAM533csPpKJSPmpE6UckDAYU296DyEcQzTLbjCOvY4NKw8A4wbFyiE
	ZSE43BG5WHiIl1aBksUDj/4n8g==
X-Google-Smtp-Source: ABdhPJxkJ1lbfwE/HFS0yyoqUL4vOqViZG1+sY1vIT/G+AZ35A4VLDbzopZna1vNMRo2bjalfVjU0w==
X-Received: by 2002:a05:6512:3092:b0:478:786f:9fc0 with SMTP id z18-20020a056512309200b00478786f9fc0mr1502296lfd.562.1653291163402;
        Mon, 23 May 2022 00:32:43 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g2-20020a2e9e42000000b0024f3d1daea5sm1666653ljk.45.2022.05.23.00.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:32:42 -0700 (PDT)
Message-ID: <828749d1-d0a6-7016-c36a-ace0bb72600d@linaro.org>
Date: Mon, 23 May 2022 09:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 05/19] dt-bindings: watchdog: npcm: Add npcm845
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
 <20220522155046.260146-6-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-6-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 watchdog.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
