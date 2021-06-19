Return-Path: <SRS0=BwI5=LN=ravnborg.org=sam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F679C2B9F4
	for <soc@archiver.kernel.org>; Sat, 19 Jun 2021 20:17:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A0A7611CC; Sat, 19 Jun 2021 20:17:22 +0000 (UTC)
X-Greylist: delayed 62 seconds by postgrey-1.34 at mail.kernel.org; Sat, 19 Jun 2021 20:17:21 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E68C611AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sam@ravnborg.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com [91.221.196.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E68C611AC
	for <soc@kernel.org>; Sat, 19 Jun 2021 20:17:21 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx1.smtp.larsendata.com (Halon) with ESMTPS
	id 3c7cff3f-d13b-11eb-960d-0050568c148b;
	Sat, 19 Jun 2021 20:16:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6324C194B39;
	Sat, 19 Jun 2021 22:16:19 +0200 (CEST)
Date: Sat, 19 Jun 2021 22:16:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/4] Mainline imx6 based SKOV boards
Message-ID: <20210619201613.GA533354@ravnborg.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-1-o.rempel@pengutronix.de>

Hi Oleksij

On Wed, Jun 09, 2021 at 02:10:46PM +0200, Oleksij Rempel wrote:
> Mainline imx6 based DTs for SKOV A/S boards
> 
> Oleksij Rempel (3):
>   dt-bindings: display: simple: add some Logic Technologies and
>     Multi-Inno panels
>   dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
>   dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards
> 
> Sam Ravnborg (1):
>   ARM: dts: add SKOV imx6q and imx6dl based boards

Thanks for taking care of these!

	Sam
