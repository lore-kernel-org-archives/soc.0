Return-Path: <SRS0=ky5b=NR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC9FC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:37:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A4460EBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33A4460EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnfByKfEoLCVJ79MdxFF+iyNEbtkBu6yfwAGfOqYXN4=; b=F6+GluyIUfVrjA
	onZ5y0wGDdofYhjxvQVfIlK0VDgxLP4oB+3+yGCNKHqx99tbdHd+abA5G7VhHg2jv3nFEMDDlUkqk
	UgqS6aWNlVe1F9q4XAHk+sqBDqIvM73Spaav9A2GsNL5GLOMDvs7fsMLw0TDpSm1auPv7yI2AQ0C5
	kIqomKVFYkUjUPgkft/e3NL5LtIrrssNk8KhiQt5eQgh6zlDatl3WlJHqmg1m0oyClypUPeWN/pqT
	33NauNFeu5ZukdTdMZhzKU8SFcZ9kI/MPA0n1okwT23+WiK5MQ91l/nOuCsRleBqATQPKMpOixh8/
	UfzCKn/3I8Kg8Gp5vbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJBnL-009gEa-CY; Thu, 26 Aug 2021 09:35:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJBmx-009gDQ-1k
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Aug 2021 09:35:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E35C610CB;
 Thu, 26 Aug 2021 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629970510;
 bh=9Vn36W/nz6oOOrx0yZWOFYAFDurdQsSJPqzXxyS5VQA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HeL6pjBGp/gUqidh91ccO96wXpieE4nE3rBApAzTwAFSZcoiQT5B9YI7y5TWEuGM1
 l2YwE7MuCLSkArr5vwue2OP2weo7lYB0IUaP3fII9tpKu7NxlCqww86mHkA3z34yGu
 iqD4A3632j9mNYc8hcAgJprEMrelLkOZcMIVSKFchqCxRcF15MBnNLDSRL3H9Pt90/
 nUur5ocMH2hYcCyPQTNBC1ji1k0LA4yieKdJQpMXAkv+9F5l3+CTvtUbNwbTrBAesd
 Rufe90o03FT0Su1lUk+K8MGcIFY1XEV7c9p4iPX8FhAciyp4vf7TKekT0B0Q5ffEzZ
 ByYLhyy/jysCA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller updates for v5.15
Date: Thu, 26 Aug 2021 11:35:04 +0200
Message-ID: <162997049869.837527.9579735591959657618.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <d42a75fc17ce718ef1b3fa4c5d3f5c7fb0bd2bc2.camel@pengutronix.de>
References: <d42a75fc17ce718ef1b3fa4c5d3f5c7fb0bd2bc2.camel@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_023511_146142_117F0782 
X-CRM114-Status: UNSURE (   7.02  )
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
Message-ID: <20210826093504.S7CqjgOXumsYkMqGRXJlSTB4YN14jBu3bRrBDaHUtyE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 23 Aug 2021 18:12:55 +0200, Philipp Zabel wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux tags/reset-for-v5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 06779631d18ff2901af604eadea0d7b2193db7a1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
