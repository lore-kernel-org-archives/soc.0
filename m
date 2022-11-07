Return-Path: <SRS0=ZBZI=3H=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C8C4332F
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 17:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FB20C43470; Mon,  7 Nov 2022 17:44:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AAF1C433D6;
	Mon,  7 Nov 2022 17:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AAF1C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id t25so32146533ejb.8;
        Mon, 07 Nov 2022 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eWjaoBznqoj2kM89mZeHCIKl3bnIdWJhw4wamO+Cyo=;
        b=gQi8cQ8zlsuNHXSruqHBWQD7jzzllZymlS2SVI594uYKR2I2PAK8IcakFFIhp4s0sa
         lplCEl40Iv5NK8qEomSZ2cy2dT8/yxbOf0ZegzW7Itqh3vbYTI5vcrmSCwmdWu49TRZa
         ugoayL7w+pfrzqcrwVljsvaJRq2BaDEQEwOIIPGFQ/p2V0WvBcjfz11VYLswsRuAQqla
         ii7YJSmTazshE9zf1sSJ1Hv559UsUxzgcwgUDKoIF9Ho2yFx+co//WLc7xaKXa6g62T5
         eZLSUZUMAdlB70cagU28SAaXkI35MH7LaNSRCea0EXsT6zX+TtpvUwmZCaV5jpi0Ms5X
         Rhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eWjaoBznqoj2kM89mZeHCIKl3bnIdWJhw4wamO+Cyo=;
        b=60R/5bkVKk5XRPQZx26TUKXhwihkha1kEtySCjsq4r+FHCqJXn8mkDtGiqNN1YtHX2
         kM0aLchPp/hCvOmWJgLi4iL4Boej8UTrxNwZaaMkSvX1ivcxlHWcxZsIksIMOvGMz3Wh
         sOvJ1mtkDdQR4zeQf5I1aD0qj6enun5ggz69YCIlVZ2Dk90ILJRLis+twjW7EnJjvZ+i
         V59fhMJ1oewrcgx4sjTzZMB6ZQBXjW8FqdQSKT3O03MOc6A0vJUcvs5xn6LSbAiHyOeQ
         LYhfuwRIQK3A+98QLO+BD5eS+9YqMiMZ3xr4v0bxOC5Jhens3jKJBfSHGmyPTOEBsdPX
         QkJA==
X-Gm-Message-State: ACrzQf0IC2nz2VfvMJx+ZHE4umPb7G44C2uiEIGHSjgPgf+lgTzZciPy
	qXFy2NXrcFFYaf54UfdDZwI=
X-Google-Smtp-Source: AMsMyM5u1DyyUIQOXXJaLbM+lyY524+zMvhbc3473zPBgeiGrfroqdUpFBfrRcxzqBUKNFxQ4IT/5A==
X-Received: by 2002:a17:907:60c8:b0:78d:bc8d:8457 with SMTP id hv8-20020a17090760c800b0078dbc8d8457mr47448621ejc.418.1667843054363;
        Mon, 07 Nov 2022 09:44:14 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u18-20020a509512000000b004611c230bd0sm4565884eda.37.2022.11.07.09.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:44:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit quirk flags
Date: Mon, 07 Nov 2022 18:44:12 +0100
Message-ID: <2120524.irdbgypaU6@kista>
In-Reply-To: <20221106154826.6687-11-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:25 CET je Andre Przywara napisal(a):
> So far we were assigning some crude "type" (SoC name, really) to each
> Allwinner USB PHY model, then guarding certain quirks based on this.
> This does not only look weird, but gets more or more cumbersome to
> maintain.
> 
> Remove the bogus type names altogether, instead introduce flags for each
> quirk, and explicitly check for them.
> This improves readability, and simplifies future extensions.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for working on that, nice cleanup!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


