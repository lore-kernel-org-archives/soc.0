Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5E6C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A78186101E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A78186101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahG6KF8Y6gMiiKAf3h1w9YIquW4nW7JPj4rp/szfqCs=; b=fMZl56AWiSQ0pW
	UtghiihdAjawS06ZyJyL3nCBf80VQ/4JrJlnfYWi322aQxitB1l7K62uMcWvJdHfUJvI9CoZ/jgOt
	MSFZpJUQb0AsdXms7sdEsX5yKM0uW3LtcTYz9AS6XNO+m0tDXaTefPKkWVAs5WuJJhEpi8dZ7zcNW
	vjmooPdN0h1SjCWpfiWbxOiyXVhF/du2montRzi3wLoVfgjbfQwg2n9HXlpykBwFJfaKrruz5Kg7a
	Xl3Kwbmkc7aCq8qEMYNY3IVqXUyIQkbSjxGuiXoQNPsZkY7AylX8HZiBi9s6dJnl0msNK2UVVog/p
	JFkWC4eGhtGBh46w6AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHyI-00BLU1-82; Thu, 12 Aug 2021 21:10:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHu0-00BJXx-Hl
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:06:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBBC560C3E;
 Thu, 12 Aug 2021 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802372;
 bh=fwBESCjZKo9gM25CESYUCaJhTCD+k9Slg/Pf7zTvUhY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hJqt22lrM4yV+oq97hYEyAr0m55/Uq6sHXpJmTMaYqxsVl2pSxUlPimNPMWtoSH7Y
 785OOGErTQmzutOEeO+Bz85hXjb+VVRv4Ej9KfCBA65sK6BYaDJMgDq1dFWNWb9TnP
 2Mez8GwCB2mzWcbWKLelpwImSRxdkSDAtrzgxTX+XOGDI3pn7YaOS4cU6wHE+m153c
 JWXy+KrGh7zYtXPSBLVeV+SJld1CYgXY/S+sL7IHoPl6zzY5mCCHmGnr1PT8rvH58I
 AOazBZhQ4yxOo/jeXlqkyL45zX7VNhwMwidpqFIpGyxPlYVtAAncqs/HGbYYVAD2vJ
 bWFkPYdnq1i9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Devicetree changes for omaps for v5.15
Date: Thu, 12 Aug 2021 23:05:46 +0200
Message-ID: <162880206094.1376011.11267731078560363684.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628153040-834155@atomide.com-3>
References: <pull-1628153040-834155@atomide.com>
 <pull-1628153040-834155@atomide.com-3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140612_692888_640570BA 
X-CRM114-Status: UNSURE (   7.55  )
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
Message-ID: <20210812210546.EPf2wsDJYzrHce542PGgVUX5n2IPgo1mhRZpAio9kZM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Aug 2021 11:46:44 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1c7ba565e70365763ea780666a3eee679344b962

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
