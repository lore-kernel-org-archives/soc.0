Return-Path: <SRS0=dR5z=VG=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC90EC433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 00:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89560C385A7; Thu, 28 Apr 2022 00:29:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70D47C385A9;
	Thu, 28 Apr 2022 00:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70D47C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KigzYfdn+iSeJPF6bdr56VWg+fbFPuorszO5TU2hSa0=; b=YmtZ5yGXslTXW2Sx/cXGZ8owdd
	p/Y4VySagTO/3jnqlE/Mm18Jm0OLS6Jwx3VVzFwehaR3Ibc+a4Yd9whb4rRk7GfoMMOPckFW0vvMK
	e1D/dW+tCp07l4tCP7Vy8HTKKeo38u4jmLOLa3P+ZCZQf6l0t6DU3ZsjywLEvU0YWvU0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1njs23-000D1I-Tq; Thu, 28 Apr 2022 02:29:19 +0200
Date: Thu, 28 Apr 2022 02:29:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arnd@arndb.de, olof@lixom.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	sebastian.hesselbarth@gmail.com
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
Message-ID: <Ymnf34FA0t9Rtqhv@lunn.ch>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427162123.110458-1-maukka@ext.kapsi.fi>

> - how to configure RTC to wake system from sleep?

The st,m41t80 binding document has:

Optional properties:
- interrupts: rtc alarm interrupt.
- clock-output-names: From common clock binding to override the default output
                      clock name
- wakeup-source: Enables wake up of host system on alarm

which you don't appear to have in your DT files.

      Andrew
