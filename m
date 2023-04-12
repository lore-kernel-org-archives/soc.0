Return-Path: <SRS0=zAZ3=AD=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B11AC77B6E
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 12:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 686F0C433D2; Wed, 12 Apr 2023 12:26:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBA25C433EF;
	Wed, 12 Apr 2023 12:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBA25C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qkNd91mc0wlb2VPKu+SyH5ISGGmmbOrNHWSQupS56iM=; b=WZCWrWYbQ4ZSJIOzFEnG7+lWwj
	bRqu/CHjEZ+F/0Z+DoAGQMMjSa6r9/P89eQedGa59zn2475FPvmVhcShraAtW6t0DMJ3ujRkz7nbD
	BHmb95TGPbCEJ8cDCQhzBNNB8WUs8bxlp06GtpvPAcikO4aDADD8o63uoIM1o5cMQQZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pmZYf-00A5OU-1G; Wed, 12 Apr 2023 14:26:41 +0200
Date: Wed, 12 Apr 2023 14:26:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: INAGAKI Hiroshi <musashino.open@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Message-ID: <b9cb92ea-6a11-4299-a963-b9674faa4011@lunn.ch>
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
 <Y/d7gjqQCKKXMHqj@lunn.ch>
 <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com>
 <87jzyn3dv9.fsf@BL-laptop>
 <64b5504d-c81d-f77e-da67-c6d9e76aedd6@gmail.com>
 <b153523b-45cf-4e2e-8d62-de15b01a158d@lunn.ch>
 <231f9093-968b-e008-f2ff-899d8b24459c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <231f9093-968b-e008-f2ff-899d8b24459c@gmail.com>

On Wed, Apr 12, 2023 at 02:21:27PM +0900, INAGAKI Hiroshi wrote:
> Hello Andrew Lunn,
> 
> thank you for your guidance, I'll do it.

You probably want to talk to Tony Dinh <mibodhi@gmail.com>.

https://lore.kernel.org/linux-arm-kernel/20230412025737.20280-2-mibodhi@gmail.com/T/

    Andrew
