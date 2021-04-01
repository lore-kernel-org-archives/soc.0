Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8E5C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B62E610FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B62E610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9b2lH7lOGF2DkR20L+4hfTKw0wxSeSl+Dqag3smmnO8=; b=B6NSqpC0CetYnDpzWdPS+S7/+
	9SL1xroBBgPY/Pex/2B+7eb5bmlZFxf763NAQVLOqOMylT0THpIsIoC1thQfEuQbRcCkz2WmnZH+Z
	qLDc3V+HO6uK1N0KuqST8192L1LR0MZCwMRRSuw5i9xObMC9bKp78Tv8y3EYMbpZnOG4bo0UtNAgP
	R3AWc70Q89q/XVXYtouVcOvjhqwoomdvcA02aofb8zJJ1ku5pregyUq21kJuiH8HtQ48+HKj3JB2O
	1tSxIAEmo93WC+gE8lua7bcPg6uIGTY31E3VCAVQjYQyV1bJfC16cHQ5gTSODsCg3aozxPPfOdW5F
	R8FGcjirw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4e2-00B1eR-C9; Thu, 01 Apr 2021 21:14:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4XD-00B10E-98
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:07:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BA76610F9;
 Thu,  1 Apr 2021 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311230;
 bh=JCsYID8U4RFD8FARp88ypge7lJ3j0xNe9pW+DzHjEIA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QZlWB1w+NHuUo0v75bXpU/j6egzD6u+at+uIEt0IKUT3RgBWjltg/txAbxYYYxAh+
 R7wcsCHKXb43Zgqa4s/e+0Aj8vtmhSD6BNtQE4HEtS9ssalNp396Bz04r0UpZYni8i
 FZaGnkMa8dkVcJASH69OYx8GI6MFbkIIv3zewpV1JerFNTldDCzYbr7DbgZXrb3i3y
 oXMMKDslXzYDTzzYsauSqwD9NrGFqub3wwiiuiaYDJiKSxewlikMpY+pcsPUxnuROO
 gWVcO8LPOye6U9Uqn0rP4FVPGenIOkSNstLqt+b/uW3ZfMbmoqjYe9l56JNoWU4uWj
 jl56NynoWE/mQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] ARM: ux500: make ux500_cpu_die static
Date: Thu,  1 Apr 2021 23:07:03 +0200
Message-ID: <161731121856.663132.10821808877634787283.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323083203.1646842-1-linus.walleij@linaro.org>
References: <20210323083203.1646842-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220723_641421_5DE2683C 
X-CRM114-Status: UNSURE (   7.63  )
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
Message-ID: <20210401210703.Gg5G_QFf291cAcmbMcxOZH1u36Ad4KfaDeJec9HN95g@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 09:32:03 +0100, Linus Walleij wrote:
> The ux500_cpu_die function is not exported so make it static
> to avoid the following warning:
> 
> arch/arm/mach-ux500/platsmp.c:89:6: warning: symbol 'ux500_cpu_die' was not declared. Should it be static?

Applied to arm/soc, thanks!

[1/1] ARM: ux500: make ux500_cpu_die static
      commit: 758c5408ea3d6d730ee388ad8354c4fe94685d4c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
