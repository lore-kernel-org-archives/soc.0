Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4049FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032A22399A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032A22399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IwfOm9iGCtoNPC/M0CAiJdghofL37/K3bFOzX59ww3k=; b=YFd3quxW2uXUsnbbloHg0zofr
	vHO/mLA0BylzMDdjG9af3ISQ5alzAfR71dQpqBUPo7MeJw2y+9gdUVl/JerOGDKW98LVRdLkDN9Nu
	gJTBkvaUBvc5qOKomT0Ew1iliJft8+wMCCYyhgIi+fm1OXNliidOd+Xxt4EXRI/KvzKjY3zLhmGYL
	ycy4h1A9tSQrq1uapoFVUjDZ0y1ScgcXPUCBZxVTt8hDsmanz9bfvWHrcsNuX/OOUbQ6/LmlpRVaT
	I6umvpupKTS3XWbo68N03BhGc9OKibaAFaUd+gn4XEatCe8ci46d12kpDHmLd7q/+uu0Sx+KYWX0B
	e8Ful315A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0So3-0004YN-SA; Fri, 15 Jan 2021 17:22:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Sni-0004Rw-Gx
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:22:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BCA7233CF;
 Fri, 15 Jan 2021 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731337;
 bh=kf6vmCuQLQ7y8H4dTC/+7sq5A31mmKSkFHkaBMWOTbg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtIRa9G5QdXP2PFRowRFrAGwyBdWyNSXNuZCl2jyIftKqYgQLNoob9X2UiPBMabfq
 dOBIqTKgRwJBYOhkkAXwkFuPdLOpi5bwt6SUGcLla2oT3rw/ptsOxv218J5W3mKhhp
 xVSDcaa0CDy+Ryth1SGC8EmnaZO4zCM8bTV3i9vS7Qu/sJClqFDqd7084B+Y0hYz0j
 5kQ1L8zrUgkN6Nz/AlMiMcyD6A56Dy+8iinW7tT0lrFSTjg7tu2iu7Pn84X7o1G7t5
 YiPBt8T22yZhFax216gJP2rmnEiF7aQ4XALj5hjYkjGZDyfO/tfM2aeXGJSZGGIhTJ
 80/Ols63Ier9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Subject: Re: [PATCH] bus: arm-integrator-lm: Add of_node_put() before return
 statement
Date: Fri, 15 Jan 2021 18:22:07 +0100
Message-ID: <161073123833.625238.240687123026047027.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112092549.251548-1-linus.walleij@linaro.org>
References: <20210112092549.251548-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122218_799075_0D5109B7 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172207.jCaGO7O_WBsOzRmshqg8vgII45RlWxdag-w95Kj5EWE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Jan 2021 10:25:49 +0100, Linus Walleij wrote:
> Every iteration of for_each_available_child_of_node() decrements
> the reference count of the previous node, however when control is
> transferred from the middle of the loop, as in the case of a return
> or break or goto, there is no decrement thus ultimately resulting in
> a memory leak.
> 
> Fix a potential memory leak in arm-integrator-lm.c by inserting
> of_node_put() before a return statement.
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] bus: arm-integrator-lm: Add of_node_put() before return statement
      commit: 1740e6736922cc1a5d061cc4240d08eacfbbaa71

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
