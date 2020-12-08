Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE797C4361B
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B079A23B04
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B079A23B04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aIjXa0eQ8YsWQPgdqocrEZJ6Nf1u7DALdWyHs8n0dPI=; b=NQLcEljXQADf+caOpZbVVtomy
	tlrBdKVBeFS43Vy7LxZXzgJFtYXzuZKVSE6Yg0XWK5gBchzLw6NQkmymH2Fwxq0bnc3ePzKvh/pjA
	M6MHYeRXuSr+YP6LTPYbIaMiWS9m0FQBuHNUG4lloUXTT3HLKwZC86AAPrcMnEwwptVONC3A447S3
	O1C7MMFEFrW7cBe4j0j7GO/JeZNdQB6IIWYGR56UEXOvalaFrgYKAEMrRQl2TOJX3Ov9Z5dy+U7Ay
	oCUp3SuZiO3rXk6BGlUiGdMdRDndCw/Bq4SuCtm6T6cvev7/uNryjkhZxV/iHmj2f5vAaLQxlO90D
	oVo9qnEjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm8W-0005md-EV; Tue, 08 Dec 2020 23:11:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm86-0005c5-Jq; Tue, 08 Dec 2020 23:10:47 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.11
Date: Wed,  9 Dec 2020 00:09:45 +0100
Message-ID: <160746884747.2839681.8297968608115515510.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7heek9jgox.fsf@baylibre.com>
References: <7heek9jgox.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181046_926226_BDBD2956 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230945.ll78e4-rjSsdqciJWf-8qjUzx0YD0XtxdXaPUCSUl5s@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 01 Dec 2020 14:37:50 -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> Note that this branch pulls in a tag from the clk-meson tree which has
> already been queued for clk-next.  This is for a couple new clock IDs.
> I also included my amlogic-fixes tag (which you've already pulled) to
> fix up potential conflicts.
> 
> Kevin
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b03455ae3c8a7e7999f9cc43ad87c63b44a89344

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
