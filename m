Return-Path: <SRS0=wmLW=C7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAB6C0015E
	for <soc@archiver.kernel.org>; Thu, 13 Jul 2023 10:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE7C6C433C7; Thu, 13 Jul 2023 10:03:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FCA6C433C9
	for <soc@kernel.org>; Thu, 13 Jul 2023 10:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FCA6C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3142970df44so604209f8f.3
        for <soc@kernel.org>; Thu, 13 Jul 2023 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689242615; x=1691834615;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHv3kkZ/P7da9z9ntbvIGbuhBODaxXDEcQWub3lPMo8=;
        b=MF1q5bm71f/u1h82c4O/qHNGi++umiOSCdY9FjCTQ6nfHGcdClwcFoaCehnt4jy1jZ
         Zz1poC0Q3jpri9CDd0L7fgeWnSmdzKJsQ/NuutdbDJJFpJqop/ntJch8OVk/eJyMcyOK
         xb0rW1TZ/Ud1rj1mbi+xR190cHcwA+2DT7sHRmStT4b9R5PnyHwrFiqyBABSYAvZXsis
         uuNyvXz3zZ+RJOLAopRgFkcaYVjhQ2ysMriY1XlVo4XnzineLa71SJsX35jCyQhPn8jD
         NetnyR1oPM2x+NfBSUJ7b+j93uZLWqkKUZJHFsi3uoBqjq5Nx6hrp3JP44Vl0F05TlMH
         yLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242615; x=1691834615;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHv3kkZ/P7da9z9ntbvIGbuhBODaxXDEcQWub3lPMo8=;
        b=QiXF5iLglAOd8Kj19zugGAd2pAzVEr2IQB7/k+K83GuQoBITrx7mE5SOweEPNUYThi
         d4NgT41NSnGgh8Tv1nnLGJHSuxgRnxws2ZtRRLclhgRgBmCElbtS+WXptOmetPCngA7M
         K2BxHTx8L+E36LKwRm2InAbp48sAsVP4kT2q43DwO2VLTU2FMn+4M7+pnaXBt7XbvRQp
         lzywautc456guejuB1wkmq2NRtR4JnXKACuACEhd0QAsvVfqo68T/O8ncDbcft1OCxLi
         E3xob7BHfloPDXobn9Hu5W8K94ylqnoAoCGUo+3z2McxnLQV0Wv+qXwFWFegh1Zvvvit
         VyEQ==
X-Gm-Message-State: ABy/qLakkkRT3aW88NBDR95WYrIubD1vlXBZ80q10HzO7Ufl1Ga1GBk+
	ENtpsku9zKje9gtNPT2/dRmdDg==
X-Google-Smtp-Source: APBJJlGuNxZ/cw1HTYc8O2dt4QAK7fopOZ8wb3bG2IouIV3zkbD2I6sjyBoNwUxIvF/DL9hNaQf1+g==
X-Received: by 2002:a5d:67c9:0:b0:313:ece8:e05c with SMTP id n9-20020a5d67c9000000b00313ece8e05cmr968841wrw.33.1689242615200;
        Thu, 13 Jul 2023 03:03:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i4-20020adfefc4000000b0031431fb40fasm7528569wrp.89.2023.07.13.03.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 03:03:34 -0700 (PDT)
Message-ID: <204ad135-5358-35d0-2df2-9495acf0432d@linaro.org>
Date: Thu, 13 Jul 2023 12:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv2 2/2] ARM: dts: at91: sam9x60: fix the SOC detection
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com,
 manikandan.m@microchip.com, varshini.rajendran@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com, cristian.birsan@microchip.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 davem@davemloft.net, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kavyasree.Kotagiri@microchip.com,
 Horatiu.Vultur@microchip.com, robh+dt@kernel.org, andrew@lunn.ch,
 michael@walle.cc, jerry.ray@microchip.com, conor+dt@kernel.org,
 jesper.nilsson@axis.com, andre.przywara@arm.com, ada@thorsis.com,
 radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20230713095111.335346-1-durai.manickamkr@microchip.com>
 <20230713095111.335346-3-durai.manickamkr@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713095111.335346-3-durai.manickamkr@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2023 11:51, Durai Manickam KR wrote:
> Remove the dbgu compatible strings in the UART submodule of the
> flexcom for the proper SOC detection.

Why?

> 
> Fixes: 99c808335877 (ARM: dts: at91: sam9x60: Add missing flexcom definitions)

If this is a bugfix, then please clearly describe the bug and its impact.

Best regards,
Krzysztof

