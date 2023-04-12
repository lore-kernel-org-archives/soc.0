Return-Path: <SRS0=zAZ3=AD=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9D4C77B6E
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 12:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5E13C433D2; Wed, 12 Apr 2023 12:24:58 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03993C433EF;
	Wed, 12 Apr 2023 12:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03993C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FpWgKUoiz0J1sZzx8HhIfaR+XN7FLVmHacJvZAr33Jo=; b=N5R6rI5YrQZVpNCySf3ccF+sYI
	JxuS4/J4ZSEW/8avo6msR+jW90J8qYZueL0LUDRVE0zn+499ARxTzTVZukGvUFDNqPyBvFTCPrwcG
	KXs222nLaxtAVuPEXFwYDOfHQeZV8vdGubPRqygDUdapCJFrTgitYvcL/pjMCBbdiEPg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pmZWf-00A5Mu-Vn; Wed, 12 Apr 2023 14:24:37 +0200
Date: Wed, 12 Apr 2023 14:24:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tony Dinh <mibodhi@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: mvebu: add Thecus N2350 board DTS
Message-ID: <eddb141e-6a8a-4473-b5e4-2e043d6f5197@lunn.ch>
References: <20230412025737.20280-1-mibodhi@gmail.com>
 <20230412025737.20280-3-mibodhi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412025737.20280-3-mibodhi@gmail.com>

> +
> +/ {
> +	model = "Thecus N2350";
> +	compatible = "marvell,armada385";

If you look at all the other armarda-385 .dts files, they all have a
board compatible. It might not be needed now, but it could be useful
in the future and allow backwards compatibility.

> +&mdio {
> +	phy0: ethernet-phy@0 {
> +		reg = <1>;
> +	};
> +};

Since you have ref = <1>, this should be ethernet-phy@1.

