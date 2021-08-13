Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D01C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 19:00:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1230A61038
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 19:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1230A61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Hfbqp6DMj+OCtiQlM+se5tpNnVhlcjypPBajiC/kEk=; b=lBElYxgJncUndt
	3Bo9gSSUa6u4nx+J/x0nheEwf+OcnHQ8Vt5D9kxZgueeH5A24J3olU6Ra8udxBMOxn1vEW48H+HwX
	ryZq9uz74aXYE2VEWDIs66uRD3KrUAEUlLRN146VCbb/3o2sFeqJUILmrOE8iMtgnSHije/DGSL7Q
	zGbgxGqY4pXFCQ8ElQICsQoyrdGUFFZwl7TRvrO4UJAriCFCI7vKiDndk1y4Zt/OV6lpFi0DHr8AH
	IWqXQdUBjvXTRjPqoKIr8miOYd1j/CrqNQ0jp0FIdOQgo+ceYLu81Y41x+fr9r0yQLZvXAotN94j4
	q23DxpNloMJWYFXgxDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEcNJ-00DOlj-Hw; Fri, 13 Aug 2021 18:57:49 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEcNA-00DOix-0P
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 18:57:41 +0000
Received: by mail-oi1-f173.google.com with SMTP id o20so17265020oiw.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 11:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nadjUsMmA1Qaeso04cq+sY3Yg6kOqWs+HX5nofVhdc4=;
 b=ZXB53pSbosFN4auNcn2n+yBEtGnOKQrU7WGJt0ZMpiISlXDXJuEXE5meJECrTCjtv/
 g6QyE7E3sk6GGsqK6xMKf0jEb+kSMowhB2d6ojZoI0pmGqWnDjExvRgFYcO1N+lH1lq9
 gDcSPiNCDY1HVytBeOYb2ZIhYvMtnkWF8LO5VdqNA2Ss35gY4PPeCKkIV9RFifcq2hAj
 /IV8AxRfQsJYRF7YaRcnrSJOh4tfsvgPa5WmlfiGkc0zlajc5Qv11pR/N4yx1TcubS9s
 In5nfVE49EkZW2y8Ups4MPqmDkQuxe3qiiIL0Cr9Zu4UsEsPhufR9R9TrfQuznAC8SY1
 TVPQ==
X-Gm-Message-State: AOAM530TQPt2HNeYJC+sn+yIKrGysbbEYhozAcOr00Ajlc4NfZD6MDnW
 DXL0mZR3VREF24DPrvZ6wg==
X-Google-Smtp-Source: ABdhPJzyRiyGkIpBy2JkscVZbJCtVPJ+y43xMPYyDEJK+adrJsMiNWm12CDeKvo5ane5KqcSgPG+WQ==
X-Received: by 2002:aca:230f:: with SMTP id e15mr672375oie.154.1628881058944; 
 Fri, 13 Aug 2021 11:57:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d11sm421828ooh.8.2021.08.13.11.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 11:57:38 -0700 (PDT)
Received: (nullmailer pid 3863381 invoked by uid 1000);
 Fri, 13 Aug 2021 18:57:37 -0000
Date: Fri, 13 Aug 2021 13:57:37 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 6/7] dt-bindings: ARM: at91: document CalAmp LMU5000 board
Message-ID: <YRbAocukLCTrlRVE@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-7-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-7-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_115740_138413_6981C103 
X-CRM114-Status: GOOD (  13.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com, soc@kernel.org,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210813185737.3PTyIHfPxMPfnoRFRmfeEG6G6oGDxKvwbtAI7xJNjGs@z>

On Thu, Aug 05, 2021 at 06:53:56PM +0300, Claudiu Beznea wrote:
> Document CalAmp LMU5000.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index a9ab18510fef..08efb259a947 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -132,6 +132,12 @@ properties:
>            - const: atmel,at91sam9g20
>            - const: atmel,at91sam9
>  
> +      - description: Exegin Q5xR5 board
> +        items:
> +          - const: exegin,q5xr5

You've got your commit msg and diff swapped.

> +          - const: atmel,at91sam9g20
> +          - const: atmel,at91sam9
> +
>        - items:
>            - enum:
>                - atmel,sama5d31
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
