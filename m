Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858DEC27C4F
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 08:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 462B8C4AF0B; Fri, 21 Jun 2024 08:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FD8C2BBFC;
	Fri, 21 Jun 2024 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718958965;
	bh=YIxf2v7PXe0qm7GK2saOC7yphClAuCAtGSPPVbPL1co=;
	h=Date:From:List-Id:To:Subject:In-Reply-To:References:From;
	b=Bf6A26abLMa64pK3Io0zbjmfJGCFAY1Ec/wLF3Sppdh08ZQTX6+xm2rYDMohDFQ5v
	 iECAukB9pNc02QpB7u+Oh9iUX8f9/RTsHyZSmKDXoK+p9tRbORRxTdeLoMVuCtyQLA
	 GFyO/Ji6v80iAktqq0nuksnkzEvnsh1cSfxHXnBFelSccUy0uZrjnBYdC30Z0a8HAT
	 wy243OMtIWLTercZfdLp/OwqaK1GRvIRmCQ21BxWzkyn5D1opzh4hJTUK2DuA61owt
	 jyHVLSml2/wIWhA0al2bu2pFufUUbQwoeVfLE2DABn9vNvGfksQG2mkg1G/MXi8b4c
	 fSD05Lr1avXFA==
Date: Fri, 21 Jun 2024 10:35:59 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, soc@kernel.org, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: convert
 marvell,mpic binding to YAML
Message-ID: <20240621103559.3a816f2f@dellmb>
In-Reply-To: <20240621082313.6605-1-kabel@kernel.org>
References: <20240621080719.20380-1-kabel@kernel.org>
	<20240621082313.6605-1-kabel@kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Jun 2024 10:23:13 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - msi-controller

Hm, #interrupt-cells is also required. Will add in v2.
