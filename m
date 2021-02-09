Return-Path: <SRS0=fMZx=HL=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D150C433DB
	for <linux-rockchip@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE6764E50
	for <linux-rockchip@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE6764E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X8yRC/gz+wyQCRV5xwA2aUTNAmhFtCzhuf3RCVXFPyg=; b=tSeuqjcROx+9OjMWJP5i14cb/
	2ZPQX8e3JX+2AZZEMx9vbx3MHyDjzspd3wPUZRkvUc1XEJGfE9YQ3pNn6OZQLbD1IOGz1dfeUNTlL
	9nCgvUQ0n5+0+dl3sNnUfX1kPNirzsGBxUXWjH+G+D/zDO6VJjn1eF0Y8HJWQtdK7Ot25i46DBECr
	79idWZVRyXpBLIPxcEUOuceN3a5a3qRcsKZCZXFm2n8AlwE6xifV2zXnN3stb9NzVnd/jegrleudY
	sppNhiA02t+iOYSFf2hhwHPYy11waRsTIZdtvpQVfZl+zCfWHxILF/cu80siLW1mtX5myP1npX6Tn
	tS7dk3o6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c6A-0007RB-W0; Tue, 09 Feb 2021 23:07:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5a-0007F5-CX; Tue, 09 Feb 2021 23:06:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CA5B64E56;
 Tue,  9 Feb 2021 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612911993;
 bh=oZZ/3UxFQ8eAo5gQbDUvtCgPkYXeyOoBm/fjUqRiJFw=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ikqn5Yms2cuCO2WSEdg+vBC7j3DY4+1SnZcz0BQ/faU4fclY7Yros8Vw94G1/JzFe
 oN/kHlxMvoZg08xIeTvJTRmqUo+a+DKpo44WOODyIzw/oa+LwN04uHQCimhPftxna5
 EE+bP8NR/lBVTMLmz4gfKI0l21Zquge4jUkl1cBCbpNrVBS92XLWiQ4pyKHkenjivE
 oBay96xDQoY4HwL6uGfULNHWn14wAEAmHduULAVuS42IwTR9w+od9z4oDny7f/ZkMn
 57zz/WXnUXfbnD5FZOajp3JBGRl0P+L3fCFyw9m3gE8I3kIlcGc2rHB+acNQco6gGp
 wcdXsYoZdVfAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.12
Date: Wed, 10 Feb 2021 00:06:07 +0100
Message-ID: <161291108112.974605.6402867046741602030.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <2184150.ElGaqSPkdT@phil>
References: <2184150.ElGaqSPkdT@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180634_623886_42120138 
X-CRM114-Status: UNSURE (   8.64  )
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
Message-ID: <20210209230607.BnutVjUFZC__IZp9LAW4WteOaS7RUFUG_vJXxdYJxDE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 06 Feb 2021 01:02:39 +0100, Heiko Stuebner wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-dts32-1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 243d3de3bd40379bbc63523f3e5638a1ad850345

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
