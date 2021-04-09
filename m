Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE68C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 07:20:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5E061182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 07:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE5E061182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fk1yL1rehOnnNgC2oUlL+dQ1+lFdctyB2r4NbkMT7EI=; b=iS846d07EShvtQu3P76xMxC3t
	PWrGCZOqc2KUycFxRLEyi5y8nysXMmcZ5iXa9DsxfHYKDgoH9FP8c+yGAU7NihhfoSY2s+rvZD6kZ
	PBB6bQCx8BcQ65eTJ7Y/kxF1bg5pRpPcVWkA24RL2S5Jak+5pUFAM+TjC8LMd6vnz3CgosDTID8sH
	5W9AQ1hhZGXgFDMHmqMvBujhVV0pfx+dytA3/EEyAenrpX68/MJ1yOw5vEYHT5pgOwZxtG6XqP9FW
	nhjGQkbhZo36sXdX51llntEP1zZDfBakRZD/vlgUCKdlobo8RsVYrSNec4g+MAH8ExKcmfL/i1Qdf
	OsSGtGAqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUlPP-00APfc-D1; Fri, 09 Apr 2021 07:18:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUlOf-00APa1-Ug
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 07:17:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D83661178;
 Fri,  9 Apr 2021 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617952660;
 bh=uygj9zBfptFX92rchP4Ynh/JGD0wJp90BR8NgN0XWbU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o2f38BEsEIKhiqiWk/PsQpFwVE2m4pitqyKjdNGWESG2Zf4lxm8hj4ZO+Fq7Wm956
 cMlZD+r7hciqVFG3Ug6Xw1WpzrKy9VbcEFKlYJwBSuI+8XLMCyoLeJDJCoU3BgvnqH
 +4LoJyWCJK/A4iD8pHN7DkPDkp8yV7TXJSbixo6f8YV4koda0w/I4oikDfm82oh7Ut
 +4n2M06bZyshzLt5dI7La7Di3hWHgwKS/uk1NDeev0Ox58a/5geWBbJVvEjXcXI74F
 Av7PPV734QUEYnJkWoZMw/bJ+6FKyovVnFjNI0QzseRrcxw7KBwQQWZR8byrwklcTf
 lPessPAZ4Zgqw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13
Date: Fri,  9 Apr 2021 09:17:35 +0200
Message-ID: <161795265048.1749935.15830124997910239772.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
References: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_081742_346368_336C6E93 
X-CRM114-Status: UNSURE (   7.95  )
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
Message-ID: <20210409071735.JRHhCNroQxr5Od4QncjBo-YS4TdLuz80Rv01Zs32sA4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:14:27 +0000, Joel Stanley wrote:
> Here's a pull request from me for the ASPEED and Nuvoton changes
> targeting the v5.13 merge window. As you can see I've chosen to
> arrange the pull request as one single "BMC-related" set of changes.
> If we choose to continue with this, in the future I will cover the
> ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.
> 
> The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e3bbc53ac8827babb5001037883e4edd2068168d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
