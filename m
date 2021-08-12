Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBAFC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD9C60F57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AD9C60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoptPbGgf+u1cIivmeK1GvKFZ/2mXTcI4PAFDn9pll8=; b=hH4afUyrYm14nZ
	erAaL9ayX7a2msR5TvDSQ+Q5wBgsRpKVqoy6ewWvly4d+Hv0ovJLoDm1eMHAIpBr4LFvUfBJtOTEa
	2K/tkVsxfJXayTF/wW4bvJ0jz/xMQJTYUN/AyYaljekXk9z4sjntWOINpSEi1xMa1ztCUNtzTXSys
	24wu78oMf9ROSaNjraRzgXwySg9MVkn4c4s2Z3F7VAcpjAZsOWzMGJWhgZJX4ohV/OJeCtJ7F57Tu
	ThhBI3sCr70gvsNoIPFowHNNvW8jlSrTnPNElWwTgP6K/YJokggI3Ex1OJPwlglbkVqlAqvuWf/NB
	77bBCXuJnsAZQYyzTFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHxh-00BLAl-0T; Thu, 12 Aug 2021 21:10:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHty-00BJXe-RZ
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:06:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E5D6103A;
 Thu, 12 Aug 2021 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802370;
 bh=V2xGOr9LNmSfReQcoltRgi724g6Hq0eSyDQzTUB8oVY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sfFrvqt49nysMdvhPJrG0TP+vuiOjSuPFClGvzf10RUZ0wmR+0JXiD8vM8WHA/eTF
 2Q8JAKIkW+TXPHah2LxJt4OOb3rxu6n/2rHKztRqt8NW65RbmmYGJxtW1bb5zIrW5B
 O0moZjVXpHI//JSTQLect34WjmXaUpqo5hdtj+bwkBYK/AeXtzqASPSRxbAaDBI+WF
 xNhP572mtKfrHy/QGI6Fb8p0QzJZn/S/hXAKUIwzgeF8Lt2s4QD3q6GloFHmyXCWZX
 aL+jL1M6H7W7rwjGYs1+nvKruQTP2aGOct07D+x/hdwbITQ7bEjv4N/EbujBX9FYH3
 fV8AYe1cHxOMg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Changes for am3 cpsw and SanCloud for v5.15
Date: Thu, 12 Aug 2021 23:05:45 +0200
Message-ID: <162880206192.1376011.3718743864242008546.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628751694-126144@atomide.com-3>
References: <pull-1628751694-126144@atomide.com>
 <pull-1628751694-126144@atomide.com-3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140610_991161_C36F2D7C 
X-CRM114-Status: UNSURE (   7.63  )
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
Message-ID: <20210812210545.LmEKzQfcV6Wx08b-VqjUcTBSqmMjcX27Uisv32q14RM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 12 Aug 2021 10:03:44 +0300, Tony Lindgren wrote:
> The following changes since commit 8c054cd2818ea08555efe24a2ffde330833c2f3f:
> 
>   ARM: dts: am57xx: Add PRUSS MDIO controller nodes (2021-08-03 15:25:14 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-am3-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 81b6a285737700c2e04ef0893617b80481b6b4b7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
