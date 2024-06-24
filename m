Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3070C2BD09
	for <soc@archiver.kernel.org>; Mon, 24 Jun 2024 20:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEFD8C32781; Mon, 24 Jun 2024 20:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FD3C2BBFC;
	Mon, 24 Jun 2024 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719261889;
	bh=eHfa78mG60gILDC24WGZEF3l8z/sFIEF7Yd38KV/jJg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=jFYUUNwquV08xxBYLYnqwGyFG6YL9GjrtVPj3+Qx8+imSaae7G/4ylO2kX1Vc+Kz1
	 /DWVYQDZ3qUIyd0YSmI/RYYcJcRlPimAqwKxMYYtoBXuTWacp+XQWWHrwtzOcGOEHb
	 Z4s9SJHfWN0+2SGXcYwgbWfdSg+lbRkBaP0QLR5u+FMA0HHYE/MZKJ7YkQFKRCwsLA
	 KmncvggLQbi/HCbH+24HdACu918GxEPO8R0qcWW4TwGt+uw80SadNqNuRdTsbmgvLw
	 kSa9sKvYEkIOhqNK+XLyn31oWtxXDU/SmnD3sH853abfl23eDGUoCRtPGBZqAdtlYy
	 IEFIsXlyhL4zQ==
Date: Mon, 24 Jun 2024 14:44:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, soc@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: interrupt-controller: convert
 marvell,mpic binding to YAML
Message-ID: <171926188565.385337.12451824082953031796.robh@kernel.org>
References: <20240624145355.8034-1-kabel@kernel.org>
 <20240624145355.8034-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624145355.8034-3-kabel@kernel.org>


On Mon, 24 Jun 2024 16:53:55 +0200, Marek Behún wrote:
> Convert the marvell,mpic device-tree binding to YAML. Add myself as
> maintainer.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../marvell,armada-370-xp-mpic.txt            | 38 -----------
>  .../interrupt-controller/marvell,mpic.yaml    | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 64 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-370-xp-mpic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,mpic.yaml
> 

Applied, thanks!

