Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C3CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C95364DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C95364DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j4xDqG35xzxKenW+qb3CPKrKSK99BxZJtYeXdtZY07A=; b=12epnP58bECKiUzp9LxEp5zkn
	CDHmafCWg8NOOHFTrRwALrakHJ5du5DB8ps+achJJMp11ubmhMxyOEaGrjBCpWKjTVqQ8gC8jnEyI
	HWr+iqzLRBPogzIzdU/cJWtqm4vFKg9UJq0ciL2r+4Xa0kzRJQdID4RBqt9Vsf4f5JGeHTDnTjxcw
	yqPAS3Y5qrO8qfpw4AyXLBt8WGfRzUunUCS/NY4oqf0tRTeQMF47DElGfM/6lUCffLI12tQyyIpnT
	L82sig3F1uHtxfVn54jFiS99RuGnuwtfXriYOHCK3CNEMUnFBSzcXnRfe0DY6oQRiQqRZFnag7dfM
	1+BdwPJVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oR9-0007jC-US; Sat, 30 Jan 2021 11:29:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oQp-0007c5-Mo
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:28:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C518064DDF;
 Sat, 30 Jan 2021 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006127;
 bh=6uCSVxqlCcKTNRbc8cK5W+DMehBIYTPDeCNNqE2CDEk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iyoAMQNz/w0fKpQyDOy4rwEJH1NlcsAMF9dAG6t9BeMyYXPq8M61+svhoX2fCYn7J
 OymnQrHuh8rekQcddISby1wEL+cdoA50KG5H8VVhMCJ8q5EmcYRxI+mumRtHrmeQt5
 Uiv33POjwpneHb6UF8ONA7EsExCwkI9SBuWwzrf37HOxpE6a1N8NPxHtm8OELfjLY4
 PchWuYZFTVnFY7G8myUlgFiVwc0oA5Vc0IBFAZi8FGGAOFz7se0hvAFqqwPR0r3z1G
 DZCcc1spN6I/ZzlIkkIonUUXXpBx1p3erjdKEAAKr2ZC4jgj33VkGO/QrfcEH3yHo+
 LJuty1gO3KFfA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 1/2] SoC changes for omaps for v5.12
Date: Sat, 30 Jan 2021 12:28:36 +0100
Message-ID: <161200610120.2091874.3279867462204676586.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1611845066-809577@atomide.com>
References: <pull-1611845066-809577@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062847_907386_FF043622 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130112836.lalgClf0ybNEArZgU8qongYNbID1CwVnLCm4qULKfIE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 16:45:01 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: ed8878041a0a2923ea9fbd4b7cc77f9fd7d12f17

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
