Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B714C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:16:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EBF44610F7; Thu,  1 Apr 2021 20:16:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9107A610E9;
	Thu,  1 Apr 2021 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308166;
	bh=a8wXmiIZJuzMRoiHoMZd0u967sFUL0d5AugV/GBVCmQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NkC7djKdqiHs9fxzRfCOjkqWtzZY3b7dRjPmy8bwFfU4E1SW+QTfoayL2eeO181q5
	 qpMZbvkVnBirYYvD1aDCTAyDB4Y2iQgUq3wFRqT2Tqt9p4mCJ9RwYmjrY2/J8tXlkE
	 MS+J3V9xGrek97GOFzkNQD7lCgjtmDDrEuZ4S0F8U+y9SSX6UrlZ7wHONEQBbffKqv
	 ceisQnrskf7v+6vIfdsfus7lMTZLxk4KOyTe+gJOZ1rYTxCFzBSzNdZ2A0akBTfFlM
	 CSVWuWiBtWeGIEsIbFgs9N8Z1cDW9adLDOEqqNWtX/eULdBhBqVMLTwujfdM989vep
	 fRNMjZBh+iuUw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org
Subject: Re: [GIT PULL 2/3] Devicetree changes for omaps for genpd support
Date: Thu,  1 Apr 2021 22:15:30 +0200
Message-Id: <161730808591.655497.12428729315912496095.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617004205-537424@atomide.com-2>
References: <pull-1617004205-537424@atomide.com> <pull-1617004205-537424@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 29 Mar 2021 10:55:21 +0300, Tony Lindgren wrote:
> The following changes since commit e259c2926c016dd815e5547412356d378fc1f589:
> 
>   PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driver (2021-03-10 14:01:00 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dts-genpd-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e49936d2154724213b5ec8a8aae89b2c2ebc3af1

       Arnd
