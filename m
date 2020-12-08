Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5FBC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C4023B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C4023B19
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZYhyFB16P0QUyy1HHTr/tGOOYNPqY8k7os65P5LQAGk=; b=faBqt5WZHltaCGgz6PSHP5N2r
	VkWVUNBRBLhbNAaH5MBT/ZKQEROQTT5GmiJlt8kcF20aeZ9Dg0/f84NqtJG8JXMtPT4SwQ4ZOMd4O
	PAXQIeE3jCv/3k9HN93tQZTTxOeagpoeWHVWydvoSpxmcnLMjGFsu8g+XTuOg314QYUpwFTuIbgza
	YJqjXW/dxySNLbleVorgsaTU0OhFq2OfDTfsgQjyKd/8UG0zeowmZOphc0l2IRH34tA9dJMUsuvcV
	DVFZXeBiXNmiSLx3aMFZ1uPvWj1GLggu37MK0GeAbPMHIBExACrtl73WloDqDuK5iUeBpUOQ0dp9F
	y3Aqgg49w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm7a-0005WG-Qf; Tue, 08 Dec 2020 23:10:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm7W-0005Vb-0Y
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:10:10 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Olof Johansson <olof@lixom.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org
Subject: Re: [GIT PULL] ARM: at91: DT for 5.11 #2
Date: Wed,  9 Dec 2020 00:09:35 +0100
Message-ID: <160746884848.2839681.1016197720805064475.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206013840.GA627225@piout.net>
References: <20201206013840.GA627225@piout.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181010_156318_33F89696 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230935.BhUsc9ueSg1ZGTox0nAQzgJTPLVRDQ8aRuAWT9pAx8Q@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 6 Dec 2020 02:38:40 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> Here is a second round of DT updates, Some are following patches series
> that made it in other subsystems and it would be nice to have them in
> the same release. Other are fixes worth having in v5.11.
> 
> The following changes since commit e1062fa7292f1e3744db0a487c4ac0109e09b03d:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f8ff2f057e745412204b5f42a439691310a6acc2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
