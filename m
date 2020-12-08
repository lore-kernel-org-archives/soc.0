Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DCCC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:38:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9CFB233CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9CFB233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UcAvNPAFt+hfqF6s1psJNG+9A9NKhxy2IwRoxTB+WuA=; b=EqTe/poagHqtWl3por1nLSX7N
	+ZlZI8mqib52IDqOfv17FGltHK8WX29RuVTsbSa94hTTMzAbCQZgFjnzWoKKgGIniG9Gp4YlSi4up
	DPfcvpK6E23ZZ4hfXnI42v65UYv7uEGUwrLteb/0KuzUf5Fgc2cWRGqJQ9uYm51Nxg3Mb+1vxIpbo
	uEY5DTZ+qNdKrkw7bsS4s4Hfvey9eOAGSLmIIxg4BADfnyabNkucsK/7oIO+8P1P7sA2YKbx1ZUCW
	CctiFO9Hg7gP/iGC+pzTVU5hqI6WfMSoEKTEnYRm42B/mBRdbLTWK+j+wKiYsDptb7c4YMDMQM49+
	qkTsAcN/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfz1-0001xC-6R; Tue, 08 Dec 2020 16:36:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfxc-0001Qd-Fc
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:35:35 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>, arm@kernel.org, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm64: TI K3 SoC configs changes for v5.11
Date: Tue,  8 Dec 2020 17:34:54 +0100
Message-ID: <160744514104.359082.4260960430144045092.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130174850.ni4sdyz3qp67j3sz@upstart>
References: <20201130174850.ni4sdyz3qp67j3sz@upstart>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113532_668806_9322E66E 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: t-kristo@ti.com, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208163454.VlCPUfZH_qDEpgT4GhgX_MpKQSgmck0q2uwsbx8QAOk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 11:48:50 -0600, Nishanth Menon wrote:
> Here is a config changes for TI K3 SoCs. This is needed for booting
> the J721E board from an SD card.
> 
> I do have a follow up cleanup patch[1] once drivers/soc/ti merges are in,
> which I think I will need to request later on.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20201112215438.31432-1-nm@ti.com/
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2ede693874c90e41a63195d06408ff3a73fcca7a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
