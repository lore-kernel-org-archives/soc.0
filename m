Return-Path: <SRS0=zFwn=OR=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6055C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 12:40:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96ADF610A2; Mon, 27 Sep 2021 12:40:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2934961074;
	Mon, 27 Sep 2021 12:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2934961074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VHmnvYIAZmrSYdI15AbGglauUUWcdf2/62XeLUmuxd0=; b=BzVbVsqX8jfoLeyweDNgUxA71K
	vuy/+WcwPmEIKm2U+iFQIpmkKiBWIxDD2YHgoNUhmwb6YmENfV8Yy7or1ksHxwEMFvCm8HjZ/P2Pe
	vnD0AUgY8fYNtqRI9W3QJ9s2SnX6ZtjnS22Gyji39L5NrASnsg69JjYQdnGerJaijCdc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1mUpvX-008R94-9T; Mon, 27 Sep 2021 14:40:11 +0200
Date: Mon, 27 Sep 2021 14:40:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dove: mark 'putc' as inline
Message-ID: <YVG7q1L6iN+rkIwK@lunn.ch>
References: <20210927095343.1015422-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927095343.1015422-1-arnd@kernel.org>

On Mon, Sep 27, 2021 at 11:53:33AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This can cause a randconfig warning without the 'inline' flag
> that every other platform uses:
> 
> In file included from arch/arm/boot/compressed/misc.c:29:
> arch/arm/mach-dove/include/mach/uncompress.h:14:13: error: 'putc' defined but not used [-Werror=unused-function]
>    14 | static void putc(const char c)
>       |             ^~~~
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
