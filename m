Return-Path: <SRS0=JR/p=AA=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A942C77B70
	for <soc@archiver.kernel.org>; Sun,  9 Apr 2023 14:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12F05C433D2; Sun,  9 Apr 2023 14:07:46 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E214CC433EF;
	Sun,  9 Apr 2023 14:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E214CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jf6jO3ttspH8uPqIAbw5feGA1slabzlsM/7hpKfh80Y=; b=jtOBGbQTeyoCuSP6NOn3dicHvZ
	G0+bCMKVAYrBH1PW4Q0lwFAr8D+89Et35zt5FUofyz+tJXiEv9Jt4yras8u0xJUZ3YCwhDnjBmbaU
	R6d1GAPVrrPlhLtGd5o3SiixO3YNorPDAD5LRXajMHq3En2cEOYo5EjDgszNc2dCzbes=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1plVhX-009qEj-IU; Sun, 09 Apr 2023 16:07:27 +0200
Date: Sun, 9 Apr 2023 16:07:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: INAGAKI Hiroshi <musashino.open@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Message-ID: <b153523b-45cf-4e2e-8d62-de15b01a158d@lunn.ch>
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
 <Y/d7gjqQCKKXMHqj@lunn.ch>
 <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com>
 <87jzyn3dv9.fsf@BL-laptop>
 <64b5504d-c81d-f77e-da67-c6d9e76aedd6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b5504d-c81d-f77e-da67-c6d9e76aedd6@gmail.com>

On Sun, Apr 09, 2023 at 02:13:11PM +0900, INAGAKI Hiroshi wrote:
> Hello Gregory CLEMENT,
> 
> On 2023/04/08 0:34, Gregory CLEMENT wrote:
> > Hello INAGAKI Hiroshi,
> > 
> > do you plan to send a v2 soon based on the reviews you got ?
> 
> Yes, I'm planning to send the next series.
> But I don't know the details about "documenting the board compatibles"
> suggested by Krzysztof Kozlowski and I don't know what to do for it, so I'm
> pausing this contribution...

Create Documentation/devicetree/bindings/arm/marvell/armada-380.yaml

Put in it

# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/arm/marvell/armada-380.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: Marvell Armada 380 SoC architecture

maintainers:
  - Andrew Lunn <andrew@lunn.ch>

description:
  Platforms based on Marvell Armada 380 SoC architecture.

properties:
  $nodename:
    const: '/'
  compatibnle:
    oneOf:

      - description: Marvell Armada 380 SoC based platforms
        items:
          - enum:
              - phytec,pcm049   # Phytec OMAP 4460 SoM
          - const: "marvell,armada380"

additionalProperties: true


But replace the phytex,pcm049 with the compatible for your board.

    Andrew
