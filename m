Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043CBC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA7823AFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA7823AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9jzF/UpehjdPduJ4npom2oDWTEElAna9JL44ET7U8A8=; b=ew0ySpZd86eUcD5QDJQD6yYl6
	O3wxeJ07i7mW5zfj0sfFZmpbrcIIu6Az1xL3Gr1mxqzT+PV5X84IXPGjejKwlAgEjtz/ROn0j3A3C
	Ig6TjCy7jKFESWc2eAQDOH+VHJ8ksn+aCvnJDic1NE4M05WeUmPyycSXfLDZF/3ddwe/M5/RYsCwV
	7QHWSHqR6Xzg/j1c7D+rUVeU5n20kNXSHmjlVhFTlTc+VZhOA5H/uspW2ZA5PGmZNpbhsk3/PXBPZ
	LohQkYgghcY7994MOt19UORir6ezlzP8uB0yknULCnNl3oMDIf46p8pCGL10F8pHRUjl4C2CqHU+O
	Q2ydkrbrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfXq-0004HX-9H; Tue, 08 Dec 2020 16:08:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfXm-0004GF-Pb
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:08:51 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Olof Johansson <olof@lixom.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@kernel.org
Subject: Re: [GIT PULL] ARM: at91: Drivers for 5.11 (bis)
Date: Tue,  8 Dec 2020 17:08:39 +0100
Message-ID: <160675365603.2641537.15905485355591975594.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127214140.GA1688544@piout.net>
References: <20201127214140.GA1688544@piout.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_110850_913529_D6E99A5B 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208160839.5ZlQsIjp6YGoKseCVv7yHlLmjXlEalqvhbFueCO9RW4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 27 Nov 2020 22:41:40 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> As discussed with Arnd, here are two cleanup patches for at91_cf. My end
> goal is to get rid of include/linux/platform_data/atmel.h.
> Also a very small patch adding SoC IDs for the sam9x60 SiPs.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: c6241fd5de13f561ad147173f93f70a5f7058690

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
