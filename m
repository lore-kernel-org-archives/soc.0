Return-Path: <SRS0=mqJN=CM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74887EB64DA
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 08:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F688C433B8; Sat, 24 Jun 2023 08:13:56 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 488E1C43391
	for <soc@kernel.org>; Sat, 24 Jun 2023 08:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 488E1C43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso365853a12.3
        for <soc@kernel.org>; Sat, 24 Jun 2023 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687594424; x=1690186424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyAf4G6q0n2PHJw+sVmsc0zJMisJVlzy4zrXB7BC4qU=;
        b=N0yNkrkaT0lZJJHQd249mGSUFugRidA55UQNPww7mymm7YUmhpvez15APqWj7OLck3
         hPwQ/UOAcui6M0O0eeHCd4xYbhuGQ+uNSZOCntw+XSdoLr+NX0cNmKVOin0VdSbdpbm0
         +RsTrfTZE3dyr0wo9SHYXCWmP5sIXXDm2c1cwj+JSyCjxigs+BY/L3t+XmlZ0ttz3yEC
         /ziR1lP5xnUU0Pxtoq2zNlMoviD0AJw/nthnsuy6A8LQZ+y3K3inFsTOmyC8SQZ6g8Oh
         dlMluCNpkomg8vcjslDbSWDIF9FB2LYaA84QpUVxh03DOYngbIJ1Vu0vc+as/2oBCX0x
         P3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687594424; x=1690186424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyAf4G6q0n2PHJw+sVmsc0zJMisJVlzy4zrXB7BC4qU=;
        b=AmeCsGTHQGtMhttDuSQeG6/zApUXPnfBF5yd9z3ZM0J25+8FhDgHzNTisNIHLri+Tk
         /KO+hFSsfYTTOQbINpzR1C+syY8MoplP/WweERFY0gv8QQzR1tinNIht5flcQFbxQGtg
         lHbLfs2cVv2pMuxSqP4eUV0x+7LEvQlVAnmlTgecrKh+EFUDvAXzYqUn7b0mbB4+HuqR
         F7YLAYEkS4l6gVR63OL6RC8QRlmCbg0WLof+xnfjtlsrm7rJ2lRYCgHYh2E7uywx3due
         LMbOkvdopqUxWWgYhADXlAnMwRgcCj5y/cNm1fEXYAGPpLy7172m/dD90U+vtFYhpn9u
         EF+w==
X-Gm-Message-State: AC+VfDxvgGPpJFx+TfXCwmjFGmkfGt/Gf0nzFrjKPrzA+yeDuLMpkZwi
	R8eiDx4vzWvmDSnw9jR3/Rj0Ug==
X-Google-Smtp-Source: ACHHUZ7wIqMMYojMdNZ6XP81cXPipjYpeXBH/sJM48dNAapcZZL8Dl9TPX7i+V2Yl3xKdgGD7yihlg==
X-Received: by 2002:a17:907:1c95:b0:987:15ee:4399 with SMTP id nb21-20020a1709071c9500b0098715ee4399mr21156322ejc.29.1687594424242;
        Sat, 24 Jun 2023 01:13:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id jo21-20020a170906f6d500b0098cc0eee805sm617235ejb.57.2023.06.24.01.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:13:43 -0700 (PDT)
Message-ID: <04c7e2f3-dd76-2e07-99cd-d77038f8124d@linaro.org>
Date: Sat, 24 Jun 2023 10:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: (subset) [PATCH v2 00/45] Add support for sam9x7 SoC family
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, wim@linux-watchdog.org,
 linux@roeck-us.net, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
 horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
 andrew@lunn.ch, alain.volmat@foss.st.com, neil.armstrong@linaro.org,
 mihai.sain@microchip.com, eugen.hristev@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2023 02:52, Mark Brown wrote:
> On Sat, 24 Jun 2023 02:00:11 +0530, Varshini Rajendran wrote:
>> This patch series adds support for the new SoC family - sam9x7.
>>  - The device tree, configs and drivers are added
>>  - Clock driver for sam9x7 is added
>>  - Support for basic peripherals is added
>>  - Target board SAM9X75 Curiosity is added
>>
>>  Changes in v2:
>>  --------------
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
>         commit: a3eb95484f276488e3d59cffa8eec29f79be416e

Eh... the patch - like all the bindings patches in this patchset - is
utterly broken. I don't even get its intention, but I will try to fix it
with a followup based on DTS.

Best regards,
Krzysztof

