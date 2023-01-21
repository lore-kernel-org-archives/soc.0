Return-Path: <SRS0=T3Pj=5S=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E05C27C76
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 22:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0912AC4339B; Sat, 21 Jan 2023 22:33:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51B8AC433D2
	for <soc@kernel.org>; Sat, 21 Jan 2023 22:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51B8AC433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qSIbpGBcZLqkCpexATgZFICQef87VnQGSmdts/43mig=; b=ctyqb7SFKq7PzL80nZrlEAu+C/
	ho+MZHR9P3yZsJAGT4aqF8EaygxfGuMsT0QTZBM0M+XjZ/9/TcBBULVC3EtGTGfSbLu0Oi+lPPZ+D
	aG1bReWRdfO7uyjDZ82yhlymFnGZiCed8K5qVpdQldmE0JWvn/hewHJGnYC/scXfSdhk5tfbeBPgU
	kNgpgoS9+3JnyfzkbTvJqxLCvwoyrXf75ccQYhu7udywcKvK35VlyPI8JOA6hx35iC2s1NlaNOBcb
	z7ZlAB8bmK8oevwZOIDS0KwngcfkPAcFj2la7dEAYqHQir82ib3S+uyManrnCZSzik8o9xNYpHsgp
	uMNS6qkg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36250)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pJMQc-0001Td-3v; Sat, 21 Jan 2023 22:33:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pJMQW-0002lj-EM; Sat, 21 Jan 2023 22:33:32 +0000
Date: Sat, 21 Jan 2023 22:33:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] ARM: multi_v7_defconfig: Add options to support
 TQMLS102xA series
Message-ID: <Y8xoPLu4NEQXG6Gj@shell.armlinux.org.uk>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-9-alexander.stein@ew.tq-group.com>
 <acab1d7a-ef00-a3be-f73c-6cb9d01687b9@linaro.org>
 <2168770.1BCLMh4Saa@steina-w>
 <e08e6325-4b2b-c1ce-b33a-877de2c0babe@linaro.org>
 <Y8qr8wl8WdJfQ9We@shell.armlinux.org.uk>
 <3114bdeb-c8eb-3a3a-0d68-ca3370ce64ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3114bdeb-c8eb-3a3a-0d68-ca3370ce64ec@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Jan 21, 2023 at 09:27:52PM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2023 15:57, Russell King (Oracle) wrote:
> > Clearly, "defconfig=y is only for critical stuff" is rather false in
> > practice, and I suspect is little more than a desire rather than a
> > rule. I suspect it's more "defconfig=y is for stuff that makes most
> > platforms successfully boot without an initramfs".
> 
> Yes, that's true, although there was already pushback against this.
> Having an initramfs is not a big deal and nowadays I think all new ARMv8
> platforms use it.
> 
> Anyway this talk here is about RTC which is not needed at all as built in.

Provided NFS doesn't repeat XIDs at boot (which it used to when the
kernel had no idea what the TOD is.)

I believe the NFS standard allows NFS servers to repeat their response
to a repeated XID even if the request is different... which used to
cause chaos for me with a machine that has no RTC and boots using NFS
root. So just be aware that if the NFS XID is still dependent on TOD,
then not having RTCs loaded can cause chaos.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
