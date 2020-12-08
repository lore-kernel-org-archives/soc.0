Return-Path: <SRS0=uTbi=FM=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753ADC4361B
	for <linux-rockchip@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D247323B26
	for <linux-rockchip@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D247323B26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oRXdNRIfxm+ZLiIw7ib23JyeENd72RvGmy6Ks40P5y4=; b=hwxEuGJTs9V2+ItVdNIC/3S26
	B6oJlEHhd6n6FMvWA7c4BBqYGY8qoheB81I5+RgRFQvLC5lHsoIPbHzZrr/f2o1UAnp9CZFMmrclI
	bm33djBci9qcWTDSCsEqo+olz4uyIZGhiHB80+kUcdKy3E+M0P3oasuhD5bWqYbE/WA4T8zDlAtIf
	kRI7zp/OLl/X7t1LZAGzwuioiDiBtNtOGQkPl7kEsjVyIS4HFua/KwbYAk8fshA61SfNSlN6PmSwx
	ci7n6yGi2D/TJzq/oWNsw0qvtGLGCgTeK6OfOF8llDSaWNx/9pyIqjsgKYOYoDrnh0u69Q/jDirSj
	VJ+yuiXWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm8Q-0005kB-4k; Tue, 08 Dec 2020 23:11:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm80-0005af-UW; Tue, 08 Dec 2020 23:10:41 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.11
Date: Wed,  9 Dec 2020 00:09:43 +0100
Message-ID: <160746884873.2839681.1674742367162235185.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <4278011.LvFx2qVVIh@phil>
References: <4278011.LvFx2qVVIh@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181041_111964_8235AFF2 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230943.3s1QYJ_iBRAb8vtrIrrVl9tYAJxukdpa-miWI6ouKCM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 06 Dec 2020 19:30:06 +0100, Heiko Stuebner wrote:
> please find below and in the following pull-requests Rockchip-changes
> aimed at 5.11
> Please pull!
> 
> Thanks
> Heiko
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 261078ab9002d0b5aff807b374425ef8120a84f4

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
