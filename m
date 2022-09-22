Return-Path: <SRS0=uPeQ=ZZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE60C6FA90
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 06:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14CA7C433D7; Thu, 22 Sep 2022 06:35:21 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5221FC433D6
	for <soc@kernel.org>; Thu, 22 Sep 2022 06:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5221FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id j16so13067201lfg.1
        for <soc@kernel.org>; Wed, 21 Sep 2022 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UG9ohaYNGjC0P5to2hQtJ2st/GFJ8zFpPwv7fQeTI1k=;
        b=n3xOBDivLy1P/8Qh+2k2b/mOB3/VRhF473LRc4JGPdzNBlSF1OkbJ39YpcAVU46+4O
         e4mZDBFykkFRfu7cchV5yKHAbpd4X7WoYgGZQfL/s7JC3M6pP5SJMUsXkppM5rOE4qdB
         aPsPaVBhsXXDQ4NzCKjQquB4uR20DOepMSCgX5CNGwcn6S1zQp8b8smzPKnvzt7VkrlY
         HClXXM9LgJVEffrwYuUepFu5hRDt+orUHOgE4D/F6R1kspEYuEcTRENkRa5ngZm8zo3R
         BqJPAebADqZ0IZ6HJ5ME+ChcZPMayp9mROGN8r1zZ7/xITDNkmVxFM8oObuleYv+JYbN
         wc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UG9ohaYNGjC0P5to2hQtJ2st/GFJ8zFpPwv7fQeTI1k=;
        b=6KTkAUIWkZMsvY3qmIQm6T0G27EP7PWpmdGJrQzWN9G2SJzsOJiRL0zrkXHmV4gM6C
         /ZVW+s2g5kTq9cDKtY3kruBeXWDElw7nGprsA8HCoS7bRCp0cS/y24Aj8dZJlQYb2jt3
         VvVwqceR2zmTW+tmcquh85jkAUC+EjsIRL4kZBcdLSSeAWcfbVz/CqNo9gppPUmOUPT8
         M+afDec8I4lzkaoxABhfY/YXJK8wcaGjQnq8B/LEDQe1ct7FGI37lMAI5b2XZEQZRuaw
         WlXa5lWWFAbx+rBt4h6YQ3DRqONNxTMURkjzaWdLZHkWbelzsS5qPyzCMRj1rimT8PQP
         BZ3w==
X-Gm-Message-State: ACrzQf20kmmuphbXdE0Zwd7YD/RP3kjV/8nnIiM3ULttjSNhvUW1Hb6B
	nCs410g+50P/3fz/uc8KTNKuXg==
X-Google-Smtp-Source: AMsMyM59bw9pdu973etIE/LLkjusQ6+VNSmZkxPOGlt5AQZzoXXZEBZhwZRYoa3QPGWJREsy0jV1IA==
X-Received: by 2002:a19:e050:0:b0:49f:5464:71d3 with SMTP id g16-20020a19e050000000b0049f546471d3mr719382lfj.558.1663828517506;
        Wed, 21 Sep 2022 23:35:17 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b0025dfd2f66d6sm745682ljo.95.2022.09.21.23.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 23:35:16 -0700 (PDT)
Date: Thu, 22 Sep 2022 08:35:14 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	soc@kernel.org, Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Message-ID: <20220922063514.f6euqlw35jrkpee4@krzk-bin>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-2-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220921210950.10568-2-aladyshev22@gmail.com>

On Thu, 22 Sep 2022 00:09:46 +0300, Konstantin Aladyshev wrote:
> Document AMD DaytonaX board compatible.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1680833


/: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dtb
