Return-Path: <SRS0=0poK=LF=gmail.com=olteanv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8220BC48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 19:46:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4EE4F61003; Fri, 11 Jun 2021 19:46:48 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A653613CA;
	Fri, 11 Jun 2021 19:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A653613CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=olteanv@gmail.com
Received: by mail-ej1-f53.google.com with SMTP id my49so6178800ejc.7;
        Fri, 11 Jun 2021 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C6C9XAc/4o5g/nJl5oV+VV5fk+Yq/QDQ08tqYJKVlN8=;
        b=Wr7Kz7qyfO/ySRu0Ur5oh4v8IOHFu8omwbVz1962faGV6z+ITUn5KuX1jAG8TS3aaK
         38Y5LWZipl+cT7CCjzqAEBNuaFWBQYdqfW1H+5+6Lt5EG720ZyzFkIMcTcl+OjuFRlSa
         1XlypvFbDDLNScs0lkW0/HZT66ck3oqM/FyMxwKAeo4o8OwF0+vbD2b/quzziHxXWW6d
         pidse3IlAvV/27stXoJhYAvK3j0oalHBWdCtu9CVifIKhqi3wF+kuOid+KRDOkOZL/Qe
         LZelQiJQ03l7fkbwK73jwDQ1mz1FLjgp+ReFtkMynml8Dd6zmR5KO1KUkt39XleFQ0HV
         6lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C6C9XAc/4o5g/nJl5oV+VV5fk+Yq/QDQ08tqYJKVlN8=;
        b=cmks8bfUJIPVF58aEb3fNxklrd+ovjwilmzT0op5SekH7Lui1bCw+BjBXx2iRS3caO
         ySPGvJWXBRz4rV+Vo2AT46iazRqJb0mPoFLwbV7qgRkvf7aeAoc2yATbOWR0CmhypbO3
         Vbjum5rR74ivcifIfbsAmpDwicha0TUmJnJEdq3szC2dFrH8gTjmBRxFrSKY3P+buAAc
         rhy3vvdskPyAlsUnt4BcJbtln6PiUKyrGEv6Ci1BQEXAsqsuu2CJ+0vt+ZGOlODLjJHQ
         bqEUiogl54M2kWSnH1Hlq1OymBvWP8MdmaImA+juJ0IOL9PnXd2QP/i4cFZ0s6+pjBAi
         FUzg==
X-Gm-Message-State: AOAM532H/xWFiBx08PkZ0h8Df/ALpX8iKgYLzSUoAYcMws7p5EwwO3kE
	HQxE26JUsrPfOHakFuqGrRw=
X-Google-Smtp-Source: ABdhPJxfI9du5pPrBGY5Y+smBF61rv+3CBid1CuZMbtYk5u7WBPWybqvRdM2AW0rcmkmc37DxDvXjw==
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr5060138ejc.484.1623440806641;
        Fri, 11 Jun 2021 12:46:46 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
        by smtp.gmail.com with ESMTPSA id o64sm3011500eda.83.2021.06.11.12.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 12:46:46 -0700 (PDT)
Date: Fri, 11 Jun 2021 22:46:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Message-ID: <20210611194644.64lvhvp76wy6guqp@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-2-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-2-mnhagan88@gmail.com>

On Fri, Jun 11, 2021 at 12:27:13AM +0100, Matthew Hagan wrote:
> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> index 78dfa315f3d0..7d184ba7d180 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> @@ -62,6 +62,12 @@ properties:
>            - enum:
>                - brcm,bcm958625hr
>                - brcm,bcm958625k
> +              - meraki,mx64
> +              - meraki,mx64-a0
> +              - meraki,mx64w
> +              - meraki,mx64w-a0
> +              - meraki,mx65
> +              - meraki,mx65w
>            - const: brcm,bcm58625
>            - const: brcm,nsp
>  
> -- 
> 2.26.3
> 

I think these compatibles describe SoCs, whereas Meraki MX64/MX65 are
boards, so this is a miscategorization. Can you not just describe the
Northstar Plus SoC that you are using in your compatible string?
