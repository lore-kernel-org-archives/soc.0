Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB38C6377A
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 61493613F1; Fri, 16 Jul 2021 21:25:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B45261374;
	Fri, 16 Jul 2021 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470725;
	bh=k952yPNWWdG7QtLT3USK8nnSCYwGJrpp2mlvUl3iR50=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a/XIMqx7mOVmPLenFhUGyFMr1vEZsyfSf8idcbwgXgiOLhPCZlTeCqCvKJJP1UwmL
	 YqG/tZcLYspuaapP/WOvcU9Fx2EXGS2eYom5p16uhRgagXeaLjtRKFdXjDPAcm0g38
	 AllifbyOLci3r+FxpejR6Oh+a8UOdVL9KO2AY8CNCd+bHPPdNLFePU5RTpO1WrRF9Z
	 8+Iedp8lBaubwAHNhYi5rIJRl4JZMgirmivkzZxgFdiiQX8/YV15qHIb56ifhnZ009
	 i2Bmy517loNYVTvhem8gg7jXD+2ddyxMXI5Nf2ycAhFoxTJF61Wxi6bhhGSiVvk1xN
	 1YXRDzaaymbdQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_ffa: fixes for v5.14
Date: Fri, 16 Jul 2021 23:24:52 +0200
Message-Id: <162647049946.3478428.5724268915646605487.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165806.2617325-1-sudeep.holla@arm.com>
References: <20210714165806.2617325-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 17:58:06 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d28912d6f0ab6dbd0ca483ae77a4260b145542c5

       Arnd
