Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED25C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 07:22:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 227D461106
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 07:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 227D461106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c11eUgQ3TyZLxNpaZsayHXjW3Wj+WCWYNSfVyOdFeIU=; b=A42NLY4YfrtoycLfluPT7hJSY
	O08AU2J9TcMZLQmAvzxUEx5dc4z98cAu3VpwHghEJZgyeATftnpB7S8YcOcKkeOeZhCAkbbKD/+iN
	pWJ79CSNrcOt5bcsjgyoHO6JhREiCvy9QThiehy9rnEnjBO4Zco2eAGgffaVlR0y5WNQqthJWnvcd
	LuEviDbxIEZOSIkkCgo1TSuAUnye8XmGl5x7Mto7aIR5jJVzRg3EuRMoK9+kNXTyH4OX63Ro+S/GO
	78jEopDPVFgTJHakTAgyZE/l5GNrooIMcKN3/9Wn+3zYGLaiEkR0W0LPpuMe64dVd9lBX10cBerS7
	HGbEsGvNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUlQi-00APwv-Ht; Fri, 09 Apr 2021 07:19:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUlPr-00APkf-4s
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 07:18:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31F1561106;
 Fri,  9 Apr 2021 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617952733;
 bh=erpf8KSRcf4FLggTMlD5I4hgo93HGVjD4OIE1sbUsog=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dv32ruHeECbKO9bC7xRuREeZj4Q9I0AJrhvm3bGx2LRVd//jj+5XsSHOACELaMjXH
 ZYwgR46CgXU529IP8/6CP78MzME0/xOFoua5TLYWTnbTA3z2bCsPwPBT8jpKU2tzAk
 Elg3TXcVy1UD4MOJ5aSS6EpbiXdTfhKxrpdxjPpGryZDtIK4Kq0cTSuRS/Jn7HO9EG
 JJw8a3V2Qqx1dBFdO/5bkPvRGjgfN0f7VojrEuuBKAyeDO43l5yeI6HCz0Wq6QTm79
 bx96W/3gUwc93Q4R2Xh++2HpRJM65gX9ZuJl6w6RxkyQ96c/36AWDKwxtlabh+JUa7
 /vMvUgjrSQU1g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: nuvoton: Add WPCM450 support
Date: Fri,  9 Apr 2021 09:18:49 +0200
Message-ID: <161795272593.1750291.13960701815040145569.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
References: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_081856_958687_56F2DF37 
X-CRM114-Status: UNSURE (   8.70  )
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
Message-ID: <20210409071849.BNHblBfZpdPqeblRchOhLOWkPmibrB0Wml6eKv9THVs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:46:27 +0000, Joel Stanley wrote:
> Here's a support for a Nuvoton soc contributed by Jonathan. There are
> changes for the irq controller, timer and serial port that have been
> merged by other maintainers. I've picked up the arch and device tree
> changes on his behalf to go through the soc tree.
> 
> The following changes since commit 09e6d2b71ae673dccf9f59f0fc1e17109113b6f4:
> 
>   ARM: config: Add WPCM to multi v5 (2021-04-09 15:18:40 +0930)
> 
> [...]

Merged into arm/newsoc, thanks!

merge commit: 39b95079f68cf17888a4cee93ad3c4acc3854b38

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
