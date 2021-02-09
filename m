Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32D8C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A58964E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A58964E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fwUEW5CK9o+A6IIm0LPqk3glo6iHomeTU2vA0Vb+Lq8=; b=SJxNhmY7HWV82fXWwB65fLu9E
	tq+E+dBM4nW9LkqjB8VLLOL837e0oAHEteloce2D7DvskIIV8lMxUDxMxSKLi4o1Es2yefVAZLm7n
	ThNmfvdcmpztTsoqPyb5B5Z9Kcd6gJQL3S1ZZ6PuaRhLQD+MO9yTjFN/4XlhekKOM/tuT7v19cw0o
	fI2eCUR74ngLMdTSmOHB2eM4/iAkmnxzfP2rBxGQ75RoLy7EZgkiDHFIor8lVmFXcA4381LnSCjpu
	uUb54jSyAvcN31hCZlM6jA00izpuyANKzeIAz6SUwGro/gWkMVzJI0eCCs9W5mkbmNBfhfMzf8RfO
	BXYEK7QdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c63-0007O6-Dw; Tue, 09 Feb 2021 23:07:03 +0000
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
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230607.tNFls9y1Uw7XtJobWHNEHXV796ZKaGw4aAaxqRbllKQ@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
