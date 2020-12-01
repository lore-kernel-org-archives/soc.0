Return-Path: <SRS0=LF0C=FF=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD32C64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 15:04:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DBCE520758; Tue,  1 Dec 2020 15:04:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF70420691
	for <soc@kernel.org>; Tue,  1 Dec 2020 15:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hktHOsbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF70420691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux+soc=kernel.org@armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=lQkIAITTxB6dPbZfefyPfQUOz6UBfNpX4sJm/fCoIDk=; b=hktHOsboRi8yvEDCwuTZGRu/0
	Ic45sRVJ42vTGFqx8/jXtEmFwBV0B1wnH0dWmOEYag1ty1hoLdZOR3luxSy7fiPPomQqz9XYOdXg2
	hCqAhFf16vnwili4UqxZsz+JU9GU02mX5mWZt2ughzQN0XemGkSN3XGC9QChj3S68TFYtuT3uaeE8
	ybi19YOI746dhucIHRDgV2lkWktLam4uc+HwMr7grrBw/9fVmrTD6d8MrSJAZ3x90t9fvQ/yXgwi5
	ku9iAeKsc2OAyDTTxrnnXw8on8WSl2riYClmz4jBqJ66JxlrO5XwXNJtFxI893mExu01ZfDB7YMet
	rfOZ+rTMg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38450)
	by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <linux@armlinux.org.uk>)
	id 1kk7Cc-0000Ec-PQ; Tue, 01 Dec 2020 15:04:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1kk7Cb-00066C-Hx; Tue, 01 Dec 2020 15:04:25 +0000
Date: Tue, 1 Dec 2020 15:04:25 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	olof@lixom.net, arnd@arndb.de, robh@kernel.org, w@1wt.eu
Subject: Re: [PATCH v2 10/10] ARM: mstar: SMP support
Message-ID: <20201201150425.GC1551@shell.armlinux.org.uk>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-11-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-11-daniel@0x0f.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>

On Tue, Dec 01, 2020 at 10:43:30PM +0900, Daniel Palmer wrote:
> +	np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
> +	smpctrl = of_iomap(np, 0);
> +
> +	if (!smpctrl)
> +		return -ENODEV;

Wouldn't -ENOMEM be more appropriate here?
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
