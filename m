Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC275C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:40:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FD464E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FD464E4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4tANRvuSFHbdMLaiSoaN7F6WIWTUDeKLzfstUtc/uYU=; b=DJ4u3Jh4cLtI1NNztM1BAbv03
	GrAX+P2EtjLWy3WVoGLVikIQXwOztVRQVmAfc/jxhwcPWKu2+ji7tr6/jZq0WYf5c2EqNmIpQBqSB
	knX1eaqX+rJJ25rRcbTXHz1eEz6tOkoi1eew+hamCUMDlHwolLgBeXsRW4AkZJct2AcrY8SIuiSlX
	eO5Bl74JLXDQkoYdyPXk0ZQrazEXvGb97cagviBt+vb8s1nh9MJT24CIHYoxgjPQ+kUd7pVV6jtrR
	O/kpwvI5ThWtu0AdcNXzHj00pl/GqmyQlFJANOtv+ZLsNxVfGtPR2w7KCUBbe1rLVoJD2RvwPMoMD
	/NDU9vC5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73OA-0003n9-77; Tue, 02 Feb 2021 21:39:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73O4-0003lP-QQ
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:39:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE83F64E3D;
 Tue,  2 Feb 2021 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612301944;
 bh=hsuoG3FXLRuRqlYKdloDpY6Zo+Uz0VKlBVBK1myw/QY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k+g6tYdhrKnJ+e9xYMakShEJE0uI/KkUILY5S1Q/onhITyKOYxcYKeVfDuptPX+/n
 +SuP5PqxwZ4bpxeVxiVANxSU0nnP1MZjOwD5BVIEPINBWa5cLDkmMw2T6/9/iLepV+
 YzRk4CKQQVnt92d2bU/UNAbCK19nGLJKoBb8BsznwlBYasqICItwAA8JJiK2kfPt5n
 w6r1oAFNLf8WLlOCYZ6UyXVxJUQNtKLHaI6SS27Dx2T3dkL0XoO+UehXzyiArqusZ9
 u8UknqJ/ThObrCJThkCYomKOm/c7AQGp5H2oUsF8f0esYoU1zBS9NiF0ObX+oFKmor
 hCMFERJyOxqRw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 2/6] Broadcom defconfig-arm64 changes for 5.12
Date: Tue,  2 Feb 2021 22:38:57 +0100
Message-ID: <161230191197.1903274.18250892208608684043.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-2-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-2-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_163904_942890_E01E2C76 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202213857.NHDnmLwhZo0kzTxVoV5mceh09UVa_lheg1jWSq8ThFM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:16 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig-arm64
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: c0ec73899d43dfe2600b9b2a5c130401a907c98a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
