Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B96C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670AF60FC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 670AF60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8XRlGqW7aN6rqO6xHUbZBhmg2USICisvKRkUxwqdD0=; b=s/zzwoo0LuRKNL
	qIDNXmveu7Ijf+ZKgHTkOwgERFp42hF9TPOqL8GogrKonWYLPtb+BpIPNbGMoY6n5ptSq9yI/u/ih
	/4LtFMaz923nEShNL1NNfxu6QjzT1bJH7GGP/yp+9S97OVBvIlEt8BC9SuNIxOHrXoMoKp6Y7v3LF
	PakSF6oE1hLx3D8QInGmOef9MzIaGFaRJPuxBlE553jlbhK3AqBfb3C8mLVp3x+FBogGtaHusQa+Z
	gE4eEFDDAFv4+Awl+cq6pToIwq1DTJ1pdKY10bT7tGMGRAVZg1q2Jruj/i2pzqBcWOzOZNkT4A5J7
	8LjltYWie2Bph2wUVReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY3p-00GO39-7e; Mon, 02 Aug 2021 13:32:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY3l-00GO1l-Tx
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:32:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1691160FC1;
 Mon,  2 Aug 2021 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911169;
 bh=puYbUFN+ELiAKsMSCu8aPcfizFvxmdzFc6W44/WcFss=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vLGeUcacjmPVd9Jym1rch+TkjU4x91B0RRSTdk4KGDy3lyfdsRv5fTlnhOVwlPGpI
 GwGL0Y9/aYJztYaf48BAmNshSz7K280mK5Oym6aSLqKdx0ssG/ApceKj3U3akS0d6F
 6TcaC1x/Pga2cLX1tQvgK9b6FFkebuR/m9M1GQbmCu24aDmKWFAwZHxt9t3QuHIOaS
 UtmLF3VDoqAPMV+Aj4eNr5J/D8HxB06z5FS0PmV6wgP3pljvGy5XRx4MIfWHSzCKDj
 V+Cb8ahbrX+qGIiHUigv3/99QCArmz2Ozaf81Pxyl8OoYWlu1DP58iyZ1hoqql47Fs
 dDqSH0bTLRzlg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Marek Vasut <marex@denx.de>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [GIT PULL] STM32 DT fixes for v5.14 #1
Date: Mon,  2 Aug 2021 15:32:37 +0200
Message-ID: <162791113541.1139989.12661940653007966330.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
References: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063250_057549_DD2D404B 
X-CRM114-Status: UNSURE (   7.11  )
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
Message-ID: <20210802133237.ZObyatfE2aR3DWPrEG8uODbZuMnrzEpM1mBpsqHcn0Q@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:58:54 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT fixes for v5.14. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b07bf042e678f5eac856052d332869423e365af0

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
