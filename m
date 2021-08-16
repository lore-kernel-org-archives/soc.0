Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4915C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4CA60F39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D4CA60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdRN5sy09uHyEGWCubO2xdfoqIU6YDCYnyq6R5qyrOw=; b=rEHwwDe6SUOwhN
	pb0xQYKjmMYLB/7uXHemjE6EJTZjuvTO0mxde02ck0Vjtkt3Tj64rgVsIcNvGYPtpwnF40j7fG1kM
	D0lk6pxziCvdL4BkJk3PxOIKojzt0qBCy540EAc5HLxYCB/njUOYFzCc3rPvNLoiu4BNhR8EgEqxV
	MI4PMdMqeXM3em28J88xkAElRBxa1jaV2v9kcEToWTo09eAyguNgclQL+sIGd+NdoAVLYRypVkU5r
	OWVqIPQDg78eOdBY2w3S1Lg1x0VkWW7Vp3/D5LLW8NcWOcuElEofBlFN5h2E0moRZiS+dWWxZvPds
	vvLLz7Pu88VvRAcXbeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk2u-000KU8-IW; Mon, 16 Aug 2021 21:21:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2W-000KMI-9g; Mon, 16 Aug 2021 21:21:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAB3260232;
 Mon, 16 Aug 2021 21:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148860;
 bh=/dLDdxhN4wN84E8SgCqPOUOIc7KQmce8hgFwVOioDWU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f//CBE2CFwFnceXN187DOQMPnMdNWox59GkEs3+eyIIOK+gGyAZ2pk5gQMPKsE2xO
 X3OY3mTyLAt5m95LxNVHJnZqEf4yRpfQgawtF93G8dNJFD5KDCtsBljeZMPwfVsKOU
 fqv4//tOtcah8wCdex5dvahdwg/i8CTCM0BZqMHWtNH7SHJ4rynkfEBlP6KLBArccr
 GzxLCs0A5tlKQDbH8XYJ5Yx+XKyOu9L1G3vce5+YObPGr2cFmDAoH9jD6doTWqruPY
 mIPvqFevZnS3cRVVWmflHjBs0hHWfKLCWm/PmApDZGnCgyOZ3o5mrlpPvKA8HB663D
 iB5peO3+SgQgQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, soc@kernel.org, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.15 part 2
Date: Mon, 16 Aug 2021 23:20:49 +0200
Message-ID: <162914852228.237905.17625199363925328243.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <47d77095-eee7-bbd9-d3aa-1dabeea3f0b9@baylibre.com>
References: <47d77095-eee7-bbd9-d3aa-1dabeea3f0b9@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142100_388663_3ADF5C17 
X-CRM114-Status: UNSURE (   7.53  )
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
Message-ID: <20210816212049.Hl1VXmp0KmjyVt_iEEUWZFLC7V0fKKH____LKAgyOYo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 16:12:59 +0200, Neil Armstrong wrote:
> Here's the second set of ARM64 DT changes for v5.15:
> - add audio nodes for vega-s95 & nexbox-a1
> 
> Neil
> 
> The following changes since commit 4b5260032ec691b11a9185f7f38f5761e67fab48:
> 
>   arm64: dts: meson: improve gxm-khadas-vim2 wifi (2021-07-26 10:08:16 +0200)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: fba65f104ea83d188ef470a3f32c519a7f4b5796

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
