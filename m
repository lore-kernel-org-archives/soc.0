Return-Path: <SRS0=EN3j=BE=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF5BC7EE23
	for <soc@archiver.kernel.org>; Mon, 15 May 2023 17:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 980A2C4339B; Mon, 15 May 2023 17:17:46 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5E1DC433D2;
	Mon, 15 May 2023 17:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5E1DC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from p5dc58da0.dip0.t-ipconnect.de ([93.197.141.160] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1pybpK-0004pc-2e; Mon, 15 May 2023 19:17:38 +0200
Date: Mon, 15 May 2023 19:17:35 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, bcousson@baylibre.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap4: add initial support for Epson Moverio
 BT-200
Message-ID: <20230515191735.6d671ef1@aktux>
In-Reply-To: <20230327082137.GH7501@atomide.com>
References: <20230313110409.2294154-1-andreas@kemnade.info>
	<20230327082137.GH7501@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 27 Mar 2023 11:21:37 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [230313 13:04]:
> > yes, epson,embt2ws is unknown, is the txt->yaml conversion around the
> > corner? I would then resubmit it includding an addition
> > to that yaml. If not probably I resubmit the conversion patch with
> > the compatible added. But that should not stop the rest of this patch from
> > being reviewed.  
> 
> Yeah let's do the yaml conversion first as otherwise we'll be adding some
> extra warnings for the dt folks.
> 
> Your patch looks otherwise OK to me.
> 
do you expect any action from me here? As Krzysztof has given his
Reviewed-by on the conversion patch, I would expect that it gets in right
after that omap.yaml conversion patch if nobody objects.

Regards,
Andreas
