Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68631C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71F96108B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71F96108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZPyaUKnwLdXJ6p5pqkMsae7SGtKPKUznEXtA2ZL6Plk=; b=RrfbSt9Giu+SR2gr2PauwBOHy
	wpZ3a7N25Vq3YrUbMtu5hBqHSCUkc3JIiXYdVUGryeRZ4pRoj/rB+YOKvdrFIbCJjS4ayIK9sJdBB
	rm3aiM32bqKA1GzZk4tlWapUpvMCFc8JQq/sw4o7uXs7dSSIFl7vMYx/Y/lkrBKJGlqpXNTb4c5SD
	Ib6QFRK4wegMwqjfhQUS1yPddCH13+N0hLU6O+1/sBTouvekrSuYDBIXp6fQbuyStCuy7RKKFRRfQ
	aAw8FJfHRGNvWDNj60J6hXckHu4KjK+LvzRxB6fd2Nv7EJjhZZO1q9wOQ64YFzFU809j8Hdgg2POk
	DeNRuwaHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS38M-00AoBU-2s; Thu, 01 Apr 2021 19:37:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2xi-00AmGs-Co
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 19:26:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95CEA610CA;
 Thu,  1 Apr 2021 19:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617305081;
 bh=kwIIVm/ibuTPTbL18bgF2gp/43QD8aXJNRzVf7+wZYs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LKWtphVpn78VUOoOX/dN2T8hKHN2BIHqc4SJqgwkvYkFIBzukE86+rs1HPRknexQw
 Ez4gXyZlIqRHzpwvFFc8JmeZ1FecdFGgp21N9OkQJBTYE7dg2Y2aLTaSCGtnAeya8Z
 /JvimxaSp9GwoviiIJUwc79sl1Z+4PFotNu/wXgXl7NGAbV76hCrgJaCW5znpDYNR7
 O+Kro3c4fO+8Ez3IsKMyzgWel3wDlL4TnLLWNH5A1EVWE4erIweG1apVTq0h6Aqlnu
 S6uAAWmWx/KN9JbVSxtcM3e1Fn7HfBMSqw8Mw7dsII7lK4QMZrgos7i8PogD6c+gnB
 IK+KTsJaOLN3w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-omap@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL 1/3] Driver changes for omaps for genpd support
Date: Thu,  1 Apr 2021 21:24:18 +0200
Message-ID: <161730504480.632809.11230034462236012550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617004205-537424@atomide.com>
References: <pull-1617004205-537424@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_202638_696847_FB30B544 
X-CRM114-Status: UNSURE (   7.33  )
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
Message-ID: <20210401192418.EjPqiBDzjKbmlfsQewsxijXYX-SSgvag18XsGKFR584@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 29 Mar 2021 10:55:20 +0300, Tony Lindgren wrote:
> The following changes since commit 4c9f4865f4604744d4f1a43db22ac6ec9dc8e587:
> 
>   Merge branch 'fixes-rc2' into fixes (2021-03-08 11:34:12 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/ti-sysc-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 1d79dca631e8e7fe886f44f49b1e0a16e1ac1dfc

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
