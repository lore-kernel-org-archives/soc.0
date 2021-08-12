Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DD7C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD6FC60EE5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD6FC60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjUSK61x4wZcGL/C0mMfR2szBhpiaCkuhcBl7cHEUR0=; b=yZFLW8jZkgCOlL
	clM7vvjXwXTQpdnZFihpUiWefZBt2CQqhLkh9rKKJz6LL4epWAmxwsKfqq9x2DHWWgphYN8ICaHiK
	ZlCiNF1Y+dY7Zbvmri9IeGwlwQj1iAcR2quVWA2sLwEidS1df87kBznY/rgFn/o3iCbRtZJSNh4fL
	srrd6mlz8bBz8vqOAO3Yla96K+JxyOLJeJtaXM07Y1xSEhd784b5dNbb/uSCTWx7IkXaDC1xtDlHU
	IwOd6SNMcTsp0tKVo1LXabbKd1PkAa9u/5iUL+/yu4eTQYWHZ98J1AEeLVLFQRry40r2RAmiom5QQ
	Lx71P2K19NgcSGxouKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHeo-00BFIg-Qg; Thu, 12 Aug 2021 20:50:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYt-00BCf0-Cu
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:44:24 +0000
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
To: ARM SoC Team <arm@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 ALKML <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.15
Date: Thu, 12 Aug 2021 22:44:05 +0200
Message-ID: <162880092646.1372486.6295796989855269180.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210811075743.707961-1-sudeep.holla@arm.com>
References: <20210811075743.707961-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134423_518335_CC5B9289 
X-CRM114-Status: UNSURE (   6.34  )
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
Message-ID: <20210812204405.wkGwLzVbQpENBEaA6zalO_QcKmQrDuGfppI4N4WjNtg@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
