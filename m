Return-Path: <SRS0=Zk5r=WQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086BBC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 15:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB9AFC34115; Thu,  9 Jun 2022 15:21:19 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FC04C34114;
	Thu,  9 Jun 2022 15:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FC04C34114
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id v7so18999957ilo.3;
        Thu, 09 Jun 2022 08:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aA/410L+9p0xbmxpZ2Mn80L61ojuTJuT5kn/KAJbX/4=;
        b=CekKbw2IT0qnc7R2ds9tFWaU5POV8Rc41GVXsuGXg3kaCBka4J9XzNFcttsqyIi/vK
         LBSZlg4G6WafxUuM64x1KfUX0Qid9AgjqP1+i7TYBsnpsmMlpmDNpSurgvASHj26D4w+
         qiVLfMi8CQ/NA+WAVXIoO+vbE5dKrCTZEwrpV/ivPyU2yC60mvrCJG8YD5N2dbBsQY6Q
         p2d72CMDEmGKX+/dALfpmkVxUwWh3LrC4/eUSzYTzvU+mCMAeP95FJzYxLp9ghKO/dUv
         c8eH2nXVvyC/kri6vELgTEDvUIELZiipEPo323j0EnckVuN+fZPnrlYzor8M4Tz5vKlF
         mk5w==
X-Gm-Message-State: AOAM530/8awYQxu8YIEBSuSo0CzTbbQUFt44F60fIu8M143NPlIrz7Sj
	el00goyQ4Li5W0o3QMWr4g==
X-Google-Smtp-Source: ABdhPJwS4Z8Uz7/L6+/4oTICgHYgwtFPW/adzsCrE/yk1RazKDvfUEOiTFSooJZLeC437CADIxrnJA==
X-Received: by 2002:a05:6e02:1bae:b0:2d3:a66b:7432 with SMTP id n14-20020a056e021bae00b002d3a66b7432mr21846994ili.185.1654788078227;
        Thu, 09 Jun 2022 08:21:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g23-20020a02bb97000000b0032e1e0ac289sm9687144jan.8.2022.06.09.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:21:17 -0700 (PDT)
Received: (nullmailer pid 3817707 invoked by uid 1000);
	Thu, 09 Jun 2022 15:21:16 -0000
Date: Thu, 9 Jun 2022 09:21:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 03/48] dt-bindings: input: gpio-keys: accept also
 interrupt-extended
Message-ID: <20220609152115.GA3815878-robh@kernel.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113911.380368-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609113911.380368-2-krzysztof.kozlowski@linaro.org>

On Thu, 09 Jun 2022 13:39:05 +0200, Krzysztof Kozlowski wrote:
> Each key device node might have interrupts-extended instead of
> interrupts property:
> 
>   fsl-ls1028a-kontron-sl28-var1.dtb: buttons0: power-button: 'anyOf' conditional failed, one must be fixed:
>     'interrupts' is a required property
>     'gpios' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/input/gpio-keys.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

The tooling is supposed to take care of this, but it's complicated 
enough that we don't find it. So easier to handle in the schema.

Reviewed-by: Rob Herring <robh@kernel.org>
