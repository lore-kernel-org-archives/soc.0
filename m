Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCD0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 12:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3644F60184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 12:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3644F60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zm3AELyQYqXrUDaGsBSF+kTfXX7wGhCH3qbOddXrgR0=; b=hi8Rkn4EFCefsR
	K37/cu9Qw0gBFgf9ITqzQ+E5dQ8mWRWSF3608KVtbd4KsSbgaKj3kLpBoym9hU0ib27BOo7sV3cgG
	5XL251xoiEu9muL8WtVEIlZ3/4GHRM+c6RA1wnM4QLe8aBq/B8c9f7CTqH+7+D0hQv89eVTEMQ9g3
	dihmT8ooOTYUfBx9dlOm8eCZA97xNciJIMdVtE8sQKK/8pPoZQ0h4xyPxvVctMXKdWqKS0RTgJ1Fm
	72L036pnZLFC/dL62U0DfLAT82lIl2XCkYiya6AZANqq1xdEa04lmLpmNOEJWMqtLPPK2R87oiqYt
	DkfHoeqnHzH+IGiW1N5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUpvk-002eQm-Bv; Mon, 27 Sep 2021 12:40:24 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUpvg-002eOr-SL
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 12:40:22 +0000
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
Content-Disposition: inline
In-Reply-To: <20210927095343.1015422-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_054020_935585_4CA48B9C 
X-CRM114-Status: GOOD (  10.74  )
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
Message-ID: <20210927124011.vi_UWzAYG1oR3EfF1t8eZyun2ROHF94jaT0PmeoeJuM@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
