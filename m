Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FF9C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 07:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46026135A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 07:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46026135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlcG7Q9DMkWqnPxpXp2eQeEAiZcuFGwpmMNCw/LMhn4=; b=HhloNhZWdZGquI
	lfrFmqbklh3xgPwv5TdtBGUYXbBeWCqqSnoonpNDT8Prv60hIZXHAcImyHutNXwxdOOhxJFavbdzz
	XrYn8nmn9hSLJg/fDk8whAmS1+cE4oKSL2rgoPhw67QXbPQLulXj5D/uFZ3pOYUtwOhADOuxRBNgG
	XE5MqshtKjs0+TZf0NCX8u+Sy3RjmfSZGP6H/nqAw0iIrJYxU6/J/kmiEE59myuGFypCUdIenTZBQ
	3FgfN/Qs6T91pRrLKtAsQcK+Yg0SMvYHX1XQYwoCS1edfkfbrS1uL3vmdjy2ZY05oGIUEwZzIf/w0
	2oa/bigi6OL5NvyHjPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Zjd-00CYoV-Tm; Wed, 14 Jul 2021 07:55:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Zja-00CYny-RP
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 07:55:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EFA861360;
 Wed, 14 Jul 2021 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626249310;
 bh=RkyDlFfl7pt4O8HlQ7bFms0Rkc42NKziOoBVucrtoPs=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=AKyI6KXaBLBsyzveuQZu5mptmf3Hbt++okcyzTQG+pRCw/LmG0l4PNEQHVY5X1eMI
 460MQqD0kCsDM8gLBrcMr2RcOHDeVvtvKkklsADhRjLknW4oI7/kHiB9dQrFemWj1L
 sS92zCJ8ws6vANfZ9Ybzx5kQUmVuYAd6Qw6lHpy5540fqFGTyrYEN9zkRiKGdXWuG7
 0FZP3iE/E4QkVYVnSt3q4TClbfn+x19l/06uB0z8kvC5tBNYfBdyRZeY/NFcNm5ITm
 lU1kCllHuhEc67EHjQwClyQCkGietowhihO8y2tplVystqwVOWrm+seavrAI+AdLkt
 sVXTHKM9uwK6A==
Date: Wed, 14 Jul 2021 15:55:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: add SolidRun SolidSense support
Message-ID: <20210714075504.GI4419@dragon>
References: <E1ludJj-0001rl-GY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ludJj-0001rl-GY@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_005510_948117_2EFC1366 
X-CRM114-Status: UNSURE (   9.62  )
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
Message-ID: <20210714075505.-l9o8ZrwBUwYyFd5HKqf3gYAjm8bUUqKIUK3kOfIMj0@z>

On Sat, Jun 19, 2021 at 04:55:31PM +0100, Russell King wrote:
> Add support for the SolidRun SolidSense platform, which is a
> Hummingboard2 with a daughter card with two Nordic software defined
> radios and a couple of bi-color LEDs.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applying: ARM: dts: add SolidRun SolidSense support
.git/rebase-apply/patch:280: trailing whitespace.
		};		
warning: 1 line adds whitespace errors.

I fixed it up and applied.

Shawn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
