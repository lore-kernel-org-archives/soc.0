Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9265AC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5322660F3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5322660F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aglPcqvkXIz3/XIBL9MVM2mPP4tw1M8ZSORRiFf0O+g=; b=Unq2R8GH6SQRV1
	sAwCKwBTJ0Ou0WoEZ32fv2jmpfxISVgAAzIQgbRyC1jeS2y74pnHwiDkN0/tj5pFTxH3RCdzp/+Rn
	46q4ms7DkDztUXoFzl/gNfhNiRwM1vOlevMiwjwDG00ulk5cLtkHj44HN6nO9HFlMiBSAFAx+i2Tw
	yBI3V+Y/2EKdeEBIXx6S9RNs8PTzZpQrbrZA8WZURdNhcVxu1AHsel0qTXhC9l42Y4lGkexvckEaf
	XAscs9MDSK2AmEXnVGO9tLP2HHswL97EHd3ezGbd5f5tSVSvDZrn+Ho7Kg7zOcr91HaPEcqx0e2d/
	PvNwvgssvIoI98oXWH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3Wl-00Aqly-Oe; Mon, 11 Oct 2021 22:12:11 +0000
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
Message-ID: <20211011221144.ywo1O6ZSGmkgVx4orMqdyf8HpoMLVViaw_b8qXQkpNc@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
