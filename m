Return-Path: <SRS0=dO8r=VE=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE693C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Apr 2022 18:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 784F6C385AA; Tue, 26 Apr 2022 18:44:14 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB78FC385A0;
	Tue, 26 Apr 2022 18:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB78FC385A0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id b188so21645535oia.13;
        Tue, 26 Apr 2022 11:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mx8P3gHsjLCx+sknIhuvMfqYptVzGGmIORChHd23uSc=;
        b=tPyGWUvuva+dG2/gOscd4yUx3sVQQj4/8AYxx7m1xYnJYvj6NDl4eeCxKrL3xYnoVr
         pvFoSs4l48BtYtuqUEzAJWQfpN705nn6zRn1tHcE+huomD390YchECNp55Kr9fI7V68j
         HyWXLh+o+DVMVxGNNxd8szxayTzO76hAD+/H0sOPGWkqm5M+Xx82YX7n6fNGBsp4jeqP
         ys+tK0pZbSe0xBt0nLE0It9g9J4pswow6bQ3TOA/qDSFZz29+r79vJtaPzwIuDQO26aP
         zLQiEFzhjDRiXaZ60jsJdRpW6+rc93Ah4Ppc+q1mCO9bzrAvbKOc47B9ZPM0HAHdH9S7
         rzyA==
X-Gm-Message-State: AOAM533c2gz2Ei203DOeyWJigTIxNWSlI+2sjf9TFxnRpCYkXSkGSzVj
	1L3PrpCi2j6pCaT6L4yXaP5Z0MQZ+Q==
X-Google-Smtp-Source: ABdhPJxGVx6HmAUiBu/kUnqmIEoBY/yWAcaWyhG1G4W0lFdInZBsLOspIDqniFb2T3g2odMs73GLNQ==
X-Received: by 2002:a54:4e92:0:b0:325:224c:8ff7 with SMTP id c18-20020a544e92000000b00325224c8ff7mr5742089oiy.154.1650998652766;
        Tue, 26 Apr 2022 11:44:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm5937954ook.28.2022.04.26.11.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 11:44:12 -0700 (PDT)
Received: (nullmailer pid 2332829 invoked by uid 1000);
	Tue, 26 Apr 2022 18:44:11 -0000
Date: Tue, 26 Apr 2022 13:44:11 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de, Krzysztof Kozlowski <krzk+dt@kernel.org>, soc@kernel.org, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, etienne.carriere@st.com
Subject: Re: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if
 "st,stm32mp1-rcc-secure"
Message-ID: <Ymg9e7sWaFSuNR0a@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
 <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
 <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
 <a6fa8050-1860-fffb-e7eb-6603d2e0eec4@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6fa8050-1860-fffb-e7eb-6603d2e0eec4@denx.de>

On Mon, Apr 25, 2022 at 09:35:13PM +0200, Marek Vasut wrote:
> On 4/25/22 21:11, Rob Herring wrote:
> > On Fri, Apr 22, 2022 at 06:31:25PM +0200, Marek Vasut wrote:
> > > On 4/22/22 17:09, Alexandre Torgue wrote:
> > > > In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> > > > security support hardened), "clocks" and "clock-names" describe oscillators
> > > > and are required.
> > > > 
> > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > > index 7a251264582d..bb0e0b92e907 100644
> > > > --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > > @@ -58,14 +58,8 @@ properties:
> > > >              - st,stm32mp1-rcc-secure
> > > >              - st,stm32mp1-rcc
> > > >          - const: syscon
> > > > -
> > > > -  clocks:
> > > > -    description:
> > > > -      Specifies the external RX clock for ethernet MAC.
> > > > -    maxItems: 1
> > > > -
> > > > -  clock-names:
> > > > -    const: ETH_RX_CLK/ETH_REF_CLK
> > > > +  clocks: true
> > > > +  clock-names: true
> > > 
> > > It looks like this should rather be a property than a compatible string --
> > > the compatible string is used by the OS to determine which hardware is
> > > represented by a node, but here it is the same hardware in either case,
> > > "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the same
> > > STM32MP1 RCC block, just configured differently by some bootloader stage.
> > > 
> > > So why not just add one-liner property of the RCC block like ?
> > > st,rcc-in-secure-configuration
> > 
> > Because using compatible was already decided.
> 
> I see ... may I ask why compatible is OK in this case even though this is
> encoding a policy (secure/non-secure configuration of the same clock IP)
> into DT ?

I see 'compatible' as an encoding of what is the programming model of 
the device. Secure vs. non-secure have different models. PCIe hosts vs 
endpoint mode is a similar case where we mostly have 2 compatibles (but 
not always).

I wouldn't say which way we do things is set in stone, but in this case 
we already decided something.

Rob
