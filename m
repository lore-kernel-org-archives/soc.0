Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A971C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:11:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559E46128B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 559E46128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTU3wGgBv0aNf67bn57DwgYTtrWz3KyXI26vWMgcXxY=; b=fpRKkAd3FM5PWS
	G0G5LQGYONoxgLGaHWOREhpXiK+igRDj29lAV+/zL7SImrrSqHSeBw8A4n3w9krARasymbs67PVeN
	69+FfQU9tPOueX9YoCjJrtcluwxGVgbIO2WMvQVPX4dDngq9+qgTpLQe8URCP1IPnYwWOCIpBXr4z
	VuxNHnPhz5ePsafe/pRzhYylrAke/eUoOTxVegy8lS5utCL8nULI8Pl56gSVw1dd9vgXvRVYkz508
	aBYKtXmCJDjE/ANhGTVmOlTPkR5XFeiki9UtuVsyvl/QXmkPpZxCKjsK1XmfgXiL+z7AF3Nczey4c
	IvZNuErUH5jMvL+f1/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDDU-004uxC-Rp; Wed, 20 Oct 2021 15:09:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvW-004q38-E0
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 821A06137C;
 Wed, 20 Oct 2021 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741446;
 bh=yHqHrbbK5M2waw5Bwrqa8vjhfMskej1hsUVj87nxyfU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kNKU6mWzet2J+QMfdMrvoONhipvCl9CoOz8Ml5YYJBat0d70hxKfBwTb7D5sdKLQs
 szp4ys7Dcx/mEOUFmphHehCx61/NLiyyJMUDMPKcr8ViCW4AIq+sYhWXoEstQCxDmh
 h+Fb8sX1bNfeWJgdSyMO7LnkquPW1BhKSvt+kpUdZq2ZGvVw86oxXXaf65XhU1HNjc
 6wuQDNSd03DZVroizb1LH+/YvIBm43UWS0lIKVXd4fViXCX/5/6tM6C9Is3r3wwUzA
 2ugzjRL/GAUAsygVwK8smfXdepkkoydHtFdbIHvdrkDcKy1d/IG/JEF3RORVFyiReX
 dBySiV0MXHbRg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.16
Date: Wed, 20 Oct 2021 16:50:16 +0200
Message-ID: <163474139809.4099414.12404569120453905287.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5cad5ac6-187d-4d36-9437-5821c6e8242d.lettre@localhost>
References: <5cad5ac6-187d-4d36-9437-5821c6e8242d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075046_537105_449DBB5C 
X-CRM114-Status: UNSURE (   8.58  )
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
Message-ID: <20211020145016.N2ZTF01J4hW6bF6Kr4h_HGiNNoHMIxbaauySQvrDG0g@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:00:48 +0200, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b4ebc083a3e0172006c53f1689926ede77bbbf7e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
