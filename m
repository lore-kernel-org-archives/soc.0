Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95480C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4108664EB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4108664EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vGZZO7hFGFWrbaJGEVhTurWEigsPk3CydbgxdUZ7W98=; b=LtFQ9r8dxB0aE6drWFvY6peW6
	w/JTClENNdegy3uYFU95i9j67xLGTl0PdV9H9KzZhC2fLfYTmkzVqDKW+fdCElGO5bHFsxakmRx/J
	7qZdG92vNIQXJdsI4Rsa2nJ7/lTYgSPIuiwMvByfMsUr2FnXybtdBXwiXrZHaqxc1IS7wfncfKz7i
	/i3da9ydFqMq7fiWyYuAWn4Zrqze0144+JOKqwyxMk7+4tk79tTXjmo+/zG2NRMSYUfwaGN/7OrzS
	zbs9+9WrdmGPVEjIVNcDQ/jTW+PDUItXT5iBJiMOc3/TtxSE60IcO36kIqrtKnBElL0YQsSp84uTu
	PoP64ObFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Uil-0005Iz-Ce; Tue, 09 Feb 2021 15:14:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UiS-0005E3-9C
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 15:14:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B00A64EC6;
 Tue,  9 Feb 2021 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883651;
 bh=vF369+zbhpiQ45k/ZshjP1Py4rriN3NsCdst7RvcaHA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hy4q4lhxfTgCnAI52aGiwt/3XRkusFSkxzFTMw3oE6CdQ/MzTha8yPvT49BvKBl0H
 NCm6RQhOHhlplmzq0nUSQg9d67/EAs0Be34kSF7cR5CyC7Pn6XKg/po0/h2Qql6910
 rfr7xw6RpUAX+xBv2okBOSv6Cbb9mp0Qi9xwWsB0kqu8+R616uEwfrvaPA9gyGHu5P
 Zt8od+g9mYDaoki6JnM92w1QLrhvfa2kdWvkew1V44FeJblyXhCy77dT3PconIxFf+
 9uh6EexOUsQHlrp3c6WZilLD6zF4XBXNYNu8P7sv0D8EEtnKkzUawPARAvDXi/KdXJ
 aH7FMKp2fqEQQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 arm@kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.12 #2
Date: Tue,  9 Feb 2021 16:13:55 +0100
Message-ID: <161288360578.2910447.16931908601286064983.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208115753.54730-1-nicolas.ferre@microchip.com>
References: <20210208115753.54730-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_101412_517636_5B5F5E45 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209151355._3hYTfJWHYX1slqEI5_yiw8rGRmry2ernqCDhGWvg6I@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Feb 2021 12:57:53 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the second batch of defconfig changes for 5.12.
> 
> Thanks, best regards,
>   Nicolas
> 
> The following changes since commit 00a1aa475f507454fab82f02c6230c8fb2312a12:
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: cfc9e56311075d25ebb3031dc1c0fd27bcdee47f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
