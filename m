Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459C0C432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27F67610FC; Thu, 12 Aug 2021 20:44:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7529D610CF;
	Thu, 12 Aug 2021 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801063;
	bh=7H4hAoK0Ui1v509VGwSfqgzmC/yEqVE09cYcCCCW3dI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e3EyI2V6RAUNDCgOvUARJZYV+Pmy+lr4+uj42aBJsktrNsffJ/4FSqwI/PPR3wOnM
	 hJYbWbWapAxRdIMlPXwGtp+YkNxUqCW8z5p0TsF5qxZY7kB8DGAovlPE4kVbPB+P5d
	 1qGIybJud1YtYuVAXd5+Jri3ylUKAYI0G+Lr5Pt+1zSidEXyIJIZCSrwqG2XTmSgph
	 TbqiXKVODcWXkp1zu6NXn8j11bYhcukWRgoG3CE6yC9Be1vCmygl0lHa5tiMfPnoCu
	 Qqdk4SELW1TH/ucCUSsDoWJv76cIAYyqpPFrSQNY6NmgE06uKIYk6p1mgntG73WoFy
	 jz1eeJs9p8oFg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.15
Date: Thu, 12 Aug 2021 22:44:05 +0200
Message-Id: <162880092646.1372486.6295796989855269180.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210811075743.707961-1-sudeep.holla@arm.com>
References: <20210811075743.707961-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 11 Aug 2021 08:57:43 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit bdb8742dc6f7c599c3d61959234fe4c23638727b:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 1bb24be00c8c360e5e3072301d5f49eac86b384f

       Arnd
