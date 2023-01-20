Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2211C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 08:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61C03C433A0; Fri, 20 Jan 2023 08:58:20 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6565BC433EF;
	Fri, 20 Jan 2023 08:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6565BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674205097; x=1705741097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+iuc98DtBAbpm/dmvmlkgpGmOGgdfICcTWaopJo7Sg=;
  b=JW+9apkhcWysNXG28XfUE1FIn/P00qBiVSI4RzBqmBKL4IrbHWEDE2o1
   Vnb+g91D4Qq6D22eYc2w9XjevyMNDKmbay3JSHHTo3vXTtprqF1Or+3v7
   VyZZAlEzzJx1SjVyR12lHFdx30IMitFvt1t7L4AqxMX0K1noo7h3zy8UQ
   Ue/Y1tB8Uf2lgo2/yZW5UwYcPnM5G2Afzbea3aUSRNBpppA0Y7mLO26HS
   f/bOtPDRD5aqv/ojSYhuPU2M2L5Qu1BSVjaYk153K0sn+vFVUwIRiT5PO
   jQrPzl9AuGi06juD4Yj++ibRJDJIOL8I4X+yqHQGORLjJAl8tcJItgQ8b
   g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669071600"; 
   d="scan'208";a="28552485"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 09:58:13 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 09:58:13 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 09:58:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674205093; x=1705741093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+iuc98DtBAbpm/dmvmlkgpGmOGgdfICcTWaopJo7Sg=;
  b=OZoKiiM8zo8HlZjPar/Rf+WdbSGIbIKYcztAnpjXHRrAiFk0trVKKLjy
   b6e/TRnO3WyrkhFectGp2M1BjR0KZGsl0Ny/F8uiKXtRbpriQPOJEhbv9
   60W+Vh2dQJRCXEDO1kpN+ex1kJprqNzc1M2dBDWzdQYtP4coafWqg/h7R
   c4PrgY173MuZqIJE0+JDbHbR1q6kNblavh6bTRzviZxemt2PONlQijNz7
   ntzkg1UN2Rl0I5imDyRptcK18e8CniDjCkvUu0+PW4q/07CsbuB6tOJzF
   uKAe/JN5DqovO6sSA3yrWJWgnfQ1gYnz0EmSKUf6MTIvwNYO5BtCru9Z4
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669071600"; 
   d="scan'208";a="28552484"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 09:58:12 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B1CED280056;
	Fri, 20 Jan 2023 09:58:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
Date: Fri, 20 Jan 2023 09:58:11 +0100
Message-ID: <23586057.ouqheUzb2q@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <3c1b8078-1f23-aba7-f3b6-ddead64e85c8@linaro.org>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com> <20230119144236.3541751-2-alexander.stein@ew.tq-group.com> <3c1b8078-1f23-aba7-f3b6-ddead64e85c8@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Krzysztof,

thanks for your feedback.

Am Donnerstag, 19. Januar 2023, 17:59:20 CET schrieb Krzysztof Kozlowski:
> On 19/01/2023 15:42, Alexander Stein wrote:
> > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > 
> > TQMLS102xA is a SOM family using NXP LS1021A CPU family.
> > MBLS102xA is an evaluation mainbord for this SOM.
> 
> typo: mainboard

Thanks.

> > Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> > b/Documentation/devicetree/bindings/arm/fsl.yaml index
> > 3ba354578e8f9..b54a920934c9d 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > 
> > @@ -1164,6 +1164,13 @@ properties:
> >                - fsl,ls1021a-twr
> >            
> >            - const: fsl,ls1021a
> > 
> > +      - description: TQ-Systems TQMLS1021A SoM on MBLS102xA board
> > +        items:
> > +          - enum:
> > +              - tq,ls1021a-tqmls1021a-mbls102xa
> 
> Can mbls102xa come with something else than tqmls1021a?

I don't expect this. MBLS102xa is the starterkit carrier board for TQMLS1021A 
module. But the module can come on other custom carrier boards.
This name schema is similar to e.g. imx8mp-tqma8mpql-mba8mpxl.dts

> > +          - const: tq,ls1021a-tqmls1021a
> 
> Why duplicating ls1021a? Can tqmls1021a come with something else? This
> is redundant.

I agree this is somewhat redundant, but this follows the naming scheme 
'<vendor>,<soc>-<module>' which is rather widespread for i.MX boards/modules. 
TQMLS1021A is the module name I can't change, actually part of the series 
TQMLS102xA.

> > +          - const: fsl,ls1021a
> > +
> > 
> >        - description: LS1028A based Boards
> >        
> >          items:
> >            - enum:
> Best regards,
> Krzysztof

Best regards,
Alexander



