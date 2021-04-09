Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A09C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 19:56:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6062561104
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 19:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6062561104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4jqorDWqxDLI/jDCRaxio+lbg536JYquv7LC6nf+bTE=; b=ofcqr+6ZOV14GzciI4128q01B
	24h0LfD7DNiOC8ZAv+I1rl8bEoe+CNfU1i48q/4/YpXfM9pVzqIFsM3e/KjKUGfc7Ts4pY8ocMEzs
	OJu6df2K/UOeh2OkGUgAmLAN7eejaV7TDnNVivK+Euo31N7J1P4rAeugyDJn8JgGZvCj1254hbYUX
	CZXfe4lVLNI+aPL1geWmT8Lf58ag4cqgf+9mS1HvgZ8y5HjGCh0KYpT+B+ngkjnr8S01ifoHasyvN
	4gZh0+dxrvakQu0hcpIkuqqikQSq6L77ZmHGxAZ9plGLD0OL4IQZPLL4jShxjBTUD8F6hdEt5QNo3
	QhCkaJ/hw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUx8K-001Ri1-Pw; Fri, 09 Apr 2021 19:49:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUx89-001RhD-D5
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 19:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:List-Id:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=K39gYSOzo7gFtPOwKHQa1EnIe2wlh0B9vYTXPXfWPYo=; b=We3iMphcXffPkiZ1RDACww7uaP
 LTfcERQzf0MZReRlFoHAeoHkhTY7XTBuut3Mi4i3KiQWyREa3gr9BprQOw0HtDS5IJheWuwyvj8u4
 ROiP7qg3kF1QBTcb7wSfWDkp/QZKXVzl26VOt1NgotRLQ07nXSW07wgG/iDYXF13QsO4UaM59HUHN
 PG+dhfEv6cebAsxBDLHyYqY4/+bYMrDtolw4XX+Tyb1maSm8Sk4wKLuwqbgq9glDJxvIQUdarsyBn
 FyjUn1UvwB3g9wRadfVZM98ftcXHg8mj2S+j3j5hHedjTPoYrR2xOzQvbvNx1JUUf65QWy/ZCG30q
 G6KQ5uaA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUx86-004lsH-QA
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 19:49:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC80061001;
 Fri,  9 Apr 2021 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617997762;
 bh=gUjb4/opSryKjWBhGwiAhhKnOxqBuUP2YiJ/hvd9zSE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JcYJBdxz/m+LLq2obInUAlZFXUJ77PHo0WaRrf7o6NFOm9WSxfdQKeUL/cdbwuJ5V
 i34BjKEzxLpxll/g0LZDMiXVOsa2h25Pt+uq/ONRj6ccqUEEufXy5Kqbnd9AVhqYBv
 Dcg1kvnGlKbw3W0ZpXrBer6et0nUKYHuGvsUy2Dha3jhbBrYQ0aqhDxYdi/esO3uil
 XQ9nTGRJ6NUglEY+LEXtJ3/k4/sAZLvRsra3ddQuvJvTCzVV928TconhJ3UKoV6kV4
 VGjRo6ZsCGcomyilRHtkmDTgCNKYfk/DoVLef1x2GP2oeC2WQPn+1M0IvMtAVqOBEu
 d8EJEaNhjT9Ug==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, khilman@kernel.org
Subject: Re: [GIT PULL] Broadcom maintainers changes for 5.13
Date: Fri,  9 Apr 2021 21:49:18 +0200
Message-ID: <161799773277.1861470.10984939931826324456.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409175018.3051283-1-f.fainelli@gmail.com>
References: <20210409175018.3051283-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_124922_891895_54C3B868 
X-CRM114-Status: UNSURE (   6.46  )
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
Message-ID: <20210409194918.oq1nOLXO0pdKHvNzt5UtcG0wvwVh9c6QvkCHl01muJA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 10:50:18 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/maintainers
> 
> [...]

Merged into arm/soc, thanks!

merge commit: d92e5e32fb4fce7ae939ad322aad77955dd5dcda

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
