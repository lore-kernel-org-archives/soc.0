Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C3DC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350A260F6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 350A260F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1ChQsrdYsCQT0iNUcFptNRFK9AmwtGDUGbl05kn04U=; b=Xz/A1aBxbgHT53
	0gO4TiJ3H46OZLn8tfVPrAGszLcEJIXqu9cZlRXL9kuov59kBOOt2etm2IhBoTubcctYn9qz7H0Sy
	iVa4PoC2oP3gXaYU+STJRYDKSNNbSSQyuES9sydxSHtCtKwa8wmeUU43lE2aPR/BzQZfPFFPwnDKd
	V20fAkyhgcwvhsvhLWt3OGTG5sAcdGBN+2GtdsUWLAgoPMfwjbn+4OmLA+8pB3BieanVdKWc0aMMm
	lFbDOgvLO2hqQr8MLA0Oqesv26eNADCRvww0ferDOsBwa3S9af5IvtI1FB36KeZdvBUCRqamUDt43
	Kcgi34QUgppJogEvFdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY5c-00GOdE-U1; Mon, 02 Aug 2021 13:34:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY5R-00GOXm-Bb
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:34:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 505AF60F6D;
 Mon,  2 Aug 2021 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911273;
 bh=e2bbYXORQPuzMFKTOysoUZFYTfU3/cbf+2ezOoN/iRU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r/cWQcIJGCEuGAoRRfOlMNr47FVk6epyW2VAmHDdSXz9JGOndcvmmsWvvKyeBCEGB
 CLa1+ICsoiQc7oCwixPyHNmhae51V+ndeViYxSbh/HVKe+5uuAa/GCrThB2m9LlRRL
 c8dOVpYvbP4PP6MXMqggbiTy/T665BU25ghi1ogEnBs+tgZHV2go6A/2NFELGMIF67
 opaZnCovocFWX5bJKq5pKDho5DEYREa5Kkn+DW5TWiNUc9813nxM42g+e7JxkfE8S6
 vzXaM6SSFYYKnbn6gmtgljIBD0IJjHr9+hBG0iJaQFbjO5U4WGacla15CMYLeUkmh/
 pFmw9jMuzY9rg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas driver updates for v5.15
Date: Mon,  2 Aug 2021 15:34:27 +0200
Message-ID: <162791126361.1140492.15958129543143485091.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1627650704.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
 <cover.1627650704.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063433_446220_25A8A661 
X-CRM114-Status: UNSURE (   7.01  )
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
Message-ID: <20210802133427.THr-Cetp9FQh1NhV0Gjy74ofwuKw3gw-_fugR2CuTzQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:18:55 +0200, Geert Uytterhoeven wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: b6e952c35267b8da9a402f2f0c9ea23d5d929774

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
