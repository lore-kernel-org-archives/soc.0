Return-Path: <SRS0=Sdul=E6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1A3C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 11:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34DA2076B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 11:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dBlbE6Wy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1HJE3h7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34DA2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3hC1MwDXjqjdiElWtAAevJ+GiM9+JGNecqzL03cA0xU=; b=dBlbE6WyUT2XDTbKlIsoR9PDk
	cUf3lfnGM3JdwdRP1BODLdO2hRwSuppNG32z5A9aHPlg23kNwES8tqH/bye90UuO7eN5Q5HXPepML
	i6z5zaO0F7kAi1mbcls3sLZZ9ODT8LqZEdS2GfKFWlDgB+cvQutl5ZZg9+3K/YP62TZyl9aHCJt/b
	7DaXtVHZsA93hMXUGZisdo8WqUOOJRT+zQtEZZL84R/1ESrTpQddw7IhGG/PpVJBveWxSvvvtplkz
	lA0K1dJ44qmdJnupbE7/56k3oP31oubHyoSyifJsanWZIVrgwa5Kk2RGlBuXCxc4FLwsAqiVRdkVj
	cs4/XIIWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khW59-0006BV-SG; Tue, 24 Nov 2020 11:01:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khW56-0006Ar-DV
 for linux-arm-kernel@lists.infradead.org; Tue, 24 Nov 2020 11:01:57 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A81D92076E;
 Tue, 24 Nov 2020 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606215715;
 bh=rcPwwNyOgnoFK0hn92mtxvr7+2z4fh+XCF5CV9YDXqU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A1HJE3h7Pc2ltNpTtPZ6L8FRqTwwXe280m0aHj4EEES8GGX8Z636xZyQRGtL0JkUw
 HY5HQtLYCKw0jDzVtGHGOWDUbjRAWomQFKBfCvcO9G45jtLKCS8q/ZszwEONi/5w7t
 Sv3YZ33wgNfX5lf3/SomXM+HExGGerzgW6KEHqWo=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/2] samsung: Drivers for v5.11
Date: Tue, 24 Nov 2020 12:01:49 +0100
Message-ID: <160621564539.128147.2478803979700391709.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113162211.10020-1-krzk@kernel.org>
References: <20201113162211.10020-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_060156_583990_51C49012 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201124110149.qU3Zpw1yK3DM4KMzwBdS58jfBNlO01hZeV16E84wCD8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 17:22:10 +0100, Krzysztof Kozlowski wrote:
> Two early pull requests to flush my queue. I will have definitely some more
> pulls later.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4ce4be5d28deeeb6aa3f724c3fcb3c1627e40f10

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
