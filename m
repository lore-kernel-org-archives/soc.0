Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736A0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B613239A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B613239A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pA/yvbp6MmOxYN4OSaz9HmGxW0sU4RdOLowM8mCWbdE=; b=XkLJXInDQqPF4II1rGfPVNjQ8
	/fj9LnSOcrqQ2B0FwapPymg+otSFzaT60a4SfNfDdLav/iqpbPedlHJoSMPBbKQumzV75Wek757Gd
	sy+w8LvVq+1675PJvPvNdZ/xfz/0UM3hnMHU8hm9rRvfQE4ARvR9LCcbmeSU3369ODKOUnHBuzDqm
	DRtymvbYBekdjVaIRx3Jjot2tJ6CVJ+s5B7rSPwAZQV7HdAx7JvNXK7/0Q7MSI0yrlDDJiaQJ1qb7
	7M22q+ncrdg/rx+MK8Jv3x0HSh1qev6XLf7WkqZ0J11WKV1E/dJEBoHKkv948ykyuCC3QiXX0Fs6j
	XkSvkPweg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Snr-0004Ss-6g; Fri, 15 Jan 2021 17:22:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Snf-0004Pt-65
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:22:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B9962339E;
 Fri, 15 Jan 2021 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731334;
 bh=rJS0doBJgN511kYDMEKPuXH/hTO65VVOcmWmFrt1O3A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pQKdmqaUEXfVuQVOBgwIMWvceciZH/oi5DGvyy2z6hP/JQgXqN4Ze7qNUZ7o0+LE8
 j8eF8m/nn+p3nWQ1esON0VtILDKSQF91blP61dZmjZAwYLOHxvAN6unt3KqbFNCrrA
 Bmka1SG1oSb6jzsHX7P0fI+G1VnyBaBVWyfw7Ed0H3RmvL7Wh199H/oD1acAdGN6uG
 SHmu7/IL0iCwNrYGWi2VPpEerQYvZPHr13ZQ5EtfgZMVYNqpt+7hTYFokCbsBb/pBk
 q39OhR0gaptrPr6q/jbWWqIEKpC5VGT5BIs1zH8pyVpyVRh/ZLYINVuCAlrrlMMqsd
 gybCMuOh7e1YA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
Date: Fri, 15 Jan 2021 18:22:06 +0100
Message-ID: <161073123818.625238.784153877114947970.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213225517.3838501-1-linus.walleij@linaro.org>
References: <20201213225517.3838501-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122215_409600_8EB57213 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172206.fX0pk8g2E6kvkpuu_7WzL2Ys-67Y4jq5n5_Nd5u5oPk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 13 Dec 2020 23:55:17 +0100, Linus Walleij wrote:
> The Ux500 platforms have some memory carveouts set aside for
> communicating with the modem and for the initial secure software
> (ISSW). These areas are protected by the memory controller
> and will result in an external abort if accessed like common
> read/write memory.
> 
> On the legacy boot loaders, these were set aside by using
> cmdline arguments such as this:
> 
> [...]

I had mistakenly not applied this last year before the merge
window, as I misread the description as being not very urgent.

On second look, this seems important enough for the v5.11
fixes branch, so I applied it now.

[1/1] ARM: dts: ux500: Reserve memory carveouts
      commit: 8a996b2d8a03beae3cb6adfc12673778c192085d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
