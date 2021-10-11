Return-Path: <SRS0=jkUD=O7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B785C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BE860F3A
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45BE860F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amkNT40SsGS8Wl+azyIyves1Z5+eB4n6npjpWh4Axtg=; b=qLnMIhKXm4tmcm
	DOWHGCaNcW/WEKK1s2gg8N9OiBH/iZNt1qfobSw6wIb5b5BlP38vNRMdpRv+9xb92Eu45VVJXaUUT
	omxxYJBqHNIby8568bIAz2f9vxtVE7HBtyg1z8xnt94bjLFwQSQN4DO73s5m7ugF5Q4NQYkTH90ja
	Bmt7G+KWcpUPC5vKYltlW/ayBHQ8GHLBgWc1fDcgrs35ALWprjvJXEQ7EddArQBZN5vTIboLatrob
	f0179ZxEQjgOUzy9jKkKi0mlc++zPwZHd4DqcuEfxnen/pupHmpqSNPuD4qdt1MJqM/wccDbNFpSr
	OIWIbDRTUdtofM+jOX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3Wj-00AqlW-SM; Mon, 11 Oct 2021 22:12:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma3Wh-00Aqks-4n; Mon, 11 Oct 2021 22:12:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AB3D60551;
 Mon, 11 Oct 2021 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633990326;
 bh=cSGHVKdyEqklV0ZSJ/pIwrBPsHrrW2nmdjxBRw0oBcA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CtnYiZMcxJXd5BRE+SpZX2neC9glw0fdwSs61P0zHdkEGgASLJHofi5ajQQyfY2iU
 y6kVGKPt3GKpRWnX22Mon6GGJe1kXe46wTrfViONniBkP05bPaWKeRwoJcbGZGXp/V
 9+aSGjh3K24gtDT4mzuxGiWdexW30Nn5+H/nOZpxJhT03LpLOo+gUqT77amQomgh9B
 Gbq2zsFEwnbKEupt5QIQQTJRfqqC58Fs00EOy+wzNpnYgoYCz6jk2BPoQOEke5WCnz
 DaY7r/p3e01L56TN9njtI22aHVwAccE+WgasP5BzoV1pDCd6Q75y++bNFH94SUSIU+
 QhwQv2gNeEurw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Neil Armstrong <narmstrong@baylibre.com>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.16
Date: Tue, 12 Oct 2021 00:11:44 +0200
Message-ID: <163399027725.3049179.3177059890960667529.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cc0a3af0-b1b1-dbe1-f553-cf58a1c63d0b@baylibre.com>
References: <cc0a3af0-b1b1-dbe1-f553-cf58a1c63d0b@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_151207_227170_85B7584C 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20211011221144.6YfaCjb2UJPRUMoyncfsS3Kvsp2PfonTND8HVDLEtWA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Oct 2021 11:46:33 +0200, Neil Armstrong wrote:
> Here's a set of Amlogic ARM64 DT changes for v5.16, adding three new Boards:
> - Radxa Zero
> - Jethub D1 & H1 home automation controllers
> with the corresponding bindings and some misc DT fixes & additions.
> 
> Neil
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1649069312dc08fe19573cdfb194a22c6693b816

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
