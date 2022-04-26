Return-Path: <SRS0=dO8r=VE=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08210C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Apr 2022 00:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC98DC385A9; Tue, 26 Apr 2022 00:19:19 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 075DFC385A7;
	Tue, 26 Apr 2022 00:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 075DFC385A7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so17822898fac.7;
        Mon, 25 Apr 2022 17:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5qSfY3Lg9ZldVtbZbBmTt420KpgY28iF9xeamtFe6D4=;
        b=OuBkMOLKFlg7hZcfnz3okwW/8tYw5p6GalbKQPMCvgT+VqIbOhSifcC9b7eUIwVCt/
         03uUPUE7/Hho7S+65nmjhT0k+g49IaCZwQEso5sfLRn9FVU/AvMK0ddKui6nU6xhajhl
         LMpuuGI8HWrQdSB0N6+9XmsOmnEgVsH0StwwwQ3PNYZF9mU6YrC7y+dkw03n5ByhM37y
         auQWRZd5tECZrEcZyHHuQsvI5wVxDIu2Lp+aZTUpnUUibu2tCTPdliTkSiW7GLXxYtAJ
         LjnV0MF/Mj4k/iRQqaMHkwKY7hjjeTCKz2AKZvhtIpsG/g4Ipe6Q9XkC6lBtgn7+yOsF
         stnQ==
X-Gm-Message-State: AOAM530eFZWK7obDs/k9czk64fpcIFLby1giHvcJd3SXvuBYAKZgWmg2
	6gkSz46dWMqQ2EQfC1dLkQ==
X-Google-Smtp-Source: ABdhPJweApfZtyPtWsPxNCUtls8rEOJ+zuFQRt41W/mpBVsBtio9nxJ8NUEwHd9tElqIGdDtnw7Iqw==
X-Received: by 2002:a05:6870:b3a2:b0:e9:f22:5819 with SMTP id w34-20020a056870b3a200b000e90f225819mr6294788oap.293.1650932358167;
        Mon, 25 Apr 2022 17:19:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p17-20020a4a3651000000b0035d9b838f21sm4970654ooe.10.2022.04.25.17.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 17:19:17 -0700 (PDT)
Received: (nullmailer pid 597729 invoked by uid 1000);
	Tue, 26 Apr 2022 00:19:16 -0000
Date: Mon, 25 Apr 2022 19:19:16 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de, olof@lixom.net, will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for
 Nuvoton Platform
Message-ID: <Ymc6hK0Z/t3IKF3z@robh.at.kernel.org>
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
 <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
 <caf4867f-7f71-9262-f190-463325eb13ab@nuvoton.com>
 <4e9eaede-2208-bd73-35ae-89e128562653@linaro.org>
 <80994f4b-136f-7669-4674-0c9826e88248@nuvoton.com>
 <43cb61ac-461f-e6ff-b495-44f8befde79f@linaro.org>
 <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>

On Thu, Apr 21, 2022 at 04:13:20PM +0800, Jacky Huang wrote:
> 
> 
> On 2022/4/21 下午 04:05, Krzysztof Kozlowski wrote:
> > On 21/04/2022 10:04, Jacky Huang wrote:
> > > 
> > > On 2022/4/21 下午 02:56, Krzysztof Kozlowski wrote:
> > > > On 21/04/2022 08:39, Jacky Huang wrote:
> > > > > On 2022/4/18 下午 08:11, Krzysztof Kozlowski wrote:
> > > > > > On 18/04/2022 10:27, Jacky Huang wrote:
> > > > > > > +properties:
> > > > > > > +  $nodename:
> > > > > > > +    const: '/'
> > > > > > > +  compatible:
> > > > > > > +    items:
> > > > > > > +      - enum:
> > > > > > > +          - nuvoton,ma35d1
> > > > > > > +          - nuvoton,ma35d1-evb
> > > > > > > +          - nuvoton,ma35d1-iot
> > > > > > > +          - nuvoton,ma35d1-som512
> > > > > > > +          - nuvoton,ma35d1-som1g
> > > > > > This does not match your DTS and does not look reasonable (SoC
> > > > > > compatible should not be part of this enum). Check some other board
> > > > > > bindings for examples.
> > > > > > 
> > > > > > 
> > > > > > Best regards,
> > > > > > Krzysztof
> > > > > I would like to modify it as follows:
> > > > > 
> > > > > description: |
> > > > >      Boards with an ARMv8 based Nuvoton SoC shall have the following
> > > > >      properties.
> > > > > 
> > > > > properties:
> > > > >      $nodename:
> > > > >        const: '/'
> > > > >      compatible:
> > > > >        oneOf:
> > > > > 
> > > > >          - description: MA35D1 evaluation board
> > > > >            items:
> > > > >              - const: nuvoton,ma35d1-evb
> > > > >              - const: nuvoton,ma35d1
> > > > > 
> > > > >          - description: MA35D1 IoT board
> > > > >            items:
> > > > >              - const: nuvoton,ma35d1-iot
> > > > Instead just enum with all board compatibles.
> > > How about to modify it as the follows:
> > > 
> > >     compatible:
> > >       oneOf:
> > > 
> > >         - description: MA35D1 evaluation board
> > >           items:
> > >             - enum:
> > >                 - nuvoton,ma35d1-evb
> > >             - const: nuvoton,ma35d1
> > > 
> > >         - description: MA35D1 IoT board
> > >           items:
> > >             - enum:
> > >                 - nuvoton,ma35d1-iot
> > >             - const: nuvoton,ma35d1
> > > 
> > >         - description: MA35D1 SOM board
> > >           items:
> > >             - enum:
> > >                 - nuvoton,ma35d1-som512
> > >                 - nuvoton,ma35d1-som1g
> > >             - const: nuvoton,ma35d1
> > > 
> > It's still almost the same. All boards together. You can add a comment
> > next to the compatible if you want some user-friendly name.
> > 
> > 
> > Best regards,
> > Krzysztof
> 
> OK, I got it. Like this,
> 
>   compatible:
>     oneOf:
> 
>       - description: MA35D1 based boards
>         items:
>           - enum:
>               - nuvoton,ma35d1-evb
>               - nuvoton,ma35d1-iot

>               - nuvoton,ma35d1-som512
>               - nuvoton,ma35d1-som1g

The memory node distinguishes how much memory. Is the board different 
for the SoM? If not, combine these to 1.

>           - const: nuvoton,ma35d1
> 
> Sincerely,
> Jacky Huang
> 
> 
> 
