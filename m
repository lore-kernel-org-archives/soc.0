Return-Path: <SRS0=GOBS=O2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFBAC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF70611C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBF70611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQ5xhZnKz9fwXJkxHIg7ESHfRwQ9eR6qmeESK+M7dK4=; b=pbkup9qX9KUVn0
	T5mUydTHXqkfUZKIGOaOxh9KY5k/AvYLs1KrUvFTi92lj91qXXzyoBU9SXh8QdD93fHUXyA7Rd6aY
	CoVal0uXQnwMIZPvkW5jevS+Gg/abd8nNVp6z9kGFFbEjvOwA7Kr+Ap0WDR+yrp7SVSYodnf7G+yg
	0ZUqyUwdjdh3Dnf8cccrYwxysCFCzd0zrh+oCInQQZkMp01PeWa39E3XEVDeCYHo/9hZXZSdvTYG8
	r2XBRkhLGqmZzk8vV2o7FV84Yv/kll++EazzzarDkDO9BHIOPXm/GPaV8xLfxUEEhPt5TYh7mgddR
	VemDNUiI7yEUsPiJh0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYEaC-00Fc3Q-KP; Wed, 06 Oct 2021 21:36:12 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYEa7-00Fc2n-PH
 for linux-arm-kernel@lists.infradead.org; Wed, 06 Oct 2021 21:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=zHpbsjc3qKt9LogaeKeHB5njaBmULVU/acnxbVKrwRQ=; b=0qfrzn0bkrFkSFvPNuD8AE9cvl
 PgfXbR8fbI0/IOz78MVLiTCjCrfDxgbdEqqxp6GqiM3KNzs3ALy0Abwbwh5rw2EYcYpcL1VXJXaVv
 rnbsznsSTzMPsWWckChQIX3xEUNZRDCdniu0WMa6EHH/gZxK6iblb0HwO6aj5lGjmrpA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mYEa1-009sY3-Ro; Wed, 06 Oct 2021 23:36:01 +0200
Date: Wed, 6 Oct 2021 23:36:01 +0200
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
Subject: Re: [PATCH v2 3/3] ARM: dts: mvebu: add device tree for netgear
 gs110emx switch
Message-ID: <YV4WweG1ukE9HfJr@lunn.ch>
References: <20211006063321.351882-1-marcel@ziswiler.com>
 <20211006063321.351882-4-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006063321.351882-4-marcel@ziswiler.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_143607_840344_1F65145E 
X-CRM114-Status: GOOD (  10.57  )
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
Message-ID: <20211006213601.znQ6PG1hPE0CPHl6zoZqV9S66Qi4hS8bq_a09LOYoG8@z>

> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3P3V";
> +	};

Sorry, i missed this the first time. This regulator does not appear to
be used. Other armada boards us it in the sdhci controller, but it
does not look like this board uses that. So i think you can remove
this.

	Andrew

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
