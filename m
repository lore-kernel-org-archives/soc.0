Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE638C4345F
	for <soc@archiver.kernel.org>; Fri, 19 Apr 2024 11:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD01CC32783; Fri, 19 Apr 2024 11:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCBCC072AA;
	Fri, 19 Apr 2024 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713525290;
	bh=+KFuCZ7V01ENe3p95+/Bwfr+5AEUubk7+KB+qoDQd7w=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Bx6D6lQ/OC+DKOlByyLwLj6JumQeTaOEC+SjIea+ozA8QkVDbwdVplPxyPnVMFmLI
	 4R4CQHttrQJBQ0RjrHw0kqF8UYGklpmTsgyjcuV2rOb0BPTBLFnVkUsmxvxaQiBG30
	 QAttUFx6K1gMOEa4g1/vheULk545OfRqSD16FxLwZbeNnjbVdQJVacAZm68gtyY0Ok
	 /AjrDJsBXmFC4dAYx49lCSyUxSKLURuAaze6YjlPekkIjCMN9Oezi286R50Woptkmr
	 FHHdrJ7LoXX5mzhUz4yprEi2tTskrwkgB18/Lqmm860s29eWsp/xyInLcHjQF81dzz
	 TaVvhc56hwJIg==
Date: Fri, 19 Apr 2024 13:14:45 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding
Message-ID: <20240419111445.wirqqjza4hbsekyp@kandell>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-2-kabel@kernel.org>
 <20240418-grain-ethics-8a3ee62ac9a1@spud>
 <20240419082337.646a54a5jam7x3x6@kandell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419082337.646a54a5jam7x3x6@kandell>

On Fri, Apr 19, 2024 at 10:23:37AM +0200, Marek Behún wrote:
> On Thu, Apr 18, 2024 at 04:43:54PM +0100, Conor Dooley wrote:
> > On Thu, Apr 18, 2024 at 02:11:06PM +0200, Marek Behún wrote:
> > > Add binding for cznic,turris-omnia-mcu, the device-tree node
> > > representing the system-controller features provided by the MCU on the
> > > Turris Omnia router.
> > > 
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  .../bindings/arm/cznic,turris-omnia-mcu.yaml  | 86 +++++++++++++++++++
> > 
> > Why's this in bindings/arm btw? Seems like it is some remote firmware if
> > it is running off-SoC on an MCU, so either remoteproc or firmware would
> > make more sense? Tying it to arm at least needs an explanation IMO.
> 
> This was discussed with Krzysztof in v1, you can look it up at
>   https://lore.kernel.org/soc/20230824131736.067c40e2@dellmb/
> 
> Basically the SoC is an ARM board, and the MCU is also always ARM.

What I wrote does not make sense. I wanted to say is that the driver
drives the peripherals implemented by the Turris Omnia MCU firmware, and
the Turris Omnia router is based on an ARM SoC, and that the MCU is also
an ARM-based MCU.

> 
> I'm guessing firmware would also make sense...
> 
