Return-Path: <SRS0=XWxB=6M=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E217AC61DA4
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 03:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A995FC4339C; Thu, 16 Feb 2023 03:59:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 954EDC433D2;
	Thu, 16 Feb 2023 03:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 954EDC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aARG8CxAx6X7UqifXS1hpHGPgPY5FOKTybfy0dj1+g8=; b=bye7ML1ksmWhsoz2j9l9+as460
	y2Rjgf+uTMV1DL+zqmaAj8LyfcvIStf/4VG3pkYBnRSy5OO6J+7qTbk/CzIcOar5E7A0lGrW4ZU2t
	oX5CtqZy/DPuoFII71DECWXle+aPAVTRu0gwZyRK2pJW5pv2F1zSX2rU5b0WlxzyhdJ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pSVQE-0058oD-Eh; Thu, 16 Feb 2023 04:59:02 +0100
Date: Thu, 16 Feb 2023 04:59:02 +0100
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
Subject: Re: [PATCH] ARM: dts: mvebu: Add support for Thecus N2350 board
Message-ID: <Y+2qBm0P4ICrcLvg@lunn.ch>
References: <20230216011046.3306-1-mibodhi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216011046.3306-1-mibodhi@gmail.com>

> +&mdio {
> +	phy0: ethernet-phy@0 {
> +		reg = <1>;

Since this is reg = <1>, it should be ethernet-phy1.

      Andrew
