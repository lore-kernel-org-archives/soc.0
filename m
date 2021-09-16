Return-Path: <SRS0=iesQ=OG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D6FC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Sep 2021 16:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72FCA61A8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Sep 2021 16:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72FCA61A8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXpljLI6CuSgfOl26H+bzexjEiwSws4h/bXJ4xfLobk=; b=coaDX/tMAIwDhl
	9m1jrXw00YdR2yJbvPdRUhPwQf18WlQ7SR5PRJn8msHvP3juwUccGcT5Odopo4JDtUi7R3g5k3z/G
	J4An6noX8IVB4Q+6JTJFTVbJiJWGLF5yPEsRfC8j0aAYr4duRkLKUk94ZcKWzDUzyScY6zGFGrvys
	onkr4E3unJLeCwuUi7OrgjW+BD+1QFbBFyjKPH9DxMFzYS9xQswYjhoICy8bEeExrd6OPmu629Ltj
	QA6bPldabe/SJqlO0vfFCkYMhg5vtEAUbfyx1StT4VCfCFrKiKHWkDuS1H/3Y/d9SqFMwGu1q2A2Q
	Ia40yMYUj4qp/b0EdAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQudV-00Bljj-Nc; Thu, 16 Sep 2021 16:53:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQudP-00Bliv-DH
 for linux-arm-kernel@lists.infradead.org; Thu, 16 Sep 2021 16:53:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C1F163262;
 Thu, 16 Sep 2021 16:53:14 +0000 (UTC)
Date: Thu, 16 Sep 2021 17:53:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ross Burton <ross.burton@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, soc@kernel.org
Subject: Re: [PATCH 1/5] arm: defconfig: drop unused POWER_AVS option
Message-ID: <YUN2d9MtEbQyrVMi@arm.com>
References: <20210908113717.964049-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908113717.964049-1-ross.burton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_095315_511006_86EEDAC6 
X-CRM114-Status: UNSURE (   9.69  )
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
Message-ID: <20210916165311.S5_h0ER2p9mJBFApXdub31rC8Y7ibSETJJfYXhFQWbA@z>

Hi Ross,

On Wed, Sep 08, 2021 at 12:37:13PM +0100, Ross Burton wrote:
> Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
> corresponding Kconfig") moved AVS code to SOC-specific folders, and
> removed corresponding Kconfig from drivers/power, leaving original
> POWER_AVS config option enabled in some defconfigs.
> 
> Remove the options, which have no references in the tree anymore.
> 
> Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the corresponding Kconfig")
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Since you added a Fixes tag, you should also cc the author of the above
commit (Ulf, added).

In general the arm64 defconfig changes are merged by the arm-soc team
(cc'ing soc@kernel.org).

For the series:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
