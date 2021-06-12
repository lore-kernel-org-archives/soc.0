Return-Path: <SRS0=pync=LG=gmail.com=olteanv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4F5C48BCF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 15:07:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6CF60613AD; Sat, 12 Jun 2021 15:07:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3478061287;
	Sat, 12 Jun 2021 15:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3478061287
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=olteanv@gmail.com
Received: by mail-ed1-f54.google.com with SMTP id r7so26225918edv.12;
        Sat, 12 Jun 2021 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MyHAGIpkkv5FhdCV+dmubHT6fI0J4Qtzj9J4fslDtcQ=;
        b=W0TBv8YxPCk0CMIX/i/QLdgS9KiKeQNoLDvGMD8SlDDMPEk6JkrNmNWNTTwzESG1DS
         VocDE82KQpTdDCqbqJn9RnvauCxSTCdFPH0GvzqxPLAfzKxYE5RsZ4RIbhMQ5LDR+H35
         zoRR+nzmC0a1z4dA97a7ZhTm6+eH4/zUC47HyMZKzVDU59gg250UVuGDeaVKnCvFbjb0
         GJ2HEvLaGKba8mdh7LQ0i4DLMzZaRLWsayayPUaFwVAY054QBMNB2YrSpcOJtc/LEEB+
         va0d42hOiUVzQa60NOHtISexG3n0qBdKgrIAy6bwb1z6ZtPsemBkGGQjvIXwkf+puHb1
         uJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MyHAGIpkkv5FhdCV+dmubHT6fI0J4Qtzj9J4fslDtcQ=;
        b=GJ5Ts5SvAudIBfz5bgdTEEE+MPKuU5ZrHJtzW3e0NT8h5xkPqVRmGTbLLRf6saUJZi
         +R6lX43VTtiH9mhItA2a84WCzVa4fC3EjE3lubC+CQQGOix3+sdiK3Wq3iqQs7h1qoJ2
         f1CbwXcBhapgIqKeGs8XFb5Nh8MgnnDAiH1L/QbOAFMDeFRzLaldU8LEhyib94S6uHdj
         aeMASKuh3I+Vn62UFRQICy20acUSJfrneWO4iShq+DqvXQ9Yu/Rkhl+YImAlZrd0IbDA
         tFaup/Hu2sktlGMdctZJy5d0bLe58CO1BOtzvefqeMpikkwZnKS1q7c3vxbK+hkvbu2O
         P71A==
X-Gm-Message-State: AOAM530cyReW3BaHoRAkvo/on+QNoUxRLUtnmLhJNtxM3HiGbgREKD5h
	ApnXLSSU4chs7K65GqpuYvE=
X-Google-Smtp-Source: ABdhPJzxp36MU7OxaYVh1dgVnXetWoZR9dLwm9Xiwc/QVPJuVTP+udohcInDHSZkGVZKBTRk6s1urA==
X-Received: by 2002:a50:d943:: with SMTP id u3mr9250028edj.175.1623510476839;
        Sat, 12 Jun 2021 08:07:56 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
        by smtp.gmail.com with ESMTPSA id n5sm4002476edd.40.2021.06.12.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 08:07:56 -0700 (PDT)
Date: Sat, 12 Jun 2021 18:07:55 +0300
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
Message-ID: <20210612150755.efb5hw3xujkkh2va@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-2-mnhagan88@gmail.com>
 <20210611194644.64lvhvp76wy6guqp@skbuf>
 <f0af3f0a-ab13-ecdc-d834-c95ddcb52866@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0af3f0a-ab13-ecdc-d834-c95ddcb52866@gmail.com>

On Sat, Jun 12, 2021 at 10:21:31AM +0100, Matthew Hagan wrote:
> Hi Vladimir,
> 
> Many thanks for taking the time to review the submission.
> 
> On 11/06/2021 20:46, Vladimir Oltean wrote:
> 
> > On Fri, Jun 11, 2021 at 12:27:13AM +0100, Matthew Hagan wrote:
> >> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
> >> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
> >>
> >> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> >> index 78dfa315f3d0..7d184ba7d180 100644
> >> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> >> @@ -62,6 +62,12 @@ properties:
> >>            - enum:
> >>                - brcm,bcm958625hr
> >>                - brcm,bcm958625k
> >> +              - meraki,mx64
> >> +              - meraki,mx64-a0
> >> +              - meraki,mx64w
> >> +              - meraki,mx64w-a0
> >> +              - meraki,mx65
> >> +              - meraki,mx65w
> >>            - const: brcm,bcm58625
> >>            - const: brcm,nsp
> >>  
> >> -- 
> >> 2.26.3
> >>
> > I think these compatibles describe SoCs, whereas Meraki MX64/MX65 are
> > boards, so this is a miscategorization. Can you not just describe the
> > Northstar Plus SoC that you are using in your compatible string?
> 
> My understanding is that the bcm958625hr and bcm958625k are dev boards
> using the BCM58625 SoC variant of NSP. For reference, a close example
> can be found in brcm,bcm4708.yaml in the same directory:
> 
>       - description: BCM53012 based boards
>         items:
>           - enum:
>               - brcm,bcm953012er
>               - brcm,bcm953012hr
>               - brcm,bcm953012k
>               - meraki,mr32
>           - const: brcm,brcm53012
>           - const: brcm,brcm53016
>           - const: brcm,bcm4708
> 
> For the compatible string we would definitely need to specify a unique
> device name for identification by the OS, rather than just the SoC.
> 
> Of course I could be mistaken. Will await confirmation on this.

Yeah, ok, fair, after rechecking I think you're right. I'm dropping this charge.
