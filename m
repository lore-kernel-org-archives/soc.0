Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E53CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2261323B09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2261323B09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GyHb+znwhYa7OAgecOcCVMrWJdofd3LK65zwrsjtFIY=; b=pAfUPeg6NqsBwDwW+JbZZ5u7F
	R8M229prlvQ3s54l5Gs/c5M+yZz0ZK0XWw+36GE5mZgjYPVcGDNOUq1dMYqRho5ft9CVVHNdWLa55
	+2d8mpKZRvlgbOim6ROJjISlmzvuTdCnu3oCy2cA+i/Foa2KmmTvwodF0XEW0fhpcBZhdVrVW3jRl
	Gq5Tt5Y5cOY7iN8N9DecrQNr68OM9PbJIdhwUfh4TUIfYUwceJTqGl0O7Pzla9ee/tz2S8wM/Q0ov
	Ng1RvHKXTCt0ZiHoPKQ+Kgro0SkIf1ic21vO+OcOjNXBdynDZ87Wuf6BFLRhF3VQY62NbS6N0/AXq
	qMCe7q6bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l359l-0001n7-OL; Fri, 22 Jan 2021 22:43:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l359a-0001l7-LL
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:43:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0638723B1C;
 Fri, 22 Jan 2021 22:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355422;
 bh=57EbRnivljg6xRuDuPzY8uwa7RZ6p5vUA+cjf2TDp9k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rj4vUoHwZGFCwckyq9bhhBikOsef1yI0fVtsR5NBjChVf8gkKSTnoUKGHBP8BD+oW
 jSpA3jvTCSULl5g21FBey/pseD3Sr7ry8c6OsCOjbS2F2kG+0qksunleHZwk/mqhKa
 v5c6bZK6z05ruO7Dgr2cJ8g46kjffr0NgIwvYtmSJmm6Yr1XaVVSNConVlgNJp5I27
 oiRsT9JCdlkouj+Z+Raw4wiZvmdumR2dhC4zcgCMp3RzDyyA4zlvtg7L2ONZJtKAYR
 DgoTJXGufb6zZx5Hm7sm3LPfqNq+1Uoh4+W8Ix+8/0T20lxHcLPUrKz4OY/iDQOfrL
 kaaFGksVvnH9w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: nomadik: Fix up MMC node names
Date: Fri, 22 Jan 2021 23:43:31 +0100
Message-ID: <161135518055.1310202.2511846197804284625.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122222038.2888747-1-linus.walleij@linaro.org>
References: <20210122222038.2888747-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_174342_759028_ED0E4026 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122224331.c1t_4IsFT1C9EZXj_SySMteovQQ2rXyrsUEQ0sI5VHo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 23:20:38 +0100, Linus Walleij wrote:
> Fix the node names for the MMC/SD card controller to conform
> to the standard node name mmc@..

Applied to arm/dt, thanks!

[1/1] ARM: dts: nomadik: Fix up MMC node names
      commit: f5e4bf9060d34f93519e319d71ee71d779a41084

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
