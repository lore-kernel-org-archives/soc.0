Return-Path: <SRS0=Zk5r=WQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C1C433EF
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 15:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F53EC3411B; Thu,  9 Jun 2022 15:18:35 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09331C341C0;
	Thu,  9 Jun 2022 15:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09331C341C0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id d6so8167739ilm.4;
        Thu, 09 Jun 2022 08:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1gmOzw7Uedt/uo+o3zQbOPqoyD7maSwLjV34dKxt390=;
        b=E2ZlX6ItMKFY40pueK7sYZoC7FShlv/CDF9q3apndfOyR/HskHaOW/thMkxN1kjwcl
         XmBt34/ZW0e+05JGUBaCPdYd8oWIfQrcANiqUVc3ryZipRLy3xijMYjgDHuEVghH3DNL
         HHeFW64DXQdd/ALzxnUJkjzev6ecWyk5Yt3f73oyvn8WWROGirDhuW6IzmuzzfBZ+w3A
         V1thg3W/R65KOLeCGP89cvMQhBlX7peh/BTFiG8995OcW6QQasb23lFYKDKjis80OiM6
         2Egb3AJLhBUfXFUzAP0AXZr+OBPfK+Wj80Z5znFcyWqV/8e73zzKpMWTf6CGqh8sRelQ
         BfmA==
X-Gm-Message-State: AOAM531ikQhCPM4xhCDcubt5TVe1WzWufhBGkjRgLx9UGmd6xZy9Z+WO
	t7N5GJuAI3PHQVFm513YQQ==
X-Google-Smtp-Source: ABdhPJxtMHHVPS+lHxLQJsKydz9fs+sGTPoA7UIGtpxvKHKRyH4605h3UklPDvAcj26MB7xJGqasng==
X-Received: by 2002:a05:6e02:5cd:b0:2d3:ad26:4b53 with SMTP id l13-20020a056e0205cd00b002d3ad264b53mr21562060ils.117.1654787914056;
        Thu, 09 Jun 2022 08:18:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i2-20020a92c942000000b002d4070b07b7sm8151707ilq.59.2022.06.09.08.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:18:33 -0700 (PDT)
Received: (nullmailer pid 3813967 invoked by uid 1000);
	Thu, 09 Jun 2022 15:18:31 -0000
Date: Thu, 9 Jun 2022 09:18:31 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 02/48] dt-bindings: input: gpio-keys: reference
 input.yaml and document properties
Message-ID: <20220609151831.GA3813893-robh@kernel.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113911.380368-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609113911.380368-1-krzysztof.kozlowski@linaro.org>

On Thu, 09 Jun 2022 13:39:04 +0200, Krzysztof Kozlowski wrote:
> The original text bindings documented "autorepeat" and "label"
> properties (in the device node, beside the nodes with keys).  DTS use
> also poll-interval.  Reference the input.yaml to get these top-level
> properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/input/gpio-keys.yaml  | 32 +++++++++++--------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
