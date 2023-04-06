Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D19C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 09:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2ABCFC4339B; Thu,  6 Apr 2023 09:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B8EC433EF;
	Thu,  6 Apr 2023 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680775141;
	bh=fClTENclEkCjUX6ml4rx7ayviXTd15F7l/SRDk3i6CA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=T563cXjbpA242Gkx3uF13yr/DkfUx7a/6Kf3RFN1UOk7B1yYVuTepwf4x+wMuThdh
	 eLnfaGZ0jUcgJyr+ORunARizUZHAX7jsakaUQVVDl81HhBmFG4V3/+Vl5fRsdUVOzh
	 8MZmGaWCR1HsuWwZgm/1tw9+sm4j1zu5OFc/8Sek=
Date: Thu, 6 Apr 2023 11:58:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Stefan Wahren <stefan.wahren@chargebyte.com>
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Message-ID: <2023040651-baboon-busybody-6175@gregkh>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
 <20230404133937.GA3778861-robh@kernel.org>
 <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>

On Thu, Apr 06, 2023 at 11:53:28AM +0200, Stefan Wahren wrote:
> Hi Greg,
> 
> Am 04.04.23 um 15:39 schrieb Rob Herring:
> > On Tue, Apr 04, 2023 at 10:02:39AM +0200, Stefan Wahren wrote:
> > > This adds a dedicated devicetree binding for the Maxim DS2482/DS2484
> > > I2C to 1-W bridges, which can be extended later for further features
> > > (e.g. sleep mode control GPIO). Since one wire is a bus, child nodes
> > > needs to be allowed here.
> > > 
> > > Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> > > ---
> > >   .../devicetree/bindings/w1/maxim,ds2482.yaml  | 44 +++++++++++++++++++
> > >   1 file changed, 44 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Shawn Guo applied all patches from this series [1] except of this one and
> patch 3, which probably should go via your 1-w tree?
> 
> Unfortunately no feedback from Evgeniy so far. Should i resend these two
> patches for you?

Please do.

thanks,

greg k-h
