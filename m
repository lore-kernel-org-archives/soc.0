Return-Path: <SRS0=3msJ=6F=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A5C636D6
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 17:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABFB3C4339B; Thu,  9 Feb 2023 17:35:37 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADC80C433D2
	for <soc@kernel.org>; Thu,  9 Feb 2023 17:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADC80C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id bh15so2270329oib.4
        for <soc@kernel.org>; Thu, 09 Feb 2023 09:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDg+0168zHr+2g1dStzDLeHsdA5LJsyBUjIXGQnr0Uw=;
        b=hH7Yaxof+rS4OmzNWBOYv3b1iEqEz7oR7sNTx1F3x3EssZ6TWpwgKW8LmKRKuVivpC
         Pu3JSfmVxaB/ZWYd2hGOQCET7xTAsHNLlch8gEM4HHTMEhLjK9RWDiPDKUNkuvOX443/
         RWBRTCX1T8Ijx4L297Rt4nS1qkPksfZrcrIJCjNJaE0EHqNZniqaHlTgP3hbqExmEnID
         Dv+PZ//ebd/7ZLI4fOA64YhHMhnS85iGi58CHRoBrwJtWhWMpYNHVDbjnM6K62+gZV52
         EPEkWzgI1S+fEcjetXHVnmO6t2jxqcxBXLUQbJixUQSO1kSMCMwAjhoP8Nm/oQTbUDIo
         lNsA==
X-Gm-Message-State: AO0yUKXtfeky/6Z7OYM+3UDwsm/gJa7R6K+yyhQI1mYJbmxqfb6G29yi
	ZLfDnvglX6fOw3J0XjxaCw==
X-Google-Smtp-Source: AK7set/+azMMFBXOEiuPtaHsvq8e3IvjnwMin5dScWkMDL2fWCaP2EyrZgGMmOcrSa3aOQo3MObWmw==
X-Received: by 2002:a05:6808:7cf:b0:35b:ae91:db53 with SMTP id f15-20020a05680807cf00b0035bae91db53mr6067889oij.42.1675964135655;
        Thu, 09 Feb 2023 09:35:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h7-20020a056808014700b0037d59e90a07sm502835oie.55.2023.02.09.09.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:35:35 -0800 (PST)
Received: (nullmailer pid 543618 invoked by uid 1000);
	Thu, 09 Feb 2023 17:35:34 -0000
Date: Thu, 9 Feb 2023 11:35:34 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, soc@kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: omap: add phytec pcm-049 som
 and pcm-959 dev board
Message-ID: <20230209173534.GA539622-robh@kernel.org>
References: <20230209025525.148872-1-colin.foster@in-advantage.com>
 <20230209025525.148872-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209025525.148872-2-colin.foster@in-advantage.com>

On Wed, Feb 08, 2023 at 06:55:24PM -0800, Colin Foster wrote:
> Add documentation for additional OMAP SOMs and development platforms,
> provided by Phytec as the PCM-049 SOM and the PCM-959 development kit.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> v2->v3
>     * Add Krzysztof Acked
> 
> v1->v2
>     * New patch
> 
> ---
>  Documentation/devicetree/bindings/arm/omap/omap.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/omap.txt b/Documentation/devicetree/bindings/arm/omap/omap.txt
> index fa8b31660cad..0a28215dfa12 100644
> --- a/Documentation/devicetree/bindings/arm/omap/omap.txt
> +++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
> @@ -131,6 +131,9 @@ Boards (incomplete list of examples):
>  - OMAP4 PandaBoard : Low cost community board
>    compatible = "ti,omap4-panda", "ti,omap4430", "ti,omap4"
>  
> +- OMAP4 PCM-959 : Commercial dev kit with PCM-049 SOM
> +  compatible = "phytec,pcm959", "phytec,pcm049", "ti,omap4460", "ti,omap4430", "ti,omap4";

OMAP maintainers, if no one is going to convert all of omap.txt over to 
schema, can we at least start an empty schema and add to it instead of 
here...

Rob
