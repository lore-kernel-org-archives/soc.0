Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40335C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C2160F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11C2160F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjJZNj23lCH365argeiC1fSkBP0rn2XcblR4Fp9JyLU=; b=yoU20pxRQjV/5x
	/MihWxZqcr3CxqXMPyvSdHZHuwkP+EBy3PB9SuxV3K3C2lXY5UFKkEtsIVRA1wCYZMYYwa9pnHj3v
	SJsBaGGduOyaVDtzaRjdzQydNyeSXHLy2HtwOAMwEkZ/Y7/8fdGf5o+H0iOszePDrZwJPpR/Hpo/x
	UJAqRTtBzPRAHYdl6T/gSPmFMaFzo6cL9F7+0saWtybZ0Hg5qSuHywe/P4HypJ8yMERc/7wX70UFI
	NtACe5OEJrQxUQrw4Z3R7IplY8LC6PRKaZOo/M60cW/EiV81YePixrroRbbz1IECpVBQLiImmAolR
	Rr3hqSmkOdfI5nJ987/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHOM-006EQz-D9; Wed, 04 Aug 2021 13:57:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHOH-006EPi-AC
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 13:57:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBD6460EE9;
 Wed,  4 Aug 2021 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628085421;
 bh=uSKDVfXkjQyfGeNj9IN/e8YDTazOYowYnjxP434zn2A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F4D6A93B65XQK02mI5rGajm/OLrkZz+veO064hOjsIOxJsq4dpL4vJhx8SaRgkje8
 AAK7DsgzkEaAfPGjZGaQfzH2Wehvm3SPJSPLO9GcvKjJn7OU1nibntDT76Fv3w5ltS
 s7c+lHZyCbVPjoM3bC7ZFpxt/byJKLzvSTyYAqUT/ypRdvkCiV56NTvwhDS9IskvDL
 7fv3eWV8LOn/bOIdNeSTshTSrTr62bTYSz0yWeeyJBuTeArnZHQN0nh0S0Ffa9Xeq/
 zxb/dUrmDmYpv8OqbdPAuUbkzirIN4InLYRg8oQNikppTNOFyPpmRx2Oqy1/LHXaD9
 Ti51oEqV9kIZw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephan Gerhold <stephan@gerhold.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS changes for the v5.15 kernel cycle
Date: Wed,  4 Aug 2021 15:56:56 +0200
Message-ID: <162808541212.328977.8507226322336641533.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdbjBv5ywZZD8rK07d5sLcHsG8o4iYD-3jHO=HLg6-nKnA@mail.gmail.com>
References: <CACRpkdbjBv5ywZZD8rK07d5sLcHsG8o4iYD-3jHO=HLg6-nKnA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065701_411322_E71D2035 
X-CRM114-Status: GOOD (  10.53  )
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
Message-ID: <20210804135656.gAuFs4U2f-f7UkVTjnyLlwZV69QM1kMFc_x1hOIZiFQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 3 Aug 2021 14:25:15 +0200, Linus Walleij wrote:
> here is a first set of DTS changes for v5.15 that would be nice if
> you could pull into the appropriate DTS branch in the SoC tree.
> 
> The details are in the signed tag, mainly some new phones,
> and some generic fixes.
> 
> Please pull it in!
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 72ee3b4dc2c8c56aca2608a0c04d0eedaf6fdc67

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
