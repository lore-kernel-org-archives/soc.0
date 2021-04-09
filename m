Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E209C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 07:21:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E2461106
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 07:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E2461106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/pcAQUhEDo3BYlLO/gVGws9pNAF4J8eDYhpJAX9Oq9Y=; b=in90i4MzTi7tKdEPpqwrM+pJN
	UWPDRoIlNQwophRy0JRCk+Ir8t4d1ExYmVvLYkbNii229/jne+RJUHRhkS+pI9KSUd7bowDL+UnyV
	Iet4hCj7ErSw1wtLht1K6Ii1wI7T7+EAg3nUzJlZu8m7FllZGrWGuAZmn9qunIsq/eUBfi0R8kjkB
	SmmBsFKT1P/2oEyJemRi9b0g3/EFNmQ3mc+B1HCUa8wRyFmvDboZMisvCLn+maY8bnwIECDtytnib
	MEO+3AlowZec7xRg/iXrPLnQmrV+d1IZ7GUlKJn8eUfn6OmHynjxwlpK9Wf6UW00DCTz8Xh3Ic6AT
	JoPbiRhzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUlQE-00APqK-OP; Fri, 09 Apr 2021 07:19:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUlPQ-00APfg-7a
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 07:18:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F88661107;
 Fri,  9 Apr 2021 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617952706;
 bh=2mWb3+F3h0vGmR85tMfMYETiFUZhbud9i7NI+IMO9pE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbKSnn28w5EJo1scRp166/oa/7BV2oqBWO66yVtmAx/tWC28KtWWFKzvlkOjn2AU0
 9jzbxKN8nj7sfyEvjhunUmzGj/Fb9l7QX72FfvNi//DcWuwKr41+ikR8oqviPBwoVb
 h37E59y8nb/ZlJpQiFTo6nIvKs2H3t6QjPhmt/jlwmWtxepSSXJSIRK6nO/F/2op2N
 xAIo7owvReEF57qJaGteeJSBkd1REnQF3UaQw0D3epNm2IHLF1L0ru7saqMT5O0OOM
 HrG5ozgjsw06TP522ZwKDS4psU1K8j9eeDu2dwhYqXgn9J99VhaLOdL/e04+GGstkN
 ycvivTGQZmw8Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [GIT PULL] ARM: aspeed: lpc changes for 5.13
Date: Fri,  9 Apr 2021 09:18:20 +0200
Message-ID: <161795267844.1750068.14862109207368145425.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
References: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_081831_003428_79C07B97 
X-CRM114-Status: GOOD (  11.64  )
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
Message-ID: <20210409071820.jQPLVs3evml5P6tguQQJjKA9MKk_9_1an3EXv9ZdC3Q@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:29:52 +0000, Joel Stanley wrote:
> This is a pull request containing a slightly messy device tree and
> associated driver changes for the ASPEED systems. It corrects some
> design decisions made when first mainlining support for the BMC
> devices on the LPC bus that have stopped us from being able to write
> drivers for eg. KCS.
> 
> Andrew has worked with Chai-Wei from ASPEED on this process. These set
> of changes have acks from the maintainers, and allow Andrew to go
> ahead with fixing the KCS drivers in the future. The branch should
> apply with no conflicts no matter which order it is merged.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d60f314b93b637e9721c406f5a61cf2157e59b48

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
