Return-Path: <SRS0=aFDC=VD=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFE4C433F5
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 19:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71209C385A7; Mon, 25 Apr 2022 19:11:16 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9741FC385A4;
	Mon, 25 Apr 2022 19:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9741FC385A4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id w27-20020a056830061b00b00604cde931a0so11471507oti.2;
        Mon, 25 Apr 2022 12:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KfvsdaNrqzE1BZExO2gpU9gM5Zw3mrEmzjGsDm/IN7Y=;
        b=n9ByHwvLSV7A+JliGmqIFIkL8usMq7P949aAM9Eh4v/22JttZ7yzc7A1vgGt+pvjwQ
         dBuGkmBq+CJMbtToUyTBgsXwXEFP+FPpQ/qj7le7yG2xhXBDY1F/rcws0PNlWmindK5i
         cvqW/5Wnj5NMvBiUbpSW/1otxr/BeRyb8ERlweG20As6r0Mgk9csOI2mK3x2rStXu3kU
         e9XGVE6UbCbeCC7Lc+qZoUZKEsrfbTl5LHn4XmHzLvrV9TEi70STgecFp7xIywQAjhzV
         +OLQWTelR313ZJCXPcfmpW0jlBgNgwskewrnP1A7YpBSl88R75TrzpA6kboodBL+z9B4
         w9Ig==
X-Gm-Message-State: AOAM531ovCDJ7o90SZ4adgH2xlpwLqP7nNrztjV2j8YuhNc4PXb2/f6X
	EtVovcjZN+7CfqTnOVNRmQ==
X-Google-Smtp-Source: ABdhPJw9uxpUO9LKnG040QuMwHyOzS4tHc0WimyBmaTy2/e4n1V3ST1BXyUY9YaMQrHV8DrvaiVaAQ==
X-Received: by 2002:a05:6830:18f:b0:605:433b:c568 with SMTP id q15-20020a056830018f00b00605433bc568mr6954877ota.46.1650913874611;
        Mon, 25 Apr 2022 12:11:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e26-20020a056820061a00b0035e46250f56sm4020495oow.13.2022.04.25.12.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 12:11:14 -0700 (PDT)
Received: (nullmailer pid 83469 invoked by uid 1000);
	Mon, 25 Apr 2022 19:11:13 -0000
Date: Mon, 25 Apr 2022 14:11:13 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de, Krzysztof Kozlowski <krzk+dt@kernel.org>, soc@kernel.org, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, etienne.carriere@st.com
Subject: Re: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if
 "st,stm32mp1-rcc-secure"
Message-ID: <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
 <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>

On Fri, Apr 22, 2022 at 06:31:25PM +0200, Marek Vasut wrote:
> On 4/22/22 17:09, Alexandre Torgue wrote:
> > In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> > security support hardened), "clocks" and "clock-names" describe oscillators
> > and are required.
> > 
> > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > index 7a251264582d..bb0e0b92e907 100644
> > --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > @@ -58,14 +58,8 @@ properties:
> >             - st,stm32mp1-rcc-secure
> >             - st,stm32mp1-rcc
> >         - const: syscon
> > -
> > -  clocks:
> > -    description:
> > -      Specifies the external RX clock for ethernet MAC.
> > -    maxItems: 1
> > -
> > -  clock-names:
> > -    const: ETH_RX_CLK/ETH_REF_CLK
> > +  clocks: true
> > +  clock-names: true
> 
> It looks like this should rather be a property than a compatible string --
> the compatible string is used by the OS to determine which hardware is
> represented by a node, but here it is the same hardware in either case,
> "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the same
> STM32MP1 RCC block, just configured differently by some bootloader stage.
> 
> So why not just add one-liner property of the RCC block like ?
> st,rcc-in-secure-configuration

Because using compatible was already decided.

Rob
