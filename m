Return-Path: <SRS0=4wwY=AT=embeddedTS.com=kris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA7C77B61
	for <soc@archiver.kernel.org>; Fri, 28 Apr 2023 21:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1256EC4339B; Fri, 28 Apr 2023 21:57:03 +0000 (UTC)
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFD73C433D2;
	Fri, 28 Apr 2023 21:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFD73C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=embeddedTS.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=embeddedTS.com
Received: from 1psW52-0008XV-Uz by out3b.electric.net with emc1-ok (Exim 4.96)
	(envelope-from <kris@embeddedTS.com>)
	id 1psW58-0008lM-UJ;
	Fri, 28 Apr 2023 14:56:46 -0700
Received: by emcmailer; Fri, 28 Apr 2023 14:56:46 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
	by out3b.electric.net with esmtps  (TLS1.2) tls TLS_DHE_RSA_WITH_SEED_CBC_SHA
	(Exim 4.96)
	(envelope-from <kris@embeddedTS.com>)
	id 1psW52-0008XV-Uz;
	Fri, 28 Apr 2023 14:56:40 -0700
Received: from tsdebian (unknown [75.164.37.163])
	by mail.embeddedts.com (Postfix) with ESMTPSA id 87B62E98;
	Fri, 28 Apr 2023 14:56:39 -0700 (MST)
Message-ID: <1682718975.5028.2.camel@embeddedTS.com>
Subject: Re: [PATCH 34/43] ARM: dts: add device tree for ep93xx Soc
From: Kris Bahnsen <kris@embeddedTS.com>
Reply-To: kris@embeddedTS.com
To: Arnd Bergmann <arnd@arndb.de>, Nikita Shubin <nikita.shubin@maquefel.me>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Olof Johansson
 <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>, Michael
 Peters <mpeters@embeddedts.com>
Date: Fri, 28 Apr 2023 14:56:15 -0700
In-Reply-To: <e429c0e0-7044-492c-a4e2-ed0c1185bb39@app.fastmail.com>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	 <20230424123522.18302-35-nikita.shubin@maquefel.me>
	 <e429c0e0-7044-492c-a4e2-ed0c1185bb39@app.fastmail.com>
Organization: embeddedTS
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:DHE-RSA-SEED-SHA:128
X-Authenticated_ID: 
X-VIPRE-Scanners:virus_clamav;virus_bd;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID; bh=T0qxuKHoFC3u0mSLJrS7Q0aIpKmNCJV1D92yNNJU0SQ=;b=WOjiTTaY+yQPgJRdeciQy77OzmGE8iM/WSdmHyKCvqiMhyOMU60rsBaBvMBRbaYsuSCPHL/MjzBn/2dDLA4c5XCBBzIhkr14Xj4xX80MGzmyvMJdsiEiHfzazNOauIXr0W31HgSeD+1jKRR7K0DIpc4kZI5sW9ShuLgXzBHerk7dGaw4Lp8cQEUsq7QgpnB9B0N87e60maQ9Jmrfc77jpb3gXRvyEdVOOSheepxllY6jhZtHxmoJGq1jVZfZbJOnM1S3jGqCPPyahk4x6Nzx4FduyNAUCL9/8szx2S4Pnos2xEWVomblEa5Nlx9mToE72uCYxYEbP6T8BcPoYNN/hA==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942

On Mon, 2023-04-24 at 13:28 +0200, Arnd Bergmann wrote:
> On Mon, Apr 24, 2023, at 14:34, Nikita Shubin wrote:
> > This adds a divice for Cirrus ep93xx SoC amd ts7250 board that has been
> > my testing target for ep93xx device support.
> > 
> > Also inluded device tree for Liebherr BK3.1 board through it's not a
> > complete support.
> > 
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Can you describe which parts are missing for BK3.1 in the
> changelog? I'm fairly sure that Liebherr is still supporting
> this board, but I don't have a contact to add to Cc here.
> 
> I've added Lukasz Majewski to Cc here, as he originally worked
> on BK3.1 and likely either has the hardware or knows someone
> who does.  Technologic Systems also lists the ts7250 as supported
> on their website, but the only contact I found for them is the
> generic support@embeddedTS.com. In case someone from Technologic
> is available for giving the series a spin, see [1] for the
> full set of patches.
> 
>      Arnd
> 
> [1] https://lore.kernel.org/all/20230424123522.18302-1-nikita.shubin@maquefel.me/

Thanks Nikita for putting this together and getting us some
details/notes off-list to get us testing this quickly.

We ran a TS-7250 with this series applied through some of
our basic testing and everything is working as expected.

Tested-by: Michael Peters <mpeters@embeddedTS.com>
Reviewed-by: Kris Bahnsen <kris@embeddedTS.com>

-Kris
