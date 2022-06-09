Return-Path: <SRS0=Zk5r=WQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992CAC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 15:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C606C3411F; Thu,  9 Jun 2022 15:17:42 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2B64C34114;
	Thu,  9 Jun 2022 15:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2B64C34114
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id n11so2559578iod.4;
        Thu, 09 Jun 2022 08:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7CNQXhlme5eQIHXbnsgkUH7CMFXIeljNmFCXWsWvWE4=;
        b=OJs1DaH/iCEBRblag0fs7QrrWg79HZmZ4834RFkR07hqdc5WJbtxWlAymU7SmE6jkV
         wfhGWfUAW2N6Z19KHYNiW0n8T1CYKMKwKESCzOQvLgCVuQ+oReOWv96v4uKprfa6atwy
         5Pzas7TYJpE8JRi2djXlSs5oeOUOw3uYVDVVkCe/wut609KqHO4NGkSxjY8pblkTduGn
         KXN+lTlwjMshcaQzsM3aT0FkLRXAqMxHuBbC52NcLMOsIQA+h7Or5xf1bUXOgRG9uLRO
         DtZjJVLdw42JJiwdCZ1ooKPRV3iMWgAcskR85Yp+7FKk9QtGmNN5bPrwwcm/tosLE3S9
         kSNQ==
X-Gm-Message-State: AOAM532MqxCFeOQXghLQVqha92DXCpJ0WZJq6M7jgeJdLNHGANShCcwZ
	AoXCLYgHMnQ7tQXAV3y4IA==
X-Google-Smtp-Source: ABdhPJxJRrvWySB45UK6FLQxD5ol1vphUXTZCU3F4uQ4ESUHx/oZ/n2249kg4HzMx/J2Z7cR3VtiOw==
X-Received: by 2002:a6b:2bc8:0:b0:669:af77:34bd with SMTP id r191-20020a6b2bc8000000b00669af7734bdmr1442822ior.182.1654787860556;
        Thu, 09 Jun 2022 08:17:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id f6-20020a056602038600b00665862d12bbsm9438447iov.46.2022.06.09.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:17:40 -0700 (PDT)
Received: (nullmailer pid 3812662 invoked by uid 1000);
	Thu, 09 Jun 2022 15:17:38 -0000
Date: Thu, 9 Jun 2022 09:17:38 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 01/48] dt-bindings: input: gpio-keys: enforce node
 names to match all properties
Message-ID: <20220609151738.GA3812591-robh@kernel.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113843.380260-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609113843.380260-1-krzysztof.kozlowski@linaro.org>

On Thu, 09 Jun 2022 13:38:43 +0200, Krzysztof Kozlowski wrote:
> The gpio-keys DT schema matches all properties with a wide pattern and
> applies specific schema to children.  This has drawback - all regular
> properties are also matched and are silently ignored, even if they are
> not described in schema.  Basically this allows any non-object property
> to be present.
> 
> Enforce specific naming pattern for children (keys) to narrow the
> pattern thus do not match other properties.  This will require all
> children to be named with 'key-' prefix or '-key' suffix.
> 
> Removal of "if:" within patternProperties causes drop of one indentation
> level, but there are no other changes in the affected block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/input/gpio-keys.yaml  | 157 +++++++++---------
>  1 file changed, 77 insertions(+), 80 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
