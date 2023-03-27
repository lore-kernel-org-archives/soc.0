Return-Path: <SRS0=0pvS=7T=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19422C76195
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 10:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9825C433D2; Mon, 27 Mar 2023 10:57:29 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7D33C433EF;
	Mon, 27 Mar 2023 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7D33C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=onlZ3BW/ohpzwNjPNz62W4K6Z+/iFWEigy06QiA3/PQ=; b=TNfv9X/+XWLgMmxbwbfvvl5iza
	JF/NG1pYn4CuIbbyC0FfJaqoDJG+cgm8GSJAtO3nc1VvmQEQ2srTdxq4MtHMAxsR38Gv8jRiz0ze4
	IHBH9ynoLhfRSxIyOItTmNsi2NLom/lT0KSAN66LgGYNeR4eGHUyr+65WMvT4XncEYJu7cKs/vRTo
	xW0MxmTJkBjsqWYOYlbBwHKlhWUo9WQsdkq+fTCgm+fhwWg3z7HHl/sm96s6UxI6gwBjRCxXsQ9bl
	8P2zw5tTcY2vOmFpc90tVKjZX3yfsiFm9/excxE/jv914YGQT4kPOMRo0ubunuzQ0f9KPTapiIG8S
	jXc0YYpA==;
Received: from p200300ccff0533001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff05:3300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pgkXK-0000EF-Ag; Mon, 27 Mar 2023 12:57:14 +0200
Date: Mon, 27 Mar 2023 12:57:13 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, bcousson@baylibre.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap4: add initial support for Epson Moverio
 BT-200
Message-ID: <20230327125713.49537a26@aktux>
In-Reply-To: <20230327082137.GH7501@atomide.com>
References: <20230313110409.2294154-1-andreas@kemnade.info>
	<20230327082137.GH7501@atomide.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

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
So I will try to incooperate the feedback into the last version
of the conversion patch and include epson,embt2ws.

Regards,
Andreas
