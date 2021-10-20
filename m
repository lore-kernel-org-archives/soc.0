Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648F2C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:32:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26292610CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26292610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RYpMnITCck9/4Pya2pnZaxT+eHBmy0edSjV16OoKJY=; b=xHpbsC8TQXRgwf
	2FsR0ckt1lT38xbZF8m9z3AbGD3GDJlm5l8uaFglKUrKC2Tg19x2ViwS3NgLJV6i0yAeR4hcCTU7p
	t1hAS03nuIX97YIn653kexJN2jS32BeSVjVrz4Rz1HREyFvI9Y9X0X4aXHXaNMyVp8YchuRm4nYjY
	n1Rcg4lrh+6HQex6hfjqSKhN0vQsrRUWtV/svzVL4OATomqWhpP8WoJ8u33LTRPZv564I7+HeOkXK
	jg3ojsCZu9MhtzcPeX0bdyEeXwX5NrYoQkDwbjKDxh4eagT1W9XABkVzhNajfiozIwY+nVsr3i07I
	MvJel7UXA4H3rYXhcnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJAa-005rfD-MO; Wed, 20 Oct 2021 21:30:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJAX-005reQ-JF
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:30:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0FB1610E7;
 Wed, 20 Oct 2021 21:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765441;
 bh=oxBxWZ7IXZjLdZvVIvjDqrsvZFGaxwm86AhEiLf1h4o=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lWRnqmizho83dALiowQUCezkHw4VVCgnGBuo4W8GscjkAcgdU2BfMN7szWkxYt4sg
 RIxlG5DtvJWRVUOGBW4VmbP0jLyVwZebTKgX8JkgcAOSjakqLfkNhn/baCAhDKxNYJ
 3loNhUZBmpV3Mw1/2c7Z+EGykQoP+AWng4Tn9tb6aLQms+K30hK2euV34hp+S1FVbZ
 cbXAoJXZS6SWJl4hEZmCNBS/dutGpqrLibefxY1BvnhwyhmTB5tcgaoDl22cEDEhhH
 0+n49ApSlgOf/fqlJFqqpaoa1UaC95eN3SiYrzCC7vItrYSrEy5eXxXRKGOS1vUZyl
 iVy7u4Fnw1YnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, arm@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: defconfig for v5.16 (#1)
Date: Wed, 20 Oct 2021 23:30:35 +0200
Message-ID: <163476542773.4156336.15519125893349486430.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <871r4mmecw.fsf@BL-laptop>
References: <871r4mmecw.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_143041_673477_A348306E 
X-CRM114-Status: UNSURE (   7.50  )
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
Message-ID: <20211020213035.c3-j-o_X0CuWqtQK6bmb3xso3uajAXN6IiN2WF6QV7A@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Oct 2021 18:39:43 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for defconfig for mvebu for v5.16.
> 
> Gregory
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: a307ca926028bc79d12eb2f686f4a557f064f598

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
