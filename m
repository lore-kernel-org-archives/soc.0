Return-Path: <SRS0=Apgj=6M=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C415C61DA4
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 15:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37E45C4339B; Thu, 16 Feb 2023 15:16:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C5AFC4339E
	for <soc@kernel.org>; Thu, 16 Feb 2023 15:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C5AFC4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id fi26so4076100edb.7
        for <soc@kernel.org>; Thu, 16 Feb 2023 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAnvsdOOqlO4PehLrC0Bi2Lmw9x5a+PMtUIW8SMSgyo=;
        b=Un0S3taOSYhvRftUZlssA+ysy6mZMaiar8Vcm0lkFFGQhLxLQcKlF2Eq27yHWhjpsJ
         V+xCgEMEKuTPcJv9u8HrmoWo7iRdMzywqIWxUm7rjbKGkkII55CCqiZQ3Y+MpCuiK+dV
         fpBR+JKLc9tbBWzvAGRnAMjFDrEp8lUyB06KS5zPiM7iakUVUW+ovn3TXVAT2jCpK6vF
         BAn5Df/qWIqWh5bceni8mEugOU3knmQn9A70ytivea8C5vAgAfHXbnesmFtH4g1JSOXH
         VCdaGR+zQ1B8lYXKG2goMeAZ1+YLp8rhg8Q30xXw84oyOZd3TfhU5rJF4xb57e2viELY
         drRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAnvsdOOqlO4PehLrC0Bi2Lmw9x5a+PMtUIW8SMSgyo=;
        b=uDTjuX/9NA8hmfNQzOwi598BeHjguUM95hbfr9TW3FgJ2fJcpTS3+7e7aXTM7Wtp9y
         GhtC0GBLUT0ipaPJjG5SoGSoDRh++jnjIqZbCvmtuJRRCFR4JXY0o+yn8iSgLRJXL5s4
         uE+rdlElznYzEvLoEWTpXoXMNq0riT4y+MKqyHkkPsDyX7fOE/lYSoxapEtfrz2ujhXJ
         vdCkkoPYPx9uccieapW9Rh7lVImEIheOUArGBXS3S4iGegaTJM6/pxOIzQHL9GUYEJx/
         3BJ+b6MgnSVRRsQZ0fTsMBnvPacZTxLYWPwVPvOjcpZvbAFzeD3mCGgGrBL9Rbs0f/8n
         dyZw==
X-Gm-Message-State: AO0yUKWXwdd93m2Tv8q+R3gWgue3TtxO2qqFaPm5CAxDX+oxsYv9WRDh
	fIjJZfXNApZNQL+o+DSy+WmBWw==
X-Google-Smtp-Source: AK7set92AuI061QLSt4JKoRfrS6/8GjDBjBTZQnbkcOx5U3ET7Bcfdi+rSByGSW1jCkaeRm2SwlUOA==
X-Received: by 2002:a17:906:6d11:b0:8b1:d5c:986e with SMTP id m17-20020a1709066d1100b008b10d5c986emr5610131ejr.15.1676560616300;
        Thu, 16 Feb 2023 07:16:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906328a00b008b147e4204dsm926885ejw.32.2023.02.16.07.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 07:16:55 -0800 (PST)
Message-ID: <8322cfc3-fa23-521d-a5ba-a349bf29923e@linaro.org>
Date: Thu, 16 Feb 2023 16:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] dt-bindings: riscv: correct starfive visionfive 2
 compatibles
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
 <conor@kernel.org>, soc@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230216131511.3327943-1-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216131511.3327943-1-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2023 14:15, Conor Dooley wrote:
> Using "va" and "vb" doesn't match what's written on the board, or the
> communications from StarFive.
> Switching to using the silkscreened version number will ease confusion &
> the risk of another spin of the board containing a "conflicting" version
> identifier.
> As the binding has not made it into mainline yet, take the opportunity
> to "correct" things.
> 
> Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Link: https://lore.kernel.org/linux-riscv/Y+4AxDSDLyL1WAqh@wendy/
> Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

