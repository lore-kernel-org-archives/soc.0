Return-Path: <SRS0=MYre=FN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F11C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Dec 2020 16:42:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E19D23C2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Dec 2020 16:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E19D23C2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PXZxXx64W+5J/BIontNnCmQTdBr7LeXJhFVYjKGLF9U=; b=NwCyCquAHCvvOhhvV4BiQAuSr
	jCSxH6+ckuSkn/Kn35QYDAuDTK8jHDRaWkwoQiY8adq1s13aTbuGU0ua/LbihzsEH/3gNJ+3KajyL
	MHRm+enSElou0lgEp6l6MNAOy6ybDwtqvyDKuTg7L+Cx5bKu/LH2tZEkrp8CeifGPliKit27ryqrA
	yGPfgtQc0uwybpBgqAVBFM0ykZ0JSxs5BeivLF4tz3D17sgYxatiszYaVTeU5Sg2o9hbCUR5CA3Wj
	sVzbUg3YO5v6EkyrlHYecRYut9XgiX10ALaRbSyO8UjLW4dcAEPI8PCLzPHWVtQYii2wt0h9LEA+U
	gEW3zj5yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2XO-0001IZ-AR; Wed, 09 Dec 2020 16:41:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2XF-0001EZ-Gk
 for linux-amlogic@lists.infradead.org; Wed, 09 Dec 2020 16:41:50 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	soc@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: meson: drop pinctrl
Date: Wed,  9 Dec 2020 17:41:37 +0100
Message-ID: <160753194753.3961338.16881051516363002534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207230156.10198-1-khilman@baylibre.com>
References: <20201207230156.10198-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_114149_685476_2324E0FE 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209164137.CiYl47a-BG1g0CasdzRO17sVXAayLsk1ba3G2ddYaKg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Dec 2020 15:01:56 -0800, Kevin Hilman wrote:
> Don't automatically select pinctrl drivers, leave it up to defaults in
> drivers/pinctrl/meson, which default to built-in, but are also now
> optionally configurable as modules as of
> commit 9c65441ec823 ("pinctrl/meson: enable building as modules")

Applied to arm/soc, thanks!

[1/1] arm64: Kconfig: meson: drop pinctrl
      commit: dcb11100cd5d3f5a191b7fba75422e3df792f3ff

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
