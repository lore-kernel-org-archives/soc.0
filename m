Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77104C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3861960F4B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3861960F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6M202HMJgipBNEBjRq15avG9+RsgTMIx3VkjP8Tvzfk=; b=bwIJ5ardWMfJSF
	oNHbXPCskEl1x2WOPQHkLpSod5M+rCEWU+HsAPDGGzhyXyXtCA3P/lDvVR6am2weoP4NkBMfPCHiC
	dm4o4HyLG1ENhbf+1kesp/2yKKK1ZToTNqG85FPUWyH/oLGP+7krSpwy+ghFRKjBbAMfVXVabjsop
	Oaypo9VpuUSt7Rqii4xdssVekTNuHm7Q6ngk8io9LYDzHw6pKsPfEF88x0csH4JMXitE2C2nQ5D7W
	0dGuk9S97RFqyD8L/2zoF+48H/qlqJicIydQy06Bvp+OOjP5wUMRdfEG3V8OHCiCCv6m9HRw20GgO
	CIEO3nGl0RrEJ++2H90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXk8J-00AXPM-Qa; Tue, 05 Oct 2021 13:05:23 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXk8G-00AXOv-A1
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 13:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GjSw70UXArEHRQSHVBHoPAYrTU+PZTUZHzIDM8YnLPc=; b=OhpLmBSdICkgEyNuofNjis7duX
 jxlY5aNa1IpRqsEWFjqmb+61waOfeLwzsEnJF4v2beuEsdV/ngEpRtunNDcmcDwqNX+8qjWJhqx5N
 fjMfLSNN+OnsXe37Jix3RiAt+EUTQPrvf7Ek4PyPIS6+M4sGwBq/aEpwhwaUD5hgTvtE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mXk8D-009h5c-9r; Tue, 05 Oct 2021 15:05:17 +0200
Date: Tue, 5 Oct 2021 15:05:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marcel Ziswiler <marcel@ziswiler.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, soc@kernel.org
Subject: Re: [PATCH v1 4/4] ARM: dts: mvebu: add device tree for netgear
 gs110emx switch
Message-ID: <YVxNjc0LrYp4SXtP@lunn.ch>
References: <20211005060334.203818-1-marcel@ziswiler.com>
 <20211005060334.203818-5-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211005060334.203818-5-marcel@ziswiler.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_060520_376907_25085D43 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211005130517.RpRSotMDSK5UsZI6P2Lgo5ONE5bAHD5qhXP_x0jXc34@z>

> +		mdio {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			switch0phy0: switch0phy0@1 {
> +				reg = <0x1>;
> +			};

> +
> +			port@1 {
> +				label = "lan1";
> +				phy-handle = <&switch0phy0>;
> +				reg = <1>;
> +			};

You numbering of the phy labels is a bit confusing here. Both the port
and the PHY use reg=<1>. So i would use the label

switch0phy1: switch0phy1@1 

     Andrew

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
