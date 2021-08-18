Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9089C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81636610A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81636610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdH+S6GsVgCSE9GfqgcfprLEhsHXhpsuoQkdixHuwnU=; b=Y9qQJkmsGnjE+4
	0xf/H0vUG/H8weM1HmuVo68KOQBtER+0wacNjr/4dlXfEuGtVA+3BMZk2wDOUjBwRR87DckXBO4mP
	DpQiKEmRQWgr1OjGh69gDm/zcTZi/dodGuL4Exgj5NgRD9cHJMop3dSQQIsoyPRg8PXNOcvCZt4Eu
	2/MfvbnkLHb7on+PMIJHPsLVSUVgNBmYA/+OIqcAk+SXW5vSgaESp+ylvnqeT1XjxBtP5TMH//U9Z
	k/8I8k/GrvjWhx1wovgKRy/gTFyTIiE2pbgMGgJCbzrskS6Iii2QDLszfUkLYcpq+J1z1i0OjX1cA
	4/zj0Fbr4sVBfa0hyT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLif-005hjU-G4; Wed, 18 Aug 2021 13:35:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLiR-005hhS-K7
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 13:34:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB9D610CD;
 Wed, 18 Aug 2021 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629293687;
 bh=kU0/0RUSkzu6GyKZwm1Fj7lQVzJR6cLnV0eZfnSWb/I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dqLHoBbFDS+eCzFijZ08ud7Eo4fCE3GMnwuLGxHieSkEDfFpfO5w0aPnO+XdIkF//
 IPcs5lIsQ64fjkBf0NSzi709OInMV/usJmS9P6hd+tmBOKfW7fugpjkGgB41h9xbDL
 Jxi5lxycV3B9VUrZzwsRZeOi35G4mOv0Mw1RjgW7D46vPPAsgYy5YfJUQ3hLdZ46R4
 wAgUsfu+lKkVZobwTZxo8TiK3cEmjsxwEQ0Ev1gtG3dCwAtQb8ngAb1YP3VUWB/NnQ
 d7nFObBhtMcnsKqWVkLGuhph9pAL+vfd7NbLvNTqU6Th5EVhAVE+1bg0y5iXp4wnCy
 MlRiR3khIvlnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, soc <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)
Date: Wed, 18 Aug 2021 15:34:37 +0200
Message-ID: <162929367324.377646.18237573210512732738.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1628849625.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be>
 <cover.1628849625.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_063447_716670_89A98C2D 
X-CRM114-Status: UNSURE (   7.11  )
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
Message-ID: <20210818133437.FK5f4rqsOSGBN5rvns9NqtVuMj6BOlIakVeNeaoMIJc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 12:22:36 +0200, Geert Uytterhoeven wrote:
> The following changes since commit bfe6b5590ce6cab81b3ee51b4541bd1d0b18b3b2:
> 
>   soc: renesas: Identify R-Car H3e-2G and M3e-2G (2021-07-27 09:27:19 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag2
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 63db5acb4adf3a61c42b387c9c79799b86d25e7f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
